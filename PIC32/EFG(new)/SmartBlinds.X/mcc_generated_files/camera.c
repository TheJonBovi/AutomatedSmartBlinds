/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include <stdio.h>
#include <string.h>
#include "tmr1.h"
#include "camera.h"

extern const struct sensor_reg OV2640_JPEG_INIT[];
extern const struct sensor_reg OV2640_YUV422[];
extern const struct sensor_reg OV2640_1024x768_JPEG[];
extern const struct sensor_reg OV2640_JPEG[];

extern char JPEG_BUFFER[];

// Set up Camera to JPEG, size, etc.
void Camera_Configure(void)
{
    printf("Configuring Camera...\r\n");
    // Reset CPLD
    SPI1_write_byte(0x07, 0x80);
    
    delay_ms(100);
    
    SPI1_write_byte(0x07, 0x00);
    
    delay_ms(100);
    
    // Reset Sensor System
    I2C1_Sensor_Write(CAM_BANKSEL, CAM_BANK_1);
    I2C1_Sensor_Write(0x12, 0x80);
    
    delay_ms(100);
  
    // Initialize JPEG
    I2C1_Sensor_Bulk_Write(OV2640_JPEG_INIT);
    
    // Initialize JPEG encoding scheme (still not sure what it means tho)
    I2C1_Sensor_Bulk_Write(OV2640_YUV422);
    
    // Set sensor to JPEG after init
    I2C1_Sensor_Bulk_Write(OV2640_JPEG);
    
    // Switch Banks
    I2C1_Sensor_Write(CAM_BANKSEL, CAM_BANK_1);
    
    // Configure PCLK and VSYNC polarity
    I2C1_Sensor_Write(0x15, 0x00);
    
    // Initialize JPEG Size
    I2C1_Sensor_Bulk_Write(OV2640_1024x768_JPEG);
    
    delay_ms(1000);
    
    // Clear the FIFO Flag
    Camera_clear_fifo_flag();
    
    printf("Camera initialized!\r\n");
}

void Camera_clear_fifo_flag(void)
{
    SPI1_write_byte(ARDUCHIP_FIFO, FIFO_CLEAR_MASK);
}

void Camera_flush_fifo(void)
{
    SPI1_write_byte(ARDUCHIP_FIFO, FIFO_START_MASK);
}

void Camera_start_capture(void)
{
    SPI1_write_byte(ARDUCHIP_FIFO, FIFO_CLEAR_MASK);
}

uint32_t Camera_read_fifo_length(void)
{
    uint32_t len1,len2,len3,length=0;
    len1 = SPI1_read_byte(FIFO_SIZE1);
    len2 = SPI1_read_byte(FIFO_SIZE2);
    len3 = SPI1_read_byte(FIFO_SIZE3) & 0x7f;
    length = ((len3 << 16) | (len2 << 8) | len1) & 0x07fffff;
	return length;
}

void Camera_set_bit(uint8_t addr, uint8_t bit)
{
    uint8_t addr_val;
	addr_val = SPI1_read_byte(addr_val);
	SPI1_write_byte(addr, addr_val | bit);
}

uint8_t Camera_get_bit(uint8_t addr, uint8_t bit)
{
    uint8_t result;
    result = SPI1_read_byte(addr);
    result = result & bit;
    return result;
}

void Camera_clear_bit(uint8_t addr, uint8_t bit)
{
	uint8_t addr_val;
	addr_val = SPI1_read_byte(addr);
	SPI1_write_byte(addr, addr_val & (~bit));
}

uint8_t Camera_read_fifo_burst()
{
    uint8_t temp = 0, temp_last = 0;
    uint32_t length = 0;
    length = Camera_read_fifo_length();
    bool is_header = false;
    
    if (length >= MAX_FIFO_SIZE) //512 kb
    {
        //ERROR max fifo size too large
        printf("ERROR: Max camera FIFO size too large!\r\n");
        return 0;
    }
    if (length == 0 ) //0 kb
    {
        // ERROR fifo length zero
        printf("ERROR: Camera FIFO Length 0.\r\n");
        return 0;
    }
    
    //myCAM.CS_LOW();
    ASSERT_CS;
    asm volatile( "NOP" ); // no-op delay
    asm volatile( "NOP" ); // no-op delay
    

    //myCAM.set_fifo_burst(); //Set fifo burst mode
    SPI1_transfer(BURST_FIFO_READ);
    
    //temp =  SPI.transfer(0x00); Write a dummy to finish this command
    temp = SPI1_transfer(0);
    
    length --;
    uint32_t buffer_index = 0;
    while ( length-- )
    {
        temp_last = temp;
      
        //temp =  SPI.transfer(0x00); // read data in
        temp = SPI1_transfer(0);
        
        if (is_header == true)
        {
            // SAVE DATA
            //Serial.write(temp);
            JPEG_BUFFER[buffer_index] = temp;
            ++buffer_index;
        }
        else if ((temp == 0xD8) & (temp_last == 0xFF))
        {
            is_header = true;
            //Serial.println(F("ACK CMD IMG END"));
            
            // SAVE DATA
            JPEG_BUFFER[buffer_index] = temp_last;
            JPEG_BUFFER[++buffer_index] = temp;
            //Serial.write(temp_last);
            //Serial.write(temp);
        }
        if ( (temp == 0xD9) && (temp_last == 0xFF) ) //If find the end ,break while,
               break;
        
        // 1260 counts at 84Mhz
        // TODO: Make a delay function for this
        //delayMicroseconds(15);
    }
    
    //myCAM.CS_HIGH();
    asm volatile( "NOP" ); // no-op delay
    asm volatile( "NOP" ); // no-op delay
    NEGATE_CS;
    
    is_header = false;
    return 1;
}

void Camera_capture_image(void)
{
    printf("Beginning image capture...\r\n");
    Camera_flush_fifo();
    Camera_clear_fifo_flag();
    Camera_start_capture();
    
    // waiting for image currently in busy wait - may want to wait in the 500ms loop
    while (!Camera_get_bit(ARDUCHIP_TRIG, CAP_DONE_MASK))
    {
        delay_ms(100);
    }
    
    Camera_read_fifo_burst();
    
    Camera_clear_fifo_flag();
    
    printf("Image captured!\r\n");
    
}

void Camera_convert_image(void)
{
//    FILE *fileptr;
//    char *buffer;
//    long filelen;
//
//    fileptr = fopen("myfile.txt", "rb");  // Open the file in binary mode
//    fseek(fileptr, 0, SEEK_END);          // Jump to the end of the file
//    filelen = ftell(fileptr);             // Get the current byte offset in the file
//    rewind(fileptr);                      // Jump back to the beginning of the file
//
//    buffer = (char *)malloc(filelen * sizeof(char)); // Enough memory for the file
//    fread(buffer, filelen, 1, fileptr); // Read in the entire file
//    fclose(fileptr); // Close the file
    
}
/* *****************************************************************************
 End of File
 */

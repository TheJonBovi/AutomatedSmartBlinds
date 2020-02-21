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
#include <string.h>
#include "tmr1.h"
#include "camera.h"

extern const struct sensor_reg OV2640_JPEG_INIT[];
extern const struct sensor_reg OV2640_YUV422[];
extern const struct sensor_reg OV2640_1024x768_JPEG[];

// Set up Camera to JPEG, size, etc.
void Camera_Configure(void)
{
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
    
    // Initialize something else i'm not sure what
    I2C1_Sensor_Bulk_Write(OV2640_YUV422);
    
    // Switch Banks
    I2C1_Sensor_Write(CAM_BANKSEL, CAM_BANK_1);
    
    // Configure PCLK and VSYNC polarity
    I2C1_Sensor_Write(0x15, 0x00);
    
    // Initialize JPEG Size
    I2C1_Sensor_Bulk_Write(OV2640_1024x768_JPEG);
    
    delay_ms(1000);
    
    // Clear the FIFO Flag
    
    // TODO: CS will not assert again in this call, RBF not filling for some reason
    clear_fifo_flag();
}

void clear_fifo_flag(void)
{
    SPI1_write_byte(ARDUCHIP_FIFO, FIFO_CLEAR_MASK);
}

/* *****************************************************************************
 End of File
 */

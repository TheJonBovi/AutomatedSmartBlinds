/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.
 * 
 * NOTE:
 * Code adapted from work done by Aidan Mocke at
 * https://www.aidanmocke.com/blog/2018/11/27/i2c/

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */
#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include <string.h>
#include "I2C1.h"

void I2C1_Sensor_Initialize(void)
{
    // Clear I2C settings register
    I2C1CON = 0;
    
    // Disable slew rate for 100kHz
    I2C1CONbits.DISSLW = 1; 
    
    // Set BRG according to section 24.4.5 of i2c datasheet 
    // PBCLK = 48Mhz(currently)
    // Target SCL = 100kHz
    I2C1BRG = 236;
    
    // Enable I2C module
    I2C1CONbits.ON = 1;
    
    I2C1_wait_for_idle();
}

// I2C_wait_for_idle() waits until the I2C peripheral is no longer doing anything  
void I2C1_wait_for_idle(void)
{
    while(I2C1CON & 0x1F); // Acknowledge sequence not in progress
                                // Receive sequence not in progress
                                // Stop condition not in progress
                                // Repeated Start condition not in progress
                                // Start condition not in progress
    while(I2C1STATbits.TRSTAT); // Bit = 0 ? Master transmit is not in progress
}

// I2C_start() sends a start condition  
void I2C1_start(void)
{
    I2C1_wait_for_idle();
    I2C1CONbits.SEN = 1;
    while (I2C1CONbits.SEN == 1);
}

// I2C_stop() sends a stop condition  
void I2C1_stop(void)
{
    I2C1_wait_for_idle();
    I2C1CONbits.PEN = 1;
}

// I2C_restart() sends a repeated start/restart condition
void I2C1_restart(void)
{
    I2C1_wait_for_idle();
    I2C1CONbits.RSEN = 1;
    while (I2C1CONbits.RSEN == 1);
}

// I2C_ack() sends an ACK condition
void I2C1_ack(void)
{
    I2C1_wait_for_idle();
    I2C1CONbits.ACKDT = 0; // Set hardware to send ACK bit
    I2C1CONbits.ACKEN = 1; // Send ACK bit, will be automatically cleared by hardware when sent  
    while(I2C1CONbits.ACKEN); // Wait until ACKEN bit is cleared, meaning ACK bit has been sent
}

// I2C_nack() sends a NACK condition
void I2C1_nack(void) // Acknowledge Data bit
{
    I2C1_wait_for_idle();
    I2C1CONbits.ACKDT = 1; // Set hardware to send NACK bit
    I2C1CONbits.ACKEN = 1; // Send NACK bit, will be automatically cleared by hardware when sent  
    while(I2C1CONbits.ACKEN); // Wait until ACKEN bit is cleared, meaning NACK bit has been sent
}

// address is I2C slave address, set wait_ack to 1 to wait for ACK bit or anything else to skip ACK checking  
void I2C1_write(unsigned char address, char wait_ack)
{
    I2C1TRN = address | 0;              // Send slave address with Read/Write bit cleared
    while (I2C1STATbits.TBF == 1);      // Wait until transmit buffer is empty
    I2C1_wait_for_idle();                // Wait until I2C bus is idle
    if (wait_ack) while (I2C1STATbits.ACKSTAT == 1); // Wait until ACK is received  
}

// value is the value of the data we want to send, set ack_nack to 0 to send an ACK or anything else to send a NACK  
void I2C1_read(unsigned char *value, char ack_nack)
{
    I2C1CONbits.RCEN = 1;               // Receive enable
    while (I2C1CONbits.RCEN);           // Wait until RCEN is cleared (automatic)  
    while (!I2C1STATbits.RBF);          // Wait until Receive Buffer is Full (RBF flag)  
    *value = I2C1RCV;                   // Retrieve value from I2C1RCV

    if (!ack_nack)                      // Do we need to send an ACK or a NACK?  
        I2C1_ack();                      // Send ACK  
    else
        I2C1_nack();                     // Send NACK  
}

// Write a value to the Camera register reg_address
void I2C1_Sensor_Write(unsigned char reg_address, unsigned char value)
{
    // Start I2C Module
    I2C1_start();
    
    // Send the address for writing to the sensor
    I2C1_write(CAM_SENSOR_WR_ADDR, ACK_Y);
    
    // Send the address to write to
    I2C1_write(reg_address, ACK_Y);
    
    // Send the value to write to that address
    I2C1_write(value, ACK_Y);
    
    // Stop I2C module
    I2C1_stop();
}

// Read a value from the Camera register reg_address and store in value
void I2C1_Sensor_Read(unsigned char reg_address, unsigned char *value)
{
    // Start I2C Module
    I2C1_start();
    
    // Send the address for writing to the sensor
    I2C1_write(CAM_SENSOR_WR_ADDR, ACK_Y);
    
    // Send the address to read from
    I2C1_write(reg_address, ACK_Y);
    
    // restart transmission to call read command
    I2C1_restart();
    
    // Send the address for reading to the sensor
    I2C1_write(CAM_SENSOR_RD_ADDR, ACK_Y);
    
    // read in the value from reg_address
    I2C1_read(value, ACK_Y);
    
    // Stop I2C Module
    I2C1_stop();    
}

// Write values from a struct into sensor memory
void I2C1_Sensor_Bulk_Write(const struct sensor_reg regList[])
{
    uint16_t reg_addr = 0;
    uint16_t reg_val = 0;
    const struct sensor_reg *next = regList;
	  while ((reg_addr != 0xff) | (reg_val != 0xff))
	  {
	    reg_addr = next->reg;
	    reg_val = next->val;
	    I2C1_Sensor_Write(reg_addr, reg_val);
	    next++;
      }
}
/* *****************************************************************************
 End of File
 */

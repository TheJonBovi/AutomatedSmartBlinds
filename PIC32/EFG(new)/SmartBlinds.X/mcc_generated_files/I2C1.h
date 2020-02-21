/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.
 * 
 *  NOTE:
 * Code adapted from work done by Aidan Mocke at
 * https://www.aidanmocke.com/blog/2018/11/27/i2c/

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _I2C1_H    /* Guard against multiple inclusion */
#define _I2C1_H

#include "ov2640_regs.h"

#define CAM_SENSOR_WR_ADDR 0x60
#define CAM_SENSOR_RD_ADDR 0x61
#define CAM_BANKSEL        0xff

#define CAM_BANK_0         0
#define CAM_BANK_1         1

#define ACK_Y   1
#define ACK_N   0

// function to initialize I2C module for OV2640 image sensor
void I2C1_Sensor_Initialize(void);

// Function to wait for i2c bus to be available to transfer data
void I2C1_wait_for_idle(void);

// I2C_start() sends a start condition  
void I2C1_start(void);

// I2C_stop() sends a stop condition  
void I2C1_stop(void);

// I2C_restart() sends a repeated start/restart condition
void I2C1_restart(void);

// I2C_ack() sends an ACK condition
void I2C1_ack(void);

// I2C_nack() sends a NACK condition
void I2C1_nack(void);

// address is I2C slave address, set wait_ack to 1 to wait for ACK bit or anything else to skip ACK checking  
void I2C1_write(unsigned char address, char wait_ack);

// value is the value of the data we want to send, set ack_nack to 0 to send an ACK or anything else to send a NACK  
void I2C1_read(unsigned char *value, char ack_nack);

// Write a value to the Camera register reg_address
void I2C1_Sensor_Write(unsigned char reg_address, unsigned char value);

// Read a value from the Camera register reg_address and store in value
void I2C1_Sensor_Read(unsigned char reg_address, unsigned char *value);

// Write values from a struct into sensor memory
void I2C1_Sensor_Bulk_Write(const struct sensor_reg regList[]);

#endif /* _I2C1_H */

/* *****************************************************************************
 End of File
 */

/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.
 * 
 * Credit to Arducam Arduino code provided by Arducam

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _CAMERA_H    /* Guard against multiple inclusion */
#define _CAMERA_H

#include "SPI1.h"
#include "I2C1.h"
#include "ov2640_regs.h"

#define ARDUCHIP_FIFO      		0x04  //FIFO and I2C control
#define FIFO_CLEAR_MASK    		0x01
#define FIFO_START_MASK    		0x02
#define FIFO_RDPTR_RST_MASK     0x10
#define FIFO_WRPTR_RST_MASK     0x20

#define FIFO_SIZE1				0x42  //Camera write FIFO size[7:0] for burst to read
#define FIFO_SIZE2				0x43  //Camera write FIFO size[15:8]
#define FIFO_SIZE3				0x44  //Camera write FIFO size[18:16]

#define MAX_FIFO_SIZE		0x7FFFFF		//8MByte

#define BURST_FIFO_READ			0x3C  //Burst FIFO read operation
#define SINGLE_FIFO_READ		0x3D  //Single FIFO read operation

#define JPEG_SIZE OV2640_1024x768_JPEG

#define ARDUCHIP_TRIG      		0x41  //Trigger source
#define VSYNC_MASK         		0x01
#define SHUTTER_MASK       		0x02
#define CAP_DONE_MASK      		0x08


// Set up Camera to JPEG, size, etc.
void Camera_Configure(void);

// Clear Camera FIFO to be able to capture images
void Camera_clear_fifo_flag(void);

// Flush camera fifo before capturing
void Camera_flush_fifo(void);

// Send command to start capture 
void Camera_start_capture(void);

// Read chip to determine FIFO Length
uint32_t Camera_read_fifo_length(void);

// Set a specific bit in the camera registers
void Camera_set_bit(uint8_t addr, uint8_t bit);

// Get a specific bit in the camera registers
uint8_t Camera_get_bit(uint8_t addr, uint8_t bit);

// Clear a specific bit in the camera registers
void Camera_clear_bit(uint8_t addr, uint8_t bit);

// Function for reading camera data
uint8_t Camera_read_fifo_burst(void);

// Function to capture an image
void Camera_capture_image(void);

// Function that converts image into a byte stream
void Camera_convert_image(void);

#endif /* _CAMERA_H */

/* *****************************************************************************
 End of File
 */

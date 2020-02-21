/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

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

#define JPEG_SIZE OV2640_1024x768_JPEG

// Set up Camera to JPEG, size, etc.
void Camera_Configure(void);

// Clear Camera FIFO to be able to capture images
void clear_fifo_flag(void);

#endif /* _CAMERA_H */

/* *****************************************************************************
 End of File
 */

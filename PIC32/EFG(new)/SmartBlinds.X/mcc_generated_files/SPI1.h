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

#ifndef _SPI1_H    /* Guard against multiple inclusion */
#define _SPI1_H

// Function to initialize Arducam on SPI1
void SPI1_Camera_Initialize(void);

// Function for writing a single byte to the camera internal memory
void SPI1_write_byte(int addr, char * value);

// Function to read a single byte from the register at addr
char SPI1_read_byte(int addr);


#endif /* _SPI1_H*/

/* *****************************************************************************
 End of File
 */
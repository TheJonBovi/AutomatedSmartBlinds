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

#define ASSERT_CS PORTFCLR = _TRISF_TRISF2_MASK 
#define NEGATE_CS PORTFSET = _TRISF_TRISF2_MASK

// Function to initialize Arducam on SPI1
void SPI1_Camera_Initialize(void);

// Function for writing a single byte to the camera internal memory
void SPI1_write_byte(int addr, char value);

// Function to read a single byte from the register at addr
char SPI1_read_byte(int addr);

// function to test RD1 soldering job by setting it to an output to blink an LED
void test_RD1_Initialize(void);

// Function to test RD1 soldering by flashing
void toggle_RD1(void);

// Function for writing out bytes for sequencing SPI bursts
uint8_t SPI1_transfer(uint8_t data);

#endif /* _SPI1_H*/

/* *****************************************************************************
 End of File
 */

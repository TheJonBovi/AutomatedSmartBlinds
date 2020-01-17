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

#ifndef _EXAMPLE_FILE_NAME_H    /* Guard against multiple inclusion */
#define _EXAMPLE_FILE_NAME_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Defines                                                           */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

/* TODO:  Include other files here if needed. */
// These will be the ADC values used to determine distance / proximity zones.
#define ADC_LOW_WNG 2400
#define ADC_MID_WNG 2500
#define ADC_HIGH_WNG 3125

#define LED_RED _TRISF_RF0_MASK
#define LED_BLU _TRISF_RF1_MASK
#define LED_GRN _TRISF_RF2_MASK


//define own motor position, mask, and length
//up down motor
#define _UDMOTOR_POSITION   0x00000001
#define _UDMOTOR_MASK       0x0000001E
#define _UDMOTOR_LENGTH     0x00000004
//open close motor
#define _OCMOTOR_MASK       0xFFFFF4EF

//define all of the states that will be needed
//up down motor
#define _UDMOTOR_S0 0x0010
#define _UDMOTOR_S1 0x0018
#define _UDMOTOR_S2 0x0008
#define _UDMOTOR_S3 0x000C
#define _UDMOTOR_S4 0x0004
#define _UDMOTOR_S5 0x0006
#define _UDMOTOR_S6 0x0002
#define _UDMOTOR_S7 0x0012
//open close motor
#define _OCMOTOR_S0 0x800
#define _OCMOTOR_S1 0xA00
#define _OCMOTOR_S2 0x200
#define _OCMOTOR_S3 0x300
#define _OCMOTOR_S4 0x100
#define _OCMOTOR_S5 0x110
#define _OCMOTOR_S6 0x010
#define _OCMOTOR_S7 0x810

//defining temperature values to compare with the temperature readings
#define TEMP_HIGH 0xFFFF //These are not the real values. Need to calculate them.
#define TEMP_LOW 0x0000

//defining gas/smoke values to compare with the gas/smoke readings
#define GAS_HIGH 0xFFFF //These are not the real values. Need to calculate them.


#endif



/* *****************************************************************************
 End of File
 */

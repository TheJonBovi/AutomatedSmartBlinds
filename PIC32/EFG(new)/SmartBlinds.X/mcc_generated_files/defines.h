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

#ifndef _DEFINES_H    /* Guard against multiple inclusion */
#define _DEFINES_H

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
#define TEMP_HIGH 0x05A //90 degrees F
#define TEMP_LOW  0x03C //60 degrees F

//defining gas/smoke values to compare with the gas/smoke readings
#define GAS_HIGH 0xFFFF //These are not the real values. Need to calculate them.
#define GAS_LOW  0x0000

//the positions for the UD motor. They can also be used for the opposite direction.
//new measurements for the OC: 0 is full open, 256 is full close, -256 is full reverse close
//128 is half open, -128 is half reverse open, 64 is quarter open, -64 is quarter reverse open
#define UD_FULL_UP      0
#define UD_1_QUARTER    128
#define UD_HALF         256
#define UD_3_QUARTER    384
#define UD_FULL_DOWN    512

#define OC_FULL_CLOSE   0
#define OC_HALF         64
#define OC_FULL_OPEN    128 
#define OC_R_HALF       192
#define OC_FULL_R_CLOSE 256
#define MOTOR_OFF()     T5CONbits.TON = 0
#define MOTOR_ON()      T5CONbits.TON = 1
#define MOTOR_DIR_UP    1
#define MOTOR_DIR_DOWN  0
#define MOTOR_DIR_OPEN  1
#define MOTOR_DIR_CLOSE 0
#define UD_MOTOR        1
#define OC_MOTOR        2

//These will be the call commands for each of the functions
#define CLOSE_BLINDS        0x0001
#define HALF_CLOSE_BLINDS   0x0010
#define OPEN_BLINDS         0x0011
#define R_CLOSE_BLINDS      0x0100
#define R_HALF_CLOSE_BLIDNS 0x0101
#define RAISE_BLINDS        0x0110
#define HALF_RAISE_BLINDS   0x0111
#define LOWER_BLINDS        0x1000
#define HALF_LOWER_BLINDS   0x1001



#endif /* _DEFINES_H */

/* *****************************************************************************
 End of File
 */

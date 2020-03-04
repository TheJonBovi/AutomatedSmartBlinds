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
#define _UDMOTOR_SOFF 0x0000
//open close motor
#define _OCMOTOR_S0 0x800
#define _OCMOTOR_S1 0xA00
#define _OCMOTOR_S2 0x200
#define _OCMOTOR_S3 0x300
#define _OCMOTOR_S4 0x100
#define _OCMOTOR_S5 0x110
#define _OCMOTOR_S6 0x010
#define _OCMOTOR_S7 0x810
#define _OCMOTOR_SOFF 0x0000

//defining temperature values to compare with the temperature readings
//190 is BE. 245 with hot breath. Set to 400 dec for high.
#define TEMP_HIGH 0x0190 //90 degrees F is the target.
#define TEMP_LOW  0x003C //60 degrees F

//defining gas/smoke values to compare with the gas/smoke readings
//550-590 dec is the average for any given time. Set to 800 dec for high.
#define GAS_HIGH 0x320 //These are not the real values. Need to calculate them.

// This value is how we set the motor speed. For reverence
// 300 = 1 rot / 5 seconds
#define MOTOR_PR_SETTING 300

//the positions for the UD motor. They can also be used for the opposite direction.
//new measurements for the OC: 0 is full open, 256 is full close, -256 is full reverse close
//128 is half open, -128 is half reverse open, 64 is quarter open, -64 is quarter reverse open
#define UD_FULL_UP      0 //fully up
#define UD_1_QUARTER    128 //quarter way down
#define UD_HALF         256 //halfway down
#define UD_3_QUARTER    384 //3 quarter way down
#define UD_FULL_DOWN    512 //fully down

#define OC_FULL_CLOSE   0 //fully closed (facing up)
#define OC_HALF         64 //half way to full open
#define OC_FULL_OPEN    128 //full open (can see through)
#define OC_R_HALF       192 //mostly closed
#define OC_FULL_R_CLOSE 256 //fully closed (facing down))

#define MOTOR_OFF()     T5CONbits.TON = 0 //set the motor off
#define MOTOR_ON()      T5CONbits.TON = 1 //set the motor on
#define MOTOR_DIR_UP    1 //used to check on what direction the motor is going
#define MOTOR_DIR_DOWN  0 //used to check on what direction the motor is going
#define MOTOR_DIR_OPEN  1 //used to check on what direction the motor is going
#define MOTOR_DIR_CLOSE 0 //used to check on what direction the motor is going
#define UD_MOTOR        1 //used to set which motor to be turned on or off
#define OC_MOTOR        2 //used to set which motor to be turned on or off

//These will be the call commands for each of the functions
//open close commands
#define CLOSE_BLINDS                0b0000001 //oc full close
#define HALF_CLOSE_BLINDS           0b0000010 //oc half
#define OPEN_BLINDS                 0b0000011 //oc full open
#define REVERSE_CLOSE_BLINDS        0b0000100 //oc r half
#define REVERSE_HALF_CLOSE_BLIDNS   0b0000101 //oc full r close
//up down commands
#define RAISE_BLINDS                0b0000110 //full up
#define ONE_QUARTER_BLINDS          0b0000111 //1 quarter down
#define LOWER_BLINDS                0b0001000 //full down
#define THREE_QUARTER_BLINDS        0b0001001 //3 quarter down
#define HALF_BLINDS                 0b0001010 //half raise/lower

#define TEMP_REQUEST                0b0001011 //request for the temperature readings
#define GAS_REQUEST                 0b0001100 //request for the gas sensor readings

//this is meant for a timer in main to have the proxy remain on
//and thus have the connected function remain on until the counter
//has reached the max timer.
#define maxProxy 15 

#define JPEG_MAX_SIZE               100000          

// Defines for wifi state machine to determine which string to send
#define WIFI_LOG_ENTRY_MODE        0
#define WIFI_HELLOXML_MODE         1  
#endif /* _DEFINES_H */

/* *****************************************************************************
 End of File
 */

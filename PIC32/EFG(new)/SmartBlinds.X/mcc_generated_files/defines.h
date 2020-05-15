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
#define ADC_LOW_WNG 2300
#define ADC_MID_WNG 2800
//#define ADC_MID_WNG 2500
#define ADC_HIGH_WNG 3300

#define LED_RED _TRISF_RF0_MASK
#define LED_BLU _TRISF_RF1_MASK
#define LED_GRN _TRISF_RF2_MASK

#define WDT_Clear() WDTCONSET = (0x5743 << _WDTCON_WDTCLRKEY_POSITION) & _WDTCON_WDTCLRKEY_MASK


//define own motor position, mask, and length
//up down motor
#define _UDMOTOR_POSITION   0x00000001
#define _UDMOTOR_MASK       0x0000001E
#define _UDMOTOR_LENGTH     0x00000004
//open close motor
#define _OCMOTOR_MASK       0xFFFFF4EF

//define all of the states that will be needed
//up down motor
#define _UDMOTOR_S0     0x0010
#define _UDMOTOR_S1     0x0018
#define _UDMOTOR_S2     0x0008
#define _UDMOTOR_S3     0x000C
#define _UDMOTOR_S4     0x0004
#define _UDMOTOR_S5     0x0006
#define _UDMOTOR_S6     0x0002
#define _UDMOTOR_S7     0x0012
#define _UDMOTOR_SOFF   0x0000
//open close motor
#define _OCMOTOR_S0     0x800
#define _OCMOTOR_S1     0xA00
#define _OCMOTOR_S2     0x200
#define _OCMOTOR_S3     0x300
#define _OCMOTOR_S4     0x100
#define _OCMOTOR_S5     0x110
#define _OCMOTOR_S6     0x010
#define _OCMOTOR_S7     0x810
#define _OCMOTOR_SOFF   0x0000

//defining gas/smoke values to compare with the gas/smoke readings
//550-590 dec is the average for any given time. Set to 800 dec for high.
#define GAS_HIGH        -1 //These are not the real values. Need to calculate them.

#define TEMP_SAMPLES     20
#define INIT_TEMP_AVG    62

// This value is how we set the motor speed. For reverence
// 300 = 1 rot / 5 seconds, changed to 900 to slow down the motor
//400 new setting where it works
#define MOTOR_PR_SETTING 400

//the positions for the UD motor. They can also be used for the opposite direction.
//new measurements for the OC: 0 is full open, 256 is full close, -256 is full reverse close
//128 is half open, -128 is half reverse open, 64 is quarter open, -64 is quarter reverse open
#define UD_FULL_UP      1024 //fully up. modify to 1024 (was 0) NEW: set to -1024 to bring up blinds
#define UD_1_QUARTER    768 //quarter way down
#define UD_HALF         512 //halfway down
#define UD_3_QUARTER    256 //3 quarter way down
#define UD_FULL_DOWN    0 //fully down. modify to 0 (was 1024)

#define OC_FULL_CLOSE   150 //fully closed (facing up)
#define OC_HALF         75 //half way to full open
#define OC_FULL_OPEN    0 //full open (can see through).
#define OC_R_HALF       -75 //mostly closed
#define OC_FULL_R_CLOSE -150 //fully closed (facing down))

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

//this is meant for a timer in main to have the proxy remain on
//and thus have the connected function remain on until the counter
//has reached the max timer.
#define maxProxy            20 // this number x 0.5 seconds for Proxy alarm 
#define maxTMR3ISRdebounce  5000 // this x 1.5ms to determine how long to hold before checking samples for ADC

#define JPEG_MAX_SIZE               10000          

// Defines for wifi message_type to determine which string to send
#define WIFI_DO_NOTHING             0
#define WIFI_LOG_ENTRY_MODE         1
#define WIFI_HELLOXML_MODE          2
#define WIFI_RECIEVE_MODE           3
#define WIFI_IMG_UPLOAD_MODE        4

// Defines for Call Control State Machine
#define CALL_IDLE_STATE             0
#define CALL_LOG_STATE              1
#define CALL_RCV_STATE              2
#define CALL_IMG_STATE              3
#define CALL_LOG_WAIT_STATE         4
#define CALL_RCV_WAIT_STATE         5
#define CALL_RCV_PROCESS_STATE      6

#define callControlDelayMAX         4

// toggles various functionality in project
//#define CAMERA_ON
//#define DREW_PHONE
#define DREW_HOUSE
//#define CHAD_HOUSE

#endif /* _DEFINES_H */

/* *****************************************************************************
 End of File
 */

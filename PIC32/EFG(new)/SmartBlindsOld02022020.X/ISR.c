/* ************************************************************************** */
/** 
 
 * Automated Smart Blinds
 * 
 *  Andrew, Chad and Michael
 * 
 *
 * ISR.c
 * 
 * 
 * This file has the routines for all Interrupt Service Routines.
 * 
 * 
 * Current Interrupts and Priorities / SS's
 * 
 * TMR2 for ADC loop set to 32-bit mode, TMR3 ISR priority 1, SRS 1
 * TMR4 for buzzer freq set to 16-bit mode, TMR4 ISR priority 2, SRS 2
 * TMR5 for motors speed set to 16-bit mode, TMR5 ISR priority 2, SRS 2
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include "defines.h"

//global variables
//variables used for the motor to turn on, direction, and state
int motorTargetUD;
int motorTargetOC;
int UDStepperState = 0;
int OCStepperState = 0;
int motorUD;
int motorOC;
int motorID;
int counterUD = 0;
int counterOC = 0;
int temperatureAlarm = 0;
int gasAlarm = 0;
int proxyAlert = 0;

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */
/** Descriptive Data Item Name

  @Summary
    Brief one-line summary of the data item.
    
  @Description
    Full description, explaining the purpose and usage of data item.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.
    
  @Remarks
    Any additional remarks
 */

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */

/** 
  @Function
    int ExampleLocalFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Description
    Full description, explaining the purpose and usage of the function.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.

  @Precondition
    List and describe any required preconditions. If there are no preconditions,
    enter "None."

  @Parameters
    @param param1 Describe the first parameter to the function.
    
    @param param2 Describe the second parameter to the function.

  @Returns
    List (if feasible) and describe the return values of the function.
    <ul>
      <li>1   Indicates an error occurred
      <li>0   Indicates an error did not occur
    </ul>

  @Remarks
    Describe any special behavior not described above.
    <p>
    Any additional remarks.

  @Example
    @code
    if(ExampleFunctionName(1, 2) == 0)
    {
        return 3;
    }
 */
static int ExampleLocalFunction(int param1, int param2) {
    return 0;
}


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

// *****************************************************************************

/** 
  @Function

 * T2_ISR

  @Summary
    
 * This function services the T2 interrupt

  @Remarks
    Refer to the ISR.h interface header for function usage details.
*/
void __ISR_AT_VECTOR(_TIMER_2_VECTOR, IPL5SRS) T2_ISR(void)
{
//    T2_count++;
    // Clear T2IF atomically
    IFS0CLR = _IFS0_T2IF_MASK;
}

/** 
  @Function

 * T3_ISR

  @Summary
    
 * This function services the T3 interrupt

  @Remarks
    Refer to the ISR.h interface header for function usage details.
*/
//This is for the ADC configs
void __ISR_AT_VECTOR(_TIMER_3_VECTOR, IPL1SRS) T3_ISR(void)
{
    // ADC loop and test output on LED's for proximity sensor
    int current_read[3];
   
//    /* Trigger a conversion */
    ADCCON3bits.GSWTRG = 1;
    /* Wait the conversions to complete */
    while (ADCDSTAT1bits.ARDY0 == 0);
    /* fetch the result */
    current_read[0] = ADCDATA0;
//    while (ADCDSTAT1bits.ARDY1 == 0);
//    /* fetch the result */
//    current_read[1] = ADCDATA1;
//    while (ADCDSTAT1bits.ARDY3 == 0);
//    /* fetch the result */
//    current_read[2] = ADCDATA3;
//    

    /*
    * Process results here
    *
    * Note: Loop time determines the sampling time since all inputs are Class 1.
    * If the loop time is small and the next trigger happens before the completion
    * of set sample time, the conversion will happen only after the sample time
    * has elapsed.
    *
    */

    // Set the LED levels according to IR proximity reading
    if (current_read[0] <= ADC_LOW_WNG) PORTK = 0b0;
    else if (ADC_LOW_WNG < current_read[0] && current_read[0] <= ADC_MID_WNG) PORTK = 0b1;
    else if (ADC_MID_WNG < current_read[0] && current_read[0] <= ADC_HIGH_WNG) PORTK = 0b11;
    else 
    {
        proxyAlert = 1;
        PORTK = 0b111;
    }
    
    //toggle RK3 for light
    PORTKINV = _PORTK_RK3_MASK;
    
    // Clear T3IF atomically
    IFS0CLR = _IFS0_T3IF_MASK;
    
    ///////////////////////////////////////////////////////////////////////////////////////////
    //This section is for the temperature
    
    //toggle RB3 for the temperature (AN3)
    PORTBINV = _PORTB_RB3_MASK;
    
    // Clear T3IF atomically
    IFS0CLR = _IFS0_T3IF_MASK;

    
    ////////////////////////////////////////////////////////////////////////////////////
    //This section is for the gas
    
    //toggle RB1 for the gas sensor (AN1)
    PORTBINV = _PORTB_RB1_MASK;
    
    // Clear T3IF atomically
    IFS0CLR = _IFS0_T3IF_MASK;
    

}

//This ISR will be used for the stepper motors UD/OC
void __ISR_AT_VECTOR(_TIMER_5_VECTOR, IPL2SRS) T5_ISR(void)
{
    int motorDirectionUD;
    int motorDirectionOC;
    
    //TODO LIST
    /*
     Put blinker in this ISR
     check ISR steps for each motor step
     debug each step
     */
     
    
    //This will check if the target is either greater or less than
    //the motors position, and choose which direction to go accordingly.
    //Otherwise it'll keep the motor off and return to the source.
    
    //If the motor target is less than the motors position, then it'll go up
    if (motorTargetUD < counterUD)
        motorDirectionUD = MOTOR_DIR_UP; 
    //else if the motor target is greater than the motors position, then it'll go down
    else if (motorTargetUD > counterUD)
        motorDirectionUD = MOTOR_DIR_DOWN;
    //else the motor will turn off and return
    else
    {
        motorUD = false;
    }
    
    //this is for the up down motor
    if (motorUD == true)
    {
        switch (UDStepperState)
        {
            case 0:
                //This is for each part of the 8 step rotation
                //the first key is pressed (CW) and the second key (CCW)
                //is not pressed, then turn on motor and turn CW
                //if the direction is cw, then go to stepper state 1
                if (motorDirectionUD == MOTOR_DIR_UP) 
                    UDStepperState = 1;
                //else it's ccw and go to stepper state 7    
                else    
                    UDStepperState = 7;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S0;

                break;
            case 1:
                //if the direction is cw, then go to stepper state 2
                if (motorDirectionUD == MOTOR_DIR_UP) 
                    UDStepperState = 2;
                //else it's ccw and go to stepper state 0
                else 
                    UDStepperState = 0;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S1;
                break;

            case 2:
                //if the direction is cw, then go to stepper state 3
                if (motorDirectionUD == MOTOR_DIR_UP) 
                    UDStepperState = 3;
                //else it's ccw and go to stepper state 1
                else
                    UDStepperState = 1;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S2;
                break;

            case 3:
                //if the direction is cw, then go to stepper state 4
                if (motorDirectionUD == MOTOR_DIR_UP) 
                    UDStepperState = 4;
                //else it's ccw and go to stepper state 2
                else
                    UDStepperState = 2;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S3;
                break;

            case 4:
                //if the direction is cw, then go to stepper state 5
                if (motorDirectionUD == MOTOR_DIR_UP) 
                    UDStepperState = 5;
                //else it's ccw and go to stepper state 3
                else
                    UDStepperState = 3;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S4;
                break;

            case 5:
                //if the direction is cw, then go to stepper state 6
                if (motorDirectionUD == MOTOR_DIR_UP) 
                    UDStepperState = 6;
                //else it's ccw and go to stepper state 4
                else
                    UDStepperState = 4;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S5;
                break;

            case 6:
                //if the direction is cw, then go to stepper state 6
                if (motorDirectionUD == MOTOR_DIR_UP) 
                    UDStepperState = 7;
                //else it's ccw and go to stepper state 5
                else
                    UDStepperState = 5;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S6;
                break;

            case 7:
                //if the direction is cw, then go to stepper state 0
                //and increment the counter for UDMOTOR
                if (motorDirectionUD == MOTOR_DIR_UP)
                {
                    UDStepperState = 0;
                    counterUD--;
                }
                //else the direction is ccw, go to stepper state 6
                //and decrement the counter for UDMOTOR
                else
                {
                    UDStepperState = 6;
                    counterUD++;
                }
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S7;
                break;
            //nothing is happening, so jump out    
            default:
                break;
        }
    }
    
    //This will check if the target is either greater or less than
    //the motors position, and choose which direction to go accordingly.
    //Otherwise it'll keep the motor off and return to the source.
    
    //If the motor target is less than the motor location, then it'll close
    if (motorTargetUD < counterOC)
        motorDirectionOC = MOTOR_DIR_OPEN; 
    //else if the motor target is greater than the motor location, then it'll open
    else if (motorTargetUD > counterOC)
        motorDirectionOC = MOTOR_DIR_CLOSE;
    //else it'll turn off the motor and return
    else
    {
        motorOC = false;
    }
    //This is for the open close motor
    if (motorOC == true)
    {
        switch (OCStepperState)
        {
            case 0:
                //This is for each part of the 8 step rotation
                //the first key is pressed (CW) and the second key (CCW)
                //is not pressed, then turn on motor and turn CW
                //if the direction is cw, then go to stepper state 1
                if (motorDirectionOC == MOTOR_DIR_OPEN)
                    OCStepperState = 1;
                //else it's ccw and go to stepper state 7
                else    
                    OCStepperState = 7;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S0;
                break;
            case 1:
                //if the direction is cw, then go to stepper state 2
                if (motorDirectionOC == MOTOR_DIR_OPEN) 
                    OCStepperState = 2;
                //else it's ccw and go to stepper state 0
                else 
                    OCStepperState = 0;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S1;
                break;
            case 2:
                //if the direction is cw, then go to stepper state 3
                if (motorDirectionOC == MOTOR_DIR_OPEN) 
                    OCStepperState = 3;
                //else it's ccw and go to stepper state 1
                else
                    OCStepperState = 1;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S2;
                break;
            case 3:
                //if the direction is cw, then go to stepper state 4
                if (motorDirectionOC == MOTOR_DIR_OPEN) 
                    OCStepperState = 4;
                //else it's ccw and go to stepper state 2
                else
                    OCStepperState = 2;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S3;
                break;
            case 4:
                //if the direction is cw, then go to stepper state 5
                if (motorDirectionOC == MOTOR_DIR_OPEN) 
                    OCStepperState = 5;
                //else it's ccw and go to stepper state 3
                else
                    OCStepperState = 3;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S4;
                break;
            case 5:
                //if the direction is cw, then go to stepper state 6
                if (motorDirectionOC == MOTOR_DIR_OPEN) 
                    OCStepperState = 6;
                //else it's ccw and go to stepper state 4
                else
                    OCStepperState = 4;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S5;
                break;
            case 6:
                //if the direction is cw, then go to stepper state 7
                if (motorDirectionOC == MOTOR_DIR_OPEN) 
                    OCStepperState = 7;
                //else it's ccw and go to stepper state 5
                else
                    OCStepperState = 5;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S6;
                break;
            case 7:
                //if the direction is cw, then go to stepper state 0
                //and increment the counter for OCMOTOR
                if (motorDirectionOC == MOTOR_DIR_OPEN)
                {
                    OCStepperState = 0;
                    counterOC--;
                }
                //else the direction is ccw, go to stepper state 6
                //and decrement the counter for OCMOTOR
                else
                {
                    OCStepperState = 6;
                    counterOC++;
                }
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S7;
                break;
            //nothing is happening, so jump out    
            default:
                break;
        }
    }
    //if both of the motors are signaled to turn off, then turn off the motors
    if (motorOC == 0 && motorUD == 0)
    {
        MOTOR_OFF();
    }
        
    //clear the T5IF
    IFS0CLR = _IFS0_T5IF_MASK;
}

//This is the ISR for the buzzer to activate
void __ISR_AT_VECTOR(_TIMER_4_VECTOR, IPL2SRS) T4_ISR(void)
{
    //toggle RF8
    PORTFINV = _PORTF_RF8_MASK;
    
    //clear the T4IF
    IFS0CLR = _IFS0_T4IF_MASK; 
}

/* *****************************************************************************
 End of File
 */


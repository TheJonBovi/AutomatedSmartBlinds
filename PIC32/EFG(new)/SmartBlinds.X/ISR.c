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
 * INT0 used for Wifi External Interrupts. ISR priority 3, SRS 3
 * INT0 External interrupt for Wifi. ISR priority 4, SRS 4
 * SPI1 used for Wi-fi communication, SPI1RX ISR priority 6, SRS 6
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
int motor_direction = 0;
int UD_stepper_state = 0;
int OC_stepper_state = 0;
int motorUD = 0;
int motorOC = 0;
int counterUD = 0;
int counterOC = 0;

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
void __ISR_AT_VECTOR(_TIMER_3_VECTOR, IPL1SRS) T3_ISR(void)
{
    // ADC loop and test output on LED's for proximity sensor
    int current_read[3];
   
//    /* Trigger a conversion */
//    ADCCON3bits.GSWTRG = 1;
//    /* Wait the conversions to complete */
//    while (ADCDSTAT1bits.ARDY0 == 0);
//    /* fetch the result */
//    current_read[0] = ADCDATA0;
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
//    if (current_read[0] <= ADC_LOW_WNG) PORTK = 0b0;
//    else if (ADC_LOW_WNG < current_read[0] && current_read[0] <= ADC_MID_WNG) PORTK = 0b1;
//    else if (ADC_MID_WNG < current_read[0] && current_read[0] <= ADC_HIGH_WNG) PORTK = 0b11;
//    else PORTK = 0b111;
//  
    //toggle RK3 for light
    PORTKINV = _PORTK_RK3_MASK;
    
    // Clear T3IF atomically
    IFS0CLR = _IFS0_T3IF_MASK;
}

//This ISR will be used for the stepper motors UD/OC
void __ISR_AT_VECTOR(_TIMER_5_VECTOR, IPL2SRS) T5_ISR(void)
{
    //TODO LIST
    /*
     Put blinker in this ISR
     check ISR steps for each motor step
     debug each step
     */
     
    //this is for the up down motor
    if (motorUD == 1)
    {
        switch (UD_stepper_state)
        {
            case 0:
                //This is for each part of the 8 step rotation
                //the first key is pressed (CW) and the second key (CCW)
                //is not pressed, then turn on motor and turn CW
                //if the direction is cw, then go to stepper state 1
                if (motor_direction == 1) 
                    UD_stepper_state = 1;
                //else it's ccw and go to stepper state 7    
                else    
                    UD_stepper_state = 7;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S0;
                
                break;
            case 1:
                //if the direction is cw, then go to stepper state 2
                if (motor_direction == 1) 
                    UD_stepper_state = 2;
                //else it's ccw and go to stepper state 0
                else 
                    UD_stepper_state = 0;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S1;
                break;
            
            case 2:
                //if the direction is cw, then go to stepper state 3
                if (motor_direction == 1) 
                    UD_stepper_state = 3;
                //else it's ccw and go to stepper state 1
                else
                    UD_stepper_state = 1;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S2;
                break;

            case 3:
                //if the direction is cw, then go to stepper state 4
                if (motor_direction == 1) 
                    UD_stepper_state = 4;
                //else it's ccw and go to stepper state 2
                else
                    UD_stepper_state = 2;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S3;
                break;
            
            case 4:
                //if the direction is cw, then go to stepper state 5
                if (motor_direction == 1) 
                    UD_stepper_state = 5;
                //else it's ccw and go to stepper state 3
                else
                    UD_stepper_state = 3;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S4;
                break;
            
            case 5:
                //if the direction is cw, then go to stepper state 6
                if (motor_direction == 1) 
                    UD_stepper_state = 6;
                //else it's ccw and go to stepper state 4
                else
                    UD_stepper_state = 4;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S5;
                break;
           
            case 6:
                //if the direction is cw, then go to stepper state 6
                if (motor_direction == 1) 
                    UD_stepper_state = 7;
                //else it's ccw and go to stepper state 5
                else
                    UD_stepper_state = 5;
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S6;
                break;
            
            case 7:
                //if the direction is cw, then go to stepper state 0
                //and increment the counter for UDMOTOR
                if (motor_direction == 1)
                {
                    UD_stepper_state = 0;
                    counterUD++;
                }
                //else the direction is ccw, go to stepper state 6
                //and decrement the counter for UDMOTOR
                else
                {
                    UD_stepper_state = 6;
                    counterUD--;
                }
                //set the UDMOTOR state to out
                PORTC = _UDMOTOR_S7;
                break;
            //nothing is happening, so jump out    
            default:
                break;
        }
        //check the counter to its preset stage
//        if (counterUD = 1000 || counterUD = -1000)
//        {
//            motorUD = 0;
//        }
    }
    
    //This is for the open close motor
    else if (motorOC == 1)
    {
        switch (OC_stepper_state)
        {
            case 0:
                //This is for each part of the 8 step rotation
                //the first key is pressed (CW) and the second key (CCW)
                //is not pressed, then turn on motor and turn CW
                //if the direction is cw, then go to stepper state 1
                if (motor_direction == 1) 
                    OC_stepper_state = 1;
                //else it's ccw and go to stepper state 7
                else    
                    OC_stepper_state = 7;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S0;
                
                break;
            case 1:
                //if the direction is cw, then go to stepper state 2
                if (motor_direction == 1) 
                    OC_stepper_state = 2;
                //else it's ccw and go to stepper state 0
                else 
                    OC_stepper_state = 0;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S1;
                break;
            case 2:
                //if the direction is cw, then go to stepper state 3
                if (motor_direction == 1) 
                    OC_stepper_state = 3;
                //else it's ccw and go to stepper state 1
                else
                    OC_stepper_state = 1;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S2;
                break;

            case 3:
                //if the direction is cw, then go to stepper state 4
                if (motor_direction == 1) 
                    OC_stepper_state = 4;
                //else it's ccw and go to stepper state 2
                else
                    OC_stepper_state = 2;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S3;
                break;
            
            case 4:
                //if the direction is cw, then go to stepper state 5
                if (motor_direction == 1) 
                    OC_stepper_state = 5;
                //else it's ccw and go to stepper state 3
                else
                    OC_stepper_state = 3;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S4;
                break;
            
            case 5:
                //if the direction is cw, then go to stepper state 6
                if (motor_direction == 1) 
                    OC_stepper_state = 6;
                //else it's ccw and go to stepper state 4
                else
                    OC_stepper_state = 4;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S5;
                break;
           
            case 6:
                //if the direction is cw, then go to stepper state 7
                if (motor_direction == 1) 
                    OC_stepper_state = 7;
                //else it's ccw and go to stepper state 5
                else
                    OC_stepper_state = 5;
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S6;
                break;
            
            case 7:
                //if the direction is cw, then go to stepper state 0
                //and increment the counter for OCMOTOR
                if (motor_direction == 1)
                {
                    OC_stepper_state = 0;
                    counterOC++;
                }
                //else the direction is ccw, go to stepper state 6
                //and decrement the counter for OCMOTOR
                else
                {
                    OC_stepper_state = 6;
                    counterOC--;
                }
                //set the OCMOTOR state to out
                PORTB = _OCMOTOR_S7;
                break;
            //nothing is happening, so jump out    
            default:
                break;
        }
    
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


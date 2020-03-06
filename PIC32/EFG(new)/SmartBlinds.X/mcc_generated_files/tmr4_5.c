/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#include <xc.h>
#include <sys/attribs.h>
#include <stdint.h>
#include <stdbool.h>
#include "defines.h"
#include "mcc.h"
#include "tmr4_5.h"

extern int motorTargetUD;
extern int motorTargetOC;
extern int counterUD;
extern int motorUD;
extern int counterOC;
extern int motorOC;
extern int UDStepperState;
extern int OCStepperState;
extern bool buzzerTrigger;
extern int proxyAlarmState;

//Timer 4 is for the buzzer
void TMR4_16bit_Initialize(void)
{
    //Need to have timer 4 be 16 bit config
    //if the system calls function, buzzer activates until call ends
    //need to have the buzzer set to 4KHz. TMR4 set to 1/4KHz.
    //.25KHz pbclock 84mhz, 11.9ns. 21008
    //ISR019<17:1> IFS0<19> IEC0<19> IPC4<28:26> IPC4<25:24>
    
    //4KHz is 250,000ns
    asm volatile( "di" ); // Disable Interrupts
    //Clear configure registers to disable, Set TMR5 for 16-bit mode, 1:1 pre-scalar
    T4CON = 0x0;
    
    //set the timer 4 input clock to 256 divider from the pb clock
    //T4CONSET = _T4CON_TCKPS_MASK;
    
    //Clear the timer 4 register
    TMR4 = 0x0;
    
    //load the period 4 register for the specific amount of 21008 = 250000ns / 11.9ns
    PR4 = 10500;

    // Disable TMR4 interrupts and set up TMR4 interrupts.
    // Set Shadow register set 2 for TMR4 interrupts (Priority 2)
    PRISSSET = (2 << _PRISS_PRI2SS_POSITION) & _PRISS_PRI2SS_MASK;
    // Clear T4 priority sub priority
    IPC4CLR = _IPC4_T4IP_MASK | _IPC4_T4IS_MASK;
    // Set T4 to priority 2, sub-priority 0
    IPC4SET = (2 << _IPC4_T4IP_POSITION) & _IPC4_T4IP_MASK;
    // Clear T4IF
    IFS0CLR = _IFS0_T4IF_MASK;
    // Enable T4 interrupts
    IEC0SET = _IEC0_T4IE_MASK;
   
    //RF8 config
    PORTFCLR = _PORTF_RF8_MASK;
    TRISFCLR = _TRISF_TRISF8_MASK;
    //start the timer in 16 bit mode
    //T4CONSET = _T4CON_ON_MASK;
    asm volatile( "ei" ); // Re-Enable Interrupts
    
}

//Timer 5 will be used for the stepper motor
void TMR5_16bit_Motor_Initialize(void)
{
    //Need to have timer 5 be 16 bit config
    //for 21008 for a 11.9ns which is 5210 for hex
    
    //Clear configure registers to disable, Set TMR5 for 16-bit mode, 1:1 pre-scalar
    T5CON = 0x0;
    
    //set the timer 5 input clock to 256 divider from the pb clock
    T5CONSET = _T5CON_TCKPS_MASK;
    
    //Clear the timer 5 register
    TMR5 = 0x0;
    
    //load the period 5 register to set motor rotation
    PR5 = MOTOR_PR_SETTING;

    // Disable TMR5 interrupts and set up TMR5 interrupts.
    // Set Shadow register set 2 for TMR5 interrupts (Priority 2)
    PRISSSET = (2 << _PRISS_PRI2SS_POSITION) & _PRISS_PRI2SS_MASK;
    // Clear T5 priority sub priority
    IPC6CLR = _IPC6_T5IP_MASK | _IPC6_T5IS_MASK;
    // Set T5 to priority 2, sub-priority 0
    IPC6SET = (2 << _IPC6_T5IP_POSITION) & _IPC6_T5IP_MASK;
    // Clear T5IF
    IFS0CLR = _IFS0_T5IF_MASK;
    // Enable T5 interrupts
    IEC0SET = _IEC0_T5IE_MASK;
    


    //clear the PORTC registers
    PORTCCLR = _PORTC_RC1_MASK | _PORTC_RC2_MASK | _PORTC_RC3_MASK | _PORTC_RC4_MASK;
    //set the UD motor pins to outputs
    TRISCCLR = _TRISC_TRISC1_MASK | _TRISC_TRISC2_MASK | _TRISC_TRISC3_MASK | _TRISC_TRISC4_MASK; 
    //clear the UD motor analog pins for the stepper motor
    ANSELCCLR = _ANSELC_ANSC1_MASK | _ANSELC_ANSC2_MASK | _ANSELC_ANSC3_MASK | _ANSELC_ANSC4_MASK;
    
    
     //clear the PORTB registers
    PORTBCLR = _PORTB_RB4_MASK | _PORTB_RB8_MASK | _PORTB_RB9_MASK | _PORTB_RB11_MASK;
    //set the OC motor pins to outputs
    TRISBCLR = _TRISB_TRISB4_MASK | _TRISB_TRISB8_MASK | _TRISB_TRISB9_MASK | _TRISB_TRISB11_MASK; 
    //clear the OC motor analog pins for the stepper motor
    ANSELBCLR = _ANSELB_ANSB4_MASK | _ANSELB_ANSB8_MASK | _ANSELB_ANSB9_MASK | _ANSELB_ANSB11_MASK;
    
    
    
    //start the timer in 16 bit mode
    //T5CONSET = _T5CON_ON_MASK;
    
    
}

//This ISR will be used for the stepper motors UD/OC
void __ISR_AT_VECTOR(_TIMER_5_VECTOR, IPL2SRS) TMR5_MOTOR_ISR(void)
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
        PORTC = _UDMOTOR_SOFF;
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
    if (motorTargetOC < counterOC)
        motorDirectionOC = MOTOR_DIR_OPEN; 
    //else if the motor target is greater than the motor location, then it'll open
    else if (motorTargetOC > counterOC)
        motorDirectionOC = MOTOR_DIR_CLOSE;
    //else it'll turn off the motor and return
    else
    {
        motorOC = false;
        PORTB = _OCMOTOR_SOFF;
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
        if (proxyAlarmState == 4)
            proxyAlarmState = 2;
        else if (proxyAlarmState == 5)
            proxyAlarmState = 0;
        MOTOR_OFF();
    }
        
    //clear the T5IF
    IFS0CLR = _IFS0_T5IF_MASK;
}

//This is the ISR for the buzzer to activate
void __ISR_AT_VECTOR(_TIMER_4_VECTOR, IPL2SRS) TMR4_ISR(void)
{
    //toggle RF8
    PORTFINV = _PORTF_RF8_MASK;
    
    //clear the T4IF
    IFS0CLR = _IFS0_T4IF_MASK; 
}
/* *****************************************************************************
 End of File
 */

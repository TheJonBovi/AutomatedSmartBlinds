////////////////////////////////////////////////////////////////////////////////
// File:	stepper_motor.c
// Author(s):	Chad Revel, Andrew Deraita, and Michael Roberts
// This is the stepper motor file that will control the rotating
// of the motor depending on what command is inputted.
////////////////////////////////////////////////////////////////////////////////

#include <xc.h>
#include <stdio.h>
#include <math.h>
#include "defines.h"

//variables used for the motor to turn on, direction, and state
int motor_on = 0;
int motor_direction = 0;
int UD_stepper_state = 0;
int OC_stepper_state = 0;
int OUT;
int motorUD = 0;
int motorOC = 0;
int counter = 0;

void stepper_motor(void)
{

    //this is for the up down motor
    if (motorUD == 1)
    {
        switch (UD_stepper_state)
        {
            //This is to check if the keys are being pressed or not
            case 0:
                //the first key is pressed (CW) and the second key (CCW)
                //is not pressed, then turn on motor and turn CW
                if (motor_direction == 1) UD_stepper_state = 1;
                    
                else    
                    UD_stepper_state = 7;
            
                OUT = _UDMOTOR_S0;
                
                break;
            //This is for each part of the 8 step rotation
            case 1:
                if (motor_direction == 1) UD_stepper_state = 2;
                
                else 
                    UD_stepper_state = 0;
                
                OUT = _UDMOTOR_S1;
                break;
            
            case 2:
                if (motor_direction == 1) UD_stepper_state = 3;
                
                else
                    UD_stepper_state = 1;
                OUT = _UDMOTOR_S2;
                break;

            case 3:
                if (motor_direction == 1) UD_stepper_state = 4;
                
                else
                    UD_stepper_state = 2;
                OUT = _UDMOTOR_S3;
                break;
            
            case 4:
                if (motor_direction == 1) UD_stepper_state = 5;
                
                else
                    UD_stepper_state = 3;
                OUT = _UDMOTOR_S4;
                break;
            
            case 5:
                if (motor_direction == 1) UD_stepper_state = 6;
                
                else
                    UD_stepper_state = 4;
                OUT = _UDMOTOR_S5;
                break;
           
            case 6:
                if (motor_direction == 1) UD_stepper_state = 7;
                
                else
                    UD_stepper_state = 5;
                OUT = _UDMOTOR_S6;
                break;
            
            case 7:
                if (motor_direction == 1)
                {
                    UD_stepper_state = 0;
                    counter++;
                }
                
                else
                {
                    UD_stepper_state = 6;
                    counter--;
                }
                OUT = _UDMOTOR_S7;
                break;
                
            default:
                break;
        }
    
    }
    
    //This is for the open close motor
    if (motorOC == 1)
    {
        switch (OC_stepper_state)
        {
            //This is to check if the keys are being pressed or not
            case 0:
                //the first key is pressed (CW) and the second key (CCW)
                //is not pressed, then turn on motor and turn CW
                if (motor_direction == 1) OC_stepper_state = 1;

                else    
                    OC_stepper_state = 7;
                
                int sPORTB = PORTB;
                (sPORTB & sPORTB & _OCMOTOR_MASK & _OCMOTOR_S0);
                PORTB = sPORTB;
            
                //OUT = _UDMOTOR_S0;
                break;
            //This is for each part of the 8 step rotation
            case 1:
                if (motor_direction == 1) OC_stepper_state = 2;
                
                else 
                    OC_stepper_state = 0;
                //int sPORTB = PORTB;
                (sPORTB & sPORTB & _OCMOTOR_MASK & _OCMOTOR_S1);
                PORTB = sPORTB;
            
                //OUT = _UDMOTOR_S1;
                break;
            
            case 2:
                if (motor_direction == 1) OC_stepper_state = 3;
                
                else
                    OC_stepper_state = 1;
                
                //int sPORTB = PORTB;
                (sPORTB & sPORTB & _OCMOTOR_MASK & _OCMOTOR_S2);
                PORTB = sPORTB;
            
                //OUT = _UDMOTOR_S2;
                break;

            case 3:
                if (motor_direction == 1) OC_stepper_state = 4;
                
                else
                    OC_stepper_state = 2;
                
                //int sPORTB = PORTB;
                (sPORTB & sPORTB & _OCMOTOR_MASK & _OCMOTOR_S3);
                PORTB = sPORTB;
            
                //OUT = _UDMOTOR_S3;
                break;
            
            case 4:
                if (motor_direction == 1) OC_stepper_state = 5;
                
                else
                    OC_stepper_state = 3;
                
                //int sPORTB = PORTB;
                (sPORTB & sPORTB & _OCMOTOR_MASK & _OCMOTOR_S4);
                PORTB = sPORTB;
            
                //OUT = _UDMOTOR_S4;
                break;
            
            case 5:
                if (motor_direction == 1) OC_stepper_state = 6;
                
                else
                    OC_stepper_state = 4;
                
                //int sPORTB = PORTB;
                (sPORTB & sPORTB & _OCMOTOR_MASK & _OCMOTOR_S5);
                PORTB = sPORTB;
            
                //OUT = _UDMOTOR_S5;
                break;
           
            case 6:
                if (motor_direction == 1) OC_stepper_state = 7;
                
                else
                    OC_stepper_state = 5;
                
                //int sPORTB = PORTB;
                (sPORTB & sPORTB & _OCMOTOR_MASK & _OCMOTOR_S6);
                PORTB = sPORTB;
            
                //OUT = _UDMOTOR_S6;
                break;
            
            case 7:
                if (motor_direction == 1) OC_stepper_state = 0;
                
                else
                    OC_stepper_state = 6;
                
                //int sPORTB = PORTB;
                (sPORTB & sPORTB & _OCMOTOR_MASK & _OCMOTOR_S7);
                PORTB = sPORTB;
            
                //OUT = _UDMOTOR_S7;
                break;
                
            default:
                break;
        }
    
    }
    
}

void T5_16bit_config(void)
{
    //Need to have timer 5 be 16 bit config
    //for 21008 for a 11.9ns which is 5210 for hex
    
    //Clear configure registers to disable, Set TMR5 for 16-bit mode, 1:1 pre-scalar
    T5CON = 0x0;
    
    //set the timer 5 input clock to 256 divider from the pb clock
    T5CONSET = _T5CON_TCKPS_MASK;
    
    //Clear the timer 5 register
    TMR5 = 0x0;
    
    //load the period 5 register for the specific amount of 5210
    PR5 = 0x0281;

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
    
    
    
    //start the timer in 16 bit mode
    T5CONSET = _T5CON_ON_MASK;
    
    
}



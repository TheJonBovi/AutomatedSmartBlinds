////////////////////////////////////////////////////////////////////////////////
// File:	stepper_motor.c
// Author(s):	Chad Revel, Andrew Deraita, and Michael Roberts
// This is the stepper motor file that will control the rotating
// of the motor depending on what command is inputted.
////////////////////////////////////////////////////////////////////////////////

#include <xc.h>
#include <stdio.h>
#include <math.h>

//defines for the 4 specific wires by color for the Up/Down motor
//M1 = the up/down motor
#define M1_BLU1 _TRISC_RC1_MASK
#define M1_PIK2 _TRISC_RC2_MASK
#define M1_YEL3 _TRISC_RC3_MASK
#define M1_ORG4 _TRISC_RC1_MASK

//defines for the 4 specific wires by color for the Open/Close motor
//M2 = the open/close motor
#define M2_BLU1 _TRICB_RB4_MASK
#define M2_PIK2 _TRICB_RB8_MASK
#define M2_YEL3 _TRICB_RB9_MASK
#define M2_ORG4 _TRICB_RB11_MASK

//variables used for the motor to turn on, direction, and state
extern int motor_on = 0;
extern int motor_direction = 0;
extern int test_stepper_state = 0;


void stepper_motor(void)
{
    switch (test_stepper_state)
    {
        //This is to check if the keys are being pressed or not
        case 0:
            //the first key is pressed (CW) and the second key (CCW)
            //is not pressed, then turn on motor and turn CW
            if ()
            {
               motor_on = 1;
               motor_direction = 1;
               test_stepper_state = 1;
            }
            //the first key is not pressed (CW) and the second key (CCW)
            //is pressed, then turn on motor and turn CCW
            else if ()
            {
                motor_on = 1;
                motor_direction = 0;
               test_stepper_state = 1;
            }
            //for anything else, including no keys pressed
            //everything is turned off
            else 
            {
                motor_on = 0;
                motor_direction = 0;
                test_stepper_state = 0;
            }
            break;
        //This is for each part of the 8 step rotation
        case 1:

            
            
    }
}

void T5_16bit_config(void)
{
    //Need to have timer 5 be 16 bit config
    //for 21008 for a 11.9ns which is 5210 for hex
    
    //Clear configure registers to disable, Set TMR5 for 16-bit mode, 1:1 pre-scalar
    T5CON = 0x0;
    
    //Clear the timer 5 register
    TMR5 = 0x0;
    
    //load the period 5 register for the specific amount of 5210
    PR5 = 0x5210;
    
    //start the timer in 16 bit mode
    T5CONSET = _T5CON_ON_MASK;
    
    
}



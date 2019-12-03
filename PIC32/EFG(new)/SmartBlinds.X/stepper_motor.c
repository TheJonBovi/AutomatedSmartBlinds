////////////////////////////////////////////////////////////////////////////////
// File:	stepper_motor.c
// Author(s):	Chad Revel, Andrew Deraita, and Michael Roberts
// This is the stepper motor file that will control the rotating
// of the motor depending on what command is inputted.
////////////////////////////////////////////////////////////////////////////////

#include <xc.h>
#include <stdio.h>
#include <math.h>

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
#define _UDMOTOR_S7 0x0013

//open close motor
#define _OCMOTOR_S0 0x800
#define _OCMOTOR_S1 0xA00
#define _OCMOTOR_S2 0x200
#define _OCMOTOR_S3 0x300
#define _OCMOTOR_S4 0x100
#define _OCMOTOR_S5 0x110
#define _OCMOTOR_S6 0x010
#define _OCMOTOR_S7 0x810

//variables used for the motor to turn on, direction, and state
extern int motor_on = 0;
extern int motor_direction = 0;
extern int test_stepper_state = 0;


void stepper_motor(void)
{
   /*
    int sPORTB = PORTB;
    (sPORTB & SPORTB & _OCMOTOR_MASK & _OCMOTOR_SX);
    PORTB = sPORTB;
    if (motorID)
    {
        switch (test_stepper_state)
        {
            //This is to check if the keys are being pressed or not
            case 0:
                //the first key is pressed (CW) and the second key (CCW)
                //is not pressed, then turn on motor and turn CW
                if (motor_direction)
                {
                    test_stepper_state = 1;

                }
                else    
                    test_stepper_state = 7;
            
                //OUT = _UDMOTOR_S0;
                break;
            //This is for each part of the 8 step rotation
            case 1:
        

            
            
    }*/
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



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

int buzz_signal = 0;

int buzz(void)
{
    //if the system calls function, buzzer activates until call ends
    //need to have the buzzer set to 4KHz. TMR4 set to 1/4KHz.
    //ISR019<17:1> IFS0<19> IEC0<19> IPC4<28:26> IPC4<25:24>
    
    /* psedo code
     *
     *  if (buzzer signal is on)
     *      activate buzzer
     *  else
     *      buzzer is off
     */
    
    
    
}

void T4_16bit_config(void)
{
    //Need to have timer 4 be 16 bit config
    //if the system calls function, buzzer activates until call ends
    //need to have the buzzer set to 4KHz. TMR4 set to 1/4KHz.
    //.25KHz pbclock 84mhz, 11.9ns. 21008
    //ISR019<17:1> IFS0<19> IEC0<19> IPC4<28:26> IPC4<25:24>
    
    //4KHz is 250,000ns
    
    //Clear configure registers to disable, Set TMR5 for 16-bit mode, 1:1 pre-scalar
    T4CON = 0x0;
    
    //set the timer 5 input clock to 256 divider from the pb clock
    T4CONSET = _T4CON_TCKPS_MASK;
    
    //Clear the timer 4 register
    TMR4 = 0x0;
    
    //load the period 4 register for the specific amount of 21008 = 250000ns / 11.9ns
    PR4 = 21008;

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
   
    //start the timer in 16 bit mode
    //T4CONSET = _T4CON_ON_MASK;
    
    
}

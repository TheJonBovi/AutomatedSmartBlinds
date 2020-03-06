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
#include "defines.h"
#include <sys/attribs.h>
#include <stdint.h>
#include <stdbool.h>
#include "stepper_control.h"

extern int motorTargetUD;
extern int motorTargetOC;
extern int proxyAlarmState;
extern int motorUD;
extern int motorOC;
extern int temperatureAlarmState;
extern int callRequest;
extern int rcv_UD_target;
extern int rcv_OC_target;
extern double rcv_temp_target;
extern double temp_high;
extern double temp_low;
extern int proxyCount;
extern int gasAlarmState;

int prevMotorTargetUD;
int prevMotorTargetOC;

bool buttonLockUD = false;
bool buttonLockOC = false;

//no longer needed, but could be used in the future
void motor_test_UD(void)
{
    //need to start getting the counter to control on how far the motor will rotate. Both for the OC and UD.
    //for the UD motor
    //if button for cw is high, rotate cw.
    //This is the left button
    if (PORTGbits.RG1 == 1 && buttonLockUD == false)
    {
        
       motorUD = true; 
       motorTargetUD = UD_FULL_DOWN;
       MOTOR_ON();
       buttonLockUD = true;
    }
    //else if button for ccw is high, rotate ccw.
    //This is the right button
    else if (PORTGbits.RG1 == 1 && buttonLockUD == true)
    {
       motorUD = true;
       motorTargetUD = UD_FULL_UP;
       MOTOR_ON();
       buttonLockUD = false;
    }
}
//no longer needed(but could use in the future)    
void motor_test_OC(void)
{
    //for the OC motor
    //if button for cw is high, rotate cw.
    //This is the left button
    if (PORTGbits.RG0 == 1 && buttonLockOC == false)
    {
       motorOC = true; 
       motorTargetOC = OC_FULL_OPEN;
       MOTOR_ON();
       buttonLockOC = true;
    }
    //else if button for ccw is high, rotate ccw.
    //This is the right button
    else if (PORTGbits.RG0 == 1 && buttonLockOC == true)
    {
       motorOC = true;
       motorTargetOC = OC_FULL_CLOSE;
       MOTOR_ON();
       buttonLockOC = false;
    }
    
}

//for triggering the blinds, there will need to be a switch statement
//this will include the proxy, temperature, clock, smoke, and user interface
//will also need to work out on which ones will open, close, raise, and lower the blinds

//if the proxy sensor triggers for the final stage, then turn on the motor and close the blinds.
void proxy_motor_control(void)
{
    switch (proxyAlarmState)
    {
        // if proxy triggered, shutter blinds
        case 1:
            motorUD = true; 
            motorOC = true;
            
            // Save off current position
            prevMotorTargetUD = motorTargetUD;
            prevMotorTargetOC = motorTargetOC;
            
            motorTargetUD = UD_FULL_DOWN;
            motorTargetOC = OC_FULL_CLOSE;
            
            proxyAlarmState = 4;
            MOTOR_ON();
            break;
            //get to case 2 in tmr5 isr
        // controls how long to wait before putting blinds back after an alarm
        case 2:
            if (proxyCount < maxProxy) 
            {
                ++proxyCount;
            }
            else if (proxyCount >= maxProxy)
            {
                proxyCount = 0;
                proxyAlarmState = 3;
            }
            // Once alarm is over, return blinds to previous values
        case 3:
            motorUD = true; 
            motorOC = true;
            
            // restore blinds to previous positions
            motorTargetUD = prevMotorTargetUD;
            motorTargetOC = prevMotorTargetOC;
            proxyAlarmState = 5;
            MOTOR_ON();  
            break;
            
        // Wait case for going into shutter mode
        case 4:
            break;
            
        // Wait case for leaving shutter mode
        case 5:
            break;
        default:
            break;    
    }
}   

//this is the temperature control. If the temperature alarm
//gets triggered, then the following commands will execute.
void temperature_control(void)
{
    switch (temperatureAlarmState)
    {
        // if temperature goes above the trigger limit, shutter blinds
        case 1:
            motorUD = true; 
            motorOC = true;
            // Save off current position
            prevMotorTargetUD = motorTargetUD;
            prevMotorTargetOC = motorTargetOC;
            MOTOR_ON();
            break;
        // when temperature lowers again to an acceptable range 
        // (in adc ISR), return to original values
        case 2:
            motorUD = true; 
            motorOC = true;

            // restore blinds to previous positions
            motorTargetUD = prevMotorTargetUD;
            motorTargetOC = prevMotorTargetOC;
            MOTOR_ON(); 
            break;
        default:
            break;
            
    }
}

void gas_control(void)
{
    switch (gasAlarmState)
    {
        case 1:
            break;
        case 2:
            break;
        default:
            break;
        // TODO: make a timer turn the buzzer on and off to chirp
        
        //might want to also open and close the blinds
        //need to write a small function that will compare
        //the position of the blinds to its destination
        //then continue with the opening and closing.
        
    }


}


//This function will be checking for any commands from the web server.
//Once it obtains one, then it will execute the call.
void call_control(void)
{
    //update the temperature
    // temperature
    rcv_temp_target = temp_high;
    
    //the open/close commands
    if (rcv_OC_target != motorTargetOC)
    {
        motorTargetOC = rcv_OC_target;
        motorOC = true;
        MOTOR_ON();
    }
    if (rcv_UD_target != motorTargetUD)
    {
        motorTargetUD = rcv_UD_target;
        motorUD = true;
        MOTOR_ON();
    }
    /*
    if (rcv_OC_target == CLOSE_BLINDS)
    {
        motorOC = true;
        motorTargetOC = OC_FULL_CLOSE;
        MOTOR_ON();     
    }
    else if (rcv_OC_target == OPEN_BLINDS)
    {
        motorOC = true;
        motorTargetOC = OC_FULL_OPEN;
        MOTOR_ON();            
    }
    else if (rcv_OC_target == HALF_CLOSE_BLINDS)
    {
        motorOC = true;
        motorTargetOC = OC_HALF;
        MOTOR_ON();             
    }
    else if (rcv_OC_target == REVERSE_CLOSE_BLINDS)
    {
        motorOC = true;
        motorTargetOC = OC_R_HALF;
        MOTOR_ON(); 
    }
    else if (rcv_OC_target == REVERSE_HALF_CLOSE_BLIDNS)
    {
        motorOC = true;
        motorTargetOC = OC_FULL_R_CLOSE;
        MOTOR_ON();             
    }

    //the up/down commands
    else if (rcv_UD_target == RAISE_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_FULL_UP;
        MOTOR_ON();            
    }
    else if (rcv_UD_target == ONE_QUARTER_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_1_QUARTER;
        MOTOR_ON();              
    }
    else if (rcv_UD_target == LOWER_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_FULL_DOWN;
        MOTOR_ON();              
    }
    else if (rcv_UD_target == THREE_QUARTER_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_3_QUARTER;
        MOTOR_ON();              
    }
    else if (rcv_UD_target == HALF_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_HALF;
        MOTOR_ON();              
    }
    */
}

/* *****************************************************************************
 End of File
 */

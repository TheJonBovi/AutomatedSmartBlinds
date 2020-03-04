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

extern int motorTargetUD;
extern int motorTargetOC;
extern int proxyAlarm;
extern int motorUD;
extern int motorOC;
extern int temperatureAlarm;
extern int callRequest;

bool buttonLockUD = false;
bool buttonLockOC = false;


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
void proxy_motor_test(void)
{
    if (proxyAlarm == 1)
    {
        motorUD = true; 
        motorOC = true;
        motorTargetUD = UD_FULL_DOWN;
        motorTargetOC = OC_FULL_CLOSE;
        MOTOR_ON();
    }
    else if (proxyAlarm == 0)
    {
        motorUD = true; 
        motorOC = true;
        motorTargetUD = UD_FULL_UP;
        motorTargetOC = OC_FULL_OPEN;
        MOTOR_ON();        
    }
}   

//this is the temperature control. If the temperature alarm
//gets triggered, then the following commands will execute.
void temperature_test(void)
{
    if (temperatureAlarm == 1)
    {
        motorUD = true; 
        motorOC = true;
        motorTargetUD = UD_FULL_DOWN;
        motorTargetOC = OC_FULL_CLOSE;
        MOTOR_ON();        
    }
    else if (temperatureAlarm == 0)
    {
        motorUD = true; 
        motorOC = true;
        motorTargetUD = UD_FULL_UP;
        motorTargetOC = OC_FULL_OPEN;
        MOTOR_ON(); 
    }
    
}


//This function will be checking for any commands from the web server.
//Once it obtains one, then it will execute the call.
void call_control(void)
{
    //the open/close commands
    if (callRequest == CLOSE_BLINDS)
    {
        motorOC = true;
        motorTargetOC = OC_FULL_CLOSE;
        MOTOR_ON();     
    }
    else if (callRequest == OPEN_BLINDS)
    {
        motorOC = true;
        motorTargetOC = OC_FULL_OPEN;
        MOTOR_ON();            
    }
    else if (callRequest == HALF_CLOSE_BLINDS)
    {
        motorOC = true;
        motorTargetOC = OC_HALF;
        MOTOR_ON();             
    }
    else if (callRequest == REVERSE_CLOSE_BLINDS)
    {
        motorOC = true;
        motorTargetOC = OC_R_HALF;
        MOTOR_ON(); 
    }
    else if (callRequest == REVERSE_HALF_CLOSE_BLIDNS)
    {
        motorOC = true;
        motorTargetOC = OC_FULL_R_CLOSE;
        MOTOR_ON();             
    }

    //the up/down commands
    else if (callRequest == RAISE_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_FULL_UP;
        MOTOR_ON();            
    }
    else if (callRequest == ONE_QUARTER_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_1_QUARTER;
        MOTOR_ON();              
    }
    else if (callRequest == LOWER_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_FULL_DOWN;
        MOTOR_ON();              
    }
    else if (callRequest == THREE_QUARTER_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_3_QUARTER;
        MOTOR_ON();              
    }
    else if (callRequest == HALF_BLINDS)
    {
        motorUD = true; 
        motorTargetUD = UD_HALF;
        MOTOR_ON();              
    }
}

/* *****************************************************************************
 End of File
 */

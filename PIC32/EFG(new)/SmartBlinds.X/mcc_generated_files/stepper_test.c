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
extern int proxyAlert;
extern int motorUD;
extern int motorOC;

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
    if (proxyAlert == 1)
    {
        motorUD = true; 
        motorOC = true;
        motorTargetUD = UD_FULL_DOWN;
        motorTargetOC = OC_FULL_CLOSE;
        MOTOR_ON();
    }
    else if (proxyAlert == 0)
    {
        motorUD = true; 
        motorOC = true;
        motorTargetUD = UD_FULL_UP;
        motorTargetOC = OC_FULL_OPEN;
        MOTOR_ON();        
    }
}   
   /* switch (stepperMotorState)
    {
        //the first case will be to check if the proxy is triggered to close
        case 0:
            //if someone is too close to the proxy, close blinds
            if (proxyAlert = 1)//replace variable if needed
            {
                closeBlinds = 1;
            }
            else
                openBlinds = 1;
            break;
         //the second case will be to check if the temperature is triggered to close  
        case 1:
            //if the temperature is too hot, close blinds
            if (temperatureSensor = 1)//replace variable to reflect temperature variable to be used
            {
                closeBlinds = 1;
            }
            else
                openBlinds = 1;
            break;
        //the third case will be to check if the smoke is triggered to open (or close)
        case 2:
            //if the smoke sensor is triggered, open and close blinds
            if (smokeSensor = 1)//replace variable to reflect the smoke sensor variable to be used
            {
                //close the blinds, wait certain amount of seconds, open blinds, wait certain amount of seconds, then repeat
            }
            else
                openBlinds = 1;
            break;
        //the forth case will be to check if the clock is triggered to open (or close)    
        case 3:
            //if it is certain times of the day, close the blinds
            if (clockTrigger = 1)
            {
                closeBlinds = 1;
            }
            else
                openBlinds = 1;
            break;
        //the fifth case will be to check if the user has triggered the system to open (or close)    
        case 4:
            //if the user wants the blinds to open, then open
            if (userTriggerClose = 1)
            {
                closeBlinds = 1;
            }
            else
                openBlinds = 1;
            break;
            
        //may also want to have a default setting to have it on normal operations. Brainstorm this...    
        default:
            break;
    }*/
/* *****************************************************************************
 End of File
 */

#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include "defines.h"

extern int motorUD;
extern int motorOC;
extern int motor_direction;
extern int counterOC;
extern int counterUD;
int stepper_motor_state;
int close_blinds;
int open_blinds;

//this are temp variables that will either be used or removed
int proxy_alert;
int temperature_sensor;
int smoke_sensor;
int clock_trigger;
int user_trigger_close;

//this function will be used to control which parts of the system will send commands to rotate the motors
void rotate_function(void)
{
    //need to start getting the counter to control on how far the motor will rotate. Both for the OC and UD.
    while (true)
    {
        //for the UD motor
        //if button for cw is high, rotate cw.
   /*     if (PORTGbits.RG1 == 1)
        {
           motorUD = 1;
           motor_direction = 1;
           T5CONSET = _T5CON_ON_MASK;
           IFS0SET = _IFS0_T5IF_MASK;
        }
        //else if button for ccw is held, rotate ccw.
        else if (PORTGbits.RG0 == 1)
        {
           motorUD = 1;
           motor_direction = 0;
           T5CONSET = _T5CON_ON_MASK;
           IFS0SET = _IFS0_T5IF_MASK;
        }
*/
        //for the OC motor
        //if button for cw is high, rotate cw.
        if (PORTGbits.RG1 == 1)
        {
           motorOC = 1;
           motor_direction = 1;
           T5CONSET = _T5CON_ON_MASK;
           IFS0SET = _IFS0_T5IF_MASK;
           //check the counter to its preset stage

        }
        //else if button for ccw is held, rotate ccw.
        else if (PORTGbits.RG0 == 1)
        {
           motorOC = 1;
           motor_direction = 0;
           T5CONSET = _T5CON_ON_MASK;
           IFS0SET = _IFS0_T5IF_MASK;
           

        }
           
    }

    //for triggering the blinds, there will need to be a switch statement
    //this will include the proxy, temperature, clock, smoke, and user interface
    //will also need to work out on which ones will open, close, raise, and lower the blinds
   /* 
    switch (stepper_motor_state)
    {
        //the first case will be to check if the proxy is triggered to close
        case 0:
            //if someone is too close to the proxy, close blinds
            if (proxy_alert = 1)//replace variable if needed
            {
                close_blinds = 1;
            }
            else
                open_blinds = 1;
            break;
         //the second case will be to check if the temperature is triggered to close  
        case 1:
            //if the temperature is too hot, close blinds
            if (temperature_sensor = 1)//replace variable to reflect temperature variable to be used
            {
                close_blinds = 1;
            }
            else
                open_blinds = 1;
            break;
        //the third case will be to check if the smoke is triggered to open (or close)
        case 2:
            //if the smoke sensor is triggered, open and close blinds
            if (smoke_sensor = 1)//replace variable to reflect the smoke sensor variable to be used
            {
                //close the blinds, wait certain amount of seconds, open blinds, wait certain amount of seconds, then repeat
            }
            else
                open_blinds = 1;
            break;
        //the forth case will be to check if the clock is triggered to open (or close)    
        case 3:
            //if it is certain times of the day, close the blinds
            if (clock_trigger = 1)
            {
                close_blinds = 1;
            }
            else
                open_blinds = 1;
            break;
        //the fifth case will be to check if the user has triggered the system to open (or close)    
        case 4:
            //if the user wants the blinds to open, then open
            if (user_trigger_close = 1)
            {
                close_blinds = 1;
            }
            else
                open_blinds = 1;
            break;
            
        //may also want to have a default setting to have it on normal operations. Brainstorm this...    
        default:
            break;
            
    }
    
     */   
}
     

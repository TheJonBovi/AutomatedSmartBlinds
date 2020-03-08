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
#include "sensor_control.h"
#include "winc1500_api.h"

// Motor Control Global Variables
extern int motorTargetUD;
extern int motorTargetOC;
extern int motorUD;
extern int motorOC;
extern int rcv_UD_target;
extern int rcv_OC_target;
int prevMotorTargetUD;
int prevMotorTargetOC;

// Temperature Sensor Control Global Variables
extern int temperatureAlarmState;
extern double rcv_temp_target;
extern double temp_high;
extern double temp_low;
extern int temp_array_position;
extern double temp_avg;
extern double temp_array[20];
extern double current_temp_avg;
extern double current_temp;

// Proximity Sensor Global Variables
extern int proxyCount;
extern int proxyAlarmState;

// Gas Sensor Global Variables
extern int gasAlarmState;

// Button Locking Variables
bool buttonLockUD = false;
bool buttonLockOC = false;

// Call Control Global Variables
extern int callControlState;
extern uint8_t message_type;



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
            break;
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
    //set the average temperature from the temperature array
    current_temp_avg = 0;
    int i;
    for (i = 0; i < TEMP_SAMPLES; ++i)
    {
        current_temp_avg += temp_array[i];
    }
    current_temp_avg = current_temp_avg / TEMP_SAMPLES;
    
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
        case 0:
            buzzer_clear();
            break;
        case 1:
            buzzer_toggle();
            break;

        default:
            break;
        
        //might want to also open and close the blinds
        //need to write a small function that will compare
        //the position of the blinds to its destination
        //then continue with the opening and closing.
        
    }


}
    
void proxy_LED_alarm(void)
{
    if (proxyAlarmState > 0) PORTK ^= 0b101;
}

/* *****************************************************************************
 End of File
 */

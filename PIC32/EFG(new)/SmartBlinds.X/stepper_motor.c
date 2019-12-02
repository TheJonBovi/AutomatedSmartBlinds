////////////////////////////////////////////////////////////////////////////////
// File:	stepper_motor.c
// Author(s):	Chad Revel, Andrew Deraita, and Michael Roberts
// This is the stepper motor file that will control the rotating
// of the motor depending on what command is inputted.
////////////////////////////////////////////////////////////////////////////////

#include <xc.h>
#include <stdio.h>
#include <math.h>

#define 
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
    T5CON = 0x0;
    
    
}

/*
//For the testing of the stepper motor with the arduino chip
int Pin0 = 10;
int Pin1 = 11;
int Pin2 = 12;
int Pin3 = 13;
int _step = 0;
bool dir = true;// green

void setup()
{
    pinMode(Pin0, OUTPUT);
    pinMode(Pin1, OUTPUT);
    pinMode(Pin2, OUTPUT);
    pinMode(Pin3, OUTPUT);
}

void loop()
{
    switch(_step)
    {
        case 0:
            digitalWrite(Pin0, LOW);
            digitalWrite(Pin1, LOW);
            digitalWrite(Pin2, LOW);
            digitalWrite(Pin3, HIGH);
            break;
        case 1:
            digitalWrite(Pin0, LOW);
            digitalWrite(Pin1, LOW);
            digitalWrite(Pin2, HIGH);
            digitalWrite(Pin3, HIGH);
            break;
        case 2:
            digitalWrite(Pin0, LOW);
            digitalWrite(Pin1, LOW);
            digitalWrite(Pin2, HIGH);
            digitalWrite(Pin3, LOW);
            break;
        case 3:
            digitalWrite(Pin0, LOW);
            digitalWrite(Pin1, HIGH);
            digitalWrite(Pin2, HIGH);
            digitalWrite(Pin3, LOW);
            break;
        case 4:
            digitalWrite(Pin0, LOW);
            digitalWrite(Pin1, HIGH);
            digitalWrite(Pin2, LOW);
            digitalWrite(Pin3, LOW);
            break;
        case 5:
            digitalWrite(Pin0, HIGH);
            digitalWrite(Pin1, HIGH);
            digitalWrite(Pin2, LOW);
            digitalWrite(Pin3, LOW);
            break;
        case 6:
            digitalWrite(Pin0, HIGH);
            digitalWrite(Pin1, LOW);
            digitalWrite(Pin2, LOW);
            digitalWrite(Pin3, LOW);
            break;
        case 7:
            digitalWrite(Pin0, HIGH);
            digitalWrite(Pin1, LOW);
            digitalWrite(Pin2, LOW);
            digitalWrite(Pin3, HIGH);
            break;
        default:
            digitalWrite(Pin0, LOW);
            digitalWrite(Pin1, LOW);
            digitalWrite(Pin2, LOW);
            digitalWrite(Pin3, LOW);
            break;
    }
    if(dir)
    {
        _step++;
    }
    else
    {
        _step--;
    }
    if(_step>7)
    {
        _step=0;
    }
    if(_step<0)
    {
        _step=7;
    }
    delay(1);
}
*/
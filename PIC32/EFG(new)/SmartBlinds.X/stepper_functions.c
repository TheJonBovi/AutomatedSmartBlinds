#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include "defines.h"

extern int motorUD;
extern int motorOC;
extern int motor_direction;
void rotate_function(void)
{
    while (true)
    {
        //for the UD motor
        //if button for cw is high, rotate cw.
//        if (PORTGbits.RG1 == 1)
//        {
//           motorUD = 1;
//           motor_direction = 1;
//           T5CONSET = _T5CON_ON_MASK;
//           IFS0SET = _IFS0_T5IF_MASK;
//        }
//        //else if button for ccw is held, rotate ccw.
//        else if (PORTGbits.RG0 == 1)
//        {
//           motorUD = 1;
//           motor_direction = 0;
//           T5CONSET = _T5CON_ON_MASK;
//           IFS0SET = _IFS0_T5IF_MASK;
//        }

        //for the OC motor
        //if button for cw is high, rotate cw.
        if (PORTGbits.RG1 == 1)
        {
           motorOC = 1;
           motor_direction = 1;
           T5CONSET = _T5CON_ON_MASK;
           IFS0SET = _IFS0_T5IF_MASK;
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

        
}
     

#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include "defines.h"

extern int motorUD;
void rotate_function(void)
{
    while (true)
    {
        if (PORTGbits.RG1 == 1)
        {
           T5CONSET = _T5CON_ON_MASK;
           IFS0SET = _IFS0_T5IF_MASK;
           motorUD = 1;
        }
        else if (PORTGbits.RG0 == 1)
        {
           T5CONCLR = _T5CON_ON_MASK;
           IFS0CLR = _IFS0_T5IF_MASK;
           motorUD = 0;
            
            
        }
           
    }

        
}
     

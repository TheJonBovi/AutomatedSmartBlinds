#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include "defines.h"

void buzzer_toggle(void)
{
    //need to start getting the counter to control on how far the motor will rotate. Both for the OC and UD.
    while (true)
    {
        //if RG1 is on, then the buzzer will turn on.
        if (PORTGbits.RG1 == 1)
        {
           T4CONSET = _T4CON_ON_MASK;
        }
        //else if RG1 is off, then the buzzer will turn off.
        else if (PORTGbits.RG0 == 1)
        {
           T4CONCLR = _T4CON_ON_MASK;
        }
           
    }

        
}
     


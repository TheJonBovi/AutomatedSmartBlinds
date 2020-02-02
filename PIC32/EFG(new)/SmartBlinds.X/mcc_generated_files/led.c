/**
    Section: Includes
*/
#include <xc.h>
#include "led.h"

void LED_Initialize(void)
{ 
    // PORTK only digital, so no ANSELx set required
    
    // Set RK0,1 and 2 of PORTK as an output (PIN19, 51 and 52)
    TRISKCLR = _TRISK_TRISK0_MASK | _TRISK_TRISK1_MASK | _TRISK_TRISK2_MASK;
    
    // Set RK0-2 to output 0
    PORTKCLR = _PORTK_RK0_MASK | _PORTK_RK1_MASK | _PORTK_RK2_MASK;
    
    //A dummy LED set to flash every .5 seconds.
    TRISKCLR = _TRISK_TRISK3_MASK;
}
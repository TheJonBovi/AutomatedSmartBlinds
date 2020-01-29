#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include "defines.h"

int temperature_value = 0; //this should be for the mV value of the temperature

void temperature_function(void)
{
    while (true)
    {
        
        temperature_value = temperature_value - 58; //this is for the degree F value of the temperature
     /*
     if temperature is above set alert number
     * then trigger variable to turn on light (later will rotate motors to open blinds)
     * else if the temperature is below set alert number
     * then trigger variable to turn on light (later will rotate motors to close blinds)
     * else
     * do nothing 
     */    
//        if (temperature_value >= 90)
//        {
//            close_blinds;
//        }
//        else if (temperature_value =< 60)
//        {
//            /close_blinds;
//        }
//        else
//            open_blinds;      
    }
}

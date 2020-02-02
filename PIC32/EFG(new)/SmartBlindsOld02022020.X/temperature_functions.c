#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include "defines.h"

int temperatureValue = 0; //this should be for the mV value of the temperature

void temperature_function(void)
{
    while (true)
    {
        
        temperatureValue = temperatureValue - 58; //this is for the degree F value of the temperature
     /*
     if temperature is above set alert number
     * then trigger variable to turn on light (later will rotate motors to open blinds)
     * else if the temperature is below set alert number
     * then trigger variable to turn on light (later will rotate motors to close blinds)
     * else
     * do nothing 
     */    
//        if (temperatureValue >= 90)
//        {
//            closeBlinds;
//        }
//        else if (temperatureValue =< 60)
//        {
//            /closeBlinds;
//        }
//        else
//            openBlinds;      
    }
}

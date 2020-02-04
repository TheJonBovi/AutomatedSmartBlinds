/*******************************************************************************
   File Name:
    main.c

  Summary:
    Main entry point for WINC1500 demos.

  Description:
    This file is the main entry point for the WINC1500 demos.  The project is meant 
    as an example of how to create applications for the WINC1500.
*******************************************************************************/

/*==============================================================================
Copyright 2016 Microchip Technology Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/


//==============================================================================
// INCLUDES
//==============================================================================    
#include "winc1500_api.h"   // primary WINC1500 include file
#include "demo_config.h"    // selects which demo to run
#include "bsp.h"            // defines for LED's and push buttons on board
#include "mcc.h"
#include "stepper_test.h"
    
extern int proxyAlert;
extern int proxyCount;

//==============================================================================
// FUNCTION PROTOTYPES
//==============================================================================    
static void BlinkLed(void);

//==============================================================================
// Main application entry point.
//==============================================================================
int main(void)
{
    // This function initailizes modules, located mainly in the mcc file
    BspInit();
    
    // Required for wifi functionality
    m2m_wifi_init();
    
    // Main while loop
    while (true) 
    {
        // These two lines control the state machine for the current WIFI configureation (currently in demo_config.h)
        ApplicationTask();
        m2m_wifi_task();
        
        
        motor_test_UD();
        motor_test_OC();
        proxy_motor_test();
        
        
        // Blinks onboard LED at 1sec 
        BlinkLed();
    }
}


static void BlinkLed(void)
{
    static uint32_t t = 0;
    
    // Blink LED on board every 500ms
    if ((m2mStub_GetOneMsTimer() - t) >= 500) 
    {
        t = m2mStub_GetOneMsTimer();
        ToggleLed();
        
        
        // Things that happen every 500ms
        if (proxyCount < maxProxy && proxyAlert == 1)
        {
            ++proxyCount;
        }
        else if (proxyCount >= maxProxy && proxyAlert == 1)
        {
            proxyCount = 0;
            proxyAlert = 0;
        }
    }
}


//DOM-IGNORE-END
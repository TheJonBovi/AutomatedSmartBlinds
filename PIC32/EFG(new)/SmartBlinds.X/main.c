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
#include "sensor_control.h"

//==============================================================================
// FUNCTION PROTOTYPES
//==============================================================================
static void mainLoop500ms(void);
void watchdog_Initialize(void);

//==============================================================================
// Main application entry point.
//==============================================================================
int main(void)
{
    // This function initailizes modules, located mainly in the mcc file
    BspInit();

#ifdef CAMERA_ON
    // Read register 0x40, which should return the static CHIP version 0x40
    char cam_version_test = SPI1_read_byte(0x40);

    // Read Product ID number from sensor chip
    unsigned char MSB_ID;
    // Switch to BANK 1
    I2C1_Sensor_Write(0xff, CAM_BANK_1);
    I2C1_Sensor_Read(0x1C, &MSB_ID);
    I2C1_Sensor_Read(0x1D, &MSB_ID);

    // Test for capturing an image
    Camera_capture_image();
#endif
    
    // Required for wifi functionality
    m2m_wifi_init();

    // Main while loop
    while (true)
    {
        // These two lines control the state machine for the current WIFI configuration (currently in demo_config.h)
        ApplicationTask();

        m2m_wifi_task();

        mainLoop500ms();
        
        WDT_Clear();
    }
}

static void mainLoop500ms(void)
{
    static uint32_t t = 0;
    uint32_t temp = m2mStub_GetOneMsTimer();
    if ((temp - t) >= 500)
    {
        // Things that happen every 500ms
        t = m2mStub_GetOneMsTimer();
        ToggleLed();
        proxy_motor_control();
        temperature_control();
        gas_control();
        call_control();
        proxy_LED_alarm();
    }

}



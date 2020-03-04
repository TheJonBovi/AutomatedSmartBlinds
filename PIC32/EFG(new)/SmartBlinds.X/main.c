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

extern int proxyAlarm;
extern int proxyCount;
extern int gasAlarm;
extern bool buzzerTrigger;

char JPEG_BUFFER[JPEG_MAX_SIZE] = {0};

//==============================================================================
// VARS FOR WIFI MODULE
//==============================================================================

//extern uint8_t testvar =1;
//extern char testcvar[100];

//==============================================================================
// FUNCTION PROTOTYPES
//==============================================================================
static void mainLoop500ms(void);

//==============================================================================
// Main application entry point.
//==============================================================================
int main(void)
{
    // This function initailizes modules, located mainly in the mcc file
    BspInit();

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
        mainLoop500ms();
    }
}

// Things that happen every 500ms
static void mainLoop500ms(void)
{
    static uint32_t t = 0;

    if ((m2mStub_GetOneMsTimer() - t) >= 500)
    {
        t = m2mStub_GetOneMsTimer();

        // Blink onboard LED
        ToggleLed();

        // Test for RD1 soldering (do not use for production code!)
        //toggle_RD1();

        //check for call requests every 500ms
        call_control();

        if (proxyCount < maxProxy && proxyAlarm == 1)
        {
            ++proxyCount;
        }
        else if (proxyCount >= maxProxy && proxyAlarm == 1)
        {
            proxyCount = 0;
            proxyAlarm = 0;
        }
        else if (gasAlarm == 1)
        {
            buzzerTrigger = true;
            //might want to also open and close the blinds
            //need to write a small function that will compare
            //the position of the blinds to its destination
            //then continue with the opening and closing.
            //
            //if so, then will want to put it in stepper_test.c

        }
        else if (gasAlarm == 0)
        {
            buzzerTrigger = false;
        }
    }
}



//DOM-IGNORE-END

/**
  System Interrupts Generated Driver File 

  @Company:
    Microchip Technology Inc.

  @File Name:
    pin_manager.c

  @Summary:
    This is the generated manager file for the MPLAB(c) Code Configurator device.  This manager
    configures the pins direction, initial state, analog setting.
    The peripheral pin select, PPS, configuration is also handled by this manager.

  @Description:
    This source file provides implementations for MPLAB(c) Code Configurator interrupts.
    Generation Information : 
        Product Revision  :  MPLAB(c) Code Configurator - 3.16
        Device            :  PIC24FJ128GA310
        Version           :  1.02
    The generated drivers are tested against the following:
        Compiler          :  XC16 1.26
        MPLAB             :  MPLAB X 3.20

    Copyright (c) 2013 - 2015 released Microchip Technology Inc.  All rights reserved.

    Microchip licenses to you the right to use, modify, copy and distribute
    Software only when embedded on a Microchip microcontroller or digital signal
    controller that is integrated into your product or third party product
    (pursuant to the sublicense terms in the accompanying license agreement).

    You should refer to the license agreement accompanying this Software for
    additional information regarding your rights and obligations.

    SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
    EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
    MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
    IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
    CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
    OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
    INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
    CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
    SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
    (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.

*/


/**
    Section: Includes
*/
#include <xc.h>
#include "pin_manager.h"

/**
    void PIN_MANAGER_Initialize(void)
*/
void PIN_MANAGER_Initialize(void)
{
    /****************************************************************************
     * Setting the Output Latch SFR(s)
     ***************************************************************************/
//    LATA = 0x0400;
//    LATB = 0x0000;
//    LATC = 0x0000;
//    LATD = 0x0001;
//    LATE = 0x0000;
//    LATF = 0x0000;
//    LATG = 0x4203;

    /****************************************************************************
     * Setting the GPIO Direction SFR(s)
     ***************************************************************************/
    
    IO_RD5_WAKE_SetDigitalOutput();
    IO_RD0_EXINT_SetDigitalInput();
    IO_RA15_EXINT_SetDigitalInput();
    IO_RD12_CE_SetDigitalOutput();
    IO_RD4_RESET_SetDigitalOutput();
    IO_RG1_CE_SetDigitalOutput();
    IO_RG14_RESET_SetDigitalOutput();
    IO_RD2_SS2_SetDigitalOutput();
    
    // Set output for LED0 (onboard LED)
    TRISHbits.TRISH2 = 0;

    /****************************************************************************
     * Setting the Weak Pull Up and Weak Pull Down SFR(s)
     ***************************************************************************/


    /****************************************************************************
     * Setting the Open Drain SFR(s)
     ***************************************************************************/
    ODCA = 0x0000;
    ODCB = 0x0000;
    ODCC = 0x0000;
    ODCD = 0x0000;
    ODCE = 0x0000;
    ODCF = 0x0000;
    ODCG = 0x0000;

    /****************************************************************************
     * Setting the Analog/Digital Configuration SFR(s)
     ***************************************************************************/

    ANSELD = 0; // all PORTD pins digital
    ANSELH = 0;
    
}

// Initialize the DIP switches for debugging purposes
void DIP_Initialize(void)
{
    //this is gonna be for pins rh3-10
    //clear the PORTH registers
    PORTHCLR = _PORTH_RH3_MASK | _PORTH_RH4_MASK | _PORTH_RH5_MASK | _PORTH_RH6_MASK | _PORTH_RH7_MASK | _PORTH_RH8_MASK | _PORTH_RH9_MASK | _PORTH_RH10_MASK;
    //set the DIP pins to inputs
    TRISHSET = _TRISH_TRISH3_MASK | _TRISH_TRISH4_MASK | _TRISH_TRISH5_MASK | _TRISH_TRISH6_MASK | _TRISH_TRISH7_MASK | _TRISH_TRISH8_MASK | _TRISH_TRISH9_MASK | _TRISH_TRISH10_MASK; 
    //clear the DIP analog pins for the stepper motor
    ANSELHCLR = _ANSELH_ANSH4_MASK | _ANSELH_ANSH5_MASK | _ANSELH_ANSH6_MASK;
}

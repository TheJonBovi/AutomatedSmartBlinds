/**
  UART2 Generated Driver File

  @Company
    Microchip Technology Inc.

  @File Name
    uart2.c

  @Summary
    This is the generated driver implementation file for the UART2 driver using MPLAB(c) Code Configurator

  @Description
    This header file provides implementations for driver APIs for UART2.
    Generation Information :
        Product Revision  :  MPLAB(c) Code Configurator - 3.16
        Device            :  PIC24FJ128GA310
        Driver Version    :  2.00
    The generated drivers are tested against the following:
        Compiler          :  XC16 1.26
        MPLAB             :  MPLAB X 3.20
*/

/*
    (c) 2016 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

/**
  Section: Included Files
*/
#include "uart2.h"

/**
  Section: UART2 APIs
*/

void UART2_Initialize(void)
{
    // PIC32MZ pins are:
    // U2RX - RE3
    // U2TX - RG9
    // U2CTS - RD10
    // U2RTS - RD3
    
    // Configure pins to digital and respective in/outputs
    // U2RX - RE3
    U2RXR = 0b0110;
    
    // U2TX - RG9
    RPG9R = 0b0010;
    ANSELGbits.ANSG9 = 0;
    
    // U2CTS - RD10
    U2CTSR = 0b0011;
    
    // U2RTS - RD3
    RPD3R = 0b0010;
    
    // Set the UART2 module to the options selected in the user interface.

    //OLD! STSEL 1; IREN disabled; PDSEL 8N; UARTEN enabled; RTSMD disabled; USIDL disabled; WAKE disabled; ABAUD disabled; LPBACK disabled; BRGH enabled; RXINV disabled; UEN TX_RX; 
    //OLD! U2MODE = 0x8008;
    U2MODEbits.IREN = 0;
    // 8 bit, no parity
    U2MODEbits.PDSEL = 00;
    
    U2MODEbits.RTSMD = 0;
    U2MODEbits.SIDL = 0;
    U2MODEbits.WAKE = 0;
    U2MODEbits.ABAUD = 0;
    U2MODEbits.LPBACK = 0;
    U2MODEbits.BRGH = 1;
    U2MODEbits.RXINV = 0;
    U2MODEbits.UEN = 0;
    
    // Turn on UART
    U2MODEbits.ON = 1;
    
    //OLD! OERR NO_ERROR_cleared; URXISEL RX_ONE_CHAR; UTXBRK COMPLETED; UTXEN disabled; ADDEN disabled; UTXISEL0 TX_ONE_CHAR; UTXINV disabled; 
    //OLD! U2STA = 0x0000;
    U2STAbits.OERR = 0;
    U2STAbits.URXISEL = 0;
    U2STAbits.UTXBRK = 0;
    U2STAbits.UTXEN = 0;
    U2STAbits.ADDEN = 0;
    U2STAbits.UTXISEL0 = 0;
    U2STAbits.UTXINV = 0;
    
    //OLD! BaudRate = 115200; Frequency = 16000000 Hz; BRG 34; 
    //OLD! U2BRG = 0x0022;
    // BaudRate = 115200; Frequency = 42MHz so
    // (42,000,000 / (4 * 115200)) - 1 = 90.1458333 = 90
    U2BRG = 90;
    
    
    U2STAbits.UTXEN = 1;
}

// Only sending, so discard all read values
uint8_t UART2_Read(void)
{
    while(!(U2STAbits.URXDA == 1))
    {
        
    }

    if ((U2STAbits.OERR == 1))
    {
        U2STAbits.OERR = 0;
    }

    

    return U2RXREG;
}

void UART2_Write(uint8_t txData)
{
    while(U2STAbits.UTXBF == 1)
    {
        
    }

    U2TXREG = txData;    // Write the data byte to the USART.
}

UART2_STATUS UART2_StatusGet (void)
{
    return U2STA;
}

// This function routes printf to this UART module
int __attribute__((__section__(".libc.write"))) write(int handle, void *buffer, unsigned int len) {
    int i;
    while(U2STAbits.TRMT == 0);  
    for (i = len; i; --i)
    {
        while(U2STAbits.TRMT == 0);
        U2TXREG = *(char*)buffer++;        
    }
    return(len);
}

/**
  End of File
*/

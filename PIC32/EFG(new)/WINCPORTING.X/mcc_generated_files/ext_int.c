/**
  EXT_INT Generated Driver File 

  @Company:
    Microchip Technology Inc.

  @File Name:
    ext_int.c

  @Summary
    This is the generated driver implementation file for the EXT_INT 
    driver using MPLAB(c) Code Configurator

  @Description:
    This source file provides implementations for driver APIs for EXT_INT. 
    Generation Information : 
        Product Revision  :  MPLAB(c) Code Configurator - 3.16
        Device            :  PIC24FJ128GA310
        Driver Version    :  1.0
    The generated drivers are tested against the following:
        Compiler          :  XC16 1.26
        MPLAB             :  MPLAB X 3.20
*/

/**
   Section: Includes
 */
#include <xc.h>
#include "ext_int.h"
#include "winc1500_api.h"
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>

//***User Area Begin->code: Add External Interrupt handler specific headers 
extern void m2m_EintHandler(void);
//***User Area End->code: Add External Interrupt handler specific headers

/**
   Section: External Interrupt Handlers
 */

#if defined(USING_CLICK_BOARD)  
/**
  Interrupt Handler for EX_INT2 - INT2
*/
void __attribute__ ( ( interrupt, no_auto_psv ) ) _INT2Interrupt(void)
{
    //***User Area Begin->code: INT2 - External Interrupt 2***
    m2m_EintHandler();
    //***User Area End->code: INT2 - External Interrupt 2***
    EX_INT2_InterruptFlagClear();
}
#elif defined(USING_PICTAIL)
/**
  Interrupt Handler for EX_INT0 - INT0
*/
//void __attribute__ ( ( interrupt, no_auto_psv ) ) _INT3Interrupt(void)
void __ISR_AT_VECTOR(_EXTERNAL_0_VECTOR, IPL4SRS) INT0_ISR(void)
  {
//    //***User Area Begin->code: INT3 - External Interrupt 3***
    m2m_EintHandler();
//    //***User Area End->code: INT3 - External Interrupt 3***
//    EX_INT3_InterruptFlagClear();
    
    //Clear flag before leaving
    IFS0bits.INT0IF = 0;
}
#endif

/**
    Section: External Interrupt Initializers
 */
/**
    void EXT_INT_Initialize(void)

    Initializer for the following external interrupts
    INT2
    INT3
*/
void EXT_INT_Initialize(void)
{
#if defined(USING_CLICK_BOARD)      
 /*******
     * INT2
     * Clear the interrupt flag
     * Set the external interrupt edge detect
     * Enable the interrupt, if enabled in the UI. 
     ********/
    EX_INT2_InterruptFlagClear();   
    EX_INT2_NegativeEdgeSet();
    EX_INT2_InterruptEnable();   
#elif defined(USING_PICTAIL)    
    /*******
     * INT0
     * Clear the interrupt flag
     * Set the external interrupt edge detect
     * Enable the interrupt, if enabled in the UI. 
     ********/
//    EX_INT3_InterruptFlagClear();   
//    EX_INT3_NegativeEdgeSet();
//    EX_INT3_InterruptEnable();
    
    IEC0bits.INT0IE = 0;
    IFS0bits.INT0IF = 0;
    // Clear EP bit to set INT0 for falling edge detection
    INTCONbits.INT0EP = 0;
    IEC0bits.INT0IE = 1;
#endif    
}

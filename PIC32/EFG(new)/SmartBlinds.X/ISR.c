/* ************************************************************************** */
/** 
 
 * Automated Smart Blinds
 * 
 *  Andrew, Chad and Michael
 * 
 *
 * ISR.c
 * 
 * 
 * This file has the routines for all Interrupt Service Routines.
 * 
 * 
 * Current Interrupts and Priorities / SS's
 * 
 * TMR2 for ADC loop set to 32-bit mode, TMR3 ISR priority 1, SRS 1
 * TMR4 for buzzer freq set to 16-bit mode, TMR4 ISR priority 2, SRS 2
 * TMR5 for motors speed set to 16-bit mode, TMR5 ISR priority 2, SRS 2
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include "defines.h"

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */
/** Descriptive Data Item Name

  @Summary
    Brief one-line summary of the data item.
    
  @Description
    Full description, explaining the purpose and usage of data item.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.
    
  @Remarks
    Any additional remarks
 */

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */

/** 
  @Function
    int ExampleLocalFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Description
    Full description, explaining the purpose and usage of the function.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.

  @Precondition
    List and describe any required preconditions. If there are no preconditions,
    enter "None."

  @Parameters
    @param param1 Describe the first parameter to the function.
    
    @param param2 Describe the second parameter to the function.

  @Returns
    List (if feasible) and describe the return values of the function.
    <ul>
      <li>1   Indicates an error occurred
      <li>0   Indicates an error did not occur
    </ul>

  @Remarks
    Describe any special behavior not described above.
    <p>
    Any additional remarks.

  @Example
    @code
    if(ExampleFunctionName(1, 2) == 0)
    {
        return 3;
    }
 */
static int ExampleLocalFunction(int param1, int param2) {
    return 0;
}


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

// *****************************************************************************

/** 
  @Function

 * T2_ISR

  @Summary
    
 * This function services the T2 interrupt

  @Remarks
    Refer to the ISR.h interface header for function usage details.
*/
void __ISR_AT_VECTOR(_TIMER_2_VECTOR, IPL5SRS) T2_ISR(void)
{
//    T2_count++;
    // Clear T2IF atomically
    IFS0CLR = _IFS0_T2IF_MASK;
}

/** 
  @Function

 * T3_ISR

  @Summary
    
 * This function services the T3 interrupt

  @Remarks
    Refer to the ISR.h interface header for function usage details.
*/
void __ISR_AT_VECTOR(_TIMER_3_VECTOR, IPL1SRS) T3_ISR(void)
{
    // ADC loop and test output on LED's for proximity sensor
    int current_read[3];
   
    /* Trigger a conversion */
    ADCCON3bits.GSWTRG = 1;
    /* Wait the conversions to complete */
    while (ADCDSTAT1bits.ARDY0 == 0);
    /* fetch the result */
    current_read[0] = ADCDATA0;
    while (ADCDSTAT1bits.ARDY1 == 0);
    /* fetch the result */
    current_read[1] = ADCDATA1;
    while (ADCDSTAT1bits.ARDY3 == 0);
    /* fetch the result */
    current_read[2] = ADCDATA3;
    /*
    * Process results here
    *
    * Note: Loop time determines the sampling time since all inputs are Class 1.
    * If the loop time is small and the next trigger happens before the completion
    * of set sample time, the conversion will happen only after the sample time
    * has elapsed.
    *
    */

    // Set the LED levels according to IR proximity reading
    if (current_read[0] <= ADC_LOW_WNG) PORTK = 0b0;
    else if (ADC_LOW_WNG < current_read[0] && current_read[0] <= ADC_MID_WNG) PORTK = 0b1;
    else if (ADC_MID_WNG < current_read[0] && current_read[0] <= ADC_HIGH_WNG) PORTK = 0b11;
    else PORTK = 0b111;
  
    
    // Clear T3IF atomically
    IFS0CLR = _IFS0_T3IF_MASK;
}

/* *****************************************************************************
 End of File
 */

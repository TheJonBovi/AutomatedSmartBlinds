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
 * SPI4 Rx ISR for Camera communication priority 5, SRS 3
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


void __ISR_AT_VECTOR(_TIMER_5_VECTOR, IPL2SRS) T5_ISR(void)
{
    //clear the T5IF
    IFS0CLR = _IFS0_T5IF_MASK;
}

void __ISR_AT_VECTOR(_TIMER_4_VECTOR, IPL2SRS) T4_ISR(void)
{
    //toggle RF8
    PORTFINV = _PORTF_RF8_MASK;
    
    //clear the T4IF
    IFS0CLR = _IFS0_T4IF_MASK; 
}
/* *****************************************************************************
 End of File
 */


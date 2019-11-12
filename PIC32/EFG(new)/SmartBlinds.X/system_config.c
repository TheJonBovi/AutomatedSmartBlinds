/* ************************************************************************** */
/** 
 
 * Automated Smart Blinds
 * 
 *  Andrew, Chad and Michael
 *
 * system_config.c
 * 
 * 
 * This file has the routines for configuring the system, including peripheral 
 * clocks, ADC, SPI and I2C
 * 
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
int global_data;


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
// Section: Config Functions                                                  */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

// *****************************************************************************

/** 
  @Function

 * SYSCLK_config

  @Summary
    
 * This function configures the main system clock past what is done in the
 * pragma configurations.

  @Remarks
    Refer to the system_config.h interface header for function usage details.
 */
void SYSCLK_config(void)
{ 
    asm volatile( "di" ); // Disable Interrupts
    PRECON = (1 & _PRECON_PFMWS_MASK) | ((2 << _PRECON_PREFEN_POSITION) & _PRECON_PREFEN_MASK); // enable prefetch cache and 1 waitstates
    asm volatile( "ei" ); // Re-Enable Interrupts
}

/** 
  @Function

 * ISR_config

  @Summary
    
 * This function configures the main system clock past what is done in the
 * pragma configurations.

  @Remarks
    Refer to the system_config.h interface header for function usage details.
 */
void ISR_config(void)
{ 
    asm volatile( "di" ); // Disable Interrupts
    
    // Enable MultiVector Mode
    INTCONSET = _INTCON_MVEC_MASK;
    
    asm volatile( "ei" ); // Re-Enable Interrupts
}

/** 
  @Function

 * PBCLK3_config

  @Summary
    
 * This function configures the Peripheral Bus 3 Clock, which will be used
 * by the ADC unit to sample analog voltages from sensors.

  @Remarks
    Refer to the system_config.h interface header for function usage details.
 */
void PBCLK3_config(void)
{
    asm volatile( "di" ); // Disable Interrupts
    
    // PBCLK3 setup to 1:1 
    SYSKEY = 0; // Ensure lock
    SYSKEY = 0xAA996655; // Write Key 1
    SYSKEY = 0x556699AA; // Write Key 2
    PB3DIV = _PB3DIV_ON_MASK | 0 & _PB3DIV_PBDIV_MASK; // 0 = div by 1, 1 = div by 2 etc up to 128
    SYSKEY = 0; // Re lock
    
    asm volatile( "ei" ); // Re-Enable Interrupts
}

/** 
  @Function

 * T2_config

  @Summary
    
 * This function configures Timer 2

  @Remarks
    Refer to the system_config.h interface header for function usage details.
 */
void T2_config(void)
{
    asm volatile( "di" ); // Disable Interrupts
    
    // Set Shadow register set 1 for TMR2 interrupts (Priority 4)
    PRISSSET = (1 << _PRISS_PRI4SS_POSITION) & _PRISS_PRI4SS_MASK;
    
     // Clear T2 priority an sub priority
    IPC2CLR = _IPC2_T2IP_MASK | _IPC2_T2IS_MASK;
    // Set T2 to priority 4, sub-priority 0
    IPC2SET = (4 << _IPC2_T2IP_POSITION) & _IPC2_T2IP_MASK;
    // Clear T2IF
    IFS0CLR = _IFS0_T2IF_MASK;
    // Enable T2 interrupts
    IEC0SET = _IEC0_T2IE_MASK;
    
    // Clear configure registers to disable, Set TMR2 for 16-bit mode, 1:1 prescalar (i.e. clock speed) 
    T2CON = 0;   
    // Clear TMR2 register just for kicks
    TMR2 = 0;
    // Set PR2 = 511 per instructions
    PR2 = 511;
    
    asm volatile( "ei" ); // Re-Enable Interrupts
}

/** 
  @Function

 * T3_config

  @Summary
    
 * This function configures Timer 3

  @Remarks
    Refer to the system_config.h interface header for function usage details.
 */
void T3_config(void)
{
    asm volatile( "di" ); // Disable Interrupts
    
    // Set Shadow register set 2 for TMR3 interrupts (Priority 5)
    PRISSSET = (2 << _PRISS_PRI5SS_POSITION) & _PRISS_PRI5SS_MASK;
    // Clear T3 priority an sub priority
    IPC3CLR = _IPC3_T3IP_MASK | _IPC3_T3IS_MASK;
    // Set T2 to priority 5, sub-priority 0
    IPC3SET = (5 << _IPC3_T3IP_POSITION) & _IPC3_T3IP_MASK;
    // Clear T3IF
    IFS0CLR = _IFS0_T3IF_MASK;
    // Enable T2 interrupts
    IEC0SET = _IEC0_T3IE_MASK;
    
    // Clear configure registers to disable, Set TMR3 for 16-bit mode, 1:1 prescalar (i.e. clock speed) 
    T3CON = 0;
    // Clear TMR3 register (the count)
    TMR3 = 0;
    // Set PR3 to 999 per instruction
    PR3 = 999;
    
    asm volatile( "ei" ); // Re-Enable Interrupts
}

/** 
  @Function

 * ADC_config

  @Summary
    
 * This function configures the ADC unit to sample the outputs of the
 * analog voltage sensors.

  @Remarks
    Refer to the system_config.h interface header for function usage details.
 */
void ADC_config(void)
{
//     1. Configure the analog port pins, as described in 22.4.1 ?Configuring the Analog Port
//    Pins?.
    // Set AN0 pin for first ADC module
    TRIS
//    2. Initialize the ADC calibration values by copying them from the factory-programmed
//    DEVADCx Flash registers into the corresponding ADCxCFG registers.
//    3. Select the analog inputs to the ADC multiplexers, as described in 22.4.2 ?Selecting the
//    ADC Multiplexer Analog Inputs?.
//    4. Select the format of the ADC result, as described in 22.4.3 ?Selecting the Format of the
//    ADC Result?.
//    5. Select the conversion trigger source, as described in 22.4.4 ?Selecting the Conversion
//    Trigger Source?.
//    6. Select the voltage reference source, as described in 22.4.5 ?Selecting the Voltage
//    Reference Source?.
//    7. Select the scanned inputs, as described in 22.4.6 ?Selecting the Scanned Inputs?.
//    8. Select the analog-to-digital conversion clock source and prescaler, as described in
//    22.4.7 ?Selecting the Analog-to-Digital Conversion Clock Source and Prescaler?.
//    9. Specify any additional acquisition time, if required, as described in 22.10 ?ADC Sampling
//    Requirements?.
//    10. Turn on the ADC module, as described in 22.4.9 ?Turning ON the ADC?.
//    11. Poll (or wait for the interrupt) for the voltage reference to be ready, as described in
//    22.4.5 ?Selecting the Voltage Reference Source?.
//    12. Enable the analog and bias circuit for required ADC modules and after the ADC module
//    wakes-up, enable the digital circuit, as described in 22.7.3 ?ADC Low-power Mode?
//    13. Configure the ADC interrupts (if required), as described in 22.6 ?Interrupts?.

}


/* *****************************************************************************
 End of File
 */

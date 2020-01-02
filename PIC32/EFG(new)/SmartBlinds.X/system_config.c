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
    PRECON = (1 & _PRECON_PFMWS_MASK) | ((3 << _PRECON_PREFEN_POSITION) & _PRECON_PREFEN_MASK); // enable prefetch cache and 1 waitstates
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

 * LED_config

  @Summary
    
 * This function configures the RK0, 1 and 2 pins to output to the red,
 * blue and green LED's, respectivly

  @Remarks
    Refer to the system_config.h interface header for function usage details.
 */
void LED_config(void)
{ 
    // PORTK only digital, so no ANSELx set required
    
    // Set RK0,1 and 2 of PORTK as an output (PIN19, 51 and 52)
    TRISKCLR = _TRISK_TRISK0_MASK | _TRISK_TRISK1_MASK | _TRISK_TRISK2_MASK;
    
    // Set RK0-2 to output 0
    PORTKCLR = _PORTK_RK0_MASK | _PORTK_RK1_MASK | _PORTK_RK2_MASK;
    
    //A dummy LED set to flash every .5 seconds.
    TRISKCLR = _TRISK_TRISK3_MASK;
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
    PB3DIV = _PB3DIV_ON_MASK | ((0 << _PB3DIV_PBDIV_POSITION) & _PB3DIV_PBDIV_MASK); // 0 = div by 1, 1 = div by 2 etc up to 128
    SYSKEY = 0; // Re lock
    
    asm volatile( "ei" ); // Re-Enable Interrupts
}

/** 
  @Function

 * T2_32bit_config

  @Summary
    
 * This function configures Timer 2 for 32-bit operation

  @Remarks
 * This function sets up T2 to interrupt every half second with T3 ISR set 
 * to Priority 1 sub-priority 0 using SRS 1
 */
void T2_32bit_config(void)
{
    asm volatile( "di" ); // Disable Interrupts
    
    
    // Clear configure registers to disable, Set TMR2 for 16-bit mode, 1:1 prescalar (i.e. clock speed) 
    T2CON = 0;
    
    // Set T2 to operate in 32-bit mode
    T2CONSET = _T2CON_T32_MASK;
    
    // Set T2 clock prescalar to 2:1 
    T2CONbits.TCKPS = 0b001;
    
    
    // Clear TMR2 and TMR3 registers to zero counts
    TMR2 = 0;
    TMR3 = 0;
    
    // Set PR2 and PR3 according to timing. 
    // 0.5 seconds = 21,000,000 counts at 42Mhz 
    // 21,000,000 = 0x0140.6F40 so PR3 = 0x0140 and PR2 = 0x6F40
    PR2 = 0x6F40;
    PR3 = 0x0140;
    
    // Disable TMR2 interrupts and set up TMR3 interrupts.
    // Set Shadow register set 1 for TMR3 interrupts (Priority 1)
    PRISSSET = (1 << _PRISS_PRI1SS_POSITION) & _PRISS_PRI1SS_MASK;
    // Clear T3 priority sub priority
    IPC3CLR = _IPC3_T3IP_MASK | _IPC3_T3IS_MASK;
    // Set T3 to priority 1, sub-priority 0
    IPC3SET = (1 << _IPC3_T3IP_POSITION) & _IPC3_T3IP_MASK;
    // Clear T3IF
    IFS0CLR = _IFS0_T3IF_MASK;
    // Enable T3 interrupts
    IEC0SET = _IEC0_T3IE_MASK;
    
    // Verify TMR2 interrupts are disabled.
    IEC0CLR = _IEC0_T2IE_MASK;
    
    T2CONSET = _T2CON_ON_MASK; // Turn Timer 2 on
    
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
    
    // Set Shadow register set 2 for TMR3 interrupts (Priority 5)
    PRISSSET = (2 << _PRISS_PRI5SS_POSITION) & _PRISS_PRI5SS_MASK;
    // Clear T2 priority an sub priority
    IPC2CLR = _IPC2_T2IP_MASK | _IPC2_T2IS_MASK;
    // Set T2 to priority 5, sub-priority 0
    IPC2SET = (5 << _IPC2_T2IP_POSITION) & _IPC2_T2IP_MASK;
    // Clear T2IF
    IFS0CLR = _IFS0_T2IF_MASK;
    // Enable T2 interrupts
    IEC0SET = _IEC0_T2IE_MASK;
    
    // Clear configure registers to disable, Set TMR3 for 16-bit mode, 1:1 prescalar (i.e. clock speed) 
    T2CON = 0;
    // Clear TMR3 register (the count)
    TMR2 = 0;
    // Set PR3 to 999 per instruction
    PR2 = 999;
    
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

//Timer 4 is for the buzzer
void T4_16bit_config(void)
{
    //Need to have timer 4 be 16 bit config
    //if the system calls function, buzzer activates until call ends
    //need to have the buzzer set to 4KHz. TMR4 set to 1/4KHz.
    //.25KHz pbclock 84mhz, 11.9ns. 21008
    //ISR019<17:1> IFS0<19> IEC0<19> IPC4<28:26> IPC4<25:24>
    
    //4KHz is 250,000ns
    asm volatile( "di" ); // Disable Interrupts
    //Clear configure registers to disable, Set TMR5 for 16-bit mode, 1:1 pre-scalar
    T4CON = 0x0;
    
    //set the timer 5 input clock to 256 divider from the pb clock
    T4CONSET = _T4CON_TCKPS_MASK;
    
    //Clear the timer 4 register
    TMR4 = 0x0;
    
    //load the period 4 register for the specific amount of 21008 = 250000ns / 11.9ns
    PR4 = 21008;

    // Disable TMR4 interrupts and set up TMR4 interrupts.
    // Set Shadow register set 2 for TMR4 interrupts (Priority 2)
    PRISSSET = (2 << _PRISS_PRI2SS_POSITION) & _PRISS_PRI2SS_MASK;
    // Clear T4 priority sub priority
    IPC4CLR = _IPC4_T4IP_MASK | _IPC4_T4IS_MASK;
    // Set T4 to priority 2, sub-priority 0
    IPC4SET = (2 << _IPC4_T4IP_POSITION) & _IPC4_T4IP_MASK;
    // Clear T4IF
    IFS0CLR = _IFS0_T4IF_MASK;
    // Enable T4 interrupts
    IEC0SET = _IEC0_T4IE_MASK;
   
    //start the timer in 16 bit mode
    //T4CONSET = _T4CON_ON_MASK;
    asm volatile( "ei" ); // Re-Enable Interrupts
    
}
//Timer 5 will be used for the stepper motor
void motor_config(void)
{
    //Need to have timer 5 be 16 bit config
    //for 21008 for a 11.9ns which is 5210 for hex
    
    //Clear configure registers to disable, Set TMR5 for 16-bit mode, 1:1 pre-scalar
    T5CON = 0x0;
    
    //set the timer 5 input clock to 256 divider from the pb clock
    T5CONSET = _T5CON_TCKPS_MASK;
    
    //Clear the timer 5 register
    TMR5 = 0x0;
    
    //load the period 5 register for the specific amount of 5210
    PR5 = 0x0281;

    // Disable TMR5 interrupts and set up TMR5 interrupts.
    // Set Shadow register set 2 for TMR5 interrupts (Priority 2)
    PRISSSET = (2 << _PRISS_PRI2SS_POSITION) & _PRISS_PRI2SS_MASK;
    // Clear T5 priority sub priority
    IPC6CLR = _IPC6_T5IP_MASK | _IPC6_T5IS_MASK;
    // Set T5 to priority 2, sub-priority 0
    IPC6SET = (2 << _IPC6_T5IP_POSITION) & _IPC6_T5IP_MASK;
    // Clear T5IF
    IFS0CLR = _IFS0_T5IF_MASK;
    // Enable T5 interrupts
    IEC0SET = _IEC0_T5IE_MASK;
    
    //TEST PURPOSE ONLY
    //set up 2 buttons for cw and ccw
    
    //clear port g for the registers
    PORTGCLR = _PORTG_RG0_MASK;
    PORTGCLR = _PORTG_RG1_MASK;
    
    //set to input for both registers
    TRISGSET = _TRISG_TRISG0_MASK;
    TRISGSET = _TRISG_TRISG1_MASK;

    //clear the PORTC registers
    PORTCCLR = _PORTC_RC1_MASK | _PORTC_RC2_MASK | _PORTC_RC3_MASK | _PORTC_RC4_MASK;
    //set the pins to outputs
    TRISCCLR = _TRISC_TRISC1_MASK | _TRISC_TRISC2_MASK | _TRISC_TRISC3_MASK | _TRISC_TRISC4_MASK; 
    //clear the analog pins for the stepper motor
    ANSELCCLR = _ANSELC_ANSC1_MASK | _ANSELC_ANSC2_MASK | _ANSELC_ANSC3_MASK | _ANSELC_ANSC4_MASK;
            
    
    
    //start the timer in 16 bit mode
    //T5CONSET = _T5CON_ON_MASK;
    
    
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
    
    // Input RB0 using ADC0
    // Set RB0 of PORTB as an input (PIN36)
    TRISBSET = (1 << _TRISB_TRISB0_POSITION) & _TRISB_TRISB0_MASK;
    // Set AN0 pin for first ADC module
    ANSELBSET = (1 << _ANSELB_ANSB0_POSITION) & _ANSELB_ANSB0_MASK;
    
    // Input RB1 using ADC1
    // Set RB1 of PORTB as an input (PIN35)
    TRISBSET = (1 << _TRISB_TRISB1_POSITION) & _TRISB_TRISB1_MASK;
    // Set AN1 pin for first ADC module
    ANSELBSET = (1 << _ANSELB_ANSB1_POSITION) & _ANSELB_ANSB1_MASK;
    
    // Input RB3 using ADC3
    // Set RB3 of PORTB as an input (PIN31)
    TRISBSET = (1 << _TRISB_TRISB3_POSITION) & _TRISB_TRISB3_MASK;
    // Set AN3 pin for first ADC module
    ANSELBSET = (1 << _ANSELB_ANSB3_POSITION) & _ANSELB_ANSB3_MASK;
    
//    2. Initialize the ADC calibration values by copying them from the factory-programmed
//    DEVADCx Flash registers into the corresponding ADCxCFG registers.
    
    /* initialize ADC calibration setting */
    ADC0CFG = DEVADC0;
    ADC1CFG = DEVADC1;
    ADC2CFG = DEVADC2;
    ADC3CFG = DEVADC3;
    ADC4CFG = DEVADC4;
    // Below not present on device
    //ADC5CFG = DEVADC5;
    //ADC6CFG = DEVADC6;
    ADC7CFG = DEVADC7;
    
    /* Configure ADCCON1 */
    ADCCON1 = 0; // No ADCCON1 features are enabled including: Stop-in-Idle, turbo,
    // CVD mode, Fractional mode and scan trigger source.
    /* Configure ADCCON2 */
    ADCCON2 = 0; // Since, we are using only the Class 1 inputs, no setting is
    // required for ADCDIV
    
    /* Initialize warm up time register */
    ADCANCON = 0;
    ADCANCONbits.WKUPCLKCNT = 6; // Wakeup exponent = 32 * TADx
    
//    3. Select the analog inputs to the ADC multiplexers, as described in 22.4.2 ?Selecting the
//    ADC Multiplexer Analog Inputs?.
    
    /* Select all analog inputs for no presync trigger, not sync sampling */
    // This also sets AN0 to ADC0, AN1 to ADC1 and AN2 to ADC2
    ADCTRGMODE = 0;
    
//    4. Select the format of the ADC result, as described in 22.4.3 ?Selecting the Format of the
//    ADC Result?.
        
    // Set all to unsigned integers in single ended mode
    ADCIMCON1bits.SIGN0 = 0; // unsigned data format
    ADCIMCON1bits.DIFF0 = 0; // Single ended mode
    ADCIMCON1bits.SIGN1 = 0; // unsigned data format
    ADCIMCON1bits.DIFF1 = 0; // Single ended mode
    ADCIMCON1bits.SIGN3 = 0; // unsigned data format
    ADCIMCON1bits.DIFF3 = 0; // Single ended mode
    
//    5. Select the conversion trigger source, as described in 22.4.4 ?Selecting the Conversion
//    Trigger Source?.
    
    // Set for Global software edge triggering (GSWTRG)
    // The main RTS loop will manually trigger interrupts in ADCCON3
    ADCTRGSNSbits.LVL0 = 0; // Edge trigger
    ADCTRGSNSbits.LVL1 = 0; // Edge trigger
    ADCTRGSNSbits.LVL3 = 0; // Edge trigger
    ADCTRG1bits.TRGSRC0 = 0b00001;
    ADCTRG1bits.TRGSRC1 = 0b00001;
    ADCTRG1bits.TRGSRC3 = 0b00001;
    
//    6. Select the voltage reference source, as described in 22.4.5 ?Selecting the Voltage
//    Reference Source?.
    
    /* Clock setting */
    ADCCON3 = 0;
    ADCCON3bits.ADCSEL = 0; // Select input clock source
    // NOTE: ADC clock must be between 1 and 23 MHz to operate successfully.
    ADCCON3bits.CONCLKDIV = 3; // Control clock frequency is 84 (PBCLK3) / 4 = 21MHz)
    ADCCON3bits.VREFSEL = 0; // Select AVDD and AVSS as reference source
    
    
//    7. Select the scanned inputs, as described in 22.4.6 ?Selecting the Scanned Inputs?.

    /* Configure ADCCSSx */
    ADCCSS1 = 0; // Clear all bits
    ADCCSS2 = 0;
//    ADCCSS1bits.CSS0 = 1; // AN0 (Class 1) set for scan
//    ADCCSS1bits.CSS1 = 1; // AN1 (Class 1) set for scan
//    ADCCSS1bits.CSS2 = 1; // AN2 (Class 1) set for scan
    
//    8. Select the analog-to-digital conversion clock source and prescaler, as described in
//    22.4.7 ?Selecting the Analog-to-Digital Conversion Clock Source and Prescaler?.
    
    ADC0TIMEbits.ADCDIV = 1; // ADC0 clock frequency is half of control clock = TAD0
    ADC0TIMEbits.SAMC = 5; // ADC0 sampling time = 5 * TAD0
    ADC0TIMEbits.SELRES = 3; // ADC0 resolution is 12 bits
    
    ADC1TIMEbits.ADCDIV = 1; // ADC1 clock frequency is half of control clock = TAD0
    ADC1TIMEbits.SAMC = 5; // ADC1 sampling time = 5 * TAD0
    ADC1TIMEbits.SELRES = 3; // ADC1 resolution is 12 bits
    
    ADC3TIMEbits.ADCDIV = 1; // ADC3 clock frequency is half of control clock = TAD0
    ADC3TIMEbits.SAMC = 5; // ADC3 sampling time = 5 * TAD0
    ADC3TIMEbits.SELRES = 3; // ADC3 resolution is 12 bits
    
//    9. Specify any additional acquisition time, if required, as described in 22.10 ?ADC Sampling
//    Requirements?.
    
    /* Configure ADCGIRQENx */
    ADCGIRQEN1 = 0; // No interrupts are used
    ADCGIRQEN2 = 0;
    
    /* Configure ADCCMPCONx */
    ADCCMPCON1 = 0; // No digital comparators are used. Setting the ADCCMPCONx
    ADCCMPCON2 = 0; // register to '0' ensures that the comparator is disabled.
    ADCCMPCON3 = 0; // Other registers are ?don't care?.
    ADCCMPCON4 = 0;
    ADCCMPCON5 = 0;
    ADCCMPCON6 = 0;

    /* Configure ADCFLTRx */
    ADCFLTR1 = 0; // No oversampling filters are used.
    ADCFLTR2 = 0;
    ADCFLTR3 = 0;
    ADCFLTR4 = 0;
    ADCFLTR5 = 0;
    ADCFLTR6 = 0;
    
    /* Early interrupt */
    ADCEIEN1 = 0; // No early interrupt
    ADCEIEN2 = 0;    
    
//    10. Turn on the ADC module, as described in 22.4.9 ?Turning ON the ADC?.
    
   
    /* Turn the ADC on */
    ADCCON1bits.ON = 1;
    
//    11. Poll (or wait for the interrupt) for the voltage reference to be ready, as described in
//    22.4.5 ?Selecting the Voltage Reference Source?.
    
    /* Wait for voltage reference to be stable */
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while(ADCCON2bits.REFFLT); // Wait if there is a fault with the reference voltage

//    12. Enable the analog and bias circuit for required ADC modules and after the ADC module
//    wakes-up, enable the digital circuit, as described in 22.7.3 ?ADC Low-power Mode?
    
    /* Enable clock to analog circuit */
    ADCANCONbits.ANEN0 = 1; // Enable the clock to analog bias
    ADCANCONbits.ANEN1 = 1; // Enable the clock to analog bias
    ADCANCONbits.ANEN3 = 1; // Enable the clock to analog bias
    /* Wait for ADC to be ready */
    while(!ADCANCONbits.WKRDY0); // Wait until ADC0 is ready
    while(!ADCANCONbits.WKRDY1); // Wait until ADC1 is ready
    while(!ADCANCONbits.WKRDY3); // Wait until ADC3 is ready
    
//    13. Configure the ADC interrupts (if required), as described in 22.6 ?Interrupts?.

    // Turn on ACD units
        /* Enable the ADC module */
    ADCCON3bits.DIGEN0 = 1; // Enable ADC0
    ADCCON3bits.DIGEN1 = 1; // Enable ADC1
    ADCCON3bits.DIGEN3 = 1; // Enable ADC3
    
    
}


/* *****************************************************************************
 End of File
 */

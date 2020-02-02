/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#include <xc.h>
#include "adc.h"

void ADC_Initialize(void)
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

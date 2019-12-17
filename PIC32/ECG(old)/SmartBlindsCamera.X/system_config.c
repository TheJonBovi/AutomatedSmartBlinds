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

//this is for the buzzer
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
/** 
  @Function

 * ADC_config

  @Summary
    
 * This function configures the ADC unit to sample the outputs of the
 * analog voltage sensors.

  @Remarks
    Refer to the system_config.h interface header for function usage details.
 */

// Configure SPI4 to Master mode with an 8Mhz SCLK
// Set the SPI4RX interrupt up at priority 5, subpriority 0 with SRS 3
void Camera_Config(void)
{
    // Set RPB3 to digital
    ANSELBCLR = _ANSELB_ANSB3_MASK;
    
    // Assign SDI4 to RPB3
    SDI4R = 0b1000;
    
    // Assign SDO4 to RPF2
    RPF2R = 0b1000;
     
    // Disable and reset SPI4 
    SPI4CONCLR = _SPI4CON_ON_MASK;
    
    // Clear MSSEN bit in SPI4CON to disable slave select (will do manually)
    SPI4CONCLR = _SPI4CON_MSSEN_MASK;
    
    // RF8 will operate as CS, assert it high before assigning to output.
    LATFSET = _LATF_LATF8_MASK;
    TRISFCLR = _TRISF_TRISF8_MASK;
    
    // Set CKE = 0, CKP = 0, SMP = 1
    SPI4CONCLR = _SPI4CON_CKE_MASK | _SPI4CON_CKP_MASK;
    SPI4CONSET = _SPI4CON_SMP_MASK;
    
    
    // Set Shadow register set 3 for SPI4 RX and ER interrupts (Priority 5)
    PRISSSET = ((3 << _PRISS_PRI5SS_POSITION) & _PRISS_PRI5SS_MASK);
    
    // Clear SPI4RX priority sub priority
    IPC41CLR = _IPC41_SPI4RXIP_MASK | _IPC41_SPI4RXIS_MASK;
    // Set SPI4RX to priority 5, sub-priority 0
    IPC41SET = (5 << _IPC41_SPI4RXIP_POSITION) & _IPC41_SPI4RXIP_MASK;
    
    // Clear SPI4EX priority sub priority
    IPC40CLR = _IPC40_SPI4EIP_MASK | _IPC40_SPI4EIS_MASK;
    // Set SPI4RX to priority 5, sub-priority 1
    IPC40SET = (5 << _IPC40_SPI4EIP_POSITION) & _IPC40_SPI4EIP_MASK | ((1 << _IPC40_SPI4EIS_POSITION) & _IPC40_SPI4EIS_MASK); ;
    
    //Enable RX and Error interrupts
    //IEC5SET = _IEC5_SPI4EIE_MASK | _IEC5_SPI4RXIE_MASK;
    
    // ENABLE SPI4 ERROR ISR 
    //IEC5SET = _IEC5_SPI4EIE_MASK;
    
    // Do NOT have a TX interrupt vector for now
    IEC5CLR = _IEC5_SPI4TXIE_MASK;
    
    // Clear all flags (fault, RX and TX)
    IFS5CLR = _IFS5_SPI4EIF_MASK | _IFS5_SPI4RXIF_MASK | _IFS5_SPI4TXIF_MASK;
  
    // Read buffer to clear receive buffer
    SPI4BUF;
    
    // Clear ENHBUF to set standard buffer mode
    SPI4CONCLR = _SPI4CON_ENHBUF_MASK;
    
    // Set the baud rate in SPI4BRG
    // PB2CLK = 84Mhz and we want a 2Mhz SCLK. So 
    // 2 = 84 / (2 * (BRG + 1) )
    // BRG = 20 for 2Mhz Sclk
    //SPI4BRG = 20;
    
    // PB2CLK = 84Mhz and we want an 8Mhz SCLK. So 
    // 8 = 84 / (2 * (BRG + 1) )
    // BRG = 8 for 4.666667Mhz clock
    SPI4BRG = 8;
    
    // Clear the Overflow flag
    SPI4STATCLR = _SPI4STAT_SPIROV_MASK;
    
    // Set SPI4 to master mode
    SPI4CONSET = _SPI4CON_MSTEN_MASK;
    
    // Enable SPI Unit
    SPI4CONSET = _SPI4CON_ON_MASK;    
}
/* *****************************************************************************
 End of File
 */

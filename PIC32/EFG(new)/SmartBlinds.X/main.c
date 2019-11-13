/* ************************************************************************** */
/** 
 
 * Automated Smart Blinds
 * 
 *  Andrew, Chad and Michael
 * 
 *
 * main.c
 * 
 * 
 * This is the main file for the PIC32, running the RTS loop and all
 * configuration information
 * 
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Pramas                                                            */
/* ************************************************************************** */
/* ************************************************************************** */

#if defined(__32MZ2048EFG144__)
#pragma config FPLLIDIV = DIV_4         // System PLL Input Divider (4x Divider) for 24MHz clock (Rev D (C1) board) 24MHz/2 = 6MHz
#pragma config UPLLFSEL = FREQ_24MHZ    // USB PLL Input Frequency Selection (USB PLL input is 24 MHz)
#else
#pragma config FPLLIDIV = DIV_2         // System PLL Input Divider (2x Divider) for 12 MHz crystal (Rev B and C boards) 12MHz/2 = 6MHz
#pragma config UPLLEN = OFF             // USB PLL Enable (USB PLL is disabled)
#endif
#pragma config FPLLRNG = RANGE_5_10_MHZ // System PLL Input Range (5-10 MHz Input)
#pragma config FPLLICLK = PLL_POSC      // System PLL Input Clock Selection (POSC is input to the System PLL)
#pragma config FPLLMULT = MUL_112       // System PLL Multiplier (PLL Multiply by 112) 6MHz * 112 = 672MHz
#pragma config FPLLODIV = DIV_8         // System PLL Output Clock Divider (8x Divider) 672MHz / 8 = 84MHz

// DEVCFG1
#pragma config FNOSC = SPLL             // Oscillator Selection Bits (Primary Osc (HS,EC))
#pragma config FSOSCEN = OFF            // Secondary Oscillator Enable (Disable SOSC)

#if defined(__32MZ2048EFG144__)
#pragma config POSCMOD = EC             // Primary Oscillator Configuration EC - External clock osc
#else
#pragma config POSCMOD = HS             // Primary Oscillator Configuration HS - Crystal osc
#endif
#pragma config FCKSM = CSDCMD           // Clock Switching and Monitor Selection (Clock Switch Disabled, FSCM Disabled)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (WDT Disabled)
#pragma config FDMTEN = OFF             // Deadman Timer Enable (Deadman Timer is disabled)
#pragma config DMTINTV = WIN_127_128    // Default DMT Count Window Interval (Window/Interval value is 127/128 counter value)
#pragma config DMTCNT = DMT31           // Max Deadman Timer count = 2^31

// DEVCFG0
#pragma config JTAGEN = OFF             // JTAG Enable (JTAG Disabled)
#pragma config ICESEL = ICS_PGx2        // ICE/ICD Comm Channel Select (Communicate on PGEC2/PGED2)


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
int T2_count = 0;
int T3_count = 0;


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Main Function                                                     */
/* ************************************************************************** */
/* ************************************************************************** */

int main()
{
    // Run initialization code
    SYSCLK_config();
    ISR_config();    
    PBCLK3_config();
    T2_config();
    T3_config();
    
    //Sync up TMR2 and TMR3 per lab instruction
    T2CONSET = _T2CON_ON_MASK; // Turn Timer 2 and Timer 3 on.
    T3CONSET = _T2CON_ON_MASK; // Do not rearrange these lines so timers will sync
    IFS0SET = _IFS0_T3IF_MASK; //artificially trigger a T3 int
    
    // This cute lil loop syncs the timers. 
    int i;
    for(i = 0; i < 2; i++) 
    { // run the following twice so it runs from cache the second time
        TMR2 = 0;
        TMR3 = 5; // Needed to get TMR2 and 3 in sync
    }
    
    // Enable the ADC Module
    /* Enable the ADC module */
    ADCCON3bits.DIGEN0 = 1; // Enable ADC0
    ADCCON3bits.DIGEN1 = 1; // Enable ADC1
    ADCCON3bits.DIGEN2 = 1; // Enable ADC2
    
    int result[3];
    while (1) 
    {
        /* Trigger a conversion */
        ADCCON3bits.GSWTRG = 1;
        /* Wait the conversions to complete */
        while (ADCDSTAT1bits.ARDY0 == 0);
        /* fetch the result */
        result[0] = ADCDATA0;
        while (ADCDSTAT1bits.ARDY1 == 0);
        /* fetch the result */
        result[1] = ADCDATA1;
        while (ADCDSTAT1bits.ARDY2 == 0);
        /* fetch the result */
        result[2] = ADCDATA2;
        /*
        * Process results here
        *
        * Note: Loop time determines the sampling time since all inputs are Class 1.
        * If the loop time is small and the next trigger happens before the completion
        * of set sample time, the conversion will happen only after the sample time
        * has elapsed.
        *
        */
    }
    // Endless loop
    while(true);
}
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

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include <xc.h>
#include <sys/attribs.h>
#include <stdint.h>
#include <stdbool.h>
#include "tmr2_3.h"
#include "defines.h"
#include "mcc.h"

// Proximity Sensor Global Variables
extern int proxyAlarmState;
extern int proxyCount;

// Temperature Sensor Control Global Variables
extern int temperatureAlarmState;
extern double current_temp;
extern double temp_high;
extern double temp_low;
extern int temp_array_position;
extern double temp_avg;
extern double temp_array[20];
extern double current_temp_avg;

// Gas Sensor Global Variables
extern int gasAlarmState;

typedef struct _TMR_OBJ_STRUCT
{
    /* Timer Elapsed */
    bool                                                    timerElapsed;
    /*Software Counter value*/
    uint8_t                                                 count;

} TMR_OBJ;

static TMR_OBJ tmr1_obj;

int proxy_debounce = 0;
int temp_debounce = 0;

double current_gas;

void TMR2_Initialize(void)
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

void TMR3_Initialize(void)
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

void TMR2_32bit_Initialize(void)
{
    asm volatile( "di" ); // Disable Interrupts
    
    // Clear configure registers to disable, Set TMR2 for 16-bit mode, 1:1 prescalar (i.e. clock speed) 
    T2CON = 0;
    
    // Set T2 to operate in 32-bit mode
    T2CONSET = _T2CON_T32_MASK;
    
    // Set T2 clock prescalar to 2:1 
    T2CONbits.TCKPS = 0;
    
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

void __ISR_AT_VECTOR(_TIMER_2_VECTOR, IPL5SRS) TMR2_ISR(void)
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
//This is for the ADC configs
void __ISR_AT_VECTOR(_TIMER_3_VECTOR, IPL1SRS) TMR3_ISR(void)
{ 
    
    // ADC loop and test output on LED's for proximity sensor
    int current_read[3];
    double temp_low = (temp_high - 5); //the high temp minus 5 degrees
   
//    /* Trigger a conversion */
    ADCCON3bits.GSWTRG = 1;
    
    /* Wait the conversions to complete */
    while (ADCDSTAT1bits.ARDY0 == 0);
    /* fetch the result for PROXIMITY */
    current_read[0] = ADCDATA0;
    
    while (ADCDSTAT1bits.ARDY1 == 0);
    /* fetch the result for TEMP */
    current_read[1] = ADCDATA1;
    
    while (ADCDSTAT1bits.ARDY3 == 0);
    /* fetch the result for GAS */
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
    if (current_read[0] <= ADC_LOW_WNG && proxyAlarmState == 0)
    {
        if (proxy_debounce < maxTMR3ISRdebounce) ++proxy_debounce;
        else
        {
            proxy_debounce = 0;
            PORTK = 0b0;
        }

    }
    else if (ADC_LOW_WNG < current_read[0] && current_read[0] <= ADC_MID_WNG && proxyAlarmState == 0) 
    {
        if (proxy_debounce < maxTMR3ISRdebounce) ++proxy_debounce;
        else
        {
            proxy_debounce = 0;
            PORTK = 0b1;
        }
    }
    else if (ADC_MID_WNG < current_read[0] && current_read[0] <= ADC_HIGH_WNG && proxyAlarmState == 0) 
    {
        if (proxy_debounce < maxTMR3ISRdebounce) ++proxy_debounce;
                else
        {
            proxy_debounce = 0;
            PORTK = 0b11;
        }
    }
    else 
    {
        if (proxy_debounce < maxTMR3ISRdebounce) ++proxy_debounce;
        else if (proxyAlarmState == 0)
        {
            proxyAlarmState = 1;
            PORTK = 0b111;
#ifdef CAMERA_ON        
            JPEG_ready = true;
            Camera_capture_image();
#endif
            
            proxy_debounce = 0;
        }
        else 
        {
            proxy_debounce = 0;
        }
        
    }   
    
    ///////////////////////////////////////////////////////////////////////////////////////////
    //This section is for the temperature
    //if the temperature is too hot, then set the alarm

    current_temp = current_read[1] * 3300 / 4096 - 58;
    //if the current temperature within 5 degrees of the
    //average temperature, then log into temperature array
    if (temp_avg - 5 < current_temp < temp_avg + 5)
    {
        temp_array[temp_array_position];
        temp_array_position++;
    }
    //else do nothing
    else{};
    
    //reset the array position when it reaches the end of the array
    if (temp_array_position > 20)
    {
        temp_array_position = 0;
    }

    
    //if the temperature average is greater or equal to the
    //high temperature trigger, then trigger the alarm
    if (current_temp_avg >= temp_high)
    {
        if (temp_debounce < maxTMR3ISRdebounce)
        {
            ++temp_debounce;
        }
        else
        {
            temperatureAlarmState = 1;
            temp_debounce = 0;
        }

    }
    //else if the average temperature is lower than the too hot settings, then turn off the temperature alarm
    else if (current_temp_avg <= temp_low)
    {
        if (temp_debounce < maxTMR3ISRdebounce)
        {
            ++temp_debounce;
        }
        else
        {
            temperatureAlarmState = 0;
            temp_debounce = 0;
        }
    }
    
    
    //////////////////////////////////////////////////////////////////////////////////////////
    //This section is for the gas
    //if the sensor detects anything below the high gas value
    //then it'll keep the gas alarm turned off
    
    current_gas = (5 * ((1023-(double)current_read[2])/(double)current_read[2]));
    // If gas gets below certain Rs/Ro, trigger buzzer
    if (current_gas < GAS_HIGH)
    {
        gasAlarmState = 1;

    }
    //else if the sensor detects dangerous levels of smoke or gas
    //then it'll trigger the gas alarm until the gas clears.
    else
    {
        gasAlarmState = 0;

    }
    
    
    // Clear T3IF atomically
    IFS0CLR = _IFS0_T3IF_MASK;
    

}


/**
  @Generated MPLAB(c) Code Configurator Source File

  @Company:
    Microchip Technology Inc.

  @File Name:
    mcc.c

  @Summary:
    This is the mcc.c file generated using MPLAB(c) Code Configurator

  @Description:
    This header file provides implementations for driver APIs for all modules selected in the GUI.
    Generation Information :
        Product Revision  :  MPLAB(c) Code Configurator - 3.16
        Device            :  PIC24FJ128GA310
        Driver Version    :  1.02
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

// Configuration bits: selected in the GUI

#include "winc1500_api.h"
#include "defines.h"
#include <string.h>
#include "mcc.h"

// PIC32MZ2048ECG144 or EFG144 based HMZ144 board Configuration Bit Settings
// DEVCFG2
#if defined(__32MZ2048EFG144__)
#pragma config FPLLIDIV = DIV_4         // System PLL Input Divider (4x Divider) for 24MHz clock (Rev D (C1) board) 24MHz/2 = 6MHz
#pragma config UPLLFSEL = FREQ_24MHZ    // USB PLL Input Frequency Selection (USB PLL input is 24 MHz)
#else
#pragma config FPLLIDIV = DIV_2         // System PLL Input Divider (2x Divider) for 12 MHz crystal (Rev B and C boards) 12MHz/2 = 6MHz
//#pragma config UPLLEN = OFF             // USB PLL Enable (USB PLL is disabled)
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
#pragma config WDTPS = PS4096           // Watchdog Timer Postscaler (1:512)
#pragma config WDTSPGM = STOP           // Watchdog Timer Stop During Flash Programming (WDT stops during Flash programming)
#pragma config WINDIS = NORMAL          // Watchdog Timer Window Mode (Watchdog Timer is in non-Window mode)
#pragma config FDMTEN = OFF             // Deadman Timer Enable (Deadman Timer is disabled)
#pragma config DMTINTV = WIN_127_128    // Default DMT Count Window Interval (Window/Interval value is 127/128 counter value)
#pragma config DMTCNT = DMT31           // Max Deadman Timer count = 2^31

// DEVCFG0
#pragma config JTAGEN = OFF             // JTAG Enable (JTAG Disabled)
#pragma config ICESEL = ICS_PGx2        // ICE/ICD Comm Channel Select (Communicate on PGEC2/PGED2)

//postscaler 1:4096, period 4096 seconds
//#pragma config WDTPS = PS4096
//#pragma config WDTPS = PS8192             //(example) 4 second watchdog timer with 80MHz clock. Need 84MHz


// Motor Control Global Variables
int motorTargetUD = 1024; //This needs to be set to 1024 (or full up to where the blinds are at the base) during start up. Both hardware and software.
int motorTargetOC = 0;    //This needs to be set to 0 (or full open as in you're able to see through them) during start up. Both hardware and software.
int UDStepperState = 0;
int OCStepperState = 0;
int motorUD;
int motorOC;
int motorID;
int counterUD = 1024;
int counterOC = 0;

// Temperature Sensor Control Global Variables
double temp_high = 100; 
double temp_low;
int temperatureAlarmState = 0;
double current_temp;
int temp_array_position = 0;
double temp_avg = INIT_TEMP_AVG;
double temp_array[TEMP_SAMPLES] = {INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG, INIT_TEMP_AVG};
double current_temp_avg;

// Gas Sensor Global Variables
int gasAlarmState = 0;

// Proximity Sensor Global Variables
int proxyAlarmState = 0;
int proxyCount = 0;
int rcv_UD_target = 0;
int rcv_OC_target = 0;
double rcv_temp_target = 0;

// Globals for wifi service
//uint8_t message_type = WIFI_IMG_UPLOAD_MODE;
//uint8_t message_type = WIFI_RECIEVE_MODE;
uint8_t message_type = WIFI_DO_NOTHING;

int callControlState = 0;

// Image storage and flag Global Variables
char JPEG_BUFFER[JPEG_MAX_SIZE] = {0};
bool JPEG_ready = false;

static void PinMapInit(void);   // added to MCC-generated code

void SYSTEM_Initialize(void)
{
    PinMapInit();               // added to MCC-generated code
    PIN_MANAGER_Initialize();
    OSCILLATOR_Initialize();
    PBCLK3_Initialize();
    PBCLK2_Initialize();
    PRISS_Initialize();
    
    INTERRUPT_Initialize();
    EXT_INT_Initialize();
    TMR1_Initialize();
    
    UART2_Initialize();
    
    // wait for gas sensor to settle
    delay_ms(10000);
    
    TMR2_32bit_Initialize();
    TMR5_16bit_Motor_Initialize();
    
    //DIP_Initialize();
    ADC_Initialize();
    
    //TMR4_16bit_Initialize();
    
    buzzer_Initialize();
    switch_Initialize();
    LED_Initialize();


#ifdef CAMERA_ON
    // Initialize Camera
    I2C1_Sensor_Initialize();
    SPI1_Camera_Initialize();


    // Configure the Camera
    Camera_Configure();
#endif
    
//    watchdog_Initialize();
}

void OSCILLATOR_Initialize(void)
{

    asm volatile( "di" ); // Disable Interrupts
    PRECON = (1 & _PRECON_PFMWS_MASK) | ((3 << _PRECON_PREFEN_POSITION) & _PRECON_PREFEN_MASK); // enable prefetch cache and 1 waitstates
    asm volatile( "ei" ); // Re-Enable Interrupts

//    // CF no clock failure; NOSC FRCPLL; SOSCEN disabled; POSCEN disabled; CLKLOCK unlocked; OSWEN Switch is Complete; IOLOCK not-active;
//    __builtin_write_OSCCONL((uint8_t) (0x0100 & 0x00FF));
//    // RCDIV FRC/1; DOZE 1:8; DOZEN disabled; ROI disabled;
//    CLKDIV = 0x3000;
//    // TUN Center frequency;
//    OSCTUN = 0x0000;
//    // ROEN disabled; ROSEL disabled; RODIV Base clock value; ROSSLP disabled;
//    REFOCON = 0x0000;
//    // WDTO disabled; TRAPR disabled; SLEEP disabled; BOR disabled; DPSLP disabled; CM disabled; SWR disabled; SWDTEN disabled; EXTR disabled; POR disabled; IDLE disabled; IOPUWR disabled; VREGS disabled;
//    RCON = 0x0000;
}

// added to MCC-generated code
// This is for PPS
static void PinMapInit(void)
{
//    __builtin_write_OSCCONL(OSCCON & 0xbf);  // unlock pin mapping registers

    // UART pins
//    RPOR8bits.RP17R   = 5;    // Assign U2TX output to Pin RF5/RP17 (Pin 50)
//    RPINR19bits.U2RXR = 10;   // Assign U2RX output to Pin RF4/RP10 (Pin 49)

#if defined(USING_PICTAIL)
    // External Interrupt 3
//    RPINR1bits.INT3R  = 36;   // Assign EXT3 input to Pin RA14/RPI36 (Pin 66))
#elif defined(USING_CLICK_BOARD)
    RPINR1bits.INT2R  = 35;   // Assign EXT2 input to Pin RA15/RPI35 (Pin 67))
#endif
    // SPI pins
//    RPOR10bits.RP21R  = 11;   // Assign SCK2 output to Pin RG6/RP21 (Pin 10)
//    RPOR9bits.RP19R   = 10;   // Assign SDO2 output to Pin RG8/RP19 (Pin 12)
//    RPINR22bits.SDI2R = 26;   // Assign SDI2 input to Pin RG7/RP26 (Pin 11)

    RPD3R = 0b1000;
    SDI4R = 0b0011;

//    __builtin_write_OSCCONL(OSCCON | 0x40);   // lock pin mapping registers
}

void PBCLK3_Initialize(void)
{
    asm volatile( "di" ); // Disable Interrupts

    // PBCLK3 setup to 2:1
    SYSKEY = 0; // Ensure lock
    SYSKEY = 0xAA996655; // Write Key 1
    SYSKEY = 0x556699AA; // Write Key 2
    PB3DIV = _PB3DIV_ON_MASK | ((1 << _PB3DIV_PBDIV_POSITION) & _PB3DIV_PBDIV_MASK); // 0 = div by 1, 1 = div by 2 etc up to 128
    SYSKEY = 0; // Re lock

    asm volatile( "ei" ); // Re-Enable Interrupts
}

void PBCLK2_Initialize(void)
{
    asm volatile( "di" ); // Disable Interrupts

    // PBCLK2 setup to 2:1
    SYSKEY = 0; // Ensure lock
    SYSKEY = 0xAA996655; // Write Key 1
    SYSKEY = 0x556699AA; // Write Key 2
    PB2DIV = _PB2DIV_ON_MASK | ((1 << _PB2DIV_PBDIV_POSITION) & _PB2DIV_PBDIV_MASK); // 0 = div by 1, 1 = div by 2 etc up to 128
    SYSKEY = 0; // Re lock

    asm volatile( "ei" ); // Re-Enable Interrupts
}

void buzzer_Initialize(void)
{
    //set up the buzzer to work on RK3
    PORTKCLR = _PORTK_RK3_MASK;

    TRISKCLR = _TRISK_TRISK3_MASK;

}

void buzzer_toggle(void)
{
    PORTKbits.RK3 ^= 1;
}

void buzzer_clear(void)
{
    PORTKbits.RK3 = 0;
}

void buzzer_set(void)
{
    PORTKbits.RK3 = 1;
}

void switch_Initialize(void)
{
    //set up 2 buttons for cw and ccw

    //clear port g for the registers
    PORTGCLR = _PORTG_RG0_MASK;
    PORTGCLR = _PORTG_RG1_MASK;

    //set to input for both registers
    TRISGSET = _TRISG_TRISG0_MASK;
    TRISGSET = _TRISG_TRISG1_MASK;
}

//This is the watchdog timer that will reset the pic after a certain amount of time
//Section 16 in datasheet for WTD.
//also section 9 here for further details http://ww1.microchip.com/downloads/en/DeviceDoc/61114E.pdf
//https://www.microchip.com/forums/m691058.aspx
//https://microchipdeveloper.com/8bit:wdt
//
void watchdog_Initialize(void)
{
    // Clear WDT flag
    WDT_Clear();
    
    // Clear register to turn off and initalize
    WDTCON = 0;
    
    //enable the watchdog
    WDTCONbits.ON = 1;
}

void PRISS_Initialize(void)
{
    PRISSbits.PRI1SS = 1;
    PRISSbits.PRI2SS = 2;
    PRISSbits.PRI3SS = 3;
    PRISSbits.PRI4SS = 4;
    PRISSbits.PRI5SS = 5;
    PRISSbits.PRI6SS = 6;
    PRISSbits.PRI7SS = 7;
    
}

/**
 End of File
*/

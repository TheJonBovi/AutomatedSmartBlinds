#include <xc.h>
#include <stdbool.h>
#include <math.h>
#include <sys/attribs.h>
#include <string.h>
#include "SPI1.h"

void SPI1_Camera_Initialize(void)
{
    // Set RF0-2 to digital
    ANSELF = 0;
    
    // Assign SDI1 to RF1
    SDI1R = 0b0100;
    
    // Assign SDO1 to RF0
    RPF0R = 0b0101;
     
    // Disable and reset SPI unit
    SPI1CON = 0;
    SPI1CONCLR = _SPI1CON_ON_MASK;
    
    // Clear MSSEN bit in SPIXCON to disable slave select (will do manually)
    SPI1CONCLR = _SPI1CON_MSSEN_MASK;
    
    // RF2 will operate as CS, assert it high before assigning to output.
    LATFSET = _LATF_LATF2_MASK;
    TRISFCLR = _TRISF_TRISF2_MASK;
    
    // SPI MODE 0 => Set CKE = 1, CKP = 0, SMP = 1
    SPI1CONbits.CKE = 0;
    SPI1CONbits.CKP = 0;
    SPI1CONbits.SMP = 0;
    
    // Disable SPI4 Interrupt enables and flags (fault, RX and TX)
    IEC3CLR = _IEC3_SPI1EIE_MASK | _IEC3_SPI1RXIE_MASK | _IEC3_SPI1TXIE_MASK;
    IFS3CLR = _IFS3_SPI1EIF_MASK | _IFS3_SPI1RXIF_MASK | _IFS3_SPI1TXIF_MASK;
   
    // Read buffer to clear receive buffer
    SPI1BUF;
    
    // Clear ENHBUF to set standard buffer mode
    SPI1CONCLR = _SPI4CON_ENHBUF_MASK;
    
    // Set the baud rate in SPI1BRG
    // PB2CLK = 42Mhz and we want a 8Mhz SCLK MAX. So 
    // 8 = 42 / (2 * (BRG + 1) )
    // BRG = 2 for 7Mhz Sclk
    SPI1BRG = 2;
    
    // This one for 4.2Mhz
    //SPI1BRG = 4;
    
    // Clear the Overflow flag
    SPI1STATCLR = _SPI1STAT_SPIROV_MASK;
    
    // Set SPI4 to master mode
    SPI1CONSET = _SPI1CON_MSTEN_MASK;
    
    // Enable SPI Unit
    SPI1CONSET = _SPI1CON_ON_MASK;    
}

void SPI1_write_byte(int addr, char value)
{
    ASSERT_CS;
    asm volatile( "NOP" ); // no-op delay
    asm volatile( "NOP" ); // no-op delay
    
    // Send address with the write command (bit 7 = 1 write)
    SPI1BUF = addr | 0x80; 
    
    // Wait for Receive buffer to fill (address data clocked out)
    while (SPI1STATbits.SPIRBF == 0);
    
    // Read the dummy in from address send
    SPI1BUF;
    
    SPI1BUF = value;
    
    // Wait for receive buffer to fill (1 = not full)
    while (SPI1STATbits.SPIRBF == 0);
    
    SPI4BUF; // discard iDummy from value send
    
    // Negate CS line to end transmission
    asm volatile( "NOP" ); // no-op delay
    asm volatile( "NOP" ); // no-op delay
    NEGATE_CS;

}

char SPI1_read_byte(int addr)
{
    char result;
    
    ASSERT_CS;
    asm volatile( "NOP" ); // no-op delay
    asm volatile( "NOP" ); // no-op delay
    
    // Send address with the read command (bit 7 = 0 read)
    SPI1BUF = addr & 0x7F; 
    
    // Wait for Receive buffer to fill (address data clocked out)
    while (SPI1STATbits.SPIRBF == 0);
    
    // Read the dummy in from address send
    SPI1BUF;
    
    // Write dummy to get value from address
    SPI1BUF = 0;
    
    // Wait for receive buffer to fill (1 = not full)
    while (SPI1STATbits.SPIRBF == 0);
    
    result = SPI1BUF; // return read value from address
    
    // Negate CS line to end transmission
    asm volatile( "NOP" ); // no-op delay
    asm volatile( "NOP" ); // no-op delay
    NEGATE_CS;
    
    return result;
}

void test_RD1_Initialize(void)
{
    // SET RD1 to an output to test with LED
    TRISDbits.TRISD1 = 0;
    
    LATDbits.LATD1 = 0;
}

void toggle_RD1(void)
{
    LATDbits.LATD1 ^= 1;
}

uint8_t SPI1_transfer(uint8_t data)
{
    SPI1BUF = data;
    asm volatile("nop");
    while (SPI1STATbits.SPIRBF == 0);
    return SPI1BUF;
}

//
//char SPI4_read_status(void)
//{
//    char result = 0;
//    
//    // Turn on TMR2 for debugging purposes
//    T2CONSET = _T2CON_ON_MASK;
//    
//    ASSERT_CS;   // Assert CS line
//    
// 
//    SPI4BUF = 0b00000101; // Load read status instruction into BUF
//    
//    // Wait for TBE to set (transmit buffer empty)
//    while (SPI4STATbits.SPITBE == 0);
//    
//    // write oDummy
//    SPI4BUF = 0;
//    
//    // Wait for receive buffer to fill (1 = not full)
//    while (SPI4STATbits.SPIRBF == 0);
//    SPI4BUF; // discard iDummy from status send
//    
//    // Wait for receive buffer to fill to get actual status(1 = not full)
//    while (SPI4STATbits.SPIRBF == 0);
//    // load up status value for return
//    result = SPI4BUF;
//    
//    // Negate CS line to end transmission
//    asm volatile( "NOP" ); // no-op delay
//    asm volatile( "NOP" ); // no-op delay
//    NEGATE_CS;
//
//    return result;   
//}
//
//void SPI4_WREN(void)
//{
//    ASSERT_CS;
//    
//    SPI4BUF = 0b00000110; // Load WREN command instruction into BUF
//    
//    // Should wait for TBE? DEFINITLY NO because we are not clocking anything else out 
//    // and we need to make sure we get the dummy in to know WREN command was sent out
//    while (SPI4STATbits.SPIRBF == 0); // Wait for receive buffer to fill (1 = not full)
//    SPI4BUF; // read iDummy to clear buffer
//    
//    asm volatile( "NOP" ); // no-op delay
//    asm volatile( "NOP" ); // no-op delay
//    NEGATE_CS;
//}
//
//void SPI4_read(int addr, char* buffer, size_t length)
//{
//    // Don't read nothing, duh
//    if (length == 0) return;
//    
//    // Ensure there is no WIP before reading
//    while (SPI4_read_status() & 0x1);
//    
//    char result = 0;
//    
//    ASSERT_CS;
//
//    SPI4BUF = 0b00000011; // Load read address instruction into BUF
//    
//    while (SPI4STATbits.SPITBE == 0); // Wait for TBE to set (transmit buffer empty)
//    
//    SPI4BUF = addr >> 8; // Load MSB of address into buffer
//    
//    while (SPI4STATbits.SPIRBF == 0); // Wait for READ command to be clocked out (1 = not full)
//    SPI4BUF; // Read iDummya
//    
//    SPI4BUF = addr & 0xFF; // Load LSB of address into buffer
//    
//    while (SPI4STATbits.SPIRBF == 0); // Wait for MSA to be clocked out (1 = not full)
//    SPI4BUF; // Read iDummyb
//    
//    SPI4BUF = 0; // Write oDummy1
//    
//    while (SPI4STATbits.SPIRBF == 0); // Wait for LSB to be clocked out(1 = not full)
//    SPI4BUF; // Read iDummyc
//    
//    // If only one byte to read
//    if (length == 1)
//    {
//        while (SPI4STATbits.SPIRBF == 0); // wait to clock in the data byte
//        buffer[0] = SPI4BUF; // read the byte
//    }
//    else
//    {
//        SPI4BUF = 0; // Write oDummy2
//
//        while (SPI4STATbits.SPIRBF == 0); // Wait for oDummy1 to clock out(1 = not full)
//        
//        // Start filling buffer with values read until length is reached.
//        size_t n = 0;
//        while (length - 2 > n)
//        {
//            buffer[n] = SPI4BUF; // save data then increment buffer and decrement length
//            SPI4BUF = 0; // Write current oDummy to get data in
//            ++n;
//            while (SPI4STATbits.SPIRBF == 0); // Wait for receive buffer to fill (1 = not full)
//        }
//        buffer[n] = SPI4BUF; // Read second to last char
//        while (SPI4STATbits.SPIRBF == 0); // Wait last char to clock in (1 = not full
//        
//        buffer[n+1] = SPI4BUF; // read last character 
//    }
//    
//    asm volatile( "NOP" ); // no-op delay
//    asm volatile( "NOP" ); // no-op delay
//    NEGATE_CS;
//}
//
//void SPI4_write(int addr, char* data, size_t length)
//{    
//    if ( length == 0) return; // Do nothing if writing nothing
//    
//    // Ensure there is no WIP before write
//    while (SPI4_read_status() & 0x1);
//    
//    // Enable writing
//    SPI4_WREN();
//    
//    // Next, send the write command
//    ASSERT_CS;
//
//    SPI4BUF = 0b00000010; // Load WRITE command instruction into BUF
//    
//    while (SPI4STATbits.SPITBE == 0); // Wait for TBE to set (transmit buffer empty)
//    
//    SPI4BUF = addr >> 8; // Write MSA of address to BUF
//    
//    while (SPI4STATbits.SPIRBF == 0); // Wait for  WRITE command to be sent out
//    SPI4BUF; // read iDummya to clear buffer
//    
//    SPI4BUF = addr & 0xFF; // Write LSA to BUF since MSA is being clocked out
//    
//    while (SPI4STATbits.SPIRBF == 0); // Wait for MSA to clock out (1 = not full)
//    SPI4BUF; // read iDummyb to clear buffer
//    
//    // Start Writing data
//    size_t n = 0;
//    while (length > n)
//    {
//        SPI4BUF = data[n]; // load data from buffer and decrement length and increment counter.
//        ++n;
//        while (SPI4STATbits.SPIRBF == 0); // Wait for receive buffer to fill (1 = not full)
//        SPI4BUF;
//    }
//    
//    while (SPI4STATbits.SPIRBF == 0); // Wait for receive buffer to fill (1 = not full)
//    SPI4BUF; // clear last iDummy
//    
////    asm volatile( "NOP" ); // no-op delay
////    asm volatile( "NOP" ); // no-op delay
//    NEGATE_CS;
//}
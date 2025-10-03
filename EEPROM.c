////////////////////////////////////////////////////////////////////////////////
// SUJET		: Gestion de l'eeprom
// AUTEUR 		: BLIN Y
// VERSION		: A
// CREATION		: 22/03/2012
// DER. MODIF	: 
// Note         : Marque de l'EEPROM : ST M95256   (32 Kbytes, pages de 64 octets)
////////////////////////////////////////////////////////////////////////////////
#include "p24FJ256GB108.h"
#include "EEPROM.h"

void InitSPIEEPROM()
{
	// vitesse de la SPI : 666.667 KHz => Fcy/3/4 = Fosc/2/3/4 = 16 MHz/2 / 3 / 4
    SPI2CON1 = 0x0136;  // SDO fonctionne sur front montant de la clock, 
    					// Mode Master
    					// Secondary prescaler 3:1
    					// Primary prescaler 4:1
    					
    SPI2STAT = 0x8000;  // enable the peripheral

    // Set IOs directions for EEPROM SPI
    EEPROM_SS_PORT = 1;
    EEPROM_SS_TRIS = 0;
} 

unsigned char writeSPIEEPROM( unsigned char i )
{
    SPI2BUF = i;					// write to buffer for TX
    while(!SPI2STATbits.SPIRBF);	// wait for transfer to complete
    return SPI2BUF;    				// read the received value
}

/////////////////////////////////////////////////////////////////////////
// Function: EEPROMWriteByte()                                           
// Preconditions: SPI module must be configured to operate with  EEPROM. 
// Overview: This function writes a new value to address specified.      
// Input: Data to be written and address.                              
// Output: None.                                                         
/////////////////////////////////////////////////////////////////////////

void EEPROMWriteByte(unsigned char Data, unsigned long Address)
{
	unsigned char Local_8;
    EEPROMWriteEnable();
    mEEPROMSSLow();

    Local_8 = writeSPIEEPROM(EEPROM_CMD_WRITE);

    Local_8 = writeSPIEEPROM(Hi(Address));
    Local_8 = writeSPIEEPROM(Lo(Address));

    Local_8 = writeSPIEEPROM(Data);

    mEEPROMSSHigh();

    // wait for completion of previous write operation
    while(EEPROMReadStatus().Bits.WIP);
    
    EEPROMWriteDisable();
}

/////////////////////////////////////////////////////////////////////////
// Function: EEPROMReadByte()                                            
// Preconditions: SPI module must be configured to operate with  EEPROM. 
// Overview: This function reads a value from address specified.         
// Input   : Address.                                                       
// Output  : Data read.                                                    
/////////////////////////////////////////////////////////////////////////

unsigned char EEPROMReadByte(unsigned int Address)
{
	unsigned char Local_8,var1,var2;

    mEEPROMSSLow();

    Local_8 = writeSPIEEPROM(EEPROM_CMD_READ);
	var1 = Hi(Address);
	var2 = Lo(Address);
    Local_8 = writeSPIEEPROM(var1);
    Local_8 = writeSPIEEPROM(var2);

    Local_8 = writeSPIEEPROM(0);

    mEEPROMSSHigh();
    return Local_8;
}

/////////////////////////////////////////////////////////////////////////
//Function: EEPROMWriteEnable()                                         
//Preconditions: SPI module must be configured to operate with EEPROM.  
//Overview: This function allows a writing into EEPROM. Must be called  
//before every writing command.                                         
//Input: None.                                                          
//Output: None.                                                         
/////////////////////////////////////////////////////////////////////////
void EEPROMWriteEnable()
{
	unsigned char Local_8;
    mEEPROMSSLow();
    Local_8 = writeSPIEEPROM(EEPROM_CMD_WREN);
    mEEPROMSSHigh();
}

void EEPROMWriteDisable()
{
	unsigned char Local_8;
    mEEPROMSSLow();
    Local_8 = writeSPIEEPROM(EEPROM_CMD_WRDI);
    mEEPROMSSHigh();
}

/////////////////////////////////////////////////////////////////////////
//Function: EEPROMReadStatus()                                          
//Preconditions: SPI module must be configured to operate with  EEPROM. 
//Overview: This function reads status register from EEPROM.            
//Input: None.                                                          
//Output: Status register value.                                        
/////////////////////////////////////////////////////////////////////////
union _EEPROMStatus_ EEPROMReadStatus()
{
	unsigned char Local_8;

    mEEPROMSSLow();
    Local_8 = writeSPIEEPROM(EEPROM_CMD_RDSR);
    Local_8 = writeSPIEEPROM(0);
    mEEPROMSSHigh();

    return (union _EEPROMStatus_)Local_8;
}


void DataWriteEEPROM(unsigned int dat, unsigned int ad)
{
	unsigned char lect;
	
	lect = 0;
	lect = EEPROMReadByte(ad);
	
	if (dat != lect)
		EEPROMWriteByte(dat,ad);
}	

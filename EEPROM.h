#include <xc.h>

void EEPROMWriteEnable();
void EEPROMWriteDisable();
union _EEPROMStatus_ EEPROMReadStatus();


// Mapping memoire de l'eeprom
#define ADR_NB_ACCIDENTS    		0x00
#define ADR_BOLD                    0x01
#define ADR_LAST_ACCIDENT_DATE      0x02 // jusquà 0x04
#define ADR_BRIGHT_ENABLED          0x05
#define ADR_LED_COLOR_1             0x06
#define ADR_LED_COLOR_2             0x07
#define ADR_LED_COLOR_3             0x08
#define ADR_BRIGHT                  0x09
#define ADR_ECO_ENABLED             0x10
#define ADR_NB_JOURS_SANS_ACCIDENTS	0x11
#define ADR_NB_RECORDS_JOURS		0x15 //jusquà 18
#define ADR_HORAIRE_ALLUMAGE        0x19 //jusquà 20
#define ADR_HORAIRE_EXTINCTION      0x21 //jusquà 22
#define ADR_AUTRE                   0x23 

#define DEBUT_MEM	0x200
#define TAILLE_MEM_SAUV		60
#define TYPE_SPORT			28
#define VAR_SPORT			29
#define NB_SAUVEGARDE		10

#define MEMOIRE_1		DEBUT_MEM


// EEPROM Commands
#define EEPROM_PAGE_SIZE    (unsigned)64
#define EEPROM_CMD_WREN     (unsigned)0b00000110
#define EEPROM_CMD_WRDI     (unsigned)0b00000100
#define EEPROM_CMD_RDSR     (unsigned)0b00000101
#define EEPROM_CMD_READ     (unsigned)0b00000011
#define EEPROM_CMD_WRITE    (unsigned)0b00000010

#define EEPROM_SS_TRIS      TRISBbits.TRISB3
#define EEPROM_SS_PORT      LATBbits.LATB3

#define mEEPROMSSLow()      EEPROM_SS_PORT = 0;
#define mEEPROMSSHigh()     EEPROM_SS_PORT = 1;

#define Lo(X)   (unsigned char)(X&0x00ff)
#define Hi(X)   (unsigned char)((X>>8)&0x00ff)

	struct  STATREG{
	unsigned    WIP:1;
	unsigned    WEL:1;
	unsigned    BP0:1;
	unsigned    BP1:1;
	unsigned    RESERVED:3;
	unsigned    WPEN:1;
};

union _EEPROMStatus_{
	struct  STATREG Bits;
	unsigned char	Char;
};

void InitSPIEEPROM();
unsigned char writeSPIEEPROM( unsigned char i );
void EEPROMWriteByte(unsigned char Data, unsigned long Address);
unsigned char EEPROMReadByte(unsigned int Address);
void EEPROMWriteEnable();
union _EEPROMStatus_ EEPROMReadStatus();
void DataWriteEEPROM(unsigned int dat, unsigned int ad);
void EEP_WriteU32(uint16_t adr, uint32_t v);
uint32_t EEP_ReadU32(uint16_t adr);

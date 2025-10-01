#pragma once
#include <xc.h>
#include <stdint.h>
#include <stdbool.h>

/* ====== À CONFIGURER POUR TA CARTE ====== */
// Choisis le module SPI à utiliser (1 ou 2)
#define EEPROM_USE_SPI        2   // 1 => SPI1, 2 => SPI2

// Broche Chip Select de l?EEPROM (CS#)
#define EEPROM_CS_LAT         LATDbits.LATD6
#define EEPROM_CS_TRIS        TRISDbits.TRISD6

/* ====== Commandes / Paramètres ====== */
#define EEPROM_PAGE_SIZE      (uint16_t)64      // pages de 64 octets
#define EEPROM_SIZE_BYTES     (uint32_t)32768   // 256 kbit = 32 kB

#define EEPROM_CMD_WREN       0x06
#define EEPROM_CMD_WRDI       0x04
#define EEPROM_CMD_RDSR       0x05
#define EEPROM_CMD_WRSR       0x01
#define EEPROM_CMD_READ       0x03
#define EEPROM_CMD_WRITE      0x02

#define EEPROM_NB_ACCIDENT_ADS 0x00

typedef union {
    struct {
        unsigned WIP:1; // Write In Progress
        unsigned WEL:1; // Write Enable Latch
        unsigned BP0:1;
        unsigned BP1:1;
        unsigned RESERVED:3;
        unsigned WPEN:1;
    } Bits;
    uint8_t Val;
} EEPROMStatus_t;

/* ====== API ====== */
void     EEPROM_Init(void);                          // Configure SPI + CS
void     EEPROM_WriteEnable(void);
void     EEPROM_WriteDisable(void);
EEPROMStatus_t EEPROM_ReadStatus(void);

void     EEPROM_WriteByte(uint8_t data, uint16_t addr);
uint8_t  EEPROM_ReadByte(uint16_t addr);

// Écrit un buffer arbitraire (gère automatiquement les frontières de page)
void     EEPROM_WriteArray(uint16_t addr, const uint8_t *buf, uint16_t len);
// Lit un buffer arbitraire
void     EEPROM_ReadArray(uint16_t addr, uint8_t *buf, uint16_t len);

// Écriture ?sécurisée? (n?écrit que si la valeur change)
static inline void EEPROM_DataWriteIfDiff(uint8_t data, uint16_t addr)
{
    if (EEPROM_ReadByte(addr) != data) EEPROM_WriteByte(data, addr);
}

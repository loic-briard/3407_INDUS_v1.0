#include "EEPROM.h"

/* ===== Sélection du module SPI ===== */
#if (EEPROM_USE_SPI==1)
  #define SPIxBUF       SPI1BUF
  #define SPIxSTAT      SPI1STAT
  #define SPIxCON1      SPI1CON1
  #define SPIxCON2      SPI1CON2
  #define SPIxSTATbits  SPI1STATbits
#elif (EEPROM_USE_SPI==2)
  #define SPIxBUF       SPI2BUF
  #define SPIxSTAT      SPI2STAT
  #define SPIxCON1      SPI2CON1
  #define SPIxCON2      SPI2CON2
  #define SPIxSTATbits  SPI2STATbits
#else
  #error "EEPROM_USE_SPI doit valoir 1 ou 2"
#endif

/* ===== Helpers ===== */
static inline void CS_Low(void)  { EEPROM_CS_LAT = 0; }
static inline void CS_High(void) { EEPROM_CS_LAT = 1; }

static uint8_t SPI_Transfer(uint8_t v)
{
    SPIxBUF = v;
    while(!SPIxSTATbits.SPIRBF);
    return (uint8_t)SPIxBUF;
}

void EEPROM_Init(void)
{
    // Configure la broche CS
    CS_High();
    EEPROM_CS_TRIS = 0;

    // Si ce SPI est déjà utilisé ailleurs (ex: ENC28), ne reconfigure pas.
    // Sinon, configuration ?safe? : maître, CKP=0, CKE=1 (mode 0), 8 bits,
    // prescalers modestes (à ajuster si besoin).
    // Attention: enlève ces lignes si ton SPI est déjà initialisé.
    SPIxSTAT = 0;                  // disable pour config
    SPIxCON1 = 0
        | (0b00 << 14)             // SMP=0 (ignore en maître 8bit)
        | (1 << 8)                 // CKE=1 : data changent au front descendant, échantillonnées au montant
        | (0 << 6)                 // CKP=0
        | (0b01 << 4)              // MSTEN=1 (maître)
        | (0b10 << 2)              // Primary prescaler 4:1
        | (0b10 << 0);             // Secondary prescaler 4:1  => F_SPI = Fcy / 16
    SPIxCON2 = 0;                  // mode simple
    SPIxSTAT = 0x8000;             // ON
}

void EEPROM_WriteEnable(void)
{
    CS_Low();
    SPI_Transfer(EEPROM_CMD_WREN);
    CS_High();
}

void EEPROM_WriteDisable(void)
{
    CS_Low();
    SPI_Transfer(EEPROM_CMD_WRDI);
    CS_High();
}

EEPROMStatus_t EEPROM_ReadStatus(void)
{
    EEPROMStatus_t st;
    CS_Low();
    SPI_Transfer(EEPROM_CMD_RDSR);
    st.Val = SPI_Transfer(0);
    CS_High();
    return st;
}

static void EEPROM_WaitWriteComplete(void)
{
    // Poll WIP
    EEPROMStatus_t st;
    do {
        st = EEPROM_ReadStatus();
    } while (st.Bits.WIP);
}

/* ==== Accès octet ==== */
void EEPROM_WriteByte(uint8_t data, uint16_t addr)
{
    EEPROM_WriteEnable();

    CS_Low();
    SPI_Transfer(EEPROM_CMD_WRITE);
    SPI_Transfer((uint8_t)(addr >> 8));
    SPI_Transfer((uint8_t)(addr & 0xFF));
    SPI_Transfer(data);
    CS_High();

    EEPROM_WaitWriteComplete();
    EEPROM_WriteDisable();
}

uint8_t EEPROM_ReadByte(uint16_t addr)
{
    uint8_t v;
    CS_Low();
    SPI_Transfer(EEPROM_CMD_READ);
    SPI_Transfer((uint8_t)(addr >> 8));
    SPI_Transfer((uint8_t)(addr & 0xFF));
    v = SPI_Transfer(0);
    CS_High();
    return v;
}

/* ==== Accès buffer ==== */
void EEPROM_ReadArray(uint16_t addr, uint8_t *buf, uint16_t len)
{
    CS_Low();
    SPI_Transfer(EEPROM_CMD_READ);
    SPI_Transfer((uint8_t)(addr >> 8));
    SPI_Transfer((uint8_t)(addr & 0xFF));
    while (len--) *buf++ = SPI_Transfer(0);
    CS_High();
}

void EEPROM_WriteArray(uint16_t addr, const uint8_t *buf, uint16_t len)
{
    while (len) {
        // borne à la frontière de page
        uint16_t pageRemain = EEPROM_PAGE_SIZE - (addr % EEPROM_PAGE_SIZE);
        uint16_t chunk = (len < pageRemain) ? len : pageRemain;

        EEPROM_WriteEnable();
        CS_Low();
        SPI_Transfer(EEPROM_CMD_WRITE);
        SPI_Transfer((uint8_t)(addr >> 8));
        SPI_Transfer((uint8_t)(addr & 0xFF));
        for (uint16_t i = 0; i < chunk; i++) {
            SPI_Transfer(buf[i]);
        }
        CS_High();
        EEPROM_WaitWriteComplete();
        EEPROM_WriteDisable();

        addr += chunk;
        buf  += chunk;
        len  -= chunk;
    }
}

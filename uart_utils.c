#include "TCPIP Stack/TCPIP.h"
#include "02_Constantes.h"
#include "03_Variables.h"
#include "uart_utils.h"


void Init_Uart_1(void){
    
    TRISFbits.TRISF8 = SORTIE; // TX1
    TRISFbits.TRISF3 = ENTREE; // RX1
    TRISFbits.TRISF5 = SORTIE; // DE
    DE1_ADM = 1;

    U1BRG = 25; // BAUD Rate Setting for 19200
    //	U1BRG = 51;					// BAUD Rate Setting for 9600

    IPC3bits.U1TXIP = 4; //Set Uart TX Interrupt Priority 4
    IPC2bits.U1RXIP = 4; //Set Uart RX Interrupt Priority 4

    U1MODE = 0; // 1-stop bit
    // No Parity, 8-data bits
    U1MODEbits.USIDL = 1;
    U1MODEbits.BRGH = 0; // Mode High speed

    U1STA = 0;
    U1STAbits.UTXISEL1 = 1; // Interruption lorsque le charactère est transmit et que le buffer est vie
    U1STAbits.URXISEL = 0;
    U1MODEbits.UARTEN = 1; // Enable UART
    U1STAbits.UTXEN = 1; // Enable UART Tx

    IFS0bits.U1TXIF = 0;
    IFS4bits.U1ERIF = 0;
}
void Init_Uart_2(void){
    
    TRISDbits.TRISD8 = SORTIE; // TX2
    TRISDbits.TRISD10 = ENTREE; // RX2
    TRISDbits.TRISD9 = SORTIE; // DE2
    DE2_ADM = 1;

    U2BRG = 25; // BAUD Rate Setting for 19200
    //	U2BRG = 51;					// BAUD Rate Setting for 9600

    IPC7bits.U2TXIP = 4; //Set Uart TX Interrupt Priority 4
    IPC7bits.U2RXIP = 4; //Set Uart RX Interrupt Priority 4

    U2MODE = 0; // 1-stop bit
    // No Parity, 8-data bits
    U2MODEbits.USIDL = 1;
    U2MODEbits.BRGH = 0; // Mode High speed

    U2STA = 0;
    U2STAbits.UTXISEL1 = 1; // Interruption lorsque le charactère est transmit et que le buffer est vie
    U2STAbits.URXISEL = 0;
    U2MODEbits.UARTEN = 1; // Enable UART
    U2STAbits.UTXEN = 1; // Enable UART Tx

    IFS1bits.U2TXIF = 0;
    IFS4bits.U2ERIF = 0;
}

// ========================
// Buffer RX + drapeaux
// ========================
#define UART1_RX_BUF_SZ 128u

static volatile uint8_t  s_rx[UART1_RX_BUF_SZ];
static volatile uint16_t s_head = 0;
static volatile uint16_t s_tail = 0;
static volatile bool     s_activity = false;

// ========================
// Helpers internes
// ========================
static inline uint16_t _next(uint16_t i) { return (uint16_t)((i + 1u) % UART1_RX_BUF_SZ); }

// ========================
//   ISR RX UART1
// ========================
// Appelée quand au moins 1 octet est reçu.
// NB: la config UART1 (baud, pins, etc.) est déjà faite dans ton init. 
//void __attribute__((interrupt, no_auto_psv)) _U1RXInterrupt(void)
//{
//    // Efface l?overrun si besoin
//    if (U1STAbits.OERR) { U1STAbits.OERR = 0; }
//
//    while (U1STAbits.URXDA) {
//        uint8_t c = (uint8_t)(U1RXREG & 0xFFu);
//        uint16_t n = _next(s_head);
//        if (n != s_tail) {           // drop si plein
//            s_rx[s_head] = c;
//            s_head = n;
//        }
//        s_activity = true;
//    }
//    IFS0bits.U1RXIF = 0;             // clear flag
//}

// ========================
//      API RX
// ========================
bool UART1_RxAvailable(void)
{
    return (s_head != s_tail);
}

int UART1_ReadByte(void)
{
    if (s_head == s_tail) return -1;
    uint8_t b = s_rx[s_tail];
    s_tail = _next(s_tail);
    return (int)b;
}

size_t UART1_Read(uint8_t *dst, size_t max)
{
    size_t n = 0;
    while ((n < max) && (s_head != s_tail)) {
        dst[n++] = s_rx[s_tail];
        s_tail = _next(s_tail);
    }
    return n;
}

bool UART1_HadActivity(void) { return s_activity; }
void UART1_ClearActivity(void) { s_activity = false; }

void UART1_RxClear(void)
{
    s_head = s_tail = 0;
    s_activity = false;
}

// ========================
//      API TX
// ========================
void UART1_WriteByte(uint8_t b)
{
    // Si RS-485 demi-duplex avec DE1_ADM : décommenter si tu dois piloter DE
    // DE1_ADM = 1; // TX enable
    while (U1STAbits.UTXBF);    // attend place FIFO
    U1TXREG = b;
    while (!U1STAbits.TRMT);    // vide le shift register
    // DE1_ADM = 0; // RX enable
}

void UART1_Write(const char *s)
{
    while (s && *s) {
        UART1_WriteByte((uint8_t)*s++);
    }
}

void UART1_WriteLine(const char *s)
{
    UART1_Write(s);
    UART1_WriteByte('\r');
    UART1_WriteByte('\n');
}

// Construit "YYYY-MM-DDTHH:MM:SS" depuis Now_Date/Now_Heure (déjà remplis par HTTPPostConfig)
void UART1_SendNowISO8601(void)
{
    // Now_Date / Now_Heure viennent de 03_Variables.c
    // struct struct_Date { unsigned int year, month, day; }
    // struct struct_Heure{ unsigned int hour, min, sec;  }
    char line[25];
    unsigned yy = Now_Date.year;
    unsigned mo = Now_Date.month;
    unsigned dd = Now_Date.day;
    unsigned hh = Now_Heure.hour;
    unsigned mm = Now_Heure.min;
    unsigned ss = Now_Heure.sec;

    // Si les secondes ne sont pas fournies par la page, tu auras ss=0 (ok)
    // Format ISO court
    // Exemple: 2025-10-08T14:32:05
    (void)sprintf(line, "%04u-%02u-%02uT%02u:%02u:%02u", yy, mo, dd, hh, mm, ss);
    UART1_WriteLine(line);
}

#ifndef UART_UTILS_H
#define UART_UTILS_H

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

/* ====== Init ====== */
void Init_Uart_1(void);
void Init_Uart_2(void);

// --- API TX ---
void UART1_WriteByte(uint8_t b);
void UART1_Write(const char *s);                 // envoie chaîne C (sans \r\n)
void UART1_WriteLine(const char *s);             // envoie chaîne + "\r\n"
void UART1_SendNowISO8601(void);                 // envoie "YYYY-MM-DDTHH:MM:SS\r\n"

// --- API RX (bufferisé via ISR) ---
bool     UART1_RxAvailable(void);                // au moins 1 octet ?
int      UART1_ReadByte(void);                   // retourne [-1..255]
size_t   UART1_Read(uint8_t *dst, size_t max);   // vidange jusqu?à max octets
bool     UART1_HadActivity(void);                // activité depuis dernier clear ?
void     UART1_ClearActivity(void);

// (optionnel) reset du buffer RX
void     UART1_RxClear(void);

#endif /* UART_UTILS_H */

#ifndef UART_UTILS_H
#define UART_UTILS_H

char DataRdyUART1(void);
unsigned int getsUART1(unsigned int length, unsigned char *buffer, unsigned int uart_data_wait);
unsigned int ReadUART1(void);
void putsUART2(unsigned int *buffer);

// Ajouts UART2 :
int DataRdyUART2(void);
unsigned int ReadUART2(void);
void WriteUART2(unsigned int data);

#endif

#include "TCPIP Stack/TCPIP.h"
#include "02_Constantes.h"
#include "03_Variables.h"

char DataRdyUART1(void)
{
    return (U1STAbits.URXDA);
}

unsigned int getsUART1(unsigned int length, unsigned char *buffer, unsigned int uart_data_wait)
{
    unsigned int wait = 0;
    char *temp_ptr = (char *)buffer;

    while (length)
    {
        while (!DataRdyUART1())
        {
            if (wait < uart_data_wait) wait++;
            else return length; // timeout
        }
        wait = 0;

        if (U1MODEbits.PDSEL == 3)
            *buffer++ = (unsigned char)U1RXREG;
        else
            *temp_ptr++ = (unsigned char)(U1RXREG & 0xFF);

        length--;
    }
    return 0;
}

unsigned int ReadUART1(void)
{
    if (U1MODEbits.PDSEL == 3) return (U1RXREG);
    else                       return (U1RXREG & 0xFF);
}

void putsUART2(unsigned int *buffer)
{
    char * temp_ptr = (char *) buffer;

    if (U2MODEbits.PDSEL == 3)
    {
        while (*buffer != '\0')
        {
            while (U2STAbits.UTXBF);
            U2TXREG = *buffer++;
        }
    }
    else
    {
        while (*temp_ptr != '\0')
        {
            while (U2STAbits.UTXBF);
            U2TXREG = *temp_ptr++;
        }
    }
}


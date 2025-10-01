#define THIS_IS_STACK_APPLICATION

#include <xc.h>

#include <stdlib.h>
#include "03_Variables.h"
#include "TCPIP Stack/TCPIP.h"
#include "TCPIP Stack/UART.h"
#include "time.h"
#include "02_Constantes.h"
#include "04_Fonctions.h"

#include "app_init.h"
#include "net_tasks.h"
#include "time_sync.h"
#include "EEPROM.h"

/*** Configuration Bits (laisser ici uniquement) ***/
#pragma config POSCMOD = HS
#pragma config IOL1WAY = OFF
#pragma config OSCIOFNC = ON
#pragma config FCKSM = CSDCMD
#pragma config FNOSC = PRIPLL
#pragma config PLLDIV = DIV2
#pragma config IESO = OFF
#pragma config WDTPS = PS32768
#pragma config FWPSA = PR128
#pragma config WINDIS = OFF
#pragma config FWDTEN = OFF
#pragma config ICS = PGx1
#pragma config GWRP = OFF
#pragma config GCP = OFF
#pragma config JTAGEN = OFF

int main(void)
{
    App_Init();                 // Init matériel + LCD + Tick + MPFS + NVM + Stack

    while (1)
    {
        ClrWdt();

        Network_CoreTasks();        // stack + apps + zeroconf/mdns
        ApplyDHCPMode_IfChanged();  // bascule DHCP si flag changé
        TimeSync_Task();            // SNTP -> BCD -> locale

        // Réactive ces deux-là si besoin :
        // Sensors_Task();          
        // UDP_Envoi_Esclave_Task();
    }
}

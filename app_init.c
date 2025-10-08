#include "TCPIP Stack/TCPIP.h"
#include "02_Constantes.h"
#include "03_Variables.h"
#include "04_Fonctions.h"

#include "board_init.h"
#include "nv_mem.h"
#include "net_tasks.h"
#include "EEPROM.h"
#include "uart_utils.h"
//#include "uart_utils.h"
//#include "time_sync.h"
#include <stdbool.h>

void App_Init(void)
{
    //initialisation de l'eeprom
    InitSPIEEPROM();
    //initialisation de variables
    Initialisations();      // ton init global (RAM, etc.)
    //initialisation de la carte
    InitializeBoard();      // init matériel (ADC, UART, SPI, CS, etc.)
    
    Init_Uart_1();
    Init_Uart_2();

    RCONbits.SWDTEN = 1;    // Watchdog si voulu

//    Init_Lcd();             // LCD

    TickInit();
    MPFSInit();

    InitNVMemContents();    // charge AppConfig/gPrefs depuis NVM (ou défauts si vide)
    Stack_Init_All();       // StackInit + Zeroconf/mDNS si activés
    
    ClrWdt();
}

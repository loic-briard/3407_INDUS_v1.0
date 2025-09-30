#include "TCPIP Stack/TCPIP.h"
#include "02_Constantes.h"
#include "03_Variables.h"
#include "04_Fonctions.h"

#include "board_init.h"
#include "nv_mem.h"
#include "net_tasks.h"

void App_Init(void)
{
    Initialisations();      // ton init global (RAM, etc.)
    InitializeBoard();      // init matériel (ADC, UART, SPI, CS, etc.)

    RCONbits.SWDTEN = 1;    // Watchdog si voulu

    Init_Lcd();             // LCD

    TickInit();
    MPFSInit();

    InitNVMemContents();    // charge AppConfig/gPrefs depuis NVM (ou défauts si vide)
    Stack_Init_All();       // StackInit + Zeroconf/mDNS si activés

    ClrWdt();
}

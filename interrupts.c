#include "TCPIP Stack/TCPIP.h"
#include "02_Constantes.h"
#include "03_Variables.h"

// ISR Timer2 (copie de ton code)
void __attribute__((interrupt, auto_psv)) _T2Interrupt(void)
{
    IFS0bits.T2IF = 0;
    CPTR_LED++;
    UC_TEMPO_2MS++;

    if (UC_COMPT_NON_RECEP_CODE_DEBUT < 0xFF)
        UC_COMPT_NON_RECEP_CODE_DEBUT++;

    UC_COMPT_CAPTEUR_TEMP++;
    if (UC_COMPT_CAPTEUR_TEMP == 50)
    {
        UC_COMPT_1S++;
        UC_COMPT_ENVOI_ESCLAVE++;
        B_LECTURE_SONDE_OK = 1;
        UC_COMPT_CAPTEUR_TEMP = 0;
    }

    if (UC_COMPT_1S >= 10)
    {
        UC_COMPT_1S = 0;
        if (UC_CYCLE_AFFICHAGE < 250)
            UC_CYCLE_AFFICHAGE++;
    }

    // LED_DCF/commentaires laissés comme dans ton code (supprimés ici)
}

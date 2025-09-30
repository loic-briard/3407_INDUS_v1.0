#include <time.h>
#include "TCPIP Stack/TCPIP.h"
#include "02_Constantes.h"
#include "03_Variables.h"
#include "04_Fonctions.h"

void TimeSync_Task(void)
{
    // Comportement identique à ton code : on (re)déclenche
    attente_synchro = 1;

    if (attente_synchro != 1)
        return;

    Mise_a_heure = 1;
    attente_synchro = 2;

    time_t timer = SNTPGetUTCSeconds();
    struct tm *newtime = localtime(&timer);
    strftime(buf_heure_utc, 20, "%H:%M:%S %d/%m/%Y", newtime);
    buf_heure_utc[20] = '\0';

    // BCD
    DIZ_HEURE_UTC = (buf_heure_utc[0] - '0');
    UNI_HEURE_UTC = (buf_heure_utc[1] - '0');
    DIZ_MIN_UTC   = (buf_heure_utc[3] - '0');
    UNI_MIN_UTC   = (buf_heure_utc[4] - '0');
    DIZ_SEC_UTC   = (buf_heure_utc[6] - '0');
    UNI_SEC_UTC   = (buf_heure_utc[7] - '0');

    DIZ_JOUR_UTC  = (buf_heure_utc[9]  - '0');
    UNI_JOUR_UTC  = (buf_heure_utc[10] - '0');
    DIZ_MOIS_UTC  = (buf_heure_utc[12] - '0');
    UNI_MOIS_UTC  = (buf_heure_utc[13] - '0');

    MIL_AN_UTC = (buf_heure_utc[15] - '0');
    CEN_AN_UTC = (buf_heure_utc[16] - '0');
    DIZ_AN_UTC = (buf_heure_utc[17] - '0');
    UNI_AN_UTC = (buf_heure_utc[18] - '0');

    DECALAGE_HORAIRE();
//    Mise_heure_locale();
    chamgement_heure_etehiver();
    traite_24h();

    SYNCHRO = 1;
}

/* Exemple si tu veux réactiver la lecture RS485 ici
void Sensors_Task(void)
{
    if (B_LECTURE_SONDE_OK)
    {
        B_LECTURE_SONDE_OK = 0;
        LED_3 = 1;
        Lire_Sonde_Rs485(0x90 + UC_INDEX_SONDE,
                         &S_TEMP_AVEC_OFFSET[UC_INDEX_SONDE],
                         &S_CORREC_TEMP[UC_INDEX_SONDE],
                         &S_TEMP_MES[UC_INDEX_SONDE],
                         &S_TEMPERATURE_TEMP_PROG[UC_INDEX_SONDE]);
        if (UC_INDEX_SONDE < 15) UC_INDEX_SONDE++;
        else UC_INDEX_SONDE = 0;
        LED_3 = 0;
    }
}
*/

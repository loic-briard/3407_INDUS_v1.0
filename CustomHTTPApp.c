/*********************************************************************
 *
 *  Application to Demo HTTP2 Server
 *  Support for HTTP2 module in Microchip TCP/IP Stack
 *	 -Implements the application
 *	 -Reference: RFC 1002
 *
 *********************************************************************
 * FileName:        CustomHTTPApp.c
 * Dependencies:    TCP/IP stack
 * Processor:       PIC24F, PIC24H, dsPIC30F, dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.10b or higher
 *					Microchip C30 v3.21 or higher
 * Company:         Microchip Technology, Inc.
 *
 * Software License Agreement
 *
 * Microchip Demo Code for Google PowerMeter. Copyright 2010 Microchip
 * Technology Inc. and its licensors.  All rights reserved.
 *
 * Microchip licenses to you the right use, modify, copy, and distribute
 * the accompanying Microchip demo code only when used with or embedded on
 * a Microchip microcontroller or Microchip digital signal controller that
 * is integrated into your product or a third party product.  Any
 * redistributions of Microchip's demo code in compliance with the
 * foregoing must include a copy of this entire notice.
 *
 * THE MICROCHIP DEMO CODE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT
 * WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT
 * LIMITATION, ANY WARRANTY OF MERCHANTABILITY, TITLE, NON-INFRINGEMENT,
 * AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL MICROCHIP OR ITS
 * LICENSORS BE LIABLE OR OBLIGATED UNDER CONTRACT, NEGLIGENCE, STRICT
 * LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER LEGAL EQUITABLE
 * THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES INCLUDING BUT NOT
 * LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, OR CONSEQUENTIAL DAMAGES,
 * LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF SUBSTITUTE GOODS,
 * TECHNOLOGY, SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT
 * LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *
 * THIRD PARTY SOFTWARE:  Notwithstanding anything to the contrary, any
 * third party software accompanying this software - including but not
 * limited to Google's reference code - is subject to the terms and
 * conditions of license agreement of such third party, such as the Apache
 * License Version 2.0 (www.apache.org/licenses/).  To the extent required
 * by such third party licenses, the terms of the third party license will
 * apply in lieu of the terms provided herein.  To the extent the terms of
 * such third party licenses prohibit any of the restrictions described
 * herein, such restrictions will not apply to such third party software.
 * THIRD PARTY SOFTWARE  IS SUBJECT TO THE FOREGOING WARRANTY DISCLAIMER AND
 * LIMIT ON LIABILITY PROVIDED IN THE PARAGRAPH ABOVE.
 *
 ********************************************************************/
#define __CUSTOMHTTPAPP_C

#include "TCPIPConfig.h"

#if defined(STACK_USE_HTTP2_SERVER)

#include "TCPIP Stack/TCPIP.h"
#include "MainDemo.h"       // Needed for SaveAppConfig() prototype
#include "03_Variables.h"
#include "EEPROM.h"
#include "04_Fonctions.h"

static HTTP_IO_RESULT HTTPPostConfig(void);

extern void Delay_10_microS(void);

extern unsigned char attente_synchro, Demande_heure_page_web;
extern unsigned char CODE_IP_AUTO, CODE_IP_AUTO_SECONDAIRE;
extern unsigned char NBR_HORLOGE_SECONDAIRE;
extern unsigned char CODE_CHANGEMENT_HEURE;
extern unsigned char CODE_DECAL_HORAIRE;
extern unsigned char FORCAGE_MARCHE;
extern unsigned char FORCAGE_ARRET;
//extern unsigned char CYCLE_OK;
extern unsigned char SYNCHRO;
//extern unsigned char INIT;

//extern unsigned char CODE_NTP_SERVER[30], CODE_ADR_IP_WEB[30];
//extern unsigned char CODE_ADR_IP_HORL_SECONDAIRE[20][30];
//extern unsigned char CODE_NOM_HORL_SECONDAIRE[20][20];
extern unsigned char NOM_SONDE_TEMP[16][15];
extern unsigned char UC_HEURE_VIEILL[2][4];

extern unsigned char JOURS_SELECT_FINALE[5];
extern unsigned char UC_DUREE_AFFICHAGE[5];
extern unsigned char JOURS_SELECT_BUF[5];
//extern unsigned char UC_AFFICH_TEMP[4];
extern unsigned char JOURS_SELECT[5];

extern short S_TEMP_AVEC_OFFSET[16];
extern short S_CORREC_TEMP[16];
extern short S_TEMP_MES[16];

/****************************************************************************
  Section:
    Function Prototypes and Memory Globalizers
 ***************************************************************************/

// Sticky status message variable.
// This is used to indicated whether or not the previous POST operation was
// successful.  The application uses these to store status messages when a
// POST operation redirects.  This lets the application provide status messages
// after a redirect, when connection instance data has already been lost.
static BOOL lastSuccess = FALSE;

// Stick status message variable.  See lastSuccess for details.
static BOOL lastFailure = FALSE;

/****************************************************************************
  Section:
    Authorization Handlers
 ***************************************************************************/
extern unsigned char buf_heure_GMT[21];

//!\\ envoyé que des caracteres ascii sinon probleme de lecture coter navigateur

void HTTPPrint_adresse_ip_value(void) {
    char buf[16];
    char *p = buf;

    p += sprintf(p, "%u", AppConfig.MyIPAddr.v[0]);
    *p++ = '.';
    p += sprintf(p, "%u", AppConfig.MyIPAddr.v[1]);
    *p++ = '.';
    p += sprintf(p, "%u", AppConfig.MyIPAddr.v[2]);
    *p++ = '.';
    p += sprintf(p, "%u", AppConfig.MyIPAddr.v[3]);
    *p = '\0';

    //    EEPROMWriteByte(AppConfig.MyIPAddr.v[3],ADR_TEST);
    TCPPutString(sktHTTP, (BYTE*) buf);
    //    unsigned char var[4] = { AppConfig.MyIPAddr.v[0],AppConfig.MyIPAddr.v[1],AppConfig.MyIPAddr.v[2],AppConfig.MyIPAddr.v[3]};
    //   TCPPutArray(sktHTTP, var, sizeof(var));  // écrit exactement 4 octets 
    // ou
    //    BYTE var[] = "test"; // -> {'t','e','s','t','\0'}
    //    TCPPutString(sktHTTP, var);
}

void HTTPPrint_nb_accidents(void) {
    BYTE buf[6]; // assez pour 0..65535 + '\0'
    itoa2((int) NB_Accidents, buf); // convertit en ASCII + '\0'
    TCPPutString(sktHTTP, buf); // envoie la chaîne "123" etc.
}

void HTTPPrint_nb_jours_sans_accidents(void) {
    char buf[12];                      // assez pour 4 294 967 295
    sprintf(buf, "%lu", (unsigned long)NB_Jours_Sans_Accidents);
    TCPPutString(sktHTTP, (BYTE*)buf);
}

void HTTPPrint_nb_records_jours(void) {
    char buf[12];                      // assez pour 4 294 967 295
    sprintf(buf, "%lu", (unsigned long)NB_Records_Jours);
    TCPPutString(sktHTTP, (BYTE*)buf);
}

void HTTPPrint_bold(void) {
    if (Bold)
        TCPPutString(sktHTTP, (BYTE*) "checked");
    else
        TCPPutString(sktHTTP, (BYTE*) "");
}

void HTTPPrint_bright_enabled(void) {
    if (Bright_Enabled)
        TCPPutString(sktHTTP, (BYTE*) "checked");
    else
        TCPPutString(sktHTTP, (BYTE*) "");
}
void HTTPPrint_eco_enabled(void) {
    if (Eco_Enabled)
        TCPPutString(sktHTTP, (BYTE*) "checked");
    else
        TCPPutString(sktHTTP, (BYTE*) "");
}
void HTTPPrint_bright(void) {
    BYTE buf[6]; // assez pour 0..65535 + '\0'
    itoa2((int) Bright, buf); // convertit en ASCII + '\0'
    TCPPutString(sktHTTP, buf); // envoie la chaîne "123" etc.
}

void HTTPPrint_last_accident_date(void) {
    char buf[11]; // "YYYY-MM-DD" + '\0'
    if (Last_Accident_Date.year == 0) {
        // pas de valeur -> mettre vide ou une date par défaut
        TCPPutString(sktHTTP, (BYTE*) "");
        return;
    }
    // format
    sprintf(buf, "%04u-%02u-%02u",
            Last_Accident_Date.year,
            Last_Accident_Date.month,
            Last_Accident_Date.day);
    TCPPutString(sktHTTP, (BYTE*) buf);
}
void HTTPPrint_start_time(void) {
    char buf[6];
    sprintf(buf, "%02u:%02u", Horaire_Allumage.hour, Horaire_Allumage.min);
    TCPPutString(sktHTTP, (BYTE*)buf);
}
void HTTPPrint_stop_time(void) {
    char buf[6];
    sprintf(buf, "%02u:%02u", Horaire_Extinction.hour, Horaire_Extinction.min);
    TCPPutString(sktHTTP, (BYTE*)buf);
}
void HTTPPrint_led_color_1(void) {
    char buf[4]; // assez pour "0".."4" + '\0'
    sprintf(buf, "%u", Led_Color_1);   // Led_Color_1 est ta variable sauvegardée
    TCPPutString(sktHTTP, (BYTE*)buf);
}
void HTTPPrint_led_color_2(void) {
    char buf[4]; // assez pour "0".."4" + '\0'
    sprintf(buf, "%u", Led_Color_2);   // Led_Color_1 est ta variable sauvegardée
    TCPPutString(sktHTTP, (BYTE*)buf);
}
void HTTPPrint_led_color_3(void) {
    char buf[4]; // assez pour "0".."4" + '\0'
    sprintf(buf, "%u", Led_Color_3);   // Led_Color_1 est ta variable sauvegardée
    TCPPutString(sktHTTP, (BYTE*)buf);
}

/*****************************************************************************
  Function:
    BYTE HTTPNeedsAuth(BYTE* cFile)

  Internal:
    See documentation in the TCP/IP Stack API or HTTP2.h for details.
 ***************************************************************************/

#if defined(HTTP_USE_AUTHENTICATION)

BYTE HTTPNeedsAuth(BYTE* cFile) {
#if defined(HTTP_MPFS_UPLOAD_REQUIRES_AUTH)
    if (memcmppgm2ram(cFile, (ROM void*) "mpfsupload", 10) == 0)
        return 0x00;
#endif

    // You can match additional strings here to password protect other files.
    // You could switch this and exclude files from authentication.
    // You could also always return 0x00 to require auth for all files.
    // You can return different values (0x00 to 0x79) to track "realms" for below.

    return 0x80; // No authentication required
}
#endif

/*****************************************************************************
  Function:
    BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass)

  Internal:
    See documentation in the TCP/IP Stack API or HTTP2.h for details.
 ***************************************************************************/

#if defined(HTTP_USE_AUTHENTICATION)

BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass) {
    if (strcmppgm2ram((char *) cUser, (ROM char *) "admin") == 0
            && strcmppgm2ram((char *) cPass, (ROM char *) "microchip") == 0)
        return 0x80; // We accept this combination

    // You can add additional user/pass combos here.
    // If you return specific "realm" values above, you can base this 
    //   decision on what specific file or folder is being accessed.
    // You could return different values (0x80 to 0xff) to indicate 
    //   various users or groups, and base future processing decisions
    //   in HTTPExecuteGet/Post or HTTPPrint callbacks on this value.

    return 0x00; // Provided user/pass is invalid
}
#endif

/****************************************************************************
  Section:
    GET Form Handlers
 ***************************************************************************/

/*****************************************************************************
  Function:
    HTTP_IO_RESULT HTTPExecuteGet(void)
	
  Internal:
    See documentation in the TCP/IP Stack API or HTTP2.h for details.
 ***************************************************************************/

HTTP_IO_RESULT HTTPExecuteGet(void) {
    return HTTP_IO_DONE;
}

/****************************************************************************
  Section:
    POST Form Handlers
 ***************************************************************************/
#if defined(HTTP_USE_POST)

/*****************************************************************************
  Function:
    HTTP_IO_RESULT HTTPExecutePost(void)
	
  Internal:
    See documentation in the TCP/IP Stack API or HTTP2.h for details.
 ***************************************************************************/

HTTP_IO_RESULT HTTPExecutePost(void) {
    BYTE filename[20];
    // Load the file name
    // Make sure BYTE filename[] above is large enough for your longest name
    MPFSGetFilename(curHTTP.file, filename, 20);

    // If its the forms.htm page
    if (!memcmppgm2ram(filename, "index_indu.htm", 14))//"index_indu.htm"
        return HTTPPostConfig();

    return HTTP_IO_DONE;
}
#endif //(use_post)

static HTTP_IO_RESULT HTTPPostConfig(void) {    
    BYTE index_param;
    struct struct_Date lastAccident;
    struct struct_Date now;

#define SM_READ_NAME 		(0u)
#define SM_READ_VALUE 		(1u)
#define SM_READ_FINISHING   (2u)

#define ACCIDENTSCOUNT				1
#define DAYWITHOUTACCIDENTS			2
#define RECORDDAYWITHOUTACCIDENTS 	3
#define LASTACCIDENTEDATE 			4
#define BOLDSELECT             		5
#define BRIGHTENABLED            	6
#define ECOPARAMENABLED             7
#define LEDCOLOR1                   8
#define LEDCOLOR2                   9
#define LEDCOLOR3                   10
#define BRIGHT                      11
#define ECOENABLED                  12
#define STARTTIME                   13
#define STOPTIME                    14
#define NOW                         15

    switch (curHTTP.smPost) {
        case SM_READ_NAME:
            // Search for a parameter name in POST data
            if (HTTPReadPostName(curHTTP.data, HTTP_MAX_DATA_LEN) == HTTP_READ_INCOMPLETE)
                return HTTP_IO_NEED_DATA;
            
            // Try to match the name value
            if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "accidents_count")) {
                index_param = ACCIDENTSCOUNT;
                curHTTP.smPost = SM_READ_VALUE;
            } else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "days_without_accident")) {
                index_param = DAYWITHOUTACCIDENTS;
                curHTTP.smPost = SM_READ_VALUE;
            } else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "record_days_without_accident")) {
                index_param = RECORDDAYWITHOUTACCIDENTS;
                curHTTP.smPost = SM_READ_VALUE;
            } 
            else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "last_accident_date")) {
                index_param = LASTACCIDENTEDATE;
                curHTTP.smPost = SM_READ_VALUE;
            } else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"bold")){
                index_param = BOLDSELECT;
                curHTTP.smPost = SM_READ_VALUE;
            }else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"bright_enabled")){
                index_param = BRIGHTENABLED;
                curHTTP.smPost = SM_READ_VALUE;
            }else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "led_color_1")) {
                index_param = LEDCOLOR1;
                curHTTP.smPost = SM_READ_VALUE;
            }else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "led_color_2")) {
                index_param = LEDCOLOR2;
                curHTTP.smPost = SM_READ_VALUE;
            }else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "led_color_3")) {
                index_param = LEDCOLOR3;
                curHTTP.smPost = SM_READ_VALUE;
            }else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "bright")) {
                index_param = BRIGHT;
                curHTTP.smPost = SM_READ_VALUE;
            }else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"eco_params_enabled")){
                index_param = ECOENABLED;
                curHTTP.smPost = SM_READ_VALUE;
            }else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "start_time")) {
                index_param = STARTTIME;
                curHTTP.smPost = SM_READ_VALUE;
            }else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "stop_time")) {
                index_param = STOPTIME;
                curHTTP.smPost = SM_READ_VALUE;
            }else if (!strcmppgm2ram((char*) curHTTP.data, (ROM char*) "now")) {
                index_param = NOW;
                curHTTP.smPost = SM_READ_VALUE;
            }

        case SM_READ_VALUE:

            // Search for a parameter value in POST data
            if (HTTPReadPostValue(curHTTP.data, HTTP_MAX_DATA_LEN) == HTTP_READ_INCOMPLETE)
                return HTTP_IO_NEED_DATA;

            switch (index_param) {
                case ACCIDENTSCOUNT :
                    if(NB_Accidents != (unsigned int)atoi((const char*)curHTTP.data))
                    {
                        NB_Accidents = (unsigned int)atoi((const char*)curHTTP.data);
                        EEPROMWriteByte(NB_Accidents, ADR_NB_ACCIDENTS);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                case DAYWITHOUTACCIDENTS :
                {
                    char *end = NULL;
                    unsigned long v = strtoul((const char*)curHTTP.data, &end, 10); // 0..4294967295
                    if (v > 99999UL) v = 99999UL; // si tu limites à 99 999

                    if (NB_Jours_Sans_Accidents != v) {
                        NB_Jours_Sans_Accidents = v;
                        EEP_WriteU32(ADR_NB_JOURS_SANS_ACCIDENTS, NB_Jours_Sans_Accidents);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;    
                }
                case RECORDDAYWITHOUTACCIDENTS: 
                {
                    char *end = NULL;
                    unsigned long v = strtoul((const char*)curHTTP.data, &end, 10); // 0..4294967295
                    if (v > 99999UL) v = 99999UL; // si tu limites à 99 999

                    if (NB_Records_Jours != v) {
                        NB_Records_Jours = v;
                        EEP_WriteU32(ADR_NB_RECORDS_JOURS, NB_Records_Jours);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                }                    
                case LASTACCIDENTEDATE:                    
                    /* init explicite (C89) */
                    lastAccident.year = 0u;
                    lastAccident.month = 0u;
                    lastAccident.day = 0u;

                    /* curHTTP.data doit pointer sur la valeur "YYYY-MM-DD" */
                    if (ParseDate((const char*) curHTTP.data, &lastAccident)) {
                        if (!DatesEqual(&Last_Accident_Date, &lastAccident)) {
                            /* l?affectation de struct est autorisée en C */
                            Last_Accident_Date = lastAccident;

                            /* si ta fonction prend un pointeur (recommandé) */
                            SaveDate(&Last_Accident_Date,ADR_LAST_ACCIDENT_DATE);
                        }
                    }

                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                
                case BOLDSELECT:
                    if (Bold != (unsigned int) atoi((const char*) curHTTP.data)) {
                        Bold = (unsigned int) atoi((const char*) curHTTP.data);
                        EEPROMWriteByte(Bold, ADR_BOLD);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                case BRIGHTENABLED:

                    if (Bright_Enabled != (unsigned int) atoi((const char*) curHTTP.data)) {
                        Bright_Enabled = (unsigned int) atoi((const char*) curHTTP.data);
                        EEPROMWriteByte(Bright_Enabled, ADR_BRIGHT_ENABLED);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                case LEDCOLOR1:
                    if (Led_Color_1 != (unsigned int) atoi((const char*) curHTTP.data)) {
                        Led_Color_1 = (unsigned int) atoi((const char*) curHTTP.data);
                        EEPROMWriteByte(Led_Color_1, ADR_LED_COLOR_1);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                case LEDCOLOR2:
                    if (Led_Color_2 != (unsigned int) atoi((const char*) curHTTP.data)) {
                        Led_Color_2 = (unsigned int) atoi((const char*) curHTTP.data);
                        EEPROMWriteByte(Led_Color_2, ADR_LED_COLOR_2);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                case LEDCOLOR3:
                    if (Led_Color_3 != (unsigned int) atoi((const char*) curHTTP.data)) {
                        Led_Color_3 = (unsigned int) atoi((const char*) curHTTP.data);
                        EEPROMWriteByte(Led_Color_3, ADR_LED_COLOR_3);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                case BRIGHT:
                    if (Bright != (unsigned int) atoi((const char*) curHTTP.data)) {
                        Bright = (unsigned int) atoi((const char*) curHTTP.data);
                        EEPROMWriteByte(Bright, ADR_BRIGHT);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                case ECOENABLED:
                    if (Eco_Enabled != (unsigned int) atoi((const char*) curHTTP.data)) {
                        Eco_Enabled = (unsigned int) atoi((const char*) curHTTP.data);
                        EEPROMWriteByte(Eco_Enabled, ADR_ECO_ENABLED);
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
                case STARTTIME:
                {
                    struct struct_Heure newH = Horaire_Allumage; // base actuelle
                    UC_TEST = 0;
                    // curHTTP.data contient "HH:MM"
                    if (ParseTime((const char*)curHTTP.data, &newH)) { // 0 => START
                        if (!TimeEqual(&Horaire_Allumage, &newH)) {
                            Horaire_Allumage = newH;
                            SaveHoraireAllExt(&Horaire_Allumage, ADR_HORAIRE_ALLUMAGE);
                        }
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                }
                case STOPTIME:
                {
                    struct struct_Heure newH = Horaire_Extinction; // base actuelle
                    if (ParseTime((const char*)curHTTP.data, &newH)) { // 1 => STOP
                        if (!TimeEqual(&Horaire_Extinction, &newH)) {
                            Horaire_Extinction = newH;
                            SaveHoraireAllExt(&Horaire_Extinction, ADR_HORAIRE_EXTINCTION);
                        }
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                }
                case NOW:                    
                    /* init explicite (C89) */
                    now.year = 0u;
                    now.month = 0u;
                    now.day = 0u;

                    /* curHTTP.data doit pointer sur la valeur "YYYY-MM-DD" */
                    if (ParseDate((const char*) curHTTP.data, &now)) {
                        if (!DatesEqual(&Now_Date_Post, &now)) {
                            /* l?affectation de struct est autorisée en C */
                            Now_Date_Post = now;
                        }
                    }
                    
                    TimeSync_Update();
                    Seconde_UTC = 0;
                    DST = true;
                    TimeSync_GetLocal(&Date_UTC, &Heure_UTC, &Seconde_UTC, &DST);
    
                    index_param = 0;
                    curHTTP.smPost = SM_READ_FINISHING;
                    break;
//                curHTTP.smPost = SM_READ_FINISHING;
            }
            return HTTP_IO_WAITING;
            
        case SM_READ_FINISHING:
            // Try reading the next parameter
            Delay_10_microS();
            // This is the only expected value, so callback is done
            strcpypgm2ram((char*) curHTTP.data, "/index_indu.htm"); //"/index.htm"
            curHTTP.httpStatus = HTTP_REDIRECT;
            return HTTP_IO_DONE;
    }
    //Default assumes that we're returning for state machine convenience.
    //Function will be called again later.
    return HTTP_IO_DONE;
}
#endif
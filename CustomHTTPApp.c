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

static HTTP_IO_RESULT HTTPPostConfig(void);

extern void Delay_10_microS(void);

extern unsigned char attente_synchro,Demande_heure_page_web;
extern unsigned char CODE_IP_AUTO,CODE_IP_AUTO_SECONDAIRE;
extern unsigned char NBR_HORLOGE_SECONDAIRE;
extern unsigned char CODE_CHANGEMENT_HEURE;
extern unsigned char CODE_DECAL_HORAIRE;
extern unsigned char FORCAGE_MARCHE;
extern unsigned char FORCAGE_ARRET;
extern unsigned char CYCLE_OK;
extern unsigned char SYNCHRO;
extern unsigned char INIT;

extern unsigned char CODE_NTP_SERVER[30],CODE_ADR_IP_WEB[30];
extern unsigned char CODE_ADR_IP_HORL_SECONDAIRE[20][30];
extern unsigned char CODE_NOM_HORL_SECONDAIRE[20][20];
extern unsigned char NOM_SONDE_TEMP[16][15];
extern unsigned char UC_HEURE_VIEILL[2][4];

extern unsigned char JOURS_SELECT_FINALE[5];
extern unsigned char UC_DUREE_AFFICHAGE[5];
extern unsigned char JOURS_SELECT_BUF[5];
extern unsigned char UC_AFFICH_TEMP[4];
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
 extern unsigned char 	buf_heure_GMT[21];
 
void HTTPPrint_adresse_ip_value(void)
{
	(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)CODE_ADR_IP_WEB);
}
void HTTPPrint_marche(void)
{

}

void HTTPPrint_arret(void)
{  

}

void HTTPPrint_color(WORD index)
{
    unsigned char var[8];
    if (index == 0)
    {
       if (FORCAGE_MARCHE == 0x31)
       {
            var[0] = '#';
            var[1] = '6';
            var[2] = '0';
            var[3] = 'E';
            var[4] = '9';
            var[5] = '2';
            var[6] = 'C';
            var[7] = 0x00;
       }
       else if ((FORCAGE_ARRET == 0x31)||(FORCAGE_ARRET == 0x32)||(FORCAGE_MARCHE == 0x30))
       {
            var[0] = '#';
            var[1] = '6';
            var[2] = '9';
            var[3] = '6';
            var[4] = '9';
            var[5] = '6';
            var[6] = '9';
            var[7] = 0x00;
       }
    }
    if (index == 1)
    {
       if (FORCAGE_ARRET == 0x31)
       {
            var[0] = '#';
            var[1] = '6';
            var[2] = '0';
            var[3] = 'E';
            var[4] = '9';
            var[5] = '2';
            var[6] = 'C';
            var[7] = 0x00;
       }
       else if ((FORCAGE_MARCHE == 0x31)||(FORCAGE_ARRET == 0x32)||(FORCAGE_ARRET == 0x30))
       {
            var[0] = '#';
            var[1] = '6';
            var[2] = '9';
            var[3] = '6';
            var[4] = '9';
            var[5] = '6';
            var[6] = '9';
            var[7] = 0x00;
       }
    }
    (PTR_BASE)TCPPutString(sktHTTP, (BYTE*)var);
}
void HTTPPrint_cycle(void)
{
    unsigned char var[8];
    
    if (CYCLE_OK == 1)
    {
        var[0] = '#';
        var[1] = '6';
        var[2] = '0';
        var[3] = 'E';
        var[4] = '9';
        var[5] = '2';
        var[6] = 'C';
        var[7] = 0x00;
    }
    else
    {
        var[0] = '#';
        var[1] = '6';
        var[2] = '9';
        var[3] = '6';
        var[4] = '9';
        var[5] = '6';
        var[6] = '9';
        var[7] = 0x00;
    }
    (PTR_BASE)TCPPutString(sktHTTP, (BYTE*)var);
}

void HTTPPrint_jour_semaine(WORD index)
{	
    if (INIT == 1)
    {
        if (JOURS_SELECT_FINALE[index - 1] == 0x31)
            TCPPutROMString(sktHTTP, (ROM BYTE*)"checked");
        else if (JOURS_SELECT_FINALE[index - 1] == 0x30)
            TCPPutROMString(sktHTTP, (ROM BYTE*)"");
    }
    if (INIT == 0)
        TCPPutROMString(sktHTTP, (ROM BYTE*)"checked");
    if ((index == 5)&&(INIT == 0))
        INIT = 1;
}

// void HTTPPrint_decal_heure_service(WORD var)
//{
//	if(CODE_DECAL_HORAIRE == var)
//		TCPPutROMString(sktHTTP, (ROM BYTE*)"selected");
//}

//void HTTPPrint_ete_hiver_service(WORD var)
//{
//	if(CODE_CHANGEMENT_HEURE == var)
//		TCPPutROMString(sktHTTP, (ROM BYTE*)"selected");
//}	

//void HTTPPrint_ntp_server(void)
//{
//	(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)CODE_NTP_SERVER);
//}

extern unsigned char 	buf_heure_GMT[21];

void HTTPPrint_heure_date(void)
{
	if(buf_heure_GMT[0]!=0)
		(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)buf_heure_GMT);
	else
		TCPPutROMString(sktHTTP, (ROM BYTE*)"Nom du server inconnu !");
}

//void HTTPPrint_temp_mes(WORD index)
//{
//	UC_AFFICH_TEMP[0] = '-';
//	UC_AFFICH_TEMP[1] = '-';
//	UC_AFFICH_TEMP[2] = 0;
//	UC_AFFICH_TEMP[3] = 0;
//
//	Affichage_Temp(S_TEMP_MES[index]);
//	(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)UC_AFFICH_TEMP);
//}

//void HTTPPrint_temp_corre(WORD index)
//{
//	UC_AFFICH_TEMP[0] = '-';//S_CORREC_TEMP[index]/10+0x30;
//	UC_AFFICH_TEMP[1] = '2';
//	UC_AFFICH_TEMP[2] = 0;
//	UC_AFFICH_TEMP[3] = 0;
//	
//	Affichage_Temp_Page_Web(S_CORREC_TEMP[index]);
//	(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)UC_AFFICH_TEMP);
//}

//void HTTPPrint_temp_affich(WORD index)
//{
//	UC_AFFICH_TEMP[0] = '-';
//	UC_AFFICH_TEMP[1] = '-';
//	UC_AFFICH_TEMP[2] = 0;
//	UC_AFFICH_TEMP[3] = 0;
//
//	Affichage_Temp(S_TEMP_AVEC_OFFSET[index]);
//	(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)UC_AFFICH_TEMP);
//}

//void HTTPPrint_Duree_affich(WORD index)
//{
//	unsigned char var[2];
//	
//	var[0] = UC_DUREE_AFFICHAGE[index]+0x30;
//	var[1] = 0x00;
//	(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)var);
//}

void HTTPPrint_heure_vieill(WORD index)
{
	unsigned char var[6];
	
	var[0] = (UC_HEURE_VIEILL[index][0]+'0'); 
	var[1] = (UC_HEURE_VIEILL[index][1]+'0'); 
	var[2] = ':';
	var[3] = (UC_HEURE_VIEILL[index][2]+'0'); 
	var[4] = (UC_HEURE_VIEILL[index][3]+'0'); 
	var[5] = 0x00;
	(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)var);
}	

//void HTTPPrint_temp_air_corre(void)
//{
//	(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)"25");
//}	
void HTTPPrint_adresse_ip_auto(WORD var)
{
	if(CODE_IP_AUTO == var)
		TCPPutROMString(sktHTTP, (ROM BYTE*)"checked");
}

//void HTTPPrint_adresse_ip_auto_secondaires(void)
//{
//	if(CODE_IP_AUTO_SECONDAIRE == 1)
//		TCPPutROMString(sktHTTP, (ROM BYTE*)"true");
//	else	
//		TCPPutROMString(sktHTTP, (ROM BYTE*)"false");
//}

//void HTTPPrint_server_list_ip_secondaires(void)
//{
//	unsigned char i;
//	
//	for(i = 0; i < NBR_HORLOGE_SECONDAIRE; i++)
//	{
////		(PTR_BASE)TCPPutString(sktHTTP, (ROM BYTE*)"IPhs.push(\"");
////		(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)CODE_ADR_IP_HORL_SECONDAIRE[i]);
////		(PTR_BASE)TCPPutString(sktHTTP, (ROM BYTE*)"\");Nahs.push(\"");
////		(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)CODE_NOM_HORL_SECONDAIRE[i]);
////		(PTR_BASE)TCPPutString(sktHTTP, (ROM BYTE*)"\");");
//	}
//	 
//}	
//void HTTPPrint_nom_sonde(WORD index)
//{
//	(PTR_BASE)TCPPutString(sktHTTP, (BYTE*)NOM_SONDE_TEMP[index]);
//}
	
/*****************************************************************************
  Function:
	BYTE HTTPNeedsAuth(BYTE* cFile)

  Internal:
  	See documentation in the TCP/IP Stack API or HTTP2.h for details.
  ***************************************************************************/

#if defined(HTTP_USE_AUTHENTICATION)
BYTE HTTPNeedsAuth(BYTE* cFile)
{
	#if defined(HTTP_MPFS_UPLOAD_REQUIRES_AUTH)
        if(memcmppgm2ram(cFile, (ROM void*)"mpfsupload", 10) == 0)
            return 0x00;
	#endif

	// You can match additional strings here to password protect other files.
	// You could switch this and exclude files from authentication.
	// You could also always return 0x00 to require auth for all files.
	// You can return different values (0x00 to 0x79) to track "realms" for below.

	return 0x80;        // No authentication required
}
#endif

/*****************************************************************************
  Function:
	BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass)

  Internal:
  	See documentation in the TCP/IP Stack API or HTTP2.h for details.
  ***************************************************************************/

#if defined(HTTP_USE_AUTHENTICATION)
BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass)
{
	if(strcmppgm2ram((char *)cUser,(ROM char *)"admin") == 0
		&& strcmppgm2ram((char *)cPass, (ROM char *)"microchip") == 0)
		return 0x80;        // We accept this combination
	
	// You can add additional user/pass combos here.
	// If you return specific "realm" values above, you can base this 
	//   decision on what specific file or folder is being accessed.
	// You could return different values (0x80 to 0xff) to indicate 
	//   various users or groups, and base future processing decisions
	//   in HTTPExecuteGet/Post or HTTPPrint callbacks on this value.
	
	return 0x00;			// Provided user/pass is invalid
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

HTTP_IO_RESULT HTTPExecuteGet(void)
{
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

HTTP_IO_RESULT HTTPExecutePost(void)
{
	BYTE filename[20];
		// Load the file name
	// Make sure BYTE filename[] above is large enough for your longest name
	MPFSGetFilename(curHTTP.file, filename, 20);
	
	// If its the forms.htm page
	if(!memcmppgm2ram(filename, "index.htm", 9))
		return HTTPPostConfig();
	
	return HTTP_IO_DONE;
}
#endif //(use_post)

static HTTP_IO_RESULT HTTPPostConfig(void)
{	
	BYTE i;
	WORD hex;
	BYTE* cDest;
	BYTE index_param;
    BYTE index_jour;
    BYTE index_jour_bis;
	BYTE index_horloge_secondaire;
    
	unsigned char index_pts,f;
	static BYTE *ptrData;
	
	#define SM_READ_NAME 		(0u)
	#define SM_READ_VALUE 		(1u)
	#define SM_READ_FINISHING   (2u)
	
	
//	#define DECAL_HEURE 				1
//	#define ETE_HIVER 					2
	#define SERVER_NTP 					3
	#define ADRESSE_IP_AUTO 			4
	#define ADRESSE_IP_EDIT 			5
	#define SERVER_LIST_IP_SECONDAIRES 	6
	#define ADRESSE_IP_AUTO_SECONDAIRES 7
	#define ADRESSE_IP_EDIT_SECONDAIRES 8
	#define NOM_EDIT_SECONDAIRES 		9
	#define CORRECTION_TEMP				10
	#define NOM_TEMP					11
	#define DUREE_AFFICHAGE				12
	#define HEURE_ALARME				13
	#define HEURE_MANUELLE				14
    #define MODE_MARCHE                 15
    #define MODE_ARRET                  16
    #define JOURS                       17

	switch(curHTTP.smPost)
	{
		case SM_READ_NAME:
			// Search for a parameter name in POST data
			if(HTTPReadPostName(curHTTP.data, HTTP_MAX_DATA_LEN) == HTTP_READ_INCOMPLETE)
				return HTTP_IO_NEED_DATA;
            
			// Try to match the name value
//			if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"decal_heure"))
//			{
//				index_param = DECAL_HEURE;
//				curHTTP.smPost = SM_READ_VALUE;
//			}
            else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"Val_Marche"))        
			{
				index_param = MODE_MARCHE;
				curHTTP.smPost = SM_READ_VALUE;
			}
            else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"Val_Arret"))      
			{
				index_param = MODE_ARRET;
				curHTTP.smPost = SM_READ_VALUE;
			}
            else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"jour_semaine_1")) 
			{
				index_jour = 0;
                index_param = JOURS;
				curHTTP.smPost = SM_READ_VALUE;
			}
            else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"jour_semaine_2"))        
			{
                index_jour = 1;
				index_param = JOURS;
				curHTTP.smPost = SM_READ_VALUE;
			}
            else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"jour_semaine_3"))      
			{
				index_jour = 2;
                index_param = JOURS;
				curHTTP.smPost = SM_READ_VALUE;
			}
            else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"jour_semaine_4"))     
			{
                index_jour = 3;
				index_param = JOURS;
				curHTTP.smPost = SM_READ_VALUE;
			}
            else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"jour_semaine_5"))      
			{
                index_jour = 4;
				index_param = JOURS;
				curHTTP.smPost = SM_READ_VALUE;
			}
//			else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"server_list_ip_secondaires"))
//			{
//				index_param = SERVER_LIST_IP_SECONDAIRES;
//				curHTTP.smPost = SM_READ_VALUE;
//			}
//			else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"adresse_ip_auto_secondaires"))
//			{
//				index_param = ADRESSE_IP_AUTO_SECONDAIRES;
//				curHTTP.smPost = SM_READ_VALUE;
//			}
//			else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"ete_hiver"))
//			{
//				index_param = ETE_HIVER;
//				curHTTP.smPost = SM_READ_VALUE;
//			}
			else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"heure_manuelle"))
			{
				index_param = HEURE_MANUELLE;
				curHTTP.smPost = SM_READ_VALUE;
			}
//			else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"Server_NTP"))
//			{
//           				index_param = SERVER_NTP;
//				curHTTP.smPost = SM_READ_VALUE;
//			}
			else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"adresse_ip_auto"))
			{
				index_param = ADRESSE_IP_AUTO;
				curHTTP.smPost = SM_READ_VALUE;
			}
            else if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"Adresse_IP_edit"))
			{
				index_param = ADRESSE_IP_EDIT;
				curHTTP.smPost = SM_READ_VALUE;
			}
			else //if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"adresse_ip_edit_0"))
			{
				if(	(curHTTP.data[0]== 'n')&&
					(curHTTP.data[1]== 'a')&&
					(curHTTP.data[2]== 'm')&&
					(curHTTP.data[3]== 'e')&&
					(curHTTP.data[4]== '_')&&
					(curHTTP.data[5]== 'e'))
				{
					index_param = NOM_EDIT_SECONDAIRES;
					index_horloge_secondaire = curHTTP.data[10]-0x30;
					curHTTP.smPost = SM_READ_VALUE;
				}
				else
				{
					if(	(curHTTP.data[0]== 'a')&&
						(curHTTP.data[1]== 'd')&&
						(curHTTP.data[2]== 'r')&&
						(curHTTP.data[3]== 'e')&&
						(curHTTP.data[4]== 's')&&
						(curHTTP.data[5]== 's'))
					{
						index_param = ADRESSE_IP_EDIT_SECONDAIRES;
						index_horloge_secondaire = curHTTP.data[16]-0x30;
						curHTTP.smPost = SM_READ_VALUE;
					}
					else
					{
						if(	(curHTTP.data[0]== 'D')&&
							(curHTTP.data[1]== 'u')&&
							(curHTTP.data[2]== 'r')&&
							(curHTTP.data[3]== 'e')&&
							(curHTTP.data[4]== 'e')&&
							(curHTTP.data[5]== '_'))
						{
							index_param = DUREE_AFFICHAGE;
							index_horloge_secondaire = curHTTP.data[6]-0x30;
							curHTTP.smPost = SM_READ_VALUE;
						}
						else
						{
							if(	(curHTTP.data[0]== 'h')&&
								(curHTTP.data[1]== 'e')&&
								(curHTTP.data[2]== 'u')&&
								(curHTTP.data[3]== 'r')&&
								(curHTTP.data[4]== 'e')&&
								(curHTTP.data[5]== '_')&&
								(curHTTP.data[6]== 'v')&&
								(curHTTP.data[7]== 'i')&&
								(curHTTP.data[8]== 'e')&&
								(curHTTP.data[9]== 'i')&&
								(curHTTP.data[10]== 'l')&&
								(curHTTP.data[11]== 'l'))
							{
								index_param = HEURE_ALARME;
								index_horloge_secondaire = curHTTP.data[13]-0x30;
								curHTTP.smPost = SM_READ_VALUE;
							}
							else
							{
								if(	(curHTTP.data[0]== 'C')&&
									(curHTTP.data[1]== 'o')&&
									(curHTTP.data[2]== 'r')&&
									(curHTTP.data[3]== 'r')&&
									(curHTTP.data[4]== 'e')&&
									(curHTTP.data[5]== 'c')&&
									(curHTTP.data[6]== 't')&&
									(curHTTP.data[7]== 'i')&&
									(curHTTP.data[8]== 'o')&&
									(curHTTP.data[9]== 'n')&&
									(curHTTP.data[10]== '_'))
								{
									index_param = CORRECTION_TEMP;
									index_horloge_secondaire = curHTTP.data[11]-0x30;
									curHTTP.smPost = SM_READ_VALUE;
								}
								else
								{
									if(	(curHTTP.data[0]== 'n')&&
										(curHTTP.data[1]== 'o')&&
										(curHTTP.data[2]== 'm')&&
										(curHTTP.data[3]== '_')&&
										(curHTTP.data[4]== 't')&&
										(curHTTP.data[5]== 'e')&&
										(curHTTP.data[6]== 'm')&&
										(curHTTP.data[7]== 'p')&&
										(curHTTP.data[8]== '_'))
									{
										index_param = NOM_TEMP;
										index_horloge_secondaire = curHTTP.data[9]-0x30;
										curHTTP.smPost = SM_READ_VALUE;
									}
									else
									{			
										index_param = 0;
										curHTTP.smPost = SM_READ_VALUE;
									}	
								}	
							}	
						}
					}	
				}		
			}
		case SM_READ_VALUE:
            
			// Search for a parameter value in POST data
			if(HTTPReadPostValue(curHTTP.data, HTTP_MAX_DATA_LEN) == HTTP_READ_INCOMPLETE)
				return HTTP_IO_NEED_DATA;

			switch(index_param)
			{
				case SERVER_LIST_IP_SECONDAIRES :
                    
                    //BYTE var[] = "IPChildren.push(\"192.168.100.70\");NameChildren.push(\"\");IPChildren.push(\"192.168.100.75\");NameChildren.push(\"\");IPChildren.push(\"192.168.100.80\");NameChildren.push(\"zerfezf\");";
                    memset(CODE_ADR_IP_HORL_SECONDAIRE[index_horloge_secondaire], 0x00, 30);
                    for (i = 0; i < 30; i++)
                    {
                        if(*(curHTTP.data+i) != 0x00)
                            CODE_ADR_IP_HORL_SECONDAIRE[index_horloge_secondaire][i] = *(curHTTP.data+i);
                        else
                            break;
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
				case NOM_EDIT_SECONDAIRES :
                    
                    memset(CODE_NOM_HORL_SECONDAIRE[index_horloge_secondaire], 0x00, 20);
                    for (i = 0; i < 20; i++)
                    {
                        if(*(curHTTP.data+i) != 0x00)
                            CODE_NOM_HORL_SECONDAIRE[index_horloge_secondaire][i] = *(curHTTP.data+i);
                        else
                            break;
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
				case NOM_TEMP :
                    memset(NOM_SONDE_TEMP[index_horloge_secondaire], 0x00, 15);
                    for (i = 0; i < 15; i++)
                    {
                        if(*(curHTTP.data+i) != 0x00)
                            NOM_SONDE_TEMP[index_horloge_secondaire][i] = *(curHTTP.data+i);
                        else
                            break;
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
				case DUREE_AFFICHAGE :
                    
                    if(curHTTP.data[0] != 0x00)
                        UC_DUREE_AFFICHAGE[index_horloge_secondaire] = curHTTP.data[0] - 0x30;
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
				case HEURE_ALARME :
                    
                    if(curHTTP.data[0] != 0x00)
                    {
                        UC_HEURE_VIEILL[index_horloge_secondaire][0] = curHTTP.data[0]-0x30;
                        UC_HEURE_VIEILL[index_horloge_secondaire][1] = curHTTP.data[1]-0x30;
                        UC_HEURE_VIEILL[index_horloge_secondaire][2] = curHTTP.data[3]-0x30;
                        UC_HEURE_VIEILL[index_horloge_secondaire][3] = curHTTP.data[4]-0x30;
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
				case HEURE_MANUELLE :
                    
                    if(curHTTP.data[0] != 0x00)
                    {
                        buf_heure_GMT[0] = curHTTP.data[0];     //enregistrement des données temporelles en BCD
                        buf_heure_GMT[1] = curHTTP.data[1];

                        buf_heure_GMT[3] = curHTTP.data[3];
                        buf_heure_GMT[4] = curHTTP.data[4];

                        buf_heure_GMT[6] = curHTTP.data[6];
                        buf_heure_GMT[7] = curHTTP.data[7];

                        buf_heure_GMT[9] = curHTTP.data[9];
                        buf_heure_GMT[10] = curHTTP.data[10];

                        buf_heure_GMT[12] = curHTTP.data[12];
                        buf_heure_GMT[13] = curHTTP.data[13];

                        buf_heure_GMT[15] = curHTTP.data[15];
                        buf_heure_GMT[16] = curHTTP.data[16];
                        buf_heure_GMT[17] = curHTTP.data[17];
                        buf_heure_GMT[18] = curHTTP.data[18];
                        SYNCHRO =1;
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_FINISHING; //SM_READ_NAME; 
                    break;
                    
//				case DECAL_HEURE :
//                    
//                    ((BYTE*)&hex)[1] = curHTTP.data[0];
//                    ((BYTE*)&hex)[0] = curHTTP.data[1];
//                    CODE_DECAL_HORAIRE = hexatob(*((WORD_VAL*)&hex));
//                    index_param = 0;
//                    curHTTP.smPost = SM_READ_NAME;
//                    break;
                    
				case CORRECTION_TEMP :
                    
                    if(curHTTP.data[0] == '-')
                        S_CORREC_TEMP[index_horloge_secondaire] = -((curHTTP.data[1] - 0x30) * 10);
                    else
                        S_CORREC_TEMP[index_horloge_secondaire] = (curHTTP.data[0] - 0x30) * 10;
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
//				case ETE_HIVER :
//                    
//                    CODE_CHANGEMENT_HEURE = curHTTP.data[0] - 0x30;
//                    index_param = 0;
//                    curHTTP.smPost = SM_READ_NAME;
//                    break;
                    
//				case SERVER_NTP :
//                    
//                    memset(CODE_NTP_SERVER, 0x00, 30);
//                    for (i = 0; i < 30; i++)
//                    {
//                        if(*(curHTTP.data+i) != 0x00)
//                            CODE_NTP_SERVER[i] = *(curHTTP.data+i);
//                        else
//                            break;
//                    }
////					buf_heure_GMT[0] = 0;
//                    index_param = 0;
//                    curHTTP.smPost = SM_READ_NAME;
//                    break;
                    
				case ADRESSE_IP_AUTO :
                    
                    CODE_IP_AUTO = curHTTP.data[0] - 0x30;
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME; 
                    break;
                    
				case ADRESSE_IP_AUTO_SECONDAIRES :
                    
                    CODE_IP_AUTO_SECONDAIRE = curHTTP.data[0] - 0x30;
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                     
				case ADRESSE_IP_EDIT :
                    
                    //Converti l'adresse IP en int
                    memset(CODE_ADR_IP_WEB, 0x00, sizeof(CODE_ADR_IP_WEB));
                    for (i = 0; i < 30; i++)
                    {
                        if(curHTTP.data[i] != 0x00)
                            CODE_ADR_IP_WEB[i] = curHTTP.data[i];
                        else
                            break;
                    }
                    index_pts = 0;
                    for(f = 0; f < 4; f++)
                    {
                        if((CODE_ADR_IP_WEB[1 + index_pts] == '.')||(CODE_ADR_IP_WEB[1 + index_pts] == 0x00))
                        {
                            AppConfig.MyIPAddr.v[f] = (CODE_ADR_IP_WEB[index_pts] - 0x30);
                            index_pts += 2;			
                        }
                        else
                        {
                            if((CODE_ADR_IP_WEB[2 + index_pts] == '.')||(CODE_ADR_IP_WEB[2 + index_pts] == 0x00))
                            {
                                AppConfig.MyIPAddr.v[f] =(CODE_ADR_IP_WEB[index_pts] - 0x30) * 10 + (CODE_ADR_IP_WEB[index_pts + 1] - 0x30);
                                index_pts += 3;			
                            }
                            else
                            {	
                                if((CODE_ADR_IP_WEB[3 + index_pts] == '.')||(CODE_ADR_IP_WEB[3 + index_pts] == 0x00))
                                {
                                    AppConfig.MyIPAddr.v[f] = (CODE_ADR_IP_WEB[index_pts] - 0x30) * 100 + (CODE_ADR_IP_WEB[index_pts + 1] - 0x30) * 10 + (CODE_ADR_IP_WEB[index_pts + 2] - 0x30);
                                    index_pts += 4;
                                }
                            }
                        }	
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
				case ADRESSE_IP_EDIT_SECONDAIRES :
                    //Converti l'adresse IP en int
                    memset(CODE_ADR_IP_HORL_SECONDAIRE[index_horloge_secondaire], 0x00, 30);
                    for (i = 0; i < 30; i++)
                    {
                        if(curHTTP.data[i] != 0x00)
                            CODE_ADR_IP_HORL_SECONDAIRE[index_horloge_secondaire][i] = curHTTP.data[i];
                        else
                            break;
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
                case MODE_MARCHE :
                    
                    if(curHTTP.data[0] == 0x31)
                    {
                        FORCAGE_MARCHE = 0x31;
                        FORCAGE_ARRET = 0x30;
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME;
                    break;
                    
                case MODE_ARRET :
                    
                    if(curHTTP.data[0] == 0x31)
                    {
                        FORCAGE_ARRET = 0x31;
                        FORCAGE_MARCHE = 0x30;
                    }
                    else if(curHTTP.data[0] == 0x32)
                    {
                        FORCAGE_ARRET = 0x32;
                        FORCAGE_MARCHE = 0x30;
                    }
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME; 
                    break;
                    
                case JOURS:
                    
                    JOURS_SELECT[index_jour] = curHTTP.data[0];
                    JOURS_SELECT_BUF[index_jour] = curHTTP.data[0];
                    //Delay_10_microS();
                    index_jour = 0;
                    index_param = 0;
                    curHTTP.smPost = SM_READ_NAME; 
                    break;
			}		
			return HTTP_IO_WAITING;
//			// Move past the data that was just read
//			ptrData += strlen((char*)ptrData);
//			if(ptrData < curHTTP.data + HTTP_MAX_DATA_LEN - 1)
//                ptrData += 1;
				
			case SM_READ_FINISHING:			
				// Try reading the next parameter
				Demande_heure_page_web = 1;
				for(i = 0; i < 5; i++)
                {
                    if(JOURS_SELECT[i] != JOURS_SELECT_BUF[i])
                    {
                        JOURS_SELECT[i] = 0;
                    }
                    JOURS_SELECT_BUF[i] = 0;
                    JOURS_SELECT_FINALE[i] = JOURS_SELECT[i];
                }
                Delay_10_microS();
				// This is the only expected value, so callback is done
				strcpypgm2ram((char*)curHTTP.data, "/index.htm");
				curHTTP.httpStatus = HTTP_REDIRECT;
				return HTTP_IO_DONE;
	}
	 //Default assumes that we're returning for state machine convenience.
	 //Function will be called again later.
	return HTTP_IO_DONE;		
}
#endif
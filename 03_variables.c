////////////////////////////////////////////////////////////////////////////////
// PUPITRE TYPE : M70P12XA
// SUJET		: declaration des variables globales au projet
// AUTEUR 		: BLIN Y
// VERSION		: A
// CREATION		: 21/07/2021
// DER. MODIF	: 
////////////////////////////////////////////////////////////////////////////////
#include "03_Variables.h"
#include "GenericTypeDefs.h"
__attribute__ ((persistent))
unsigned char
	B_RAM_NON_EFFACEE1;
long
DEBUT_RAM,
	DIZ_HEURE_UTC,				//Dizaine heure UTC GPS
	UNI_HEURE_UTC,				//Unit� heure UTC GPS
	DIZ_MIN_UTC,				//Dizaine minute UTC GPS
	UNI_MIN_UTC,				//Unit� minute UTC GPS
	DIZ_SEC_UTC,				//Dizaine seconde UTC GPS
	UNI_SEC_UTC,				//Unit� seconde UTC GPS
	DIZ_JOUR_UTC,				//Dizaine jour UTC GPS
	UNI_JOUR_UTC,				//Unit� jour UTC GPS
	DIZ_MOIS_UTC,				//Dizaine mois UTC GPS
	UNI_MOIS_UTC,				//Unit� mois UTC GPS
	MIL_AN_UTC,					//Millier d'ann�e UTC GPS
	CEN_AN_UTC,					//centaine d'ann�e UTC GPS
	DIZ_AN_UTC,					//Dizaine ann�e UTC GPS
	UNI_AN_UTC;					//Unit� d'ann�e UTC GPS


__attribute__ ((persistent))
long	DIZ_HEURE_DCF,					//Dizaine heure locale
		UNI_HEURE_DCF,					//Unit� heure locale
		DIZ_MIN_DCF,					//Dizaine minute locale
		UNI_MIN_DCF,					//Unit� minute locale
		DIZ_SEC_DCF,					//Dizaine seconde locale
		UNI_SEC_DCF,					//Unit� seconde locale
		DIZ_JOUR_DCF,					//Dizaine jour locale
		UNI_JOUR_DCF,					//Unit� jour locale
		DIZ_MOIS_DCF,					//Dizaine mois locale
		UNI_MOIS_DCF,					//Unit� mois locale
		MIL_AN_DCF,					//Millier d'ann�e UTC GPS
		CEN_AN_DCF,					//centaine d'ann�e UTC GPS
		DIZ_AN_DCF,						//Dizaine ann�e locale
		UNI_AN_DCF;	
//Trame DCF

unsigned char T_DCF[60]= {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};

__attribute__ ((persistent))

struct last_Acc_Date Last_Accident_Date;

unsigned int
    JOURS_OK,           //Valide si le jour selectionn� correspond au jour actuel
    PLAGE_OK,           //Valaide si l'heure actuelle se trouve dans la plage horaire d�fini
    CYCLE_OK,           //Confirmation que le cycle est en cours (permet de contrer la validation de jour lorsqu'on passe de lundi 23h59 � mardi 00h00)
    TRAME,              //1 : Trame envoy� pour le d�but du vieillissement, 0 : Trame envoy� pour la fin du vieillisement
    START_STOP,         //1 : Depart_Vieillissement actif, 0 : Arret_Vieillissement actif
    HEURE_D,            //Plage horaire debut (heure)
    HEURE_F,            //Plage horaire fin (heure)
    HEURE_ACTU,         //Heure en temps r�el (heure)
    MIN_D,              //Plage horaire debut (minute)
    MIN_F,              //Plage horaire fin (minute)
    MIN_ACTU,           //Heure en temps r�el (minute)
    J1,
    J2,
    J_WEEK,
    WEEKEND,
    INIT,
    JOUR_PRECEDENT,
    NUM_JOUR_DCF,				//Num�ro du jour de la semaine 1=Lundi et 7=Dimanche
	DECAL_HORAIRE,				//Nombre d'heure de d�calage horaire
    
    NB_Accidents,
    NB_Jours_Sans_Accidents,
    NB_Records_Jours,
    Bold,
    Bright_Enabled,
    Led_Color_1,
    Led_Color_2,
    Led_Color_3;


    
short
	S_TEMP_AVEC_OFFSET[16],					
	S_TEMP_MES[16],
	S_CORREC_TEMP[16],	
	S_TEMPERATURE_TEMP_PROG[16];
		
__attribute__ ((persistent))
unsigned char
    attente_synchro,    
	SYNCHRO,				//Synchronisation de l'heure
	UC_TEMPO_2MS,
	Mise_a_heure,
	Demande_heure_page_web,
	CODE_FUS_HOR,			//Code du fuseau horaire
	CODE_DECAL_HORAIRE,		//code D�calage horaire des switchs
	CODE_CHANGEMENT_HEURE,
	CODE_NTP_SERVER[30],
	UC_LCD_LIGNE[16],
	UC_AFFICH_TEMP[5],
	UC_DUREE_AFFICHAGE[5],
	UC_HEURE_VIEILL[2][4],
	CODE_IP_AUTO,
	CODE_IP_AUTO_SECONDAIRE,
	MEM_CODE_IP_AUTO,
	CODE_ADR_IP_WEB[30],
	CODE_ADR_IP_HORL_SECONDAIRE[10][30],
	CODE_NOM_HORL_SECONDAIRE[10][20],
	NOM_SONDE_TEMP[16][15],
	NBR_HORLOGE_SECONDAIRE,
	B_LECTURE_SONDE_OK,
	UC_COMPT_CAPTEUR_TEMP,
	UC_CYCLE_AFFICHAGE,
	UC_COMPT_1S,
	UC_COMPT_ENVOI_ESCLAVE,
	UC_INDEX_SONDE,
	UC_TABLE_EMI_SONDE[2],	//Variables Capteurs temp,
	UC_TABLE_REC_SONDE[10],
        
    UC_TEST,
    
	FIN_TRAME,				//Fin d'�mission de trame DCF
	DEC_HOR_NEG,			//flag d�calage horaire n�gatif	
	TRAME_OK,				//Flag si trame DCF � transmettre
	NUM_SEC,				//Pointeur du num�ro de seconde DCF � transmettre
	CPTR100ms,				//compteur interruptions 100ms	
	CPTR_LED,				//Allume LED
	UC_ETAT_CLAVIER,		// variables li�es au clavier 
	UC_SAUVEG_ETAT_CLAVIER,
	B_CARTE_ALLUMEE,
	buf_heure_utc[21],
	buf_heure_GMT[21],
	UC_POINT_TRAME_RECEPT_RX1,
	UC_COMPT_NON_RECEP_CODE_DEBUT,
	TAB_RECEPT[2],
	B_RAM_NON_EFFACEE2,
	FIN_RAM,
        
    JOURS_SELECT[5],            //Jours s�lectionn� � la r�ception + donn�e s�lectionn� pr�c�dement
    JOURS_SELECT_BUF[5],        //Nouveaux jours s�lectionn�
    JOURS_SELECT_FINALE[5],     //Apr�s comparaison, jours de fonctionnement voulu
    FORCAGE_MARCHE,             
    FORCAGE_ARRET,
    Trame_STOP[4],
    Trame_GO[4];

__attribute__ ((persistent))
unsigned char * UC_PT_CHAINE_LCD;

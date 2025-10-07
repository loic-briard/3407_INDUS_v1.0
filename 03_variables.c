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
#include <stdbool.h>
__attribute__ ((persistent))
unsigned char
	B_RAM_NON_EFFACEE1;
__attribute__ ((persistent))

struct struct_Date Last_Accident_Date;
struct struct_Date Now_Date_Post;
struct struct_Heure Horaire_Allumage;
struct struct_Heure Horaire_Extinction;
struct struct_Date Date_UTC;
struct struct_Heure Heure_UTC;

unsigned int
    NB_Accidents,
    Bold,
    Bright_Enabled,
    Bright,    
    Eco_Enabled,    
    Led_Color_1,
    Led_Color_2,
    Led_Color_3;
    
short
	S_TEMP_AVEC_OFFSET[16],					
	S_TEMP_MES[16],
	S_CORREC_TEMP[16],	
	S_TEMPERATURE_TEMP_PROG[16];

unsigned long 
    NB_Jours_Sans_Accidents,
    NB_Records_Jours;

bool DST; //Daylight Saving Time

__attribute__ ((persistent))
unsigned char
	NOM_SONDE_TEMP[16][15],
	NBR_HORLOGE_SECONDAIRE,
	B_LECTURE_SONDE_OK,
	UC_COMPT_CAPTEUR_TEMP,
	UC_CYCLE_AFFICHAGE,
    UC_TEMPO_2MS,
	UC_COMPT_1S,
	UC_COMPT_ENVOI_ESCLAVE,
	UC_INDEX_SONDE,
	UC_TABLE_EMI_SONDE[2],	//Variables Capteurs temp,
	UC_TABLE_REC_SONDE[10],
        
    UC_TEST,
    Seconde_UTC,
    
    CODE_IP_AUTO,
	CODE_IP_AUTO_SECONDAIRE,
	MEM_CODE_IP_AUTO,
	FIN_TRAME,				//Fin d'émission de trame DCF
	DEC_HOR_NEG,			//flag décalage horaire négatif	
	TRAME_OK,				//Flag si trame DCF à transmettre
	NUM_SEC,				//Pointeur du numéro de seconde DCF à transmettre
	CPTR100ms,				//compteur interruptions 100ms	
	CPTR_LED,				//Allume LED
	B_CARTE_ALLUMEE,
	buf_heure_utc[21],
	buf_heure_GMT[21],
	UC_POINT_TRAME_RECEPT_RX1,
	UC_COMPT_NON_RECEP_CODE_DEBUT,
	TAB_RECEPT[2],
	B_RAM_NON_EFFACEE2,
	FIN_RAM;

__attribute__ ((persistent))
unsigned char * UC_PT_CHAINE_LCD;

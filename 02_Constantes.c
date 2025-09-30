/******************************************************************************
 * NOM		: FTSM02XA
 * TYPE		: UTILITAIRE
 * SUJET	: Constantes
 * AUTEUR 	: BLIN Y
 * VERSION	: A
 * CREATION : 09/04/2009
 ******************************************************************************/
//#define USE_LCD

#if defined(__XC16__)
  #define PERSIST __attribute__((persistent))
#else
  #define PERSIST
#endif

__attribute__((space(auto_psv)))
 unsigned char 
MESS_PROG_LIGNE_OFF_1[17]	= "OFF      \"      ",
MESS_EFFACEE[17]			= "                ",
MESS_ACCEUIL[17]			= "...Stramatel... ";
//Trame_GO[4]                = "#GO$",
//Trame_STOP[4]              = "#ST$";


//---Constantes ports entrées/sorties------------------------------------------
#define LED_DCF 			LATDbits.LATD5
#define LED_SYNCHRO_HEURE 	LATDbits.LATD6
#define LED_3		 		LATDbits.LATD7


#define CONST_CODE_DECAL_HORAIRE	0x0D //+ 1 heure
 /*
18	+12h	Nouvelle zélande
17	+11h	Nouvelle calédonie
16	+10h	Australie
15	+9h	Japon
14	+8h	Chine
13	+7h	Indonésie
12	+6h	Bangladesh
11	+5h	Pakistan
10	+4h	Emirats arabe
0F	+3h	Russie /Moscou
0E	+2h	Egypte
0D	+1h	France/allemagne
0C	UCT	Angleterre
0B	-1h	Cap Vert
0A	-2h	Brésil
09	-3h	Brésil
08	-4h	ChiliPORT
07	-5h	New York
06	-6h	Mexique
05	-7h	Canada
04	-8h	Californie
03	-9h	Alaska
02	-10h	Hawaï
01	-11h	Samoa
00	-12h	*/

#define CONST_CODE_CHANGEMENT_HEURE	0x01 // + 1 heure


#define CDE_SIGNAL_DCF	LATGbits.LATG0	//??? A modifier

// chiffre 0 1 2 3 4 5 6 7 8 9 A E J P				0	 1	  2    3    4    5    6    7    8    9	  A    B    C    D    E    F  
const unsigned char CODE_ACCEPTABLE_1[256] = {	0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF, /*00 à 0F*/
					      						0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF, /*10 à 1F*/
					      						0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00, /*20 à 2F*/
					      						0xBB,0x18,0xEA,0x7A,0x59,0x73,0xF3,0x1A,0xFB,0x7B,0x00,0x00,0x00,0x00,0x00,0x00, /*30 à 3F*/
					      						0x00,0xDB,0x00,0x00,0x00,0xE3,0x00,0x00,0x00,0x00,0xDB,0x00,0x00,0x00,0x00,0xBB, /*40 à 4F*/
					      						0xCB,0x00,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00, /*50 à 5F*/
					      						0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00, /*60 à 6F*/
					      						0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00, /*70 à 7F*/
					      						0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00, /*80 à 8F*/
					      						0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00, /*90 à 9F*/
					      						0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF, /*A0 à AF*/
					      						0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF, /*B0 à BF*/
					      						0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF, /*C0 à CF*/
					      						0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF, /*D0 à DF*/
					      						0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF, /*E0 à EF*/
					      						0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF};/*F0 à FF*/

// Alimentation
#define AVDD_CONV	3.30

#define INH_5V 				LATBbits.LATB15
#define EVCC3 				LATBbits.LATB14
#define EVUSB				LATFbits.LATF8	
#define PIN_FAULT_USB		PORTAbits.RA15


// Liaison série
#define DE1_ADM 	LATFbits.LATF5
#define DE2_ADM 	LATDbits.LATD9
#define CTRL       	LATCbits.LATC1

// LED
#define LE			LATFbits.LATF1
#define OE			LATFbits.LATF0

// LCD
#define LCD_READ_BUSY 	PORTEbits.RE7

#define LCD_DIR_DB7		TRISEbits.TRISE7

#define LCD_TRIS_E		TRISDbits.TRISD2
#define LCD_TRIS_RS		TRISDbits.TRISD0
#define LCD_TRIS_RW		TRISDbits.TRISD1

#define LCD_E  	 LATDbits.LATD2
#define LCD_RS 	 LATDbits.LATD0
#define LCD_RW   LATDbits.LATD1 

//Opto
#define OPT1 PORTEbits.RE7
#define OPT2 PORTEbits.RE8
#define OPT3 LATGbits.LATG8
#define OPT4 LATGbits.LATG9

//---Constantes numériques----------------------------------------------------------------
#define ENTREE              1
#define SORTIE              0

//EUROPE.....
__attribute__((space(auto_psv)))
const unsigned  long CHANGEMENT_HEURE1[32][2] = {			{32801,103101},	//2021
															{32701,103001},	//2022
															{32601,102901},	//2023
															{33101,102701},	//2024
															{33001,102601},	//2025
															{32901,102501},	//2026
															{32801,103101},	//2027
															{32601,102901},	//2028
															{32501,102801},	//2029
															{33101,102701},	//2030
															{33001,102601},	//2031
															{32801,103101},	//2032
															{32701,103001},	//2033
															{32601,102901},	//2034
															{32501,102801}, //2035
															{33001,102601},	//2036
															{32901,102501},	//2037
															{32801,103101},	//2038
															{32701,103001},	//2039
															{32501,102801},	//2040
															{33101,102701},	//2041
															{33001,102601},	//2042
															{32901,102501},	//2043
															{32701,103001},	//2044
															{32601,102901},	//2045
															{32501,102801},	//2046
															{33101,102701},	//2047
															{32901,102501},	//2048
															{32801,103101},	//2049
															{32701,103001}};//2050

//ETATS UNIS....

__attribute__((space(auto_psv)))
const unsigned long CHANGEMENT_HEURE2[30][2] = {			{31402,110702},	//2021
															{31302,110602},	//2022
															{31202,110502},	//2023
															{31002,110302},	//2024
															{30902,110202},	//2025
															{30802,110102},	//2026
															{31402,110702},	//2027
															{31202,110502},	//2028
															{31102,110402},	//2029
															{31002,110302},	//2030
															{30902,110202},	//2031
															{31402,110702},	//2032
															{31302,110602},	//2033
															{31202,110502},	//2034
															{31102,110402}, //2035
															{30902,110202},	//2036
															{30802,110102},	//2037
															{31402,110702},	//2038
															{31302,110602},	//2039
															{31102,110402},	//2040
															{31002,110302},	//2041
															{30902,110202},	//2042
															{30802,110102},	//2043
															{31302,110602},	//2044
															{31202,110502},	//2045
															{31102,110402},	//2046
															{31002,110302},	//2047
															{30802,110102},	//2048
															{31402,110702},	//2049
															{31302,110602}};//2050

//Cuba, Mexique....
__attribute__((space(auto_psv)))
const unsigned long CHANGEMENT_HEURE3[30][2] = {			{40402,103102},	//2021
															{40302,103002},	//2022
															{40202,102902},	//2023
															{40702,102702},	//2024
															{40602,102602},	//2025
															{40502,102502},	//2026
															{40402,103102},	//2027
															{40202,102902},	//2028
															{40102,102802},	//2029
															{40702,102702},	//2030
															{40602,102602},	//2031
															{40402,103102},	//2032
															{40302,103002},	//2033
															{40202,102902},	//2034
															{40102,102802}, //2035
															{40602,102602},	//2036
															{40502,102502},	//2037
															{40402,103102},	//2038
															{40302,103002},	//2039
															{40102,102802},	//2040
															{40702,102702},	//2041
															{40602,102602},	//2042
															{40502,102502},	//2043
															{40302,103002},	//2044
															{40202,102902},	//2045
															{40102,102802},	//2046
															{40702,102702},	//2047
															{40502,102502},	//2048
															{40402,103102},	//2049
															{40302,103002}};//2050

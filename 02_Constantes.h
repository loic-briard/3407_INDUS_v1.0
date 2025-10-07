/******************************************************************************
 * NOM		: FTSM02XA
 * TYPE		: UTILITAIRE
 * SUJET	: Constantes
 * AUTEUR 	: BLIN Y
 * VERSION	: A
 * CREATION : 09/04/2009
 ******************************************************************************/
//#define USE_LCD

//#if defined(__XC16__)
//  #define PERSIST __attribute__((persistent))
//#else
//  #define PERSIST
//#endif

__attribute__((space(auto_psv)))
 extern unsigned char 
MESS_PROG_LIGNE_OFF_1[17],
MESS_EFFACEE[17],
MESS_ACCEUIL[17];
//Trame_GO[4]                = "#GO$",
//Trame_STOP[4]              = "#ST$";


//---Constantes ports entrées/sorties------------------------------------------
#define DCF_IN              PORTGbits.RG0   // lecture du signal DCF (niveau logique)
#define LED_DCF             LATDbits.LATD5
#define LED_SYNCHRO_HEURE   LATDbits.LATD6
#define LED_3               LATDbits.LATD7


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
#define DCF_IN   PORTGbits.RG0    // entrée DCF

// chiffre 0 1 2 3 4 5 6 7 8 9 A E J P				0	 1	  2    3    4    5    6    7    8    9	  A    B    C    D    E    F  
extern const unsigned char CODE_ACCEPTABLE_1[256];
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
extern const unsigned  long CHANGEMENT_HEURE1[32][2];//2050

//ETATS UNIS....

__attribute__((space(auto_psv)))
extern const unsigned long CHANGEMENT_HEURE2[30][2];//2050

//Cuba, Mexique....
__attribute__((space(auto_psv)))
extern const unsigned long CHANGEMENT_HEURE3[30][2];//2050

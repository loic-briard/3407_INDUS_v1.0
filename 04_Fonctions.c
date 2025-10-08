////////////////////////////////////////////////////////////////////////////////
// NOM			: MA1P04XA.h
// TYPE			: UTILITAIRE
// SUJET		: sous-fonctions principales et secondaires
// AUTEUR 		: JOLY JP & BLIN Y
// VERSION		: A
// CREATION		: 25/01/2008
// DER. MODIF	: 
////////////////////////////////////////////////////////////////////////////////
#include <xc.h>
#include "string.h"
#include "TCPIP Stack/TCPIP.h"      // Définit BYTE, WORD, DWORD, BOOL, IP_ADDR, ROM, ...
#include "TCPIP Stack/Helpers.h"    // Ensuite seulement
#include "TCPIP Stack/UART.h"
#include "02_Constantes.h"
#include "03_Variables.h"
#include "04_Fonctions.h"
#include "EEPROM.h"
#include "GenericTypeDefs.h"

unsigned char BusyXLCDstr(void);

void LCD_WRITE_DATA (unsigned char LCD_data);
void Init_Lcd_1 ( unsigned char octet_lcd);

void Envoi_Instruction_Au_Lcd (void);
void Concatener_Heure_Direct(void);
void Concatener_Heure_Plage(void);
void Depart_Vieillissement(void);
void Arret_Vieillissement(void);
void AFFICHER_2LIGNES_LCD(void);
void Trame_Vieillissement(void);
void CHARGER_2LIGNES_LCD(void);
void Test_Plage_Horaire(void);
void Ecrire_2lignes_Lcd(void);
void Delay_2_5_microS(void);        // 2.5 µs mesuré
void Delay_100_microS(void);
void Test_Weekend(void);
void Delay_10_mS(void);
void Test_Jours(void);
void Init_Lcd (void);

extern void Delay_10_microS(void);

#ifndef FONCTIONS_TIME_INCLUDED
#define FONCTIONS_TIME_INCLUDED
  #include <time.h>
#endif

void Init_Broches_Remappables(void)
{
	// Unlock registre remappable
	OSCCON = 0x46;
	OSCCON = 0x57;
	OSCCONbits.IOLOCK = 0;
	
	RPINR1bits.INT2R = 36;      // INT2 sur la broche 38
	RPINR18bits.U1RXR = 16;     // RX1 
	RPINR19bits.U2RXR = 3;      // RX2 

	RPINR20bits.SDI1R = 35;     // SDI1	
	
	RPOR15bits.RP30R = 0;
	RPOR14bits.RP29R = 0;
	RPOR14bits.RP28R = 0;
	RPOR13bits.RP27R = 0;
	RPOR13bits.RP26R = 7;       // SDO1 
	RPOR12bits.RP25R = 0;	
	RPOR12bits.RP24R = 0;
	RPOR11bits.RP23R = 0;
	RPOR11bits.RP22R = 0;
	RPOR10bits.RP21R = 8;       // SCK1 
	RPOR10bits.RP20R = 0;
	RPOR9bits.RP19R = 0;
	RPOR9bits.RP18R = 0;
	RPOR8bits.RP17R = 0;
	RPOR8bits.RP16R = 0;	
	RPOR7bits.RP15R = 3;        // TX1
	RPOR7bits.RP14R = 0;
	RPOR6bits.RP13R = 0;
	RPOR6bits.RP12R = 0;
	RPOR5bits.RP11R = 0;
	RPOR5bits.RP10R = 0;
	RPOR4bits.RP9R = 0;
	RPOR4bits.RP8R = 0;
	RPOR3bits.RP7R = 0;
	RPOR3bits.RP6R = 0;
	RPOR2bits.RP5R = 0;
	RPOR2bits.RP4R = 0;
	RPOR1bits.RP3R = 0;
	RPOR1bits.RP2R = 5;         //Tx2
	RPOR0bits.RP1R = 0;
	RPOR0bits.RP0R = 0;

	// Lock registre remappable
	OSCCON = 0x46;
	OSCCON = 0x57;
	OSCCONbits.IOLOCK = 1;
}

void Initialisations(void)
{	
	unsigned short p,i;
	
	Init_Broches_Remappables();
	
    UC_TEST = 0;
    
	AD1PCFG = 0xFFFB;

	CLKDIVbits.CPDIV = 1;       // la fréquence est divisé par 2
	CORCONbits.PSV = 1;         //Program space visible in data space

	// Interruption
	INTCON1bits.NSTDIS = 0;     // on accepte l empilation des interruptions

	TRISA = 0xffff;
	TRISB = 0xffff;
	TRISC = 0xffff;
	TRISD = 0xffff;
	TRISE = 0xffff;
	TRISF = 0xffff;
	TRISG = 0xffff;
		
	//LCD
	TRISEbits.TRISE0 = SORTIE;      // DB0
	TRISEbits.TRISE1 = SORTIE;		// DB1		
	TRISEbits.TRISE2 = SORTIE;		// DB2
	TRISEbits.TRISE3 = SORTIE;		// DB3
	TRISEbits.TRISE4 = SORTIE;		// DB4
	TRISEbits.TRISE5 = SORTIE;		// DB5
	TRISEbits.TRISE6 = SORTIE;		// DB6
	TRISEbits.TRISE7 = SORTIE;		// DB7
	
	LCD_TRIS_RS = SORTIE;       // RS
	LCD_TRIS_RW = SORTIE;		// R/W
	LCD_TRIS_E = SORTIE;		// E

	// Leds
	TRISDbits.TRISD5 = SORTIE;      // LED 1 dcf
	TRISDbits.TRISD6 = SORTIE;      // LED 2 led synchro heure
	TRISDbits.TRISD7 = SORTIE;      // LED 3 si besoin

	TRISGbits.TRISG0 = ENTREE;   // DCF sur RG0 en entrée
    LED_5 = 0; 
    LED_6 = 0;
    LED_7 = 0;
	
	//Liaison SPI1 Ethernet
	TRISGbits.TRISG6 = SORTIE;      // SCK1
//	CNPU1bits.CN8PUE = 1;           // Pull up
	TRISGbits.TRISG7 = SORTIE;      // SDO1
//	CNPU1bits.CN9PUE = 1;           // Pull up
	TRISAbits.TRISA15 = ENTREE;     // SDI1
	//CNPU3bits.CN44PUE = 1;        // Pull up
	//CNPD3bits.CN44PDE = 1;        // Pull down
	TRISAbits.TRISA14 = ENTREE;     // INT
	CNPU3bits.CN43PUE = 1;          // Pull up

	ClrWdt();                       // Mise à jour du watchdog
    
    //eeprom configuration
	RCONbits.SWDTEN = 1;
	AD1PCFG = 0xFFFF; // toutes les pats numeriques
	//Liaison SPI2 EEPROM
	TRISBbits.TRISB2 = SORTIE;	// SDO2
	TRISBbits.TRISB5 = ENTREE;	// SDI2
	TRISBbits.TRISB4 = SORTIE;	// SCK2
	TRISBbits.TRISB3 = SORTIE;	//CS
	
	//Broches_Remappables
	RPINR22bits.SDI2R = 18;	// SDI2 etait 18
	RPOR6bits.RP13R = 10;	// SDO2
	RPOR14bits.RP28R = 11;	// SCK2
    
	//Initialisation TIMER2 100ms
	T2CONbits.TCS=0;                // Fosc/2
	T2CONbits.TCKPS1 = 0;           // Prescaler de 1/64
	T2CONbits.TCKPS0 = 1;
	// ATTENTION 62499 == 62500 cycle il faut faire -1 sur le nombre de cycle
	PR2	= 1999;                     // 62499 cycle avec prescaler 1/8
	T2CONbits.TON = 1;              // active le timer 1	
	IFS0bits.T2IF = 0;              // met le flag timer 1 à 0
	IPC1bits.T2IP = 7;              // priorité de l'interuption (7=priorité la plus haute)
	IEC0bits.T2IE = 1;              // active l'interruption liée au timer 1
							
	Delay_10_mS();
	Delay_10_mS();
	Delay_10_mS();
	Delay_10_mS();
	
	
	UC_POINT_TRAME_RECEPT_RX1 = 0x00;
	UC_COMPT_NON_RECEP_CODE_DEBUT = 0;

	TRAME_OK = 0x00;
	NUM_SEC = 0x00;
	CPTR100ms = 0x00;
	CPTR_LED = 0x00;
        
    //initialisation des variables lies aux accidents
    NB_Accidents = EEPROMReadByte(ADR_NB_ACCIDENTS);
    if(NB_Accidents == 0xFF)
        NB_Accidents = 0;
    NB_Jours_Sans_Accidents = EEP_ReadU32(ADR_NB_JOURS_SANS_ACCIDENTS);
    if(NB_Jours_Sans_Accidents == 0xFFFFFFFFUL)
        NB_Jours_Sans_Accidents = 0;
    NB_Records_Jours = EEP_ReadU32(ADR_NB_RECORDS_JOURS);
    if(NB_Records_Jours == 0xFFFFFFFFUL)
        NB_Records_Jours = 0;    
    
    Bold = EEPROMReadByte(ADR_BOLD);
    if(Bold == 0xFF)
        Bold = 0;    
    Bright_Enabled = EEPROMReadByte(ADR_BRIGHT_ENABLED);
    if(Bright_Enabled == 0xFF)
        Bright_Enabled = 0;    
    Bright = EEPROMReadByte(ADR_BRIGHT);
    if(Bright == 0xFF)
        Bright = 127;    
    
    Led_Color_1 = EEPROMReadByte(ADR_LED_COLOR_1);
    if(Led_Color_1 == 0xFF)
        Led_Color_1 = 0;
    Led_Color_2 = EEPROMReadByte(ADR_LED_COLOR_2);
    if(Led_Color_2 == 0xFF)
        Led_Color_2 = 0;
    Led_Color_3 = EEPROMReadByte(ADR_LED_COLOR_3);
    if(Led_Color_3 == 0xFF)
        Led_Color_3 = 0;
    
    Eco_Enabled = EEPROMReadByte(ADR_ECO_ENABLED);
    if(Eco_Enabled == 0xFF)
        Eco_Enabled = 0;  
    
    LoadLastAccidentDate(&Last_Accident_Date);
    LoadHoraire(&Horaire_Allumage, ADR_HORAIRE_ALLUMAGE);
    LoadHoraire(&Horaire_Extinction, ADR_HORAIRE_EXTINCTION);
    
    Nop();    
}

void Delay_2_5_microS(void)	// 2.5 µs mesuré
{
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
}

//void Delay_10_microS(void)
//{
//	unsigned int i;
//	for(i = 0; i < 6; i++)      // Valeur max de I fixe grace a l oscillo
//		Nop();
//}
void Delay_100_microS(void)
{
	unsigned int i;
	for(i = 0; i < 80; i++)     // Valeur max de I fixe grace a l oscillo
		Nop();
}
		
void Delay_1_mS(void)
{
	unsigned int i;
	for(i = 0; i < 800; i++)        // Valeur max de I fixe grace a l oscillo
		Nop();
}

void Delay_0_5_mS(void)
{
	unsigned int i;
	for(i = 0; i < 400; i++)        // 1 ms mesuré Valeur max de I fixe grace a l oscillo
		Nop();
}
void Delay_10_mS(void)
{
	unsigned int i;
	ClrWdt();						// Mise à jour du watchdog
	for(i = 0; i < 8000; i++)       // Valeur max de I fixe grace a l oscillo
		Nop();
}

// ENTREES		: aucune
// SORTIES		: aucune
// E/S			: aucune
// DESCRIPTION	: TEMPO_3S
//
// GLOBALES		: aucune
void TEMPO_3S(void)
{
	unsigned char var ;
	var = 0;
	do
	{
		Delay_10_mS();
		Delay_10_mS();
		Delay_10_mS();
		ClrWdt();           // Mise à jour du watchdog
		var++;
	}while (var < 100);     // Attente de 3 secondes
}

//void LectureTEMP_RS (unsigned char code_sonde)
//{
//	unsigned char i,p;
//	unsigned char var_recept;
//	
//	UC_TABLE_EMI_SONDE[0]=code_sonde;							//Préparation trame demande de température E0 pour sonde air
//	UC_TABLE_EMI_SONDE[1]=0x0D;
//
//
//	DE2_ADM = 1;											// Mise en émission
//	Delay_1_mS();	// Attente de 1 ms
//
//	while (!U2STAbits.TRMT);
//	WriteUART2( UC_TABLE_EMI_SONDE[0]);			// Transmission de l'octet sur USART1
//	while (!U2STAbits.TRMT);
//	WriteUART2( UC_TABLE_EMI_SONDE[1]);			// Transmission de l'octet sur USART1
//	while (!U2STAbits.TRMT);
//	IFS1bits.U2TXIF=0;
//
//	DE2_ADM = 0;											// Mise en réception
//
//	Delay_1_mS();	// Attente de 1 ms
//
//	IFS1bits.U2RXIF = 0;
//	var_recept = ReadUART2();					// Charge la valeur du registre de réception dans var_recept
//	p = 0;
//	UC_TEMPO_2MS = 0;
//	do
//	{
//		if(U2STAbits.OERR)
//			U2STAbits.OERR = 0;
//	
//		if((U2STAbits.FERR)||(U2STAbits.PERR))
//			var_recept = ReadUART2();
//	
//		if(DataRdyUART2())								// Réception filaire par RX2
//		{
//			var_recept = ReadUART2();					// Charge la valeur du registre de réception dans var_recept
//			IFS1bits.U2RXIF = 0;
//		}
//		else
//			var_recept = 0xFF;			
//		if (var_recept==code_sonde)							//Si code début trame E0 => pointeur à 0
//			p=0;
//		if (var_recept != 0xFF)
//		{
//			if(p <= 10)
//				UC_TABLE_REC_SONDE[p] = var_recept;			//Réception de la trame dans la table de réception
//			if(p < 10)
//				p++;
//		}
//	}while ((var_recept !=0x0D)&&(UC_TEMPO_2MS<20));		//attente du 0x0D (fin de trame) ou pendant 20ms		
//
//	Delay_1_mS();	// Attente de 1 ms
//	Delay_1_mS();	// Attente de 1 ms
//	Delay_1_mS();	// Attente de 1 ms
//
//}

//void Lire_Sonde_Rs485(unsigned char adr, 
//				short * temp_air_avec_offset, 
//				short * correc_air, 
//				short * temp_air_mesure,				
//				short * temp_prog)					
//{
//	unsigned short tempS, tempH;
//
////	*temp_air_mesure = 8888;	
////  *temp_air_avec_offset = 8888;
//
//	LectureTEMP_RS (adr);													//Si pas de réponse I2C => demande sur la RS485
//	if (UC_TABLE_REC_SONDE[0]==adr)									//Si code sonde OK (E0 pour sonde air), alors mise en forme des données température
//	{
//		 *temp_air_mesure =((((unsigned short)UC_TABLE_REC_SONDE[2]-0x30)*100)+(((unsigned short)UC_TABLE_REC_SONDE[3]-0x30)*10)+(((unsigned short)UC_TABLE_REC_SONDE[4]-0x30)));
//
//		if (UC_TABLE_REC_SONDE[1]==0x2D)
//			*temp_air_mesure = -*temp_air_mesure;
//			
//		UC_TABLE_REC_SONDE[0] = 0x00;
//		UC_TABLE_REC_SONDE[1] = 0x00;
//		UC_TABLE_REC_SONDE[2] = 0x00;
//		UC_TABLE_REC_SONDE[3] = 0x00;
//		UC_TABLE_REC_SONDE[4] = 0x00;
//		UC_TABLE_REC_SONDE[5] = 0x00;
//			
//		*temp_air_avec_offset = *temp_air_mesure + *correc_air;
//	}
//	else
//		*temp_air_mesure = 8888;
//
//	if((*temp_air_avec_offset > -10)&&(*temp_air_avec_offset < 10))	// Permet d'éviter d'afficher - 0° si la température est inférieur à 1°
//		*temp_air_avec_offset = 0;
//}

// ---------------------------------------- fonction piur indus sécurité ----------------------------------------
void SaveDate(struct struct_Date *date,unsigned int adr)//unsigned int year, unsigned int month, unsigned int day
{
    // bornes simples
    if(date->year < 2000) date->year = 2000;
    if(date->month < 1 || date->month > 12) date->month = 1;
    if(date->day   < 1 || date->day   > 31) date->day   = 1;

    unsigned int y = (unsigned int)(date->year - 2000);

    EEPROMWriteByte(y,     adr + 0);
    EEPROMWriteByte(date->month, adr + 1);
    EEPROMWriteByte(date->day,   adr + 2);
}
BOOL LoadLastAccidentDate(struct struct_Date *date_last_acc)//unsigned int *year, unsigned int *month, unsigned int *day
{
    unsigned int y = EEPROMReadByte(ADR_LAST_ACCIDENT_DATE + 0);
    unsigned int m = EEPROMReadByte(ADR_LAST_ACCIDENT_DATE + 1);
    unsigned int d = EEPROMReadByte(ADR_LAST_ACCIDENT_DATE + 2);

    // EEPROM neuve / non écrite
    if (y == 0xFF && m == 0xFF && d == 0xFF)
        return 0;

    // Sanity check simple
    if (m < 1 || m > 12 || d < 1 || d > 31)
        return 0;

    if (date_last_acc->year)  date_last_acc->year  = 2000u + y;//2000u + (uint16_t)y
    if (date_last_acc->month) date_last_acc->month = m;
    if (date_last_acc->day)   date_last_acc->day   = d;
        
    return 1;
}
unsigned int ParseDate(const char* s, struct struct_Date* out)
{
    unsigned int y, m, d;
    if(!s || !out) return 0;
    /* attend exactement "YYYY-MM-DD" (10 char) */
    if(strlen(s) != 10) return 0;
    if(s[4] != '-' || s[7] != '-') return 0;

    y = (unsigned int)( (s[0]-'0')*1000u + (s[1]-'0')*100u + (s[2]-'0')*10u + (s[3]-'0') );
    m = (unsigned int)( (s[5]-'0')*10u + (s[6]-'0') );
    d = (unsigned int)( (s[8]-'0')*10u + (s[9]-'0') );

    if(y < 2000u || y > 2099u) return 0;
    if(m < 1u || m > 12u) return 0;
    if(d < 1u || d > 31u) return 0;

    out->year  = y;
    out->month = (unsigned char)m;
    out->day   = (unsigned char)d;
    return 1;
}
unsigned int DatesEqual(struct struct_Date* a, struct struct_Date* b)
{
    return (a->year==b->year) && (a->month==b->month) && (a->day==b->day);
}

// --------------------------- horaire -------------------------------------------------//
BOOL LoadHoraire(struct struct_Heure *horaire_all_ext,unsigned int adr)
{
    unsigned char h = EEPROMReadByte(adr + 0);
    unsigned char m = EEPROMReadByte(adr + 1);
    unsigned char s = 0;

    // EEPROM neuve / non écrite
    if (h == 0xFF && m == 0xFF )
        return 0;

    // Sanity simple
    if (h > 23 || m > 59 || h < 0 || m < 0)
        return 0;

    horaire_all_ext->hour = h;
    horaire_all_ext->min  = m;
    horaire_all_ext->sec  = s;
    return 1;
}



unsigned int ParseTime(const char* string, struct struct_Heure* out)
{
    unsigned h=0, m=0, s=0;
    if (!string || !out) return 0;

    // Attend "HH:MM"
    h = (unsigned int)( (string[0]-'0')*10u + (string[1]-'0') );
    m = (unsigned int)( (string[3]-'0')*10u + (string[4]-'0') );
    s = (unsigned int)( (string[6]-'0')*10u + (string[7]-'0') );
//    if (sscanf(s, "%2u:%2u", &h, &m) != 2) return 0;
    if (h > 23u || m > 59u) return 0;

    out->hour = (uint8_t)h;
    out->min  = (uint8_t)m;
    out->sec  = (uint8_t)s;
    return 1;
}

unsigned int TimeEqual(struct struct_Heure* a, struct struct_Heure* b)
{
    return (a->hour == b->hour) && (a->min == b->min);
}


void SaveHoraireAllExt(const struct struct_Heure *horaire_all_ext, unsigned int adr)
{
    uint8_t h = (horaire_all_ext->hour > 23 || horaire_all_ext->hour < 0) ? 7  : horaire_all_ext->hour;
    uint8_t m = (horaire_all_ext->min > 59 || horaire_all_ext->hour < 0) ? 0  : horaire_all_ext->min;

    EEPROMWriteByte(h, adr + 0);
    EEPROMWriteByte(m, adr + 1);
}


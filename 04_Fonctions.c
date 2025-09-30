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
	
    attente_synchro = 0;
    
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
	
    //Efface le LCD
	if( (B_RAM_NON_EFFACEE1 != 1)	||
		(B_RAM_NON_EFFACEE2 != 1))
	{
		B_RAM_NON_EFFACEE1 = 1;
		B_RAM_NON_EFFACEE2 = 1;
		
		memset(CODE_NTP_SERVER, 0x00, sizeof(CODE_NTP_SERVER));
		CODE_NTP_SERVER[0] = 'e';
		CODE_NTP_SERVER[1] = 'p';
		CODE_NTP_SERVER[2] = 'o';
		CODE_NTP_SERVER[3] = 'n';
		CODE_NTP_SERVER[4] = 'a';
		CODE_NTP_SERVER[5] = '.';
		CODE_NTP_SERVER[6] = 's';
		CODE_NTP_SERVER[7] = 't';
		CODE_NTP_SERVER[8] = 'r';
		CODE_NTP_SERVER[9] = 'a';
		CODE_NTP_SERVER[10] = 'm';
		CODE_NTP_SERVER[11] = 'a';
		CODE_NTP_SERVER[12] = 't';
		CODE_NTP_SERVER[13] = 'e';
		CODE_NTP_SERVER[14] = 'l';
		CODE_NTP_SERVER[15] = '.';
		CODE_NTP_SERVER[16] = 'l';
		CODE_NTP_SERVER[17] = 'o';
		CODE_NTP_SERVER[18] = 'c';
        CODE_NTP_SERVER[19] = 'a';
        CODE_NTP_SERVER[20] = 'l';
		
		CODE_IP_AUTO = 1;     
	}
	
	// Liaison asynchrone 1 (Synchro temps horloge mère)
	TRISFbits.TRISF8 = SORTIE;      // TX1
	TRISFbits.TRISF3 = ENTREE;      // RX1
	TRISFbits.TRISF5 = SORTIE;      // DE
	DE1_ADM = 1;
						
	U1BRG = 25;     // BAUD Rate Setting for 19200
//	U1BRG = 51;		// BAUD Rate Setting for 9600

	IPC3bits.U1TXIP = 4;    // Set Uart TX Interrupt Priority 4
	IPC2bits.U1RXIP = 4;    // Set Uart RX Interrupt Priority 4

	U1MODE = 0;             // 1-stop bit
                            // No Parity, 8-data bits
	U1MODEbits.USIDL = 1;
	U1MODEbits.BRGH = 0;            // Mode High speed
	
	U1STA = 0;
	U1STAbits.UTXISEL1 = 1;			// Interruption lorsque le charactère est transmit et que le buffer est vie
	U1STAbits.URXISEL = 0;
	U1MODEbits.UARTEN   = 1;		// Enable UART
	U1STAbits.UTXEN     = 1;		// Enable UART Tx
	
	IFS0bits.U1TXIF = 0;
	IFS4bits.U1ERIF = 0;


	// Liaison asynchrone 2 (Sondes de t°)
	TRISDbits.TRISD8 = SORTIE;      // TX2
	TRISDbits.TRISD10 = ENTREE;     // RX2
	TRISDbits.TRISD9 = SORTIE;      // DE2
	DE2_ADM = 1;
					
	U2BRG = 25;     // BAUD Rate Setting for 19200
//	U2BRG = 51;		// BAUD Rate Setting for 9600

	IPC7bits.U2TXIP = 4;        // Set Uart TX Interrupt Priority 4
	IPC7bits.U2RXIP = 4;        // Set Uart RX Interrupt Priority 4

	U2MODE = 0;                 // 1-stop bit
                                // No Parity, 8-data bits
	U2MODEbits.USIDL = 1;
	U2MODEbits.BRGH = 0;		// Mode High speed
	
	U2STA = 0;
	U2STAbits.UTXISEL1 = 1;         // Interruption lorsque le charactère est transmit et que le buffer est vie
	U2STAbits.URXISEL = 0;
	U2MODEbits.UARTEN   = 1;		// Enable UART
	U2STAbits.UTXEN     = 1;        // Enable UART Tx
	
	IFS1bits.U2TXIF = 0;
	IFS4bits.U2ERIF = 0;

	// Leds
	TRISDbits.TRISD5 = SORTIE;      // LED 1
	TRISDbits.TRISD6 = SORTIE;      // LED 2
	TRISDbits.TRISD7 = SORTIE;      // LED 3

	LED_SYNCHRO_HEURE = 0;
	LED_DCF = 0;
	LED_3 = 0;
	
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
	
	//initialisation variables à 0
	MEM_CODE_IP_AUTO = 0xff;
	SYNCHRO = 0x00;
	FIN_TRAME = 0x01;
	DIZ_HEURE_UTC = 0x00;
	UNI_HEURE_UTC = 0x00;
	DIZ_MIN_UTC = 0x00;
	UNI_MIN_UTC = 0x00;
	DIZ_SEC_UTC = 0x00;
	UNI_SEC_UTC = 0x00;
	DIZ_JOUR_UTC = 0x00;
	UNI_JOUR_UTC = 0x00;
	DIZ_MOIS_UTC = 0x00;
	UNI_MOIS_UTC = 0x00;
	MIL_AN_UTC = 0x00;
	CEN_AN_UTC =0x00;
	DIZ_AN_UTC = 0x00;
	UNI_AN_UTC = 0x00;
	CODE_DECAL_HORAIRE = 0x00;
	DECAL_HORAIRE = 0x00;
	DEC_HOR_NEG=0x00;
	DIZ_HEURE_DCF = 0x00;
	UNI_HEURE_DCF = 0x00;
	DIZ_MIN_DCF = 0x00;
	UNI_MIN_DCF = 0x00;
	DIZ_SEC_DCF = 0x00;
	UNI_SEC_DCF = 0x00;
	DIZ_JOUR_DCF = 0x00;
	UNI_JOUR_DCF = 0x00;
	DIZ_MOIS_DCF = 0x00;
	UNI_MOIS_DCF = 0x00;
	DIZ_AN_DCF = 0x00;
	UNI_AN_DCF = 0x00;
	NUM_JOUR_DCF = 0x00;
	UC_POINT_TRAME_RECEPT_RX1 = 0x00;
	UC_COMPT_NON_RECEP_CODE_DEBUT = 0;

	TRAME_OK = 0x00;
	NUM_SEC = 0x00;
	CPTR100ms = 0x00;
	CPTR_LED = 0x00;
	CODE_FUS_HOR = 0x00;
    
    FORCAGE_MARCHE = 0x00;
    FORCAGE_ARRET = 0x00;
    CYCLE_OK = 0;
    PLAGE_OK = 0;
    JOURS_OK = 0;
    J1 = 0;
    J2 = 0;
    J_WEEK = 0;
    WEEKEND = 0;
    INIT = 0;
    JOUR_PRECEDENT = 0;
    TRAME = 0;
    START_STOP = 0;
    HEURE_D = 0;
    HEURE_F = 0;
    HEURE_ACTU = 0;
    MIN_D = 0;
    MIN_F = 0;
    MIN_ACTU = 0;
    
    for(i=0;i<5;i++)
    {
    JOURS_SELECT[i] = 0x30;
    JOURS_SELECT_BUF[i] = 0x30;
    JOURS_SELECT_FINALE[i] = 0x30;
    }
    
	
	CODE_DECAL_HORAIRE=CONST_CODE_DECAL_HORAIRE;            //((PORTAbits.RA4*0x10)|(PORTBbits.RB5*0x08)|(PORTBbits.RB6*0x04)|(PORTBbits.RB7*0x02)|(PORTBbits.RB8*0x01));	
	CODE_CHANGEMENT_HEURE=CONST_CODE_CHANGEMENT_HEURE;      //((PORTAbits.RA4*0x10)|(PORTBbits.RB5*0x08)|(PORTBbits.RB6*0x04)|(PORTBbits.RB7*0x02)|(PORTBbits.RB8*0x01));

	NBR_HORLOGE_SECONDAIRE = 3;
	for(i=0;i<NBR_HORLOGE_SECONDAIRE;i++)
	{
		CODE_ADR_IP_HORL_SECONDAIRE[i][0]='1';
		CODE_ADR_IP_HORL_SECONDAIRE[i][1]='9';
		CODE_ADR_IP_HORL_SECONDAIRE[i][2]='2';
		CODE_ADR_IP_HORL_SECONDAIRE[i][3]='.';
		CODE_ADR_IP_HORL_SECONDAIRE[i][4]='1';
		CODE_ADR_IP_HORL_SECONDAIRE[i][5]='6';
		CODE_ADR_IP_HORL_SECONDAIRE[i][6]='8';
		CODE_ADR_IP_HORL_SECONDAIRE[i][7]='.';
		CODE_ADR_IP_HORL_SECONDAIRE[i][8]='1';
		CODE_ADR_IP_HORL_SECONDAIRE[i][9]='0';
		CODE_ADR_IP_HORL_SECONDAIRE[i][10]='0';
		CODE_ADR_IP_HORL_SECONDAIRE[i][11]='.';
		CODE_ADR_IP_HORL_SECONDAIRE[i][12]='1';
		CODE_ADR_IP_HORL_SECONDAIRE[i][13]=i+0x30;
		CODE_ADR_IP_HORL_SECONDAIRE[i][14]=0;
		
		CODE_NOM_HORL_SECONDAIRE[i][0] ='H';
		CODE_NOM_HORL_SECONDAIRE[i][1] ='o';
		CODE_NOM_HORL_SECONDAIRE[i][2] ='r';
		CODE_NOM_HORL_SECONDAIRE[i][3] =' ';
		CODE_NOM_HORL_SECONDAIRE[i][4] =i+0x30;
		CODE_NOM_HORL_SECONDAIRE[i][5] =0;
	}
	
	for(i=0;i<16;i++)
	{
		NOM_SONDE_TEMP[i][0] ='S';
		NOM_SONDE_TEMP[i][1] ='o';
		NOM_SONDE_TEMP[i][2] ='n';
		NOM_SONDE_TEMP[i][3] ='d';
		NOM_SONDE_TEMP[i][4] ='e';
		NOM_SONDE_TEMP[i][5] =' ';
		NOM_SONDE_TEMP[i][6] =i+0x30;
		NOM_SONDE_TEMP[i][7] =0;
	}
	UC_DUREE_AFFICHAGE[0] = 2;
	UC_DUREE_AFFICHAGE[1] = 2;
	UC_DUREE_AFFICHAGE[2] = 2;
	UC_DUREE_AFFICHAGE[3] = 0;
	UC_DUREE_AFFICHAGE[4] = 0;
	
	UC_HEURE_VIEILL[0][0] = 1;
	UC_HEURE_VIEILL[0][1] = 8;

	UC_HEURE_VIEILL[0][2] = 0;
	UC_HEURE_VIEILL[0][3] = 0;

	UC_HEURE_VIEILL[1][0] = 0;
	UC_HEURE_VIEILL[1][1] = 7;

	UC_HEURE_VIEILL[1][2] = 4;
	UC_HEURE_VIEILL[1][3] = 5;

	Mise_a_heure = 0;

	buf_heure_GMT[0] = '1';
	buf_heure_GMT[1] = '0';
	buf_heure_GMT[2] = ':';
	buf_heure_GMT[3] = '0';
	buf_heure_GMT[4] = '0';
	buf_heure_GMT[5] = ':';
	buf_heure_GMT[6] = '0';
	buf_heure_GMT[7] = '0';
	buf_heure_GMT[8] = ' ';
	buf_heure_GMT[9] = '0';
	buf_heure_GMT[10]= '6';
	buf_heure_GMT[11]= '/';
	buf_heure_GMT[12]= '0';
	buf_heure_GMT[13]= '4';
	buf_heure_GMT[14]= '/';
	buf_heure_GMT[15]= '2';
	buf_heure_GMT[16]= '0';
	buf_heure_GMT[17]= '2';
	buf_heure_GMT[18]= '2';
	buf_heure_GMT[19]= 0;
}

// ENTREES		: valeur à écrire sur le port data du LCD
// SORTIES		: aucune
// E/S			: aucune
// DESCRIPTION	: Init_Lcd
//
// GLOBALES		: aucune
void Init_Lcd (void)
{
	// Init du LCD
	Init_Lcd_1(0x30);
	ClrWdt();               // Mise à jour du watchdog
	Init_Lcd_1(0x30);
	ClrWdt();				// Mise à jour du watchdog
	Init_Lcd_1(0x30);
	ClrWdt();				// Mise à jour du watchdog
	Init_Lcd_1(0x38);
	ClrWdt();				// Mise à jour du watchdog
	Init_Lcd_1(0x0C);
	ClrWdt();				// Mise à jour du watchdog
	Init_Lcd_1(0x01);
	ClrWdt();				// Mise à jour du watchdog
	Init_Lcd_1(0x06);
	ClrWdt();				// Mise à jour du watchdog
}

// ENTREES		: valeur à écrire sur le port data du LCD
// SORTIES		: aucune
// E/S			: aucune
// DESCRIPTION	: Init_Lcd_1
//
// GLOBALES		: aucune
void Init_Lcd_1 ( unsigned char octet_lcd)
{
	LCD_WRITE_DATA (octet_lcd);
	Envoi_Instruction_Au_Lcd();
	LCD_RS = 0;
}

// ENTREES		: aucune
// SORTIES		: aucune
// DESCRIPTION	: Ecrire_2lignes_Lcd
//
// GLOBALES		:aucune
void Ecrire_2lignes_Lcd(void)
{
	CHARGER_2LIGNES_LCD();
	AFFICHER_2LIGNES_LCD();
}

// ENTREES		: aucune
// SORTIES		: aucune
// E/S			: aucune
// DESCRIPTION	: CHARGER_2LIGNES_LCD
//
// GLOBALES		: aucune
void CHARGER_2LIGNES_LCD(void)
{
	char i;
	// Attention le pointeur UP_VAR_LOCAL_LCD est de type const rom (poiteur sur les messages situés dans la mémoire ROM)
	for (i = 0; i < 16; i++)
	{
		UC_LCD_LIGNE[i] = *(UC_PT_CHAINE_LCD + i);
	}
}

// ENTREES		: aucune
// SORTIES		: aucune
// E/S			: aucune
// DESCRIPTION	: AFFICHER_2LIGNES_LCD
//
// GLOBALES		: aucune
void AFFICHER_2LIGNES_LCD(void)
{
		unsigned char i = 0, index_message = 0, msk = 0;
	unsigned char * message;
	
//Affichage de la ligne 1		
	LCD_RS = 0;	
	Delay_2_5_microS();     // Attente de 8 µs
	LCD_WRITE_DATA (0x80);
	Envoi_Instruction_Au_Lcd();
	index_message = 0;
	LCD_RS = 1;	
	
	for (index_message = 0; index_message < 8; index_message++)
	{
		LCD_WRITE_DATA (UC_LCD_LIGNE[index_message]);
		Envoi_Instruction_Au_Lcd();
	}
//Affichage de la ligne 2		
	LCD_RS = 0;	
	Delay_2_5_microS();     // Attente de 8 µs
	LCD_WRITE_DATA (0xC0);
	Envoi_Instruction_Au_Lcd();
	LCD_RS = 1;	
	
	for (index_message = 8; index_message < 16; index_message++)
	{
		LCD_WRITE_DATA (UC_LCD_LIGNE[index_message]);
		Envoi_Instruction_Au_Lcd();
	}
}

// ENTREES		: aucune
// SORTIES		: aucune
// E/S			: aucune
// DESCRIPTION	: LCD_WRITE_DATA
//
// GLOBALES		: aucune
void LCD_WRITE_DATA (unsigned char var)
{
	if(var & 0x01)
		LATEbits.LATE0 = 1;
	else
		LATEbits.LATE0 = 0;
		
	if(var & 0x02)
		LATEbits.LATE1 = 1;
	else
		LATEbits.LATE1 = 0;
		
	if(var & 0x04)
		LATEbits.LATE2 = 1;
	else
		LATEbits.LATE2 = 0;
		
	if(var & 0x08)
		LATEbits.LATE3 = 1;
	else
		LATEbits.LATE3 = 0;
		
	if(var & 0x10)
		LATEbits.LATE4 = 1;
	else
		LATEbits.LATE4 = 0;
		
	if(var & 0x20)
		LATEbits.LATE5 = 1;
	else
		LATEbits.LATE5 = 0;
		
	if(var & 0x40)
		LATEbits.LATE6 = 1;
	else
		LATEbits.LATE6 = 0;
		
	if(var & 0x80)
		LATEbits.LATE7 = 1;
	else
		LATEbits.LATE7 = 0;
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

// ENTREES		: aucune
// SORTIES		: aucune
// E/S			: aucune
// DESCRIPTION	: Envoi_Instruction_Au_Lcd
//
// GLOBALES		: aucune
void Envoi_Instruction_Au_Lcd (void)
{
	char busy_ok=0;
	
	LCD_RW = 0;
	Delay_2_5_microS();     // Attente de 2.5 µs
	
	LCD_E = 1;
	Delay_2_5_microS();		// Attente de 2.5 µs

	LCD_E = 0;
	Delay_2_5_microS();		// Attente de 2.5 µs
	
	LCD_RW = 1;
	LCD_RS  = 0;
	Delay_2_5_microS();		// Attente de 2.5 µs

	LCD_DIR_DB7 = ENTREE;       // Lecture de la broche busy (broche DB7)
	Delay_2_5_microS();			// Attente de 2.5 µs
	
	// Attente du retour du signal busy du LCD
	do
	{
		LCD_RW = 1;
		Delay_2_5_microS();     // Attente de 2.5 µs
		
		LCD_E = 1;
		Delay_2_5_microS();		// Attente de 2.5 µs
		
		busy_ok = LCD_READ_BUSY;
		LCD_E = 0;
		Delay_2_5_microS();		// Attente de 2.5 µs
		
		LCD_RW = 0;
		Delay_2_5_microS();		// Attente de 2.5 µs
		
	}while(busy_ok);			// Le LCD est prêt lorsque le signal busy est à 0

	LCD_DIR_DB7 = SORTIE;		// On remet le port en sortie
	LCD_RS  = 1;
	LCD_RW = 1;	
	Delay_2_5_microS();			// Attente de 2.5 µs
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

////////récupération du nombre d'heure de décalage
void DECALAGE_HORAIRE (void)		
{
	if (CODE_DECAL_HORAIRE >= 0x0C)						//Comparaison avec UTC code switch 0x0C
		DECAL_HORAIRE = CODE_DECAL_HORAIRE - 0x0C ;

	if (CODE_DECAL_HORAIRE < 0x0C)
	{
		DECAL_HORAIRE = 0x0C - CODE_DECAL_HORAIRE ;		//Décalage horaire négatif	
		DEC_HOR_NEG = 1;
	}
	if (CODE_DECAL_HORAIRE == 0x0C)
		CODE_FUS_HOR = 0x00;
	if (CODE_DECAL_HORAIRE == 0x0D)
		CODE_FUS_HOR = 0x01;
	if (CODE_DECAL_HORAIRE == 0x0E)
		CODE_FUS_HOR = 0x02;
	if (CODE_DECAL_HORAIRE == 0x0F)
		CODE_FUS_HOR = 0x03;
}

////////Réglage heure locale
void Mise_heure_locale (void)				
{
	struct tm heure;

	time_t temps_sec = 0, temps_sec1 = 0;
	unsigned int Dec_Hor_sec;

	heure.tm_sec =((DIZ_SEC_UTC * 10) + UNI_SEC_UTC);         //remplissage de la structure tm avec les données UTC
	heure.tm_min =((DIZ_MIN_UTC * 10) + UNI_MIN_UTC);
	heure.tm_hour =((DIZ_HEURE_UTC * 10) + UNI_HEURE_UTC);
	heure.tm_mday =((DIZ_JOUR_UTC * 10) + UNI_JOUR_UTC);
	heure.tm_mon =(((DIZ_MOIS_UTC * 10) + UNI_MOIS_UTC) - 1);                                                   //month = mois -1
	heure.tm_year =(((MIL_AN_UTC * 1000) + (CEN_AN_UTC * 100) + (DIZ_AN_UTC * 10) + UNI_AN_UTC) - 1900);        //year = année-1900
	heure.tm_wday = 0;
	heure.tm_yday = 0;
	heure.tm_isdst = 0;

	Dec_Hor_sec = (DECAL_HORAIRE * 3600) ;			//traduction du décalage horaire d'heure en secondes

	temps_sec = mktime(&heure);						//traduction du temps en seconde depuis 1970
	temps_sec1 = mktime(&heure);
    
	//Trame DCF
	if (DEC_HOR_NEG == 1)							//traitement du décalage horaire
	{
		temps_sec = (temps_sec - Dec_Hor_sec);		//+1min pour comuniquer l'heure exacte
		DEC_HOR_NEG = 0;
	}
	else
		temps_sec = (temps_sec + Dec_Hor_sec);		//+1min pour comuniquer l'heure exacte

	heure = *localtime(&temps_sec);					//traduction du temps en seconde en temps structure

	DIZ_SEC_DCF = (heure.tm_sec)/10;					//récupération des données temporelles
	UNI_SEC_DCF = (heure.tm_sec)%10;
	DIZ_MIN_DCF = (heure.tm_min)/10;
	UNI_MIN_DCF = (heure.tm_min)%10;
	DIZ_HEURE_DCF = (heure.tm_hour)/10;
	UNI_HEURE_DCF = (heure.tm_hour)%10;
	DIZ_JOUR_DCF = (heure.tm_mday)/10;
	UNI_JOUR_DCF = (heure.tm_mday)%10;
	DIZ_MOIS_DCF = ((heure.tm_mon)+1)/10;	
	UNI_MOIS_DCF = ((heure.tm_mon)+1)%10;	
	MIL_AN_DCF = (((heure.tm_year)+1900)/1000);	
	CEN_AN_DCF = (((heure.tm_year)+1900)%1000)/100;
	DIZ_AN_DCF = (((heure.tm_year)+1900)%100)/10;	
	UNI_AN_DCF = ((heure.tm_year)+1900)%10;
	NUM_JOUR_DCF = heure.tm_wday;

//	if (NUM_JOUR_DCF ==0)
//		NUM_JOUR_DCF = 7;

	//Trame RS485
	if (DEC_HOR_NEG ==1)                //traitement du décalage horaire
	{
		temps_sec1 = (temps_sec1 - Dec_Hor_sec);        //+1min pour comuniquer l'heure exacte
		DEC_HOR_NEG = 0;
	}
	else
		temps_sec1= (temps_sec1 + Dec_Hor_sec);         //+1min pour comuniquer l'heure exacte

	heure = *localtime(&temps_sec1);					//traduction du temps en seconde en temps structure
}

/////Chamgement d'heure été hiver DCF
void chamgement_heure_etehiver (void)
{
	struct tm heure;
	time_t temps_sec = 0, temps_sec1 = 0;

	unsigned char etat_chgtetehiver, index;
	int heure1;
	long mois_date_heure;

	heure.tm_sec =((DIZ_SEC_DCF * 10) + UNI_SEC_DCF);     //remplissage de la structure tm avec les données UTC
	heure.tm_min =((DIZ_MIN_DCF * 10) + UNI_MIN_DCF);
	heure.tm_hour =((DIZ_HEURE_DCF * 10) + UNI_HEURE_DCF);
	heure.tm_mday =((DIZ_JOUR_DCF * 10) + UNI_JOUR_DCF);
	heure.tm_mon =(((DIZ_MOIS_DCF * 10) + UNI_MOIS_DCF) - 1);												//month = mois -1
	heure.tm_year =(((MIL_AN_DCF * 1000) + (CEN_AN_DCF * 100) + (DIZ_AN_DCF * 10) + UNI_AN_DCF) - 1900);		//year = année-1900
	heure.tm_wday = 0;
	heure.tm_yday = 0;
	heure.tm_isdst = 0;

	//Pattes CN 15/16/21 pour réglage du code des dates de changement d'heure	
	etat_chgtetehiver = CODE_CHANGEMENT_HEURE;// ??? ((PORTBbits.RB9*0x04) | (PORTBbits.RB10*0x02) | (PORTBbits.RB11*0x01));
	index = ((DIZ_AN_UTC * 10) + UNI_AN_UTC) - 21;

	temps_sec = mktime(&heure);

	if (etat_chgtetehiver == 0x00)		//Pas de changement  d'heure été hiver
	{}

	if (etat_chgtetehiver == 0x01)		//EUROPE..	à 1h UTC
	{	
		mois_date_heure = ((DIZ_MOIS_UTC*100000)+(UNI_MOIS_UTC*10000)+(DIZ_JOUR_UTC*1000)+(UNI_JOUR_UTC*100)+(DIZ_HEURE_UTC*10)+UNI_HEURE_UTC);
		if ((CHANGEMENT_HEURE1 [index][0]<=mois_date_heure) && (mois_date_heure<CHANGEMENT_HEURE1[index][1])) 
		{
			temps_sec=temps_sec+3600;
//			heure1 = ((DIZ_HEURE_DCF*10)+UNI_HEURE_DCF)+1;
//			DIZ_HEURE_DCF = heure1/10;
//			UNI_HEURE_DCF = heure1%10;
//			DIZ_HEURE_RS = heure1/10;
//			UNI_HEURE_RS = heure1%10;
			CODE_FUS_HOR = 0x02;
		}
	}


	if (etat_chgtetehiver == 0x02)		//Etats unis..	à 2 h locale
	{	
		mois_date_heure = ((DIZ_MOIS_DCF*100000)+(UNI_MOIS_DCF*10000)+(DIZ_JOUR_DCF*1000)+(UNI_JOUR_DCF*100)+(DIZ_HEURE_DCF*10)+UNI_HEURE_DCF);
		if ((CHANGEMENT_HEURE2[index][0]<=mois_date_heure) && (mois_date_heure<CHANGEMENT_HEURE2[index][1]))
		{
			temps_sec=temps_sec+3600;
//			heure1 = ((DIZ_HEURE_DCF*10)+UNI_HEURE_DCF)+1;
//			DIZ_HEURE_DCF = heure1/10;
//			UNI_HEURE_DCF = heure1%10;
//			DIZ_HEURE_RS = heure1/10;
//			UNI_HEURE_RS = heure1%10;
			CODE_FUS_HOR = 0x02;
		}
	}

	if (etat_chgtetehiver == 0x03)		//Mexique...	à 2h locale
	{	
		mois_date_heure = ((DIZ_MOIS_DCF*100000)+(UNI_MOIS_DCF*10000)+(DIZ_JOUR_DCF*1000)+(UNI_JOUR_DCF*100)+(DIZ_HEURE_DCF*10)+UNI_HEURE_DCF);
		if ((CHANGEMENT_HEURE3[index][0]<=mois_date_heure) && (mois_date_heure<CHANGEMENT_HEURE3[index][1]))
		{
			temps_sec=temps_sec+3600;
//			heure1 = ((DIZ_HEURE_DCF*10)+UNI_HEURE_DCF)+1;
//			DIZ_HEURE_DCF = heure1/10;
//			UNI_HEURE_DCF = heure1%10;
//			DIZ_HEURE_RS = heure1/10;
//			UNI_HEURE_RS = heure1%10;
			CODE_FUS_HOR = 0x02;
		}
	}
	heure = *localtime(&temps_sec);					//traduction du temps en seconde en temps structure	

	struct tm *newtime;

	newtime = localtime(&temps_sec);
			
	strftime(buf_heure_GMT, 20, "%H:%M:%S %d/%m/%Y", newtime);
	buf_heure_GMT[20]='\0';

	//putsUART2((ROM char*)"\n\rHeure horloge :\r\n");//+buf[0]+buf[1]);
	//putsUART((char *)buf_heure_GMT);
	
	
	DIZ_HEURE_DCF = (heure.tm_hour)/10;
	UNI_HEURE_DCF = (heure.tm_hour)%10;
	DIZ_MIN_DCF = (heure.tm_min)/10;
	UNI_MIN_DCF = (heure.tm_min)%10;
	DIZ_SEC_DCF = (heure.tm_sec)/10;					//récupération des données temporelles
	UNI_SEC_DCF = (heure.tm_sec)%10;
	DIZ_JOUR_DCF = (heure.tm_mday)/10;
	UNI_JOUR_DCF = (heure.tm_mday)%10;
	DIZ_MOIS_DCF = ((heure.tm_mon)+1)/10;	
	UNI_MOIS_DCF = ((heure.tm_mon)+1)%10;	
	MIL_AN_DCF=	(((heure.tm_year)+1900)/1000);	
	CEN_AN_DCF=(((heure.tm_year)+1900)%1000)/100;
	DIZ_AN_DCF = (((heure.tm_year)+1900)%100)/10;	
	UNI_AN_DCF = ((heure.tm_year)+1900)%10;
	NUM_JOUR_DCF = heure.tm_wday;
}

void traite_24h (void)
{
	if((DIZ_HEURE_DCF==2)&&(UNI_HEURE_DCF==4))
	{
		DIZ_HEURE_DCF=0;
		UNI_HEURE_DCF=0;
	}	
}
void LectureTEMP_RS (unsigned char code_sonde)
{
	unsigned char i,p;
	unsigned char var_recept;
	
	UC_TABLE_EMI_SONDE[0]=code_sonde;							//Préparation trame demande de température E0 pour sonde air
	UC_TABLE_EMI_SONDE[1]=0x0D;


	DE2_ADM = 1;											// Mise en émission
	Delay_1_mS();	// Attente de 1 ms

	while (!U2STAbits.TRMT);
	WriteUART2( UC_TABLE_EMI_SONDE[0]);			// Transmission de l'octet sur USART1
	while (!U2STAbits.TRMT);
	WriteUART2( UC_TABLE_EMI_SONDE[1]);			// Transmission de l'octet sur USART1
	while (!U2STAbits.TRMT);
	IFS1bits.U2TXIF=0;

	DE2_ADM = 0;											// Mise en réception

	Delay_1_mS();	// Attente de 1 ms

	IFS1bits.U2RXIF = 0;
	var_recept = ReadUART2();					// Charge la valeur du registre de réception dans var_recept
	p = 0;
	UC_TEMPO_2MS = 0;
	do
	{
		if(U2STAbits.OERR)
			U2STAbits.OERR = 0;
	
		if((U2STAbits.FERR)||(U2STAbits.PERR))
			var_recept = ReadUART2();
	
		if(DataRdyUART2())								// Réception filaire par RX2
		{
			var_recept = ReadUART2();					// Charge la valeur du registre de réception dans var_recept
			IFS1bits.U2RXIF = 0;
		}
		else
			var_recept = 0xFF;			
		if (var_recept==code_sonde)							//Si code début trame E0 => pointeur à 0
			p=0;
		if (var_recept != 0xFF)
		{
			if(p <= 10)
				UC_TABLE_REC_SONDE[p] = var_recept;			//Réception de la trame dans la table de réception
			if(p < 10)
				p++;
		}
	}while ((var_recept !=0x0D)&&(UC_TEMPO_2MS<20));		//attente du 0x0D (fin de trame) ou pendant 20ms		

	Delay_1_mS();	// Attente de 1 ms
	Delay_1_mS();	// Attente de 1 ms
	Delay_1_mS();	// Attente de 1 ms

}

void Lire_Sonde_Rs485(unsigned char adr, 
				short * temp_air_avec_offset, 
				short * correc_air, 
				short * temp_air_mesure,				
				short * temp_prog)					
{
	unsigned short tempS, tempH;

//	*temp_air_mesure = 8888;	
//  *temp_air_avec_offset = 8888;

	LectureTEMP_RS (adr);													//Si pas de réponse I2C => demande sur la RS485
	if (UC_TABLE_REC_SONDE[0]==adr)									//Si code sonde OK (E0 pour sonde air), alors mise en forme des données température
	{
		 *temp_air_mesure =((((unsigned short)UC_TABLE_REC_SONDE[2]-0x30)*100)+(((unsigned short)UC_TABLE_REC_SONDE[3]-0x30)*10)+(((unsigned short)UC_TABLE_REC_SONDE[4]-0x30)));

		if (UC_TABLE_REC_SONDE[1]==0x2D)
			*temp_air_mesure = -*temp_air_mesure;
			
		UC_TABLE_REC_SONDE[0] = 0x00;
		UC_TABLE_REC_SONDE[1] = 0x00;
		UC_TABLE_REC_SONDE[2] = 0x00;
		UC_TABLE_REC_SONDE[3] = 0x00;
		UC_TABLE_REC_SONDE[4] = 0x00;
		UC_TABLE_REC_SONDE[5] = 0x00;
			
		*temp_air_avec_offset = *temp_air_mesure + *correc_air;
	}
	else
		*temp_air_mesure = 8888;

	if((*temp_air_avec_offset > -10)&&(*temp_air_avec_offset < 10))	// Permet d'éviter d'afficher - 0° si la température est inférieur à 1°
		*temp_air_avec_offset = 0;
}

void Affichage_Temp_Horloge(short temp)
{
	unsigned char var[4];
	var[0] = 0;
	var[1] = 0;
	var[2] = 0;
	var[3] = 0;
	
	if (temp == 8888)
	{
		UC_AFFICH_TEMP[0] = 0x40;
		UC_AFFICH_TEMP[1] = 0x40;
		UC_AFFICH_TEMP[2] = 0x00;
		UC_AFFICH_TEMP[3] = 0x00;
	}
	else
	{
		itoa2(temp/10,var);
		if (var[0] != '-')
		{
			if (var[1] == 0x00)
			{
				UC_AFFICH_TEMP[0] = 0x00;
				UC_AFFICH_TEMP[1] = CODE_ACCEPTABLE_1[var[0]];
			}	
			else
			{	
				UC_AFFICH_TEMP[0] = CODE_ACCEPTABLE_1[var[0]];
				UC_AFFICH_TEMP[1] = CODE_ACCEPTABLE_1[var[1]];
			}	
			UC_AFFICH_TEMP[2] = 0x4B;
			UC_AFFICH_TEMP[3] = 0x00;
		}
		else
		{
			if (var[2] != 0x00)
			{
				UC_AFFICH_TEMP[0] = 0x40;
				UC_AFFICH_TEMP[1] = CODE_ACCEPTABLE_1[var[1]];
				UC_AFFICH_TEMP[2] = CODE_ACCEPTABLE_1[var[2]];
				UC_AFFICH_TEMP[3] = 0x00;
			}                        
			else
			{
				UC_AFFICH_TEMP[0] = 0x40;
				UC_AFFICH_TEMP[1] = CODE_ACCEPTABLE_1[var[1]];
				UC_AFFICH_TEMP[2] = 0x4B;
				UC_AFFICH_TEMP[3] = 0x00;
			}                        
		}                        
	}                        
	UC_AFFICH_TEMP[4] = 0;
}

void Affichage_Temp(short temp)
{
	unsigned char var[4];
	var[0] = 0;
	var[1] = 0;
	var[2] = 0;
	var[3] = 0;
	
	if (temp == 8888)
	{
		UC_AFFICH_TEMP[0] = '-';
		UC_AFFICH_TEMP[1] = '-';
		UC_AFFICH_TEMP[2] = ' ';
		UC_AFFICH_TEMP[3] = ' ';
	}
	else
	{
		itoa2(temp/10,var);
		if (var[0] != '-')
		{
			if (var[1] == 0x00)
			{
				UC_AFFICH_TEMP[0] = ' ';
				UC_AFFICH_TEMP[1] = var[0];
			}	
			else
			{	
				UC_AFFICH_TEMP[0] = var[0];
				UC_AFFICH_TEMP[1] = var[1];
			}	
			UC_AFFICH_TEMP[2] = ' ';
			UC_AFFICH_TEMP[3] = ' ';
		}
		else
		{
			if (var[2] != 0x00)
			{
				UC_AFFICH_TEMP[0] = '-';
				UC_AFFICH_TEMP[1] = var[1];
				UC_AFFICH_TEMP[2] = var[2];
				UC_AFFICH_TEMP[3] = ' ';
			}                        
			else
			{
				UC_AFFICH_TEMP[0] = '-';
				UC_AFFICH_TEMP[1] = var[1];
				UC_AFFICH_TEMP[2] = ' ';
				UC_AFFICH_TEMP[3] = ' ';
			}                        
		}                        
	}                        
	UC_AFFICH_TEMP[4] = 0;
}
void Affichage_Temp_Page_Web(short temp)
{
	unsigned char var[4];
	var[0] = 0;
	var[1] = 0;
	var[2] = 0;
	var[3] = 0;
	
	if (temp == 8888)
	{
		UC_AFFICH_TEMP[0] = '0';
		UC_AFFICH_TEMP[1] = 0;
		UC_AFFICH_TEMP[2] = 0;
		UC_AFFICH_TEMP[3] = 0;
	}
	else
	{
		itoa2(temp/10,var);
		if (var[0] != '-')
		{
			UC_AFFICH_TEMP[0] = var[0];
			UC_AFFICH_TEMP[1] = var[1];
			UC_AFFICH_TEMP[2] = 0;
			UC_AFFICH_TEMP[3] = 0;
		}
		else
		{
			UC_AFFICH_TEMP[0] = '-';
			UC_AFFICH_TEMP[1] = var[1];
			UC_AFFICH_TEMP[2] = var[2];
			UC_AFFICH_TEMP[3] = 0;
		}                        
	}                        
	UC_AFFICH_TEMP[4] = 0;
}
void Affichage_Temp_sans_degre(short temp)
{
	unsigned char var[4];
	var[0] = 0;
	var[1] = 0;
	var[2] = 0;
	var[3] = 0;
	
	if (temp == 8888)
	{
		UC_AFFICH_TEMP[0] = '0';
		UC_AFFICH_TEMP[1] = 0;
		UC_AFFICH_TEMP[2] = 0;
		UC_AFFICH_TEMP[3] = 0;
	}
	else
	{
		itoa2(temp,var);
		if (var[0] != '-')
		{
			UC_AFFICH_TEMP[0] = var[0];
			UC_AFFICH_TEMP[1] = var[1];
			UC_AFFICH_TEMP[2] = var[2];
			UC_AFFICH_TEMP[3] = 0;
		}
		else
		{
			UC_AFFICH_TEMP[0] = '-';
			UC_AFFICH_TEMP[1] = var[1];
			UC_AFFICH_TEMP[2] = var[2];
			UC_AFFICH_TEMP[3] = var[3];
		}                        
	}                        
	UC_AFFICH_TEMP[4] = 0;
}

void Depart_Vieillissement(void)
{
    if (START_STOP == 0)            // Permet le lancement unique de la fonction si celle-ci est déjà en marche
    {
        LED_DCF = 1;
        TRAME = 1;                  // Permet de dire que l'on veut envoyer une trame de START
        Trame_Vieillissement();     // Fonction permettant d'envoyer les trames correspondantes
    }
}

void Arret_Vieillissement(void)
{
    if (START_STOP == 1)            
    {
        LED_DCF = 0;
        CYCLE_OK = 0;               // Réinitialise la valeur afin de sortir du cyle
        TRAME = 0;                  // Permet de dire que l'on veut envoyer une trame de STOP
        Trame_Vieillissement();  
    }
}

void Trame_Vieillissement(void)
{
    DE2_ADM = 1;
    Delay_1_mS();
    
    unsigned char i,j;
    if (TRAME == 1)
    {
        for(i = 0; i < 4; i++)
        {
            WriteUART2(Trame_GO[i]);
            while (!U2STAbits.TRMT);
        }
        IFS1bits.U2TXIF=0;
           
        START_STOP = 1;
    }
    if (TRAME == 0)
    {
        for(i = 0; i < 4; i++)
        {
            WriteUART2(Trame_STOP[i]);
            while (!U2STAbits.TRMT);
        }
        IFS1bits.U2TXIF=0;
            
        START_STOP = 0;
    }
}

void Test_Plage_Horaire(void)
{
    Concatener_Heure_Direct();      // Fonction permettant créer un nombre entier avec l'heure (ex: 19h35 --> 1935)
    Concatener_Heure_Plage();       // Fonction permettant créer des nombres entier avec l'heure des palges horaires
 
    if (J1 == 1)
    {
        if ((HEURE_D <= HEURE_ACTU) && (HEURE_ACTU<= 0x937))
            PLAGE_OK = 1;
        else
            PLAGE_OK = 0;
    }
    
    if (J_WEEK == 1)
        PLAGE_OK = 1;
    
    if (J2 == 1)
    {
        if ((0x00 <= HEURE_ACTU) && (HEURE_ACTU < HEURE_F))
            PLAGE_OK = 1;
        else
        {
            PLAGE_OK = 0;
            WEEKEND = 0;
        }
    }
}

void Test_Jours(void)
{  
    Test_Weekend();
    
    if (WEEKEND == 0)
    {
        if(JOURS_SELECT_FINALE[NUM_JOUR_DCF - 1] == 0x31)
        {
            JOURS_OK = 1;
            J1 = 1;
            J2 = 0;
            JOUR_PRECEDENT = NUM_JOUR_DCF;
        }
        else if (NUM_JOUR_DCF == JOUR_PRECEDENT + 1)
        {
            JOURS_OK = 1;
            J1 = 0;
            J2 = 1;
            
        }
        else
        {
            J1 = 0;
            J2 = 0;
            JOURS_OK = 0;
            JOUR_PRECEDENT = 0;
        }
    }
    else if (WEEKEND == 1)
    {
        if ((NUM_JOUR_DCF == 6) || (NUM_JOUR_DCF == 7))
        {
            JOURS_OK = 1;
            J1 = 0;
            J_WEEK = 1;
            J2 = 0;
        }
        else if (NUM_JOUR_DCF == 1)
        {
            JOURS_OK = 1;
            J1 = 0;
            J_WEEK = 0;
            J2 = 1;
        }
    }
}

void Concatener_Heure_Direct(void)
{   
    HEURE_ACTU = DIZ_HEURE_DCF * 0x3E8  + UNI_HEURE_DCF * 0x64 + DIZ_MIN_DCF * 0xA + UNI_MIN_DCF;
}

void Concatener_Heure_Plage(void)
{
    unsigned char i;
    
    for (i = 0; i < 2; i++)     // La boucle for permet de sélectionner l'heure de début ou l'heure de fin
    {
        if (i == 0)
            HEURE_D = UC_HEURE_VIEILL[i][0] * 0x3E8 + UC_HEURE_VIEILL[i][1] * 0x64 + UC_HEURE_VIEILL[i][2] * 0xA + UC_HEURE_VIEILL[i][3];

        if (i == 1)
            HEURE_F = UC_HEURE_VIEILL[i][0] * 0x3E8 + UC_HEURE_VIEILL[i][1] * 0x64 + UC_HEURE_VIEILL[i][2] * 0xA + UC_HEURE_VIEILL[i][3];
    }
}

void Test_Weekend(void)
{ 
    if (((NUM_JOUR_DCF == 6) || (NUM_JOUR_DCF == 7)) && ((NUM_JOUR_DCF == JOUR_PRECEDENT + 1) || (NUM_JOUR_DCF == JOUR_PRECEDENT + 2)))
        WEEKEND = 1;
    else if ((NUM_JOUR_DCF == 1) && (WEEKEND == 1))
        WEEKEND = 1;
}
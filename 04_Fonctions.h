////////////////////////////////////////////////////////////////////////////////
// NOM			: MA1P04XA.h
// TYPE			: UTILITAIRE
// SUJET		: sous-fonctions principales et secondaires
// AUTEUR 		: JOLY JP & BLIN Y
// VERSION		: A
// CREATION		: 25/01/2008
// DER. MODIF	: 
////////////////////////////////////////////////////////////////////////////////
unsigned char BusyXLCDstr(void);

void Delay_2_5_microS(void);        // 2.5 µs mesuré
void Delay_100_microS(void);
void Test_Weekend(void);
void Delay_10_mS(void);
void Init_Broches_Remappables(void);
void Initialisations(void);

void SaveDate(struct struct_Date *date,unsigned int adr);
BOOL LoadLastAccidentDate(struct struct_Date *date_last_acc);
unsigned int ParseDate(const char* s, struct struct_Date* out);
unsigned int DatesEqual(struct struct_Date* a, struct struct_Date* b);

BOOL LoadHoraire(struct struct_Heure *horaire_all_ext, unsigned int adr);
unsigned int ParseTime(const char* s, struct struct_Heure* out);
unsigned int TimeEqual(struct struct_Heure* a, struct struct_Heure* b);
void SaveHoraireAllExt(const struct struct_Heure *horaireAllExt,unsigned int adr);


extern void Delay_10_microS(void);
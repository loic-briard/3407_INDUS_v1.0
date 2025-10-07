#ifndef TIME_SYNC_H
#define TIME_SYNC_H

#include <stdint.h>
#include <stdbool.h>

/* Types de base (tes structures) */
//struct struct_Date { unsigned int year, month, day; };
//struct struct_Heure { unsigned int hour, min; };

/* Règle DST simple (heure d?été) */
typedef struct {
    bool enabled;              /* true = on calcule DST, false = ignore */
    /* Règles ?dernier dimanche? à 01:00 UTC (règle Europe/Paris classique) */
    /* Si tu veux une autre région, tu peux fournir des callbacks (voir plus bas). */
} TimeSync_DstEU;

/* Fuseau horaire et DST attachés au module */
typedef struct {
    int16_t base_offset_min;   /* ex: +60 pour UTC+1, -300 pour UTC-5 */
    bool    use_eu_rule;       /* si true, utilise l?algorithme EU par défaut */
    bool    dst_enabled;       /* active la gestion DST */
} TimeSync_TZ;

/* État courant */
typedef struct {
    struct struct_Date utc_date;
    struct struct_Heure utc_time;
    uint8_t utc_sec;

    struct struct_Date local_date;
    struct struct_Heure local_time;
    uint8_t local_sec;

    bool dst_active;           /* true si DST actif pour l?instant courant */
} TimeSync_State;

/* ===== API ===== */
void TimeSync_Init(TimeSync_TZ tz);           /* à appeler au boot (choix fuseau/DST) */
bool TimeSync_Update(void);                   /* lit SNTP, met à jour UTC + Local, renvoie true si OK */
void TimeSync_GetUTC(struct struct_Date* d, struct struct_Heure* h, uint8_t* sec);
void TimeSync_GetLocal(struct struct_Date* d, struct struct_Heure* h, uint8_t* sec, bool* dst_on);

/* Helpers de formatage / parsing */
void TimeSync_FormatISODate(const struct struct_Date* d, char out[11]);    /* YYYY-MM-DD */
void TimeSync_FormatHHMM(const struct struct_Heure* h, char out[6]);       /* HH:MM */
bool TimeSync_ParseISODate(const char* s, struct struct_Date* d);          /* "YYYY-MM-DD" */

#endif /* TIME_SYNC_H */

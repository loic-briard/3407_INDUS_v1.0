#ifndef TIME_SYNC_H
#define TIME_SYNC_H
#include <stdint.h>
#include <stdbool.h>

/* ===== Types de base ===== */
//extern struct struct_Date { unsigned int year, month, day; };
//extern struct struct_Heure { unsigned int hour, min; };

/* Snapshot prêt à l?emploi */
typedef struct {
    struct_Date  date;
    struct_Heure heure;   /* (nommé 'heure' pour éviter tout conflit de macro) */
    uint8_t             sec;
    bool                dst;      /* seulement pour la version locale */
} TimeSync_Instant;

/* ===== API ===== */
void TimeSync_Init(TimeSync_TZ tz);

/* Poser l'UTC directement (ex: depuis POST "Now" ou une source GPS/DCF77) */
void TimeSync_SetUTC(const struct struct_Date* d, const struct struct_Heure* h, uint8_t sec);
/* Parse et pose: "YYYY-MM-DDTHH:MM:SS(.ms)Z" ? UTC */
bool TimeSync_SetUTC_ISO8601(const char* iso_utc);

/* A appeler chaque seconde (depuis ton timer) :
   - +1s sur l'UTC
   - met à jour les secondes locales
   - et quand la minute UTC change, recalcule entièrement l'heure locale (fuseau + DST).
*/
void TimeSync_Tick1s(void);

/* Lecture */
void TimeSync_GetUTC(struct struct_Date* d, struct struct_Heure* h, uint8_t* sec);
void TimeSync_GetLocal(struct struct_Date* d, struct struct_Heure* h, uint8_t* sec, bool* dst_on);

/* Raccourcis "one-liner" */
TimeSync_Instant TimeSync_NowLocal(void);
TimeSync_Instant TimeSync_NowUTC(void);

/* Helpers de formatage */
void TimeSync_FormatISODate(const struct struct_Date* d, char out[11]);  /* "YYYY-MM-DD" */
void TimeSync_FormatHHMM(const struct struct_Heure* h, char out[6]);     /* "HH:MM"      */

#endif /* TIME_SYNC_H */

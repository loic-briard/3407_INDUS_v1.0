#include "03_Variables.h"
#include "time_sync.h"
#include <time.h>
#include <stdio.h>

/* Dépendances Microchip (SNTP) */
#include "TCPIP Stack/TCPIP.h"

/* ===== État module ===== */
static TimeSync_TZ    g_tz;
static TimeSync_State g_state;

/* ====== Petites utilitaires (pures) ====== */
static bool is_leap(unsigned y) {
    return ((y % 4u == 0u) && (y % 100u != 0u)) || (y % 400u == 0u);
}
static unsigned dim(unsigned y, unsigned m) {
    static const unsigned d[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
    return (m==2u) ? (d[1] + (is_leap(y)?1u:0u)) : d[m-1];
}
/* 0=Sun..6=Sat ? algo de Sakamoto (valide pour 1900..2099) */
static unsigned dow(unsigned y, unsigned m, unsigned d) {
    static const int t[12] = {0,3,2,5,0,3,5,1,4,6,2,4};
    if (m < 3) y -= 1;
    return (unsigned)((y + y/4 - y/100 + y/400 + t[m-1] + d) % 7);
}
/* Dernier dimanche d?un mois donné, à 01:00 UTC (UE) */
static void last_sunday_01utc(unsigned year, unsigned month,
                              struct struct_Date* out_d, struct struct_Heure* out_h)
{
    unsigned d = dim(year, month);
    while (dow(year, month, d) != 0u) d--; /* 0 = Sunday */
    out_d->year = year; out_d->month = month; out_d->day = d;
    out_h->hour = 1; out_h->min = 0;
}
/* Compare (date, time, sec) A < B ?  */
static int cmp_ts(const struct struct_Date* da, const struct struct_Heure* ha, uint8_t sa,
                  const struct struct_Date* db, const struct struct_Heure* hb, uint8_t sb)
{
    if (da->year  != db->year ) return (da->year  < db->year ) ? -1 : 1;
    if (da->month != db->month) return (da->month < db->month) ? -1 : 1;
    if (da->day   != db->day  ) return (da->day   < db->day  ) ? -1 : 1;
    if (ha->hour  != hb->hour ) return (ha->hour  < hb->hour ) ? -1 : 1;
    if (ha->min   != hb->min  ) return (ha->min   < hb->min  ) ? -1 : 1;
    if (sa        != sb       ) return (sa        < sb       ) ? -1 : 1;
    return 0;
}

/* Ajoute un décalage en minutes à un (date,time,sec) ? sans libc */
static void add_minutes(struct struct_Date* d, struct struct_Heure* h, uint8_t* sec, int minutes)
{
    /* on travaille en total minutes */
    int total = (int)h->hour*60 + (int)h->min + minutes;

    /* normaliser secondes si minutes != 0 (on garde sec) */
    while (total < 0) {
        /* recule d?un jour */
        if (d->day == 1) {
            if (d->month == 1) { d->year--; d->month = 12; }
            else d->month--;
            d->day = dim(d->year, d->month);
        } else d->day--;
        total += 24*60;
    }
    while (total >= 24*60) {
        /* avance d?un jour */
        total -= 24*60;
        if (d->day == dim(d->year, d->month)) {
            d->day = 1;
            if (d->month == 12) { d->month = 1; d->year++; }
            else d->month++;
        } else d->day++;
    }
    h->hour = (unsigned)(total/60);
    h->min  = (unsigned)(total%60);
    /* *sec inchangé */
}

/* Convertit time_t UTC -> structs UTC */
static void break_utc(time_t utc_secs, struct struct_Date* d, struct struct_Heure* h, uint8_t* s)
{
    struct tm* t = gmtime(&utc_secs); /* vrai UTC */
    d->year = (unsigned)(t->tm_year + 1900);
    d->month = (unsigned)(t->tm_mon + 1);
    d->day = (unsigned)t->tm_mday;
    h->hour = (unsigned)t->tm_hour;
    h->min  = (unsigned)t->tm_min;
    *s = (uint8_t)t->tm_sec;
}

/* Calcule si la DST européenne est active pour un instant UTC donné.
   Règle: actif de (dernier dimanche mars à 01:00 UTC) inclus
          jusqu?à (dernier dimanche octobre à 01:00 UTC) exclus. */
static bool dst_eu_active_utc(const struct struct_Date* d, const struct struct_Heure* h, uint8_t s)
{
    struct struct_Date start_d, end_d;
    struct struct_Heure start_h, end_h;
    last_sunday_01utc(d->year, 3, &start_d, &start_h);
    last_sunday_01utc(d->year,10, &end_d,   &end_h);

    int c_start = cmp_ts(&start_d, &start_h, 0, d, h, s);
    int c_end   = cmp_ts(d, h, s, &end_d, &end_h, 0);
    return (c_start <= 0) && (c_end < 0);
}

/* ===== Implémentation API ===== */
void TimeSync_Init(TimeSync_TZ tz)
{
    g_tz = tz;
    /* valeurs neutres */
    g_state.utc_date = (struct struct_Date){1970,1,1};
    g_state.utc_time = (struct struct_Heure){0,0};
    g_state.utc_sec  = 0;
    g_state.local_date = g_state.utc_date;
    g_state.local_time = g_state.utc_time;
    g_state.local_sec  = 0;
    g_state.dst_active = false;
}

bool TimeSync_Update(void)
{
    time_t utc_secs = SNTPGetUTCSeconds();
    if (utc_secs == 0) return false; /* à adapter: selon ta stack SNTP, 0 peut être valide */

    /* 1) UTC direct */
    break_utc(utc_secs, &g_state.utc_date, &g_state.utc_time, &g_state.utc_sec);

    /* 2) Calcul DST (si activée) sur l?INSTANT UTC (règle EU) */
    bool dst_on = false;
    if (g_tz.dst_enabled && g_tz.use_eu_rule) {
        dst_on = dst_eu_active_utc(&g_state.utc_date, &g_state.utc_time, g_state.utc_sec);
    }

    /* 3) Local = UTC + base_offset (+60 pour France) + (dst_on ? +60 : 0) */
    g_state.local_date = g_state.utc_date;
    g_state.local_time = g_state.utc_time;
    g_state.local_sec  = g_state.utc_sec;

    int total_offset = (int)g_tz.base_offset_min + (dst_on ? 60 : 0);
    add_minutes(&g_state.local_date, &g_state.local_time, &g_state.local_sec, total_offset);
    g_state.dst_active = dst_on;

    return true;
}

void TimeSync_GetUTC(struct struct_Date* d, struct struct_Heure* h, uint8_t* sec)
{
    if (d)   *d = g_state.utc_date;
    if (h)   *h = g_state.utc_time;
    if (sec) *sec = g_state.utc_sec;
}

void TimeSync_GetLocal(struct struct_Date* d, struct struct_Heure* h, uint8_t* sec, bool* dst_on)
{
    if (d)      *d = g_state.local_date;
    if (h)      *h = g_state.local_time;
    if (sec)    *sec = g_state.local_sec;
    if (dst_on) *dst_on = g_state.dst_active;
}

/* ===== Helpers format/parse ===== */
void TimeSync_FormatISODate(const struct struct_Date* d, char out[11])
{
    sprintf(out, "%04u-%02u-%02u", d->year, d->month, d->day);
}
void TimeSync_FormatHHMM(const struct struct_Heure* h, char out[6])
{
    sprintf(out, "%02u:%02u", h->hour, h->min);
}
bool TimeSync_ParseISODate(const char* s, struct struct_Date* d)
{
    unsigned y=0,m=0,day=0;
    if (!s || !d) return false;
    if (sscanf(s, "%u-%u-%u", &y,&m,&day) != 3) return false;
    if (y < 1970u || m<1u || m>12u) return false;
    if (day<1u || day>dim(y,m)) return false;
    d->year=y; d->month=m; d->day=day;
    return true;
}

#include "03_Variables.h"
#include "time_sync.h"
#include <stdio.h>

//static TimeSync_TZ    g_tz;
//static TimeSync_State g_state;

/* ======= Utils date/heure (pures) ======= */
static bool is_leap(unsigned y) {
    return ((y % 4u == 0u) && (y % 100u != 0u)) || (y % 400u == 0u);
}
static unsigned dim(unsigned y, unsigned m) {
    static const unsigned d[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
    return (m==2u) ? (d[1] + (is_leap(y)?1u:0u)) : d[m-1];
}
/* 0=Sun..6=Sat ? Sakamoto, valide large */
static unsigned dow(unsigned y, unsigned m, unsigned d) {
    static const int t[12] = {0,3,2,5,0,3,5,1,4,6,2,4};
    if (m < 3) y -= 1;
    return (unsigned)((y + y/4 - y/100 + y/400 + t[m-1] + d) % 7);
}
static void last_sunday_01utc(unsigned year, unsigned month,
                              struct struct_Date* out_d, struct struct_Heure* out_h)
{
    unsigned day = dim(year, month);
    while (dow(year, month, day) != 0u) day--; /* 0 = Sunday */
    out_d->year = year; out_d->month = month; out_d->day = day;
    out_h->hour = 1; out_h->min = 0;
}
/* Compare A vs B (date+heure+sec) : -1 <, 0 ==, 1 > */
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
/* +X minutes sur un (date,heure,sec) */
static void add_minutes(struct struct_Date* d, struct struct_Heure* h, uint8_t* sec, int minutes)
{
    int total = (int)h->hour*60 + (int)h->min + minutes;
    while (total < 0) {
        if (d->day == 1) {
            if (d->month == 1) { d->year--; d->month = 12; }
            else d->month--;
            d->day = dim(d->year, d->month);
        } else d->day--;
        total += 24*60;
    }
    while (total >= 24*60) {
        total -= 24*60;
        if (d->day == dim(d->year, d->month)) {
            d->day = 1;
            if (d->month == 12) { d->month = 1; d->year++; }
            else d->month++;
        } else d->day++;
    }
    h->hour = (unsigned)(total/60);
    h->min  = (unsigned)(total%60);
    (void)sec; /* secondes inchangées */
}
/* +1 seconde (UTC ou Local) */
static void add_one_sec(struct struct_Date* d, struct struct_Heure* h, uint8_t* sec)
{
    if (++(*sec) >= 60) {
        *sec = 0;
        if (++h->min >= 60) {
            h->min = 0;
            if (++h->hour >= 24) {
                h->hour = 0;
                if (++d->day > dim(d->year, d->month)) {
                    d->day = 1;
                    if (++d->month > 12) { d->month = 1; d->year++; }
                }
            }
        }
    }
}

/* DST Europe active pour un instant UTC ? (dernier dim. mars 01:00 UTC ? dernier dim. oct. 01:00 UTC) */
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

/* Recalcule l'heure locale à partir de l'UTC + fuseau + DST */
static void recompute_local_from_utc(void)
{
    bool dst_on = false;
    if (g_tz.dst_enabled && g_tz.use_eu_rule) {
        dst_on = dst_eu_active_utc(&g_state.utc_date, &g_state.utc_time, g_state.utc_sec);
    }
    g_state.dst_active = dst_on;

    int16_t total_offset = (int16_t)(g_tz.base_offset_min + (dst_on ? 60 : 0));
    g_state.local_date = g_state.utc_date;
    g_state.local_time = g_state.utc_time;
    g_state.local_sec  = g_state.utc_sec;
    add_minutes(&g_state.local_date, &g_state.local_time, &g_state.local_sec, total_offset);
    g_state.last_total_offset_min = total_offset;
}

/* ===== API ===== */
void TimeSync_Init(TimeSync_TZ tz)
{
    g_tz = tz;
    g_state.utc_date = (struct struct_Date){1970,1,1};
    g_state.utc_time = (struct struct_Heure){0,0};
    g_state.utc_sec  = 0;
    g_state.dst_active = false;
    g_state.last_total_offset_min = g_tz.base_offset_min;
    recompute_local_from_utc(); /* pose local initial */
}

void TimeSync_SetUTC(const struct struct_Date* d, const struct struct_Heure* h, uint8_t sec)
{
    if (!d || !h) return;
    g_state.utc_date = *d;
    g_state.utc_time = *h;
    g_state.utc_sec  = sec;
    recompute_local_from_utc();
}

/* "YYYY-MM-DDTHH:MM:SS(.ms)Z" ? UTC */
bool TimeSync_SetUTC_ISO8601(const char* iso)
{
    if (!iso) return false;
    unsigned Y,M,D,hh,mm,ss;
    /* %u s'arrête avant le '.' ? OK même si ".520Z" suit */
    int n = sscanf(iso, "%u-%u-%uT%u:%u:%u", &Y,&M,&D,&hh,&mm,&ss);
    if (n != 6) return false;
    if (M<1||M>12 || D<1||D>dim(Y,M) || hh>23 || mm>59 || ss>59) return false;
    struct struct_Date d = {Y,M,D};
    struct struct_Heure h = {hh,mm};
    TimeSync_SetUTC(&d, &h, (uint8_t)ss);
    return true;
}

/* A appeler toutes les 1s dans ton timer */
void TimeSync_Tick1s(void)
{
    unsigned prev_min = g_state.utc_time.min;

    /* 1) +1s sur l'UTC */
    add_one_sec(&g_state.utc_date, &g_state.utc_time, &g_state.utc_sec);

    /* 2) côté local :
          - si minute UTC inchangée ? +1s local (rapide)
          - si minute UTC a changé  ? RECALCUL complet local (fuseau + DST)
    */
    if (g_state.utc_time.min == prev_min) {
        add_one_sec(&g_state.local_date, &g_state.local_time, &g_state.local_sec);
    } else {
        recompute_local_from_utc();
    }
}

/* Getters */
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

/* Raccourcis */
TimeSync_Instant TimeSync_NowLocal(void)
{
    TimeSync_Instant t;
    TimeSync_GetLocal(&t.date, &t.heure, &t.sec, &t.dst);
    return t;
}
TimeSync_Instant TimeSync_NowUTC(void)
{
    TimeSync_Instant t;
    TimeSync_GetUTC(&t.date, &t.heure, &t.sec);
    t.dst = false;
    return t;
}

/* Helpers format */
void TimeSync_FormatISODate(const struct struct_Date* d, char out[11])
{
    sprintf(out, "%04u-%02u-%02u", d->year, d->month, d->day);
}
void TimeSync_FormatHHMM(const struct struct_Heure* h, char out[6])
{
    sprintf(out, "%02u:%02u", h->hour, h->min);
}

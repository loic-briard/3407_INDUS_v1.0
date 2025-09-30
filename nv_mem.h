#ifndef NV_MEM_H
#define NV_MEM_H

#include "TCPIP Stack/TCPIP.h"

extern APP_CONFIG AppConfig;

void InitNVMemContents(void);

#if defined(EEPROM_CS_TRIS) || defined(SPIFLASH_CS_TRIS)
void SaveNVMemContents(void);
void SaveAppConfig(const APP_CONFIG *ptrAppConfig);
void SavePowerMeterPreferences(void);
#endif

#endif

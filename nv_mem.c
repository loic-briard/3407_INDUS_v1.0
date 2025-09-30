#include "TCPIP Stack/TCPIP.h"
#include "02_Constantes.h"
#include "03_Variables.h"
#include "04_Fonctions.h"
#include "nv_mem.h"

APP_CONFIG AppConfig;
static unsigned short wOriginalAppConfigChecksum;

// Adresse MAC sérialisée (comme avant)
static ROM BYTE SerializedMACAddress[6] = {
    MY_DEFAULT_MAC_BYTE1, MY_DEFAULT_MAC_BYTE2, MY_DEFAULT_MAC_BYTE3,
    MY_DEFAULT_MAC_BYTE4, MY_DEFAULT_MAC_BYTE5, MY_DEFAULT_MAC_BYTE6
};

void InitNVMemContents(void)
{
    #if defined(EEPROM_CS_TRIS) || defined(SPIFLASH_CS_TRIS)
        unsigned char vNeedToSaveDefaults = 0;
    #endif

    while (1)
    {
        memset((void*)&AppConfig, 0x00, sizeof(AppConfig));

        AppConfig.Flags.bIsDHCPEnabled = TRUE;
        AppConfig.Flags.bInConfigMode  = TRUE;
        memcpypgm2ram((void*)&AppConfig.MyMACAddr, (ROM void*)SerializedMACAddress, sizeof(AppConfig.MyMACAddr));

        AppConfig.MyIPAddr.Val      = MY_DEFAULT_IP_ADDR_BYTE1 | MY_DEFAULT_IP_ADDR_BYTE2<<8ul | MY_DEFAULT_IP_ADDR_BYTE3<<16ul | MY_DEFAULT_IP_ADDR_BYTE4<<24ul;
        AppConfig.DefaultIPAddr.Val = AppConfig.MyIPAddr.Val;
        AppConfig.MyMask.Val        = MY_DEFAULT_MASK_BYTE1 | MY_DEFAULT_MASK_BYTE2<<8ul | MY_DEFAULT_MASK_BYTE3<<16ul | MY_DEFAULT_MASK_BYTE4<<24ul;
        AppConfig.DefaultMask.Val   = AppConfig.MyMask.Val;
        AppConfig.MyGateway.Val     = MY_DEFAULT_GATE_BYTE1 | MY_DEFAULT_GATE_BYTE2<<8ul | MY_DEFAULT_GATE_BYTE3<<16ul | MY_DEFAULT_GATE_BYTE4<<24ul;

        AppConfig.PrimaryDNSServer.Val   = MY_DEFAULT_PRIMARY_DNS_BYTE1   | MY_DEFAULT_PRIMARY_DNS_BYTE2<<8ul   | MY_DEFAULT_PRIMARY_DNS_BYTE3<<16ul   | MY_DEFAULT_PRIMARY_DNS_BYTE4<<24ul;
        AppConfig.SecondaryDNSServer.Val = MY_DEFAULT_SECONDARY_DNS_BYTE1 | MY_DEFAULT_SECONDARY_DNS_BYTE2<<8ul | MY_DEFAULT_SECONDARY_DNS_BYTE3<<16ul | MY_DEFAULT_SECONDARY_DNS_BYTE4<<24ul;

        memcpypgm2ram(AppConfig.NetBIOSName, (ROM void*)MY_DEFAULT_HOST_NAME, 16);
        FormatNetBIOSName(AppConfig.NetBIOSName);

        #if defined(WF_CS_TRIS)
            WF_ASSERT(sizeof(MY_DEFAULT_SSID_NAME) <= sizeof(AppConfig.MySSID));
            memcpypgm2ram(AppConfig.MySSID, (ROM void*)MY_DEFAULT_SSID_NAME, sizeof(MY_DEFAULT_SSID_NAME));
            AppConfig.SsidLength = sizeof(MY_DEFAULT_SSID_NAME) - 1;
            AppConfig.SecurityMode = MY_DEFAULT_WIFI_SECURITY_MODE;
            AppConfig.WepKeyIndex  = MY_DEFAULT_WEP_KEY_INDEX;

            #if (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_OPEN)
                memset(AppConfig.SecurityKey, 0x00, sizeof(AppConfig.SecurityKey));
                AppConfig.SecurityKeyLength = 0;
            #elif MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WEP_40
                memcpypgm2ram(AppConfig.SecurityKey, (ROM void*)MY_DEFAULT_WEP_KEYS_40, sizeof(MY_DEFAULT_WEP_KEYS_40) - 1);
                AppConfig.SecurityKeyLength = sizeof(MY_DEFAULT_WEP_KEYS_40) - 1;
            #elif MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WEP_104
                memcpypgm2ram(AppConfig.SecurityKey, (ROM void*)MY_DEFAULT_WEP_KEYS_104, sizeof(MY_DEFAULT_WEP_KEYS_104) - 1);
                AppConfig.SecurityKeyLength = sizeof(MY_DEFAULT_WEP_KEYS_104) - 1;
            #elif (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA_WITH_KEY) || \
                  (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA2_WITH_KEY) || \
                  (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA_AUTO_WITH_KEY)
                memcpypgm2ram(AppConfig.SecurityKey, (ROM void*)MY_DEFAULT_PSK, sizeof(MY_DEFAULT_PSK) - 1);
                AppConfig.SecurityKeyLength = sizeof(MY_DEFAULT_PSK) - 1;
            #elif (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA_WITH_PASS_PHRASE) || \
                  (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA2_WITH_PASS_PHRASE) || \
                  (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA_AUTO_WITH_PASS_PHRASE)
                memcpypgm2ram(AppConfig.SecurityKey, (ROM void*)MY_DEFAULT_PSK_PHRASE, sizeof(MY_DEFAULT_PSK_PHRASE) - 1);
                AppConfig.SecurityKeyLength = sizeof(MY_DEFAULT_PSK_PHRASE) - 1;
            #else
                #error "No security defined"
            #endif
        #endif

        wOriginalAppConfigChecksum = CalcIPChecksum((BYTE*)&AppConfig, sizeof(AppConfig));

        #if defined(EEPROM_CS_TRIS) || defined(SPIFLASH_CS_TRIS)
        {
            NVM_VALIDATION_STRUCT NVMValidationStruct;

            if (vNeedToSaveDefaults)
                SaveNVMemContents();

            #if defined(EEPROM_CS_TRIS)
                XEEReadArray(identifierOffset, (BYTE*)&NVMValidationStruct, sizeof(NVMValidationStruct));
                XEEReadArray(identifierOffset + sizeof(NVMValidationStruct), (BYTE*)&AppConfig, sizeof(AppConfig));
                XEEReadArray(powerMeterPreferencesOffset, (BYTE*)&gPowerMeterPreferences, sizeof(gPowerMeterPreferences));
            #else
                SPIFlashReadArray(identifierOffset, (BYTE*)&NVMValidationStruct, sizeof(NVMValidationStruct));
                SPIFlashReadArray(identifierOffset + sizeof(NVMValidationStruct), (BYTE*)&AppConfig, sizeof(AppConfig));
                SPIFlashReadArray(powerMeterPreferencesOffset, (BYTE*)&gPowerMeterPreferences, sizeof(gPowerMeterPreferences));
            #endif

            if ((NVMValidationStruct.wConfigurationLength != sizeof(AppConfig)) ||
                (NVMValidationStruct.wOriginalChecksum != wOriginalAppConfigChecksum) ||
                (NVMValidationStruct.wCurrentChecksum  != CalcIPChecksum((BYTE*)&AppConfig, sizeof(AppConfig))))
            {
                if (vNeedToSaveDefaults)
                    while(1);   // erreur HW/SPI

                vNeedToSaveDefaults = 1;
                continue;      // relance la boucle pour écrire les défauts
            }
            break; // EEPROM/Flash OK
        }
        #endif

        break; // pas d?EEPROM/Flash
    }
}

#if defined(EEPROM_CS_TRIS) || defined(SPIFLASH_CS_TRIS)
void SaveNVMemContents(void)
{
    #if defined(STACK_USE_MPFS2)
        if (structureEndOffset > NV_MEM_RESERVE_BLOCK)
            while(1);
    #endif
    SaveAppConfig(&AppConfig);
    SavePowerMeterPreferences();
}

void SaveAppConfig(const APP_CONFIG *ptrAppConfig)
{
    NVM_VALIDATION_STRUCT NVMValidationStruct;

    #if defined(STACK_USE_MPFS2)
        if (identifierOffset + sizeof(NVMValidationStruct) + sizeof(AppConfig) > MPFS_RESERVE_BLOCK)
            while(1);
    #endif

    NVMValidationStruct.wOriginalChecksum = wOriginalAppConfigChecksum;
    NVMValidationStruct.wCurrentChecksum  = CalcIPChecksum((BYTE*)ptrAppConfig, sizeof(APP_CONFIG));
    NVMValidationStruct.wConfigurationLength = sizeof(APP_CONFIG);

    #if defined(EEPROM_CS_TRIS)
        XEEBeginWrite(identifierOffset);
        XEEWriteArray((BYTE*)&NVMValidationStruct, sizeof(NVMValidationStruct));
        XEEWriteArray((BYTE*)ptrAppConfig, sizeof(APP_CONFIG));
    #else
        SPIFlashBeginWrite(identifierOffset);
        SPIFlashWriteArray((BYTE*)&NVMValidationStruct, sizeof(NVMValidationStruct));
        SPIFlashWriteArray((BYTE*)ptrAppConfig, sizeof(APP_CONFIG));
    #endif
}

void SavePowerMeterPreferences(void)
{
    #if defined(EEPROM_CS_TRIS)
        XEEBeginWrite(identifierOffset + sizeof(NVM_VALIDATION_STRUCT) + sizeof(AppConfig));
        XEEWriteArray((BYTE*)&gPowerMeterPreferences, sizeof(gPowerMeterPreferences));
        XEEEndWrite();
    #else
        SPIFlashBeginWrite(identifierOffset + sizeof(NVM_VALIDATION_STRUCT) + sizeof(AppConfig));
        SPIFlashWriteArray((BYTE*)&gPowerMeterPreferences, sizeof(gPowerMeterPreferences));
    #endif
}
#endif

#include "TCPIPConfig.h"
#include "TCPIP Stack/TCPIP.h"
#include "02_Constantes.h"
#include "03_Variables.h"
#include "04_Fonctions.h"

#include "TCPIPConfig.h"
#if defined(STACK_USE_ZEROCONF_MDNS_SD)
  #include "TCPIP Stack/mDNS.h"
#endif

void Stack_Init_All(void)
{
    StackInit();

    #if defined(STACK_USE_ZEROCONF_LINK_LOCAL)
        ZeroconfLLInitialize();
    #endif
    #if defined(STACK_USE_ZEROCONF_MDNS_SD)
        mDNSInitialize(MY_DEFAULT_HOST_NAME);
        mDNSMulticastFilterRegister();
    #endif
}

void Network_CoreTasks(void)
{
    StackTask();
    StackApplications();

    #if defined(STACK_USE_ZEROCONF_LINK_LOCAL)
        ZeroconfLLProcess();
    #endif
    #if defined(STACK_USE_ZEROCONF_MDNS_SD)
        mDNSProcess();
        // HTTPUpdateRecord(); // à appeler seulement si nécessaire
    #endif

    #if defined(STACK_USE_GENERIC_TCP_CLIENT_EXAMPLE)
        GenericTCPClient();
    #endif
    #if defined(STACK_USE_GENERIC_TCP_SERVER_EXAMPLE)
        GenericTCPServer();
    #endif
    #if defined(STACK_USE_SNMP_SERVER) && !defined(SNMP_TRAP_DISABLED)
        SNMPTrapDemo();
    #endif
}

void ApplyDHCPMode_IfChanged(void)
{
    if (MEM_CODE_IP_AUTO != CODE_IP_AUTO)
    {
        if (CODE_IP_AUTO == 1) DHCPEnable(0);
        else                   DHCPDisable(0);

        MEM_CODE_IP_AUTO = CODE_IP_AUTO;
    }
}

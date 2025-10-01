#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED="../TCPIP Stack/Announce.c" "../TCPIP Stack/ARP.c" "../TCPIP Stack/AutoIP.c" "../TCPIP Stack/BerkeleyAPI.c" "../TCPIP Stack/Delay.c" "../TCPIP Stack/DHCP.c" "../TCPIP Stack/DHCPs.c" "../TCPIP Stack/DNS.c" "../TCPIP Stack/DynDNS.c" "../TCPIP Stack/FTP.c" "../TCPIP Stack/Hashes.c" "../TCPIP Stack/Helpers.c" "../TCPIP Stack/HTTP2.c" "../TCPIP Stack/ICMP.c" "../TCPIP Stack/IP.c" "../TCPIP Stack/MPFS2.c" "../TCPIP Stack/NBNS.c" "../TCPIP Stack/Random.c" "../TCPIP Stack/Reboot.c" "../TCPIP Stack/SMTP.c" "../TCPIP Stack/SNMP.c" "../TCPIP Stack/SNTP.c" "../TCPIP Stack/SPIEEPROM.c" "../TCPIP Stack/SPIFlash.c" "../TCPIP Stack/SPIRAM.c" "../TCPIP Stack/SSL.c" "../TCPIP Stack/StackTsk.c" "../TCPIP Stack/TCP.c" "../TCPIP Stack/TCPPerformanceTest.c" "../TCPIP Stack/Telnet.c" "../TCPIP Stack/TFTPc.c" "../TCPIP Stack/Tick.c" "../TCPIP Stack/UART.c" "../TCPIP Stack/UDP.c" "../TCPIP Stack/UDPPerformanceTest.c" "../TCPIP Stack/ENCX24J600.c" "../TCPIP Stack/ENC28J60.c" "../TCPIP Stack/UART1TCPBridge.c" ../CustomHTTPApp.c "../Output file/PW_indus.s" ../Main.c ../board_init.c ../app_init.c ../net_tasks.c ../time_sync.c ../uart_utils.c ../interrupts.c ../03_variables.c ../02_Constantes.c ../04_Fonctions.c ../EEPROM.c ../nv_mem.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1563683617/Announce.o ${OBJECTDIR}/_ext/1563683617/ARP.o ${OBJECTDIR}/_ext/1563683617/AutoIP.o ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o ${OBJECTDIR}/_ext/1563683617/Delay.o ${OBJECTDIR}/_ext/1563683617/DHCP.o ${OBJECTDIR}/_ext/1563683617/DHCPs.o ${OBJECTDIR}/_ext/1563683617/DNS.o ${OBJECTDIR}/_ext/1563683617/DynDNS.o ${OBJECTDIR}/_ext/1563683617/FTP.o ${OBJECTDIR}/_ext/1563683617/Hashes.o ${OBJECTDIR}/_ext/1563683617/Helpers.o ${OBJECTDIR}/_ext/1563683617/HTTP2.o ${OBJECTDIR}/_ext/1563683617/ICMP.o ${OBJECTDIR}/_ext/1563683617/IP.o ${OBJECTDIR}/_ext/1563683617/MPFS2.o ${OBJECTDIR}/_ext/1563683617/NBNS.o ${OBJECTDIR}/_ext/1563683617/Random.o ${OBJECTDIR}/_ext/1563683617/Reboot.o ${OBJECTDIR}/_ext/1563683617/SMTP.o ${OBJECTDIR}/_ext/1563683617/SNMP.o ${OBJECTDIR}/_ext/1563683617/SNTP.o ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o ${OBJECTDIR}/_ext/1563683617/SPIFlash.o ${OBJECTDIR}/_ext/1563683617/SPIRAM.o ${OBJECTDIR}/_ext/1563683617/SSL.o ${OBJECTDIR}/_ext/1563683617/StackTsk.o ${OBJECTDIR}/_ext/1563683617/TCP.o ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1563683617/Telnet.o ${OBJECTDIR}/_ext/1563683617/TFTPc.o ${OBJECTDIR}/_ext/1563683617/Tick.o ${OBJECTDIR}/_ext/1563683617/UART.o ${OBJECTDIR}/_ext/1563683617/UDP.o ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o ${OBJECTDIR}/_ext/1563683617/ENC28J60.o ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o ${OBJECTDIR}/_ext/164278092/PW_indus.o ${OBJECTDIR}/_ext/1472/Main.o ${OBJECTDIR}/_ext/1472/board_init.o ${OBJECTDIR}/_ext/1472/app_init.o ${OBJECTDIR}/_ext/1472/net_tasks.o ${OBJECTDIR}/_ext/1472/time_sync.o ${OBJECTDIR}/_ext/1472/uart_utils.o ${OBJECTDIR}/_ext/1472/interrupts.o ${OBJECTDIR}/_ext/1472/03_variables.o ${OBJECTDIR}/_ext/1472/02_Constantes.o ${OBJECTDIR}/_ext/1472/04_Fonctions.o ${OBJECTDIR}/_ext/1472/EEPROM.o ${OBJECTDIR}/_ext/1472/nv_mem.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1563683617/Announce.o.d ${OBJECTDIR}/_ext/1563683617/ARP.o.d ${OBJECTDIR}/_ext/1563683617/AutoIP.o.d ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d ${OBJECTDIR}/_ext/1563683617/Delay.o.d ${OBJECTDIR}/_ext/1563683617/DHCP.o.d ${OBJECTDIR}/_ext/1563683617/DHCPs.o.d ${OBJECTDIR}/_ext/1563683617/DNS.o.d ${OBJECTDIR}/_ext/1563683617/DynDNS.o.d ${OBJECTDIR}/_ext/1563683617/FTP.o.d ${OBJECTDIR}/_ext/1563683617/Hashes.o.d ${OBJECTDIR}/_ext/1563683617/Helpers.o.d ${OBJECTDIR}/_ext/1563683617/HTTP2.o.d ${OBJECTDIR}/_ext/1563683617/ICMP.o.d ${OBJECTDIR}/_ext/1563683617/IP.o.d ${OBJECTDIR}/_ext/1563683617/MPFS2.o.d ${OBJECTDIR}/_ext/1563683617/NBNS.o.d ${OBJECTDIR}/_ext/1563683617/Random.o.d ${OBJECTDIR}/_ext/1563683617/Reboot.o.d ${OBJECTDIR}/_ext/1563683617/SMTP.o.d ${OBJECTDIR}/_ext/1563683617/SNMP.o.d ${OBJECTDIR}/_ext/1563683617/SNTP.o.d ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d ${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d ${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d ${OBJECTDIR}/_ext/1563683617/SSL.o.d ${OBJECTDIR}/_ext/1563683617/StackTsk.o.d ${OBJECTDIR}/_ext/1563683617/TCP.o.d ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d ${OBJECTDIR}/_ext/1563683617/Telnet.o.d ${OBJECTDIR}/_ext/1563683617/TFTPc.o.d ${OBJECTDIR}/_ext/1563683617/Tick.o.d ${OBJECTDIR}/_ext/1563683617/UART.o.d ${OBJECTDIR}/_ext/1563683617/UDP.o.d ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d ${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d ${OBJECTDIR}/_ext/164278092/PW_indus.o.d ${OBJECTDIR}/_ext/1472/Main.o.d ${OBJECTDIR}/_ext/1472/board_init.o.d ${OBJECTDIR}/_ext/1472/app_init.o.d ${OBJECTDIR}/_ext/1472/net_tasks.o.d ${OBJECTDIR}/_ext/1472/time_sync.o.d ${OBJECTDIR}/_ext/1472/uart_utils.o.d ${OBJECTDIR}/_ext/1472/interrupts.o.d ${OBJECTDIR}/_ext/1472/03_variables.o.d ${OBJECTDIR}/_ext/1472/02_Constantes.o.d ${OBJECTDIR}/_ext/1472/04_Fonctions.o.d ${OBJECTDIR}/_ext/1472/EEPROM.o.d ${OBJECTDIR}/_ext/1472/nv_mem.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1563683617/Announce.o ${OBJECTDIR}/_ext/1563683617/ARP.o ${OBJECTDIR}/_ext/1563683617/AutoIP.o ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o ${OBJECTDIR}/_ext/1563683617/Delay.o ${OBJECTDIR}/_ext/1563683617/DHCP.o ${OBJECTDIR}/_ext/1563683617/DHCPs.o ${OBJECTDIR}/_ext/1563683617/DNS.o ${OBJECTDIR}/_ext/1563683617/DynDNS.o ${OBJECTDIR}/_ext/1563683617/FTP.o ${OBJECTDIR}/_ext/1563683617/Hashes.o ${OBJECTDIR}/_ext/1563683617/Helpers.o ${OBJECTDIR}/_ext/1563683617/HTTP2.o ${OBJECTDIR}/_ext/1563683617/ICMP.o ${OBJECTDIR}/_ext/1563683617/IP.o ${OBJECTDIR}/_ext/1563683617/MPFS2.o ${OBJECTDIR}/_ext/1563683617/NBNS.o ${OBJECTDIR}/_ext/1563683617/Random.o ${OBJECTDIR}/_ext/1563683617/Reboot.o ${OBJECTDIR}/_ext/1563683617/SMTP.o ${OBJECTDIR}/_ext/1563683617/SNMP.o ${OBJECTDIR}/_ext/1563683617/SNTP.o ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o ${OBJECTDIR}/_ext/1563683617/SPIFlash.o ${OBJECTDIR}/_ext/1563683617/SPIRAM.o ${OBJECTDIR}/_ext/1563683617/SSL.o ${OBJECTDIR}/_ext/1563683617/StackTsk.o ${OBJECTDIR}/_ext/1563683617/TCP.o ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1563683617/Telnet.o ${OBJECTDIR}/_ext/1563683617/TFTPc.o ${OBJECTDIR}/_ext/1563683617/Tick.o ${OBJECTDIR}/_ext/1563683617/UART.o ${OBJECTDIR}/_ext/1563683617/UDP.o ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o ${OBJECTDIR}/_ext/1563683617/ENC28J60.o ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o ${OBJECTDIR}/_ext/164278092/PW_indus.o ${OBJECTDIR}/_ext/1472/Main.o ${OBJECTDIR}/_ext/1472/board_init.o ${OBJECTDIR}/_ext/1472/app_init.o ${OBJECTDIR}/_ext/1472/net_tasks.o ${OBJECTDIR}/_ext/1472/time_sync.o ${OBJECTDIR}/_ext/1472/uart_utils.o ${OBJECTDIR}/_ext/1472/interrupts.o ${OBJECTDIR}/_ext/1472/03_variables.o ${OBJECTDIR}/_ext/1472/02_Constantes.o ${OBJECTDIR}/_ext/1472/04_Fonctions.o ${OBJECTDIR}/_ext/1472/EEPROM.o ${OBJECTDIR}/_ext/1472/nv_mem.o

# Source Files
SOURCEFILES=../TCPIP Stack/Announce.c ../TCPIP Stack/ARP.c ../TCPIP Stack/AutoIP.c ../TCPIP Stack/BerkeleyAPI.c ../TCPIP Stack/Delay.c ../TCPIP Stack/DHCP.c ../TCPIP Stack/DHCPs.c ../TCPIP Stack/DNS.c ../TCPIP Stack/DynDNS.c ../TCPIP Stack/FTP.c ../TCPIP Stack/Hashes.c ../TCPIP Stack/Helpers.c ../TCPIP Stack/HTTP2.c ../TCPIP Stack/ICMP.c ../TCPIP Stack/IP.c ../TCPIP Stack/MPFS2.c ../TCPIP Stack/NBNS.c ../TCPIP Stack/Random.c ../TCPIP Stack/Reboot.c ../TCPIP Stack/SMTP.c ../TCPIP Stack/SNMP.c ../TCPIP Stack/SNTP.c ../TCPIP Stack/SPIEEPROM.c ../TCPIP Stack/SPIFlash.c ../TCPIP Stack/SPIRAM.c ../TCPIP Stack/SSL.c ../TCPIP Stack/StackTsk.c ../TCPIP Stack/TCP.c ../TCPIP Stack/TCPPerformanceTest.c ../TCPIP Stack/Telnet.c ../TCPIP Stack/TFTPc.c ../TCPIP Stack/Tick.c ../TCPIP Stack/UART.c ../TCPIP Stack/UDP.c ../TCPIP Stack/UDPPerformanceTest.c ../TCPIP Stack/ENCX24J600.c ../TCPIP Stack/ENC28J60.c ../TCPIP Stack/UART1TCPBridge.c ../CustomHTTPApp.c ../Output file/PW_indus.s ../Main.c ../board_init.c ../app_init.c ../net_tasks.c ../time_sync.c ../uart_utils.c ../interrupts.c ../03_variables.c ../02_Constantes.c ../04_Fonctions.c ../EEPROM.c ../nv_mem.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GB108
MP_LINKER_FILE_OPTION=,--script=p24FJ256GB108.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1563683617/Announce.o: ../TCPIP\ Stack/Announce.c  .generated_files/flags/default/f3c3178885b2313abff2f93373b9b7d9784995e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Announce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Announce.c"  -o ${OBJECTDIR}/_ext/1563683617/Announce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Announce.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/ARP.o: ../TCPIP\ Stack/ARP.c  .generated_files/flags/default/4ffc21abdce273af2c115bad836f81f4cfad3e11 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ARP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ARP.c"  -o ${OBJECTDIR}/_ext/1563683617/ARP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ARP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/AutoIP.o: ../TCPIP\ Stack/AutoIP.c  .generated_files/flags/default/a7dbd6b9b27a4a06e4eb5869a190c3cd9f76231a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/AutoIP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/AutoIP.c"  -o ${OBJECTDIR}/_ext/1563683617/AutoIP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/AutoIP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o: ../TCPIP\ Stack/BerkeleyAPI.c  .generated_files/flags/default/147afa4811678e8b64b8dd457c6069eb5f9faf8d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/BerkeleyAPI.c"  -o ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Delay.o: ../TCPIP\ Stack/Delay.c  .generated_files/flags/default/4649b1aa0bf3a31ec38e233ad7abd498773a5082 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Delay.c"  -o ${OBJECTDIR}/_ext/1563683617/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/DHCP.o: ../TCPIP\ Stack/DHCP.c  .generated_files/flags/default/d102d8040448f494570aafdf467e1cd14f0e1edf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DHCP.c"  -o ${OBJECTDIR}/_ext/1563683617/DHCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DHCP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/DHCPs.o: ../TCPIP\ Stack/DHCPs.c  .generated_files/flags/default/1537f8d8b474baaaacd43270b1a920e9d001517f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCPs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DHCPs.c"  -o ${OBJECTDIR}/_ext/1563683617/DHCPs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DHCPs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/DNS.o: ../TCPIP\ Stack/DNS.c  .generated_files/flags/default/fc88e2062bc689948b4bb61ebb4015b46190670f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DNS.c"  -o ${OBJECTDIR}/_ext/1563683617/DNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/DynDNS.o: ../TCPIP\ Stack/DynDNS.c  .generated_files/flags/default/1c4d19761b058df2f7978431a3bfe5b75fdacf95 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DynDNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DynDNS.c"  -o ${OBJECTDIR}/_ext/1563683617/DynDNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DynDNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/FTP.o: ../TCPIP\ Stack/FTP.c  .generated_files/flags/default/b74f5ae4a3891f25224ab1ba53cc31a77780a1b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/FTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/FTP.c"  -o ${OBJECTDIR}/_ext/1563683617/FTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/FTP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Hashes.o: ../TCPIP\ Stack/Hashes.c  .generated_files/flags/default/a55c6f3cde435c757a47cb1858ed049d873a5df1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Hashes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Hashes.c"  -o ${OBJECTDIR}/_ext/1563683617/Hashes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Hashes.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Helpers.o: ../TCPIP\ Stack/Helpers.c  .generated_files/flags/default/18b248845e3260a3e85b2320177da0426e9417f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Helpers.c"  -o ${OBJECTDIR}/_ext/1563683617/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Helpers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/HTTP2.o: ../TCPIP\ Stack/HTTP2.c  .generated_files/flags/default/41f5768ed013064f69d4258fd09f0b9baec978c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/HTTP2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/HTTP2.c"  -o ${OBJECTDIR}/_ext/1563683617/HTTP2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/HTTP2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/ICMP.o: ../TCPIP\ Stack/ICMP.c  .generated_files/flags/default/345c7b90fa9ce7294a004676f006de093c0af0ba .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ICMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ICMP.c"  -o ${OBJECTDIR}/_ext/1563683617/ICMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ICMP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/IP.o: ../TCPIP\ Stack/IP.c  .generated_files/flags/default/2e361661f81b037a9a54918631e746fdf488ae4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/IP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/IP.c"  -o ${OBJECTDIR}/_ext/1563683617/IP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/IP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/MPFS2.o: ../TCPIP\ Stack/MPFS2.c  .generated_files/flags/default/98e6a3c2ab4e678d13153eab6ae744be8dae673f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/MPFS2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/MPFS2.c"  -o ${OBJECTDIR}/_ext/1563683617/MPFS2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/MPFS2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/NBNS.o: ../TCPIP\ Stack/NBNS.c  .generated_files/flags/default/3cd18d6144cd5e3833a5e69406861362fbd1586e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/NBNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/NBNS.c"  -o ${OBJECTDIR}/_ext/1563683617/NBNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/NBNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Random.o: ../TCPIP\ Stack/Random.c  .generated_files/flags/default/a8377b18006885c5dd9710babfe22c04ee3328d9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Random.c"  -o ${OBJECTDIR}/_ext/1563683617/Random.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Random.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Reboot.o: ../TCPIP\ Stack/Reboot.c  .generated_files/flags/default/7a7785f4d988e32b9c9fd675572e640525d0f2cc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Reboot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Reboot.c"  -o ${OBJECTDIR}/_ext/1563683617/Reboot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Reboot.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SMTP.o: ../TCPIP\ Stack/SMTP.c  .generated_files/flags/default/7eb20375daeb3a9ca8014b2f1f22447423e30ffb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SMTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SMTP.c"  -o ${OBJECTDIR}/_ext/1563683617/SMTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SMTP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SNMP.o: ../TCPIP\ Stack/SNMP.c  .generated_files/flags/default/cb01eb155d5210dde6c6f2d5769beb1f45d6f545 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SNMP.c"  -o ${OBJECTDIR}/_ext/1563683617/SNMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SNMP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SNTP.o: ../TCPIP\ Stack/SNTP.c  .generated_files/flags/default/8337b48ddbba34a8971625dc630cb493e61658e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SNTP.c"  -o ${OBJECTDIR}/_ext/1563683617/SNTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SNTP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o: ../TCPIP\ Stack/SPIEEPROM.c  .generated_files/flags/default/88c7fd6376aab79361f44a0d0a2e0af105682b1c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIEEPROM.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SPIFlash.o: ../TCPIP\ Stack/SPIFlash.c  .generated_files/flags/default/235e361075469aca6f62b1ae0c5ca53c58d59ab0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIFlash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIFlash.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIFlash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SPIRAM.o: ../TCPIP\ Stack/SPIRAM.c  .generated_files/flags/default/4ffedc3fd03ec855866bb32026730ba1beec8156 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIRAM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIRAM.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIRAM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SSL.o: ../TCPIP\ Stack/SSL.c  .generated_files/flags/default/50af13a53099c42ea2d397ae4c09da3f45f0de40 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SSL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SSL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SSL.c"  -o ${OBJECTDIR}/_ext/1563683617/SSL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SSL.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/StackTsk.o: ../TCPIP\ Stack/StackTsk.c  .generated_files/flags/default/8088c9ffd6131f5d2c5e270afd84315cb6d0537b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/StackTsk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/StackTsk.c"  -o ${OBJECTDIR}/_ext/1563683617/StackTsk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/StackTsk.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/TCP.o: ../TCPIP\ Stack/TCP.c  .generated_files/flags/default/18b9e2bf0d812d09057086180221af1bc09968e5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TCP.c"  -o ${OBJECTDIR}/_ext/1563683617/TCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TCP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o: ../TCPIP\ Stack/TCPPerformanceTest.c  .generated_files/flags/default/431139ee47d17f61d0443a35a9c339fb6a03a815 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TCPPerformanceTest.c"  -o ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Telnet.o: ../TCPIP\ Stack/Telnet.c  .generated_files/flags/default/67f876075ea3b54eb5f35705ed70c1ed21d02c75 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Telnet.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Telnet.c"  -o ${OBJECTDIR}/_ext/1563683617/Telnet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Telnet.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/TFTPc.o: ../TCPIP\ Stack/TFTPc.c  .generated_files/flags/default/c86efebc746b38fbf36fcadabba855f645d70cbf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TFTPc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TFTPc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TFTPc.c"  -o ${OBJECTDIR}/_ext/1563683617/TFTPc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TFTPc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Tick.o: ../TCPIP\ Stack/Tick.c  .generated_files/flags/default/7c85b65ff981e092f68a87be4b9cc7733a0e35d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Tick.c"  -o ${OBJECTDIR}/_ext/1563683617/Tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Tick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/UART.o: ../TCPIP\ Stack/UART.c  .generated_files/flags/default/b73f09ceeb7b7e8a7b50ac770ce8840a5eee173d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UART.c"  -o ${OBJECTDIR}/_ext/1563683617/UART.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UART.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/UDP.o: ../TCPIP\ Stack/UDP.c  .generated_files/flags/default/1ec97113cfd440680d245dbcc575ed4ebd32406e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UDP.c"  -o ${OBJECTDIR}/_ext/1563683617/UDP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UDP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o: ../TCPIP\ Stack/UDPPerformanceTest.c  .generated_files/flags/default/760d06d041424c3c11d8bad89187dd1fdacdd54c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UDPPerformanceTest.c"  -o ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/ENCX24J600.o: ../TCPIP\ Stack/ENCX24J600.c  .generated_files/flags/default/d39f65f8dbfac52b8afc3fad1c8377d51d691f5b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ENCX24J600.c"  -o ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/ENC28J60.o: ../TCPIP\ Stack/ENC28J60.c  .generated_files/flags/default/ed12d2c9225cfaa3bc15e3efa80ed0155f574683 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENC28J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ENC28J60.c"  -o ${OBJECTDIR}/_ext/1563683617/ENC28J60.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o: ../TCPIP\ Stack/UART1TCPBridge.c  .generated_files/flags/default/5dcca0e800ff187827b1871e6066515af56b3f0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UART1TCPBridge.c"  -o ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/CustomHTTPApp.o: ../CustomHTTPApp.c  .generated_files/flags/default/832bcf2a4f3999b120674378a23fbff6c873d4c8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CustomHTTPApp.c  -o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/Main.o: ../Main.c  .generated_files/flags/default/52d17c54309117b51a33cb729beb0c4fdc703fe9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Main.c  -o ${OBJECTDIR}/_ext/1472/Main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/Main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/board_init.o: ../board_init.c  .generated_files/flags/default/2e6680e7270e3c2bdabedea856efdc2763ba2372 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/board_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/board_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../board_init.c  -o ${OBJECTDIR}/_ext/1472/board_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/board_init.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/app_init.o: ../app_init.c  .generated_files/flags/default/466db8a63354c670c381e2f69e7a4a0cfb51c420 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/app_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/app_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app_init.c  -o ${OBJECTDIR}/_ext/1472/app_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/app_init.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/net_tasks.o: ../net_tasks.c  .generated_files/flags/default/62b6a205fbe49547f4b862331fca0c63c55f1f53 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/net_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/net_tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../net_tasks.c  -o ${OBJECTDIR}/_ext/1472/net_tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/net_tasks.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/time_sync.o: ../time_sync.c  .generated_files/flags/default/c650e8f734e65f9bcd2267c524da4d787f35233a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/time_sync.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/time_sync.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../time_sync.c  -o ${OBJECTDIR}/_ext/1472/time_sync.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/time_sync.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/uart_utils.o: ../uart_utils.c  .generated_files/flags/default/6416375ccbbaffdba3d2b6f7c43edfff3361ffa4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/uart_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/uart_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../uart_utils.c  -o ${OBJECTDIR}/_ext/1472/uart_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/uart_utils.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/interrupts.o: ../interrupts.c  .generated_files/flags/default/257358be765246336fa651f57222772cf0c2cff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../interrupts.c  -o ${OBJECTDIR}/_ext/1472/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/03_variables.o: ../03_variables.c  .generated_files/flags/default/fac5aec78a00e2475a24c8eb3eb8a7a7b03ef281 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/03_variables.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/03_variables.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../03_variables.c  -o ${OBJECTDIR}/_ext/1472/03_variables.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/03_variables.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/02_Constantes.o: ../02_Constantes.c  .generated_files/flags/default/ff6b0c5e4a2ad562ba86d35d3dacf9e19b4b4cd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/02_Constantes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/02_Constantes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../02_Constantes.c  -o ${OBJECTDIR}/_ext/1472/02_Constantes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/02_Constantes.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/04_Fonctions.o: ../04_Fonctions.c  .generated_files/flags/default/ea0c06cf7ab1ccae81f355e62e461c1b9cbc310 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/04_Fonctions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/04_Fonctions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../04_Fonctions.c  -o ${OBJECTDIR}/_ext/1472/04_Fonctions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/04_Fonctions.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/EEPROM.o: ../EEPROM.c  .generated_files/flags/default/ffbc5bf0aac7bbe96bd14c352d7d46aff1e06ed1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/EEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/EEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../EEPROM.c  -o ${OBJECTDIR}/_ext/1472/EEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/EEPROM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/nv_mem.o: ../nv_mem.c  .generated_files/flags/default/5671be7316356b960bbbb3a637d7a0d1186be7bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/nv_mem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/nv_mem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../nv_mem.c  -o ${OBJECTDIR}/_ext/1472/nv_mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/nv_mem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
else
${OBJECTDIR}/_ext/1563683617/Announce.o: ../TCPIP\ Stack/Announce.c  .generated_files/flags/default/2475eaa3d9909914bd36c5f534773181a8b612ee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Announce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Announce.c"  -o ${OBJECTDIR}/_ext/1563683617/Announce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Announce.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/ARP.o: ../TCPIP\ Stack/ARP.c  .generated_files/flags/default/7c61abf11a78d5cfcc8c4e64836de4875687ad02 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ARP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ARP.c"  -o ${OBJECTDIR}/_ext/1563683617/ARP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ARP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/AutoIP.o: ../TCPIP\ Stack/AutoIP.c  .generated_files/flags/default/23aecd680969df94b00d28c4eab6112534809859 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/AutoIP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/AutoIP.c"  -o ${OBJECTDIR}/_ext/1563683617/AutoIP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/AutoIP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o: ../TCPIP\ Stack/BerkeleyAPI.c  .generated_files/flags/default/2bab62695f8dd98cffd6db0ecb6f843587995290 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/BerkeleyAPI.c"  -o ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Delay.o: ../TCPIP\ Stack/Delay.c  .generated_files/flags/default/711edb3d1d337e7c4de65a9b55ef1db6794e3796 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Delay.c"  -o ${OBJECTDIR}/_ext/1563683617/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Delay.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/DHCP.o: ../TCPIP\ Stack/DHCP.c  .generated_files/flags/default/acb978df2edbc3f25612c83a946432cfebb47bfa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DHCP.c"  -o ${OBJECTDIR}/_ext/1563683617/DHCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DHCP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/DHCPs.o: ../TCPIP\ Stack/DHCPs.c  .generated_files/flags/default/a92502150f7b65edabfe39cac809c01705cd8158 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCPs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DHCPs.c"  -o ${OBJECTDIR}/_ext/1563683617/DHCPs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DHCPs.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/DNS.o: ../TCPIP\ Stack/DNS.c  .generated_files/flags/default/f078d45e5105a05b780b1cca3d955e8bf0db29c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DNS.c"  -o ${OBJECTDIR}/_ext/1563683617/DNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DNS.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/DynDNS.o: ../TCPIP\ Stack/DynDNS.c  .generated_files/flags/default/10332b1910ca2dae3a360595078f3ff46bbeceee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DynDNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DynDNS.c"  -o ${OBJECTDIR}/_ext/1563683617/DynDNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DynDNS.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/FTP.o: ../TCPIP\ Stack/FTP.c  .generated_files/flags/default/6bbd00833a13f4f8342452d03aa4d688edd754e3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/FTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/FTP.c"  -o ${OBJECTDIR}/_ext/1563683617/FTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/FTP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Hashes.o: ../TCPIP\ Stack/Hashes.c  .generated_files/flags/default/d07a86c8e93b2ef4c20210fca0de042b138d08cb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Hashes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Hashes.c"  -o ${OBJECTDIR}/_ext/1563683617/Hashes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Hashes.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Helpers.o: ../TCPIP\ Stack/Helpers.c  .generated_files/flags/default/b44780b93907908e012768322cb1654d6ed1e78b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Helpers.c"  -o ${OBJECTDIR}/_ext/1563683617/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Helpers.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/HTTP2.o: ../TCPIP\ Stack/HTTP2.c  .generated_files/flags/default/aa5e87d03366e74d88d3f61f9a292087a5d0166e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/HTTP2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/HTTP2.c"  -o ${OBJECTDIR}/_ext/1563683617/HTTP2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/HTTP2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/ICMP.o: ../TCPIP\ Stack/ICMP.c  .generated_files/flags/default/bc09f9c09cfe48af0104d2fff9f7e2df5a3e5d84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ICMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ICMP.c"  -o ${OBJECTDIR}/_ext/1563683617/ICMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ICMP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/IP.o: ../TCPIP\ Stack/IP.c  .generated_files/flags/default/19541979c726393d05f094a71fe9ce946e57aea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/IP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/IP.c"  -o ${OBJECTDIR}/_ext/1563683617/IP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/IP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/MPFS2.o: ../TCPIP\ Stack/MPFS2.c  .generated_files/flags/default/c9e727b916374ace25aa7d8d5aa91ce117811e00 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/MPFS2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/MPFS2.c"  -o ${OBJECTDIR}/_ext/1563683617/MPFS2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/MPFS2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/NBNS.o: ../TCPIP\ Stack/NBNS.c  .generated_files/flags/default/bfe777cc13b1fc0637a2b8bbf55a8d5edcd8d918 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/NBNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/NBNS.c"  -o ${OBJECTDIR}/_ext/1563683617/NBNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/NBNS.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Random.o: ../TCPIP\ Stack/Random.c  .generated_files/flags/default/717fa6c405e9818912e4a614533dc4d26680fcb3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Random.c"  -o ${OBJECTDIR}/_ext/1563683617/Random.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Random.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Reboot.o: ../TCPIP\ Stack/Reboot.c  .generated_files/flags/default/d406500b966ad502c927c728d09de05ed08cae04 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Reboot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Reboot.c"  -o ${OBJECTDIR}/_ext/1563683617/Reboot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Reboot.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SMTP.o: ../TCPIP\ Stack/SMTP.c  .generated_files/flags/default/fd8adcd3678fcbf3a5c6856088a394ed6431a781 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SMTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SMTP.c"  -o ${OBJECTDIR}/_ext/1563683617/SMTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SMTP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SNMP.o: ../TCPIP\ Stack/SNMP.c  .generated_files/flags/default/d51f91eb4181b877f38a30734bb91aaa7a7151e9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SNMP.c"  -o ${OBJECTDIR}/_ext/1563683617/SNMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SNMP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SNTP.o: ../TCPIP\ Stack/SNTP.c  .generated_files/flags/default/2891c1cfd355e8d126931bc1c7345edfb84790a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SNTP.c"  -o ${OBJECTDIR}/_ext/1563683617/SNTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SNTP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o: ../TCPIP\ Stack/SPIEEPROM.c  .generated_files/flags/default/aacf05722067a600599d5a6b4b792c6f02a823a2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIEEPROM.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SPIFlash.o: ../TCPIP\ Stack/SPIFlash.c  .generated_files/flags/default/b119a32ac2415db500f80d3b489f034e4cd9329d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIFlash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIFlash.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIFlash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SPIRAM.o: ../TCPIP\ Stack/SPIRAM.c  .generated_files/flags/default/ea7bfbc73ed7d8523e582814e638c45dd15ba61d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIRAM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIRAM.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIRAM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/SSL.o: ../TCPIP\ Stack/SSL.c  .generated_files/flags/default/1c715aaea819f68d72100dc5f8057d0851d15ba5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SSL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SSL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SSL.c"  -o ${OBJECTDIR}/_ext/1563683617/SSL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SSL.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/StackTsk.o: ../TCPIP\ Stack/StackTsk.c  .generated_files/flags/default/5f06d09d9ad6410d8924aa02a08dae0817b68be4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/StackTsk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/StackTsk.c"  -o ${OBJECTDIR}/_ext/1563683617/StackTsk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/StackTsk.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/TCP.o: ../TCPIP\ Stack/TCP.c  .generated_files/flags/default/fc1fe254995e7fc2ec923b20a0e0cfef114f2d1c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TCP.c"  -o ${OBJECTDIR}/_ext/1563683617/TCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TCP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o: ../TCPIP\ Stack/TCPPerformanceTest.c  .generated_files/flags/default/161657cbc9625f7d8a96216c9778018981396d65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TCPPerformanceTest.c"  -o ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Telnet.o: ../TCPIP\ Stack/Telnet.c  .generated_files/flags/default/e84e9ee6fb807193dea506d9d7771bdf1adfdf7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Telnet.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Telnet.c"  -o ${OBJECTDIR}/_ext/1563683617/Telnet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Telnet.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/TFTPc.o: ../TCPIP\ Stack/TFTPc.c  .generated_files/flags/default/503b404ccdc217cd1b19629653e5c5c8fb139f28 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TFTPc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TFTPc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TFTPc.c"  -o ${OBJECTDIR}/_ext/1563683617/TFTPc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TFTPc.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/Tick.o: ../TCPIP\ Stack/Tick.c  .generated_files/flags/default/92cd28b525949c38cdd011b7dea8c6e80aa777cd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Tick.c"  -o ${OBJECTDIR}/_ext/1563683617/Tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Tick.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/UART.o: ../TCPIP\ Stack/UART.c  .generated_files/flags/default/f0a090967d9f061a1133b5049db57f3f12d1719d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UART.c"  -o ${OBJECTDIR}/_ext/1563683617/UART.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UART.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/UDP.o: ../TCPIP\ Stack/UDP.c  .generated_files/flags/default/7c147688c273f7d14250107d293ff9b24733cd15 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UDP.c"  -o ${OBJECTDIR}/_ext/1563683617/UDP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UDP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o: ../TCPIP\ Stack/UDPPerformanceTest.c  .generated_files/flags/default/a066674fb605a8ad7dfc0b172d862d9223ec3ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UDPPerformanceTest.c"  -o ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/ENCX24J600.o: ../TCPIP\ Stack/ENCX24J600.c  .generated_files/flags/default/c616b8c842d5a88a97cf0e18b53912436d062c06 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ENCX24J600.c"  -o ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/ENC28J60.o: ../TCPIP\ Stack/ENC28J60.c  .generated_files/flags/default/51b30b69bcc5f9c1eb9abf850e8bf0df7ee7893f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENC28J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ENC28J60.c"  -o ${OBJECTDIR}/_ext/1563683617/ENC28J60.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o: ../TCPIP\ Stack/UART1TCPBridge.c  .generated_files/flags/default/128faffd8e9ac9841f4603ba3531a93b0d2213db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UART1TCPBridge.c"  -o ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/CustomHTTPApp.o: ../CustomHTTPApp.c  .generated_files/flags/default/f0cf62ed1ecb96b24bb1daab59cabbe24dd9097c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CustomHTTPApp.c  -o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/Main.o: ../Main.c  .generated_files/flags/default/72e65f3c197bab34c648f0a3c05d46fada8befa4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Main.c  -o ${OBJECTDIR}/_ext/1472/Main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/Main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/board_init.o: ../board_init.c  .generated_files/flags/default/695c9f601d77ccc2f95083dcc4e9a5e6ffabdc87 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/board_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/board_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../board_init.c  -o ${OBJECTDIR}/_ext/1472/board_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/board_init.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/app_init.o: ../app_init.c  .generated_files/flags/default/8ba911818831146e94fbcf3b67a6e583d217b934 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/app_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/app_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app_init.c  -o ${OBJECTDIR}/_ext/1472/app_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/app_init.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/net_tasks.o: ../net_tasks.c  .generated_files/flags/default/aee8b7f3945c6d60885e38279791782c8dd423e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/net_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/net_tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../net_tasks.c  -o ${OBJECTDIR}/_ext/1472/net_tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/net_tasks.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/time_sync.o: ../time_sync.c  .generated_files/flags/default/9241dba28f9c9d8162fa0a3c48d172b2726e5ffb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/time_sync.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/time_sync.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../time_sync.c  -o ${OBJECTDIR}/_ext/1472/time_sync.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/time_sync.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/uart_utils.o: ../uart_utils.c  .generated_files/flags/default/d01d5bccdd51be5bb5d96577258a427c5a77b6f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/uart_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/uart_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../uart_utils.c  -o ${OBJECTDIR}/_ext/1472/uart_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/uart_utils.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/interrupts.o: ../interrupts.c  .generated_files/flags/default/995c787b823db5fb3b47fbd370a554ba43c75d6c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../interrupts.c  -o ${OBJECTDIR}/_ext/1472/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/interrupts.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/03_variables.o: ../03_variables.c  .generated_files/flags/default/ff2fc66edb2a2936eeac18cb93846fa1b2bf781e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/03_variables.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/03_variables.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../03_variables.c  -o ${OBJECTDIR}/_ext/1472/03_variables.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/03_variables.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/02_Constantes.o: ../02_Constantes.c  .generated_files/flags/default/61521bcca650441515df63d1dff4976ad349b57d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/02_Constantes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/02_Constantes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../02_Constantes.c  -o ${OBJECTDIR}/_ext/1472/02_Constantes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/02_Constantes.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/04_Fonctions.o: ../04_Fonctions.c  .generated_files/flags/default/93673f0c4e39b42906591f2412844b8568f1b4ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/04_Fonctions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/04_Fonctions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../04_Fonctions.c  -o ${OBJECTDIR}/_ext/1472/04_Fonctions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/04_Fonctions.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/EEPROM.o: ../EEPROM.c  .generated_files/flags/default/e311febd63c88ec866a23d9c2761c9b12261f8c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/EEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/EEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../EEPROM.c  -o ${OBJECTDIR}/_ext/1472/EEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/EEPROM.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
${OBJECTDIR}/_ext/1472/nv_mem.o: ../nv_mem.c  .generated_files/flags/default/cb8695c1931b93a0fd4d8815eb238d071260b396 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/nv_mem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/nv_mem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../nv_mem.c  -o ${OBJECTDIR}/_ext/1472/nv_mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/nv_mem.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/164278092/PW_indus.o: ../Output\ file/PW_indus.s  .generated_files/flags/default/516b00dbc83f8f0dbc70aecaef4a85d3a06a5b28 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/164278092" 
	@${RM} ${OBJECTDIR}/_ext/164278092/PW_indus.o.d 
	@${RM} ${OBJECTDIR}/_ext/164278092/PW_indus.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  "../Output file/PW_indus.s"  -o ${OBJECTDIR}/_ext/164278092/PW_indus.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/164278092/PW_indus.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD5=1,-g,--no-relax$(MP_EXTRA_AS_POST) 
	
else
${OBJECTDIR}/_ext/164278092/PW_indus.o: ../Output\ file/PW_indus.s  .generated_files/flags/default/7afeda6a0eece3a856692ef13a65596f055781c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/164278092" 
	@${RM} ${OBJECTDIR}/_ext/164278092/PW_indus.o.d 
	@${RM} ${OBJECTDIR}/_ext/164278092/PW_indus.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  "../Output file/PW_indus.s"  -o ${OBJECTDIR}/_ext/164278092/PW_indus.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/164278092/PW_indus.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_ICD5=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_ICD5=1,$(MP_LINKER_FILE_OPTION),--heap=1024,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/Horloge_principale_1.X.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  
	
else
${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=1024,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/Horloge_principale_1.X.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

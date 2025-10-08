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
SOURCEFILES_QUOTED_IF_SPACED=../board_init.c ../app_init.c ../net_tasks.c ../uart_utils.c ../EEPROM.c ../nv_mem.c "../TCPIP Stack/Announce.c" "../TCPIP Stack/ARP.c" "../TCPIP Stack/AutoIP.c" "../TCPIP Stack/BerkeleyAPI.c" "../TCPIP Stack/Delay.c" "../TCPIP Stack/DHCP.c" "../TCPIP Stack/DHCPs.c" "../TCPIP Stack/DNS.c" "../TCPIP Stack/DynDNS.c" "../TCPIP Stack/FTP.c" "../TCPIP Stack/Hashes.c" "../TCPIP Stack/Helpers.c" "../TCPIP Stack/HTTP2.c" "../TCPIP Stack/ICMP.c" "../TCPIP Stack/IP.c" "../TCPIP Stack/MPFS2.c" "../TCPIP Stack/NBNS.c" "../TCPIP Stack/Random.c" "../TCPIP Stack/Reboot.c" "../TCPIP Stack/SMTP.c" "../TCPIP Stack/SNMP.c" "../TCPIP Stack/SNTP.c" "../TCPIP Stack/SPIEEPROM.c" "../TCPIP Stack/SPIFlash.c" "../TCPIP Stack/SPIRAM.c" "../TCPIP Stack/SSL.c" "../TCPIP Stack/StackTsk.c" "../TCPIP Stack/TCP.c" "../TCPIP Stack/TCPPerformanceTest.c" "../TCPIP Stack/Telnet.c" "../TCPIP Stack/TFTPc.c" "../TCPIP Stack/Tick.c" "../TCPIP Stack/UDP.c" "../TCPIP Stack/UDPPerformanceTest.c" "../TCPIP Stack/ENCX24J600.c" "../TCPIP Stack/ENC28J60.c" "../TCPIP Stack/UART1TCPBridge.c" ../CustomHTTPApp.c "../Output file/PW_indus.s" ../Main.c ../interrupts.c ../03_variables.c ../02_Constantes.c ../04_Fonctions.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/board_init.o ${OBJECTDIR}/_ext/1472/app_init.o ${OBJECTDIR}/_ext/1472/net_tasks.o ${OBJECTDIR}/_ext/1472/uart_utils.o ${OBJECTDIR}/_ext/1472/EEPROM.o ${OBJECTDIR}/_ext/1472/nv_mem.o ${OBJECTDIR}/_ext/1563683617/Announce.o ${OBJECTDIR}/_ext/1563683617/ARP.o ${OBJECTDIR}/_ext/1563683617/AutoIP.o ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o ${OBJECTDIR}/_ext/1563683617/Delay.o ${OBJECTDIR}/_ext/1563683617/DHCP.o ${OBJECTDIR}/_ext/1563683617/DHCPs.o ${OBJECTDIR}/_ext/1563683617/DNS.o ${OBJECTDIR}/_ext/1563683617/DynDNS.o ${OBJECTDIR}/_ext/1563683617/FTP.o ${OBJECTDIR}/_ext/1563683617/Hashes.o ${OBJECTDIR}/_ext/1563683617/Helpers.o ${OBJECTDIR}/_ext/1563683617/HTTP2.o ${OBJECTDIR}/_ext/1563683617/ICMP.o ${OBJECTDIR}/_ext/1563683617/IP.o ${OBJECTDIR}/_ext/1563683617/MPFS2.o ${OBJECTDIR}/_ext/1563683617/NBNS.o ${OBJECTDIR}/_ext/1563683617/Random.o ${OBJECTDIR}/_ext/1563683617/Reboot.o ${OBJECTDIR}/_ext/1563683617/SMTP.o ${OBJECTDIR}/_ext/1563683617/SNMP.o ${OBJECTDIR}/_ext/1563683617/SNTP.o ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o ${OBJECTDIR}/_ext/1563683617/SPIFlash.o ${OBJECTDIR}/_ext/1563683617/SPIRAM.o ${OBJECTDIR}/_ext/1563683617/SSL.o ${OBJECTDIR}/_ext/1563683617/StackTsk.o ${OBJECTDIR}/_ext/1563683617/TCP.o ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1563683617/Telnet.o ${OBJECTDIR}/_ext/1563683617/TFTPc.o ${OBJECTDIR}/_ext/1563683617/Tick.o ${OBJECTDIR}/_ext/1563683617/UDP.o ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o ${OBJECTDIR}/_ext/1563683617/ENC28J60.o ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o ${OBJECTDIR}/_ext/164278092/PW_indus.o ${OBJECTDIR}/_ext/1472/Main.o ${OBJECTDIR}/_ext/1472/interrupts.o ${OBJECTDIR}/_ext/1472/03_variables.o ${OBJECTDIR}/_ext/1472/02_Constantes.o ${OBJECTDIR}/_ext/1472/04_Fonctions.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/board_init.o.d ${OBJECTDIR}/_ext/1472/app_init.o.d ${OBJECTDIR}/_ext/1472/net_tasks.o.d ${OBJECTDIR}/_ext/1472/uart_utils.o.d ${OBJECTDIR}/_ext/1472/EEPROM.o.d ${OBJECTDIR}/_ext/1472/nv_mem.o.d ${OBJECTDIR}/_ext/1563683617/Announce.o.d ${OBJECTDIR}/_ext/1563683617/ARP.o.d ${OBJECTDIR}/_ext/1563683617/AutoIP.o.d ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d ${OBJECTDIR}/_ext/1563683617/Delay.o.d ${OBJECTDIR}/_ext/1563683617/DHCP.o.d ${OBJECTDIR}/_ext/1563683617/DHCPs.o.d ${OBJECTDIR}/_ext/1563683617/DNS.o.d ${OBJECTDIR}/_ext/1563683617/DynDNS.o.d ${OBJECTDIR}/_ext/1563683617/FTP.o.d ${OBJECTDIR}/_ext/1563683617/Hashes.o.d ${OBJECTDIR}/_ext/1563683617/Helpers.o.d ${OBJECTDIR}/_ext/1563683617/HTTP2.o.d ${OBJECTDIR}/_ext/1563683617/ICMP.o.d ${OBJECTDIR}/_ext/1563683617/IP.o.d ${OBJECTDIR}/_ext/1563683617/MPFS2.o.d ${OBJECTDIR}/_ext/1563683617/NBNS.o.d ${OBJECTDIR}/_ext/1563683617/Random.o.d ${OBJECTDIR}/_ext/1563683617/Reboot.o.d ${OBJECTDIR}/_ext/1563683617/SMTP.o.d ${OBJECTDIR}/_ext/1563683617/SNMP.o.d ${OBJECTDIR}/_ext/1563683617/SNTP.o.d ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d ${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d ${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d ${OBJECTDIR}/_ext/1563683617/SSL.o.d ${OBJECTDIR}/_ext/1563683617/StackTsk.o.d ${OBJECTDIR}/_ext/1563683617/TCP.o.d ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d ${OBJECTDIR}/_ext/1563683617/Telnet.o.d ${OBJECTDIR}/_ext/1563683617/TFTPc.o.d ${OBJECTDIR}/_ext/1563683617/Tick.o.d ${OBJECTDIR}/_ext/1563683617/UDP.o.d ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d ${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d ${OBJECTDIR}/_ext/164278092/PW_indus.o.d ${OBJECTDIR}/_ext/1472/Main.o.d ${OBJECTDIR}/_ext/1472/interrupts.o.d ${OBJECTDIR}/_ext/1472/03_variables.o.d ${OBJECTDIR}/_ext/1472/02_Constantes.o.d ${OBJECTDIR}/_ext/1472/04_Fonctions.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/board_init.o ${OBJECTDIR}/_ext/1472/app_init.o ${OBJECTDIR}/_ext/1472/net_tasks.o ${OBJECTDIR}/_ext/1472/uart_utils.o ${OBJECTDIR}/_ext/1472/EEPROM.o ${OBJECTDIR}/_ext/1472/nv_mem.o ${OBJECTDIR}/_ext/1563683617/Announce.o ${OBJECTDIR}/_ext/1563683617/ARP.o ${OBJECTDIR}/_ext/1563683617/AutoIP.o ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o ${OBJECTDIR}/_ext/1563683617/Delay.o ${OBJECTDIR}/_ext/1563683617/DHCP.o ${OBJECTDIR}/_ext/1563683617/DHCPs.o ${OBJECTDIR}/_ext/1563683617/DNS.o ${OBJECTDIR}/_ext/1563683617/DynDNS.o ${OBJECTDIR}/_ext/1563683617/FTP.o ${OBJECTDIR}/_ext/1563683617/Hashes.o ${OBJECTDIR}/_ext/1563683617/Helpers.o ${OBJECTDIR}/_ext/1563683617/HTTP2.o ${OBJECTDIR}/_ext/1563683617/ICMP.o ${OBJECTDIR}/_ext/1563683617/IP.o ${OBJECTDIR}/_ext/1563683617/MPFS2.o ${OBJECTDIR}/_ext/1563683617/NBNS.o ${OBJECTDIR}/_ext/1563683617/Random.o ${OBJECTDIR}/_ext/1563683617/Reboot.o ${OBJECTDIR}/_ext/1563683617/SMTP.o ${OBJECTDIR}/_ext/1563683617/SNMP.o ${OBJECTDIR}/_ext/1563683617/SNTP.o ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o ${OBJECTDIR}/_ext/1563683617/SPIFlash.o ${OBJECTDIR}/_ext/1563683617/SPIRAM.o ${OBJECTDIR}/_ext/1563683617/SSL.o ${OBJECTDIR}/_ext/1563683617/StackTsk.o ${OBJECTDIR}/_ext/1563683617/TCP.o ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1563683617/Telnet.o ${OBJECTDIR}/_ext/1563683617/TFTPc.o ${OBJECTDIR}/_ext/1563683617/Tick.o ${OBJECTDIR}/_ext/1563683617/UDP.o ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o ${OBJECTDIR}/_ext/1563683617/ENC28J60.o ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o ${OBJECTDIR}/_ext/164278092/PW_indus.o ${OBJECTDIR}/_ext/1472/Main.o ${OBJECTDIR}/_ext/1472/interrupts.o ${OBJECTDIR}/_ext/1472/03_variables.o ${OBJECTDIR}/_ext/1472/02_Constantes.o ${OBJECTDIR}/_ext/1472/04_Fonctions.o

# Source Files
SOURCEFILES=../board_init.c ../app_init.c ../net_tasks.c ../uart_utils.c ../EEPROM.c ../nv_mem.c ../TCPIP Stack/Announce.c ../TCPIP Stack/ARP.c ../TCPIP Stack/AutoIP.c ../TCPIP Stack/BerkeleyAPI.c ../TCPIP Stack/Delay.c ../TCPIP Stack/DHCP.c ../TCPIP Stack/DHCPs.c ../TCPIP Stack/DNS.c ../TCPIP Stack/DynDNS.c ../TCPIP Stack/FTP.c ../TCPIP Stack/Hashes.c ../TCPIP Stack/Helpers.c ../TCPIP Stack/HTTP2.c ../TCPIP Stack/ICMP.c ../TCPIP Stack/IP.c ../TCPIP Stack/MPFS2.c ../TCPIP Stack/NBNS.c ../TCPIP Stack/Random.c ../TCPIP Stack/Reboot.c ../TCPIP Stack/SMTP.c ../TCPIP Stack/SNMP.c ../TCPIP Stack/SNTP.c ../TCPIP Stack/SPIEEPROM.c ../TCPIP Stack/SPIFlash.c ../TCPIP Stack/SPIRAM.c ../TCPIP Stack/SSL.c ../TCPIP Stack/StackTsk.c ../TCPIP Stack/TCP.c ../TCPIP Stack/TCPPerformanceTest.c ../TCPIP Stack/Telnet.c ../TCPIP Stack/TFTPc.c ../TCPIP Stack/Tick.c ../TCPIP Stack/UDP.c ../TCPIP Stack/UDPPerformanceTest.c ../TCPIP Stack/ENCX24J600.c ../TCPIP Stack/ENC28J60.c ../TCPIP Stack/UART1TCPBridge.c ../CustomHTTPApp.c ../Output file/PW_indus.s ../Main.c ../interrupts.c ../03_variables.c ../02_Constantes.c ../04_Fonctions.c



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
${OBJECTDIR}/_ext/1472/board_init.o: ../board_init.c  .generated_files/flags/default/ac6f0bb326cdc7af1077c8151c6dbe8361e4ca46 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/board_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/board_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../board_init.c  -o ${OBJECTDIR}/_ext/1472/board_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/board_init.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/app_init.o: ../app_init.c  .generated_files/flags/default/cf6275e3e6db15b45622ed8f6e921d4d07c543b2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/app_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/app_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app_init.c  -o ${OBJECTDIR}/_ext/1472/app_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/app_init.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/net_tasks.o: ../net_tasks.c  .generated_files/flags/default/706df140535ec10625c68118847425356d402f58 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/net_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/net_tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../net_tasks.c  -o ${OBJECTDIR}/_ext/1472/net_tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/net_tasks.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/uart_utils.o: ../uart_utils.c  .generated_files/flags/default/d7884f1ad149fd2552dbaf8d220c33d93fe93f02 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/uart_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/uart_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../uart_utils.c  -o ${OBJECTDIR}/_ext/1472/uart_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/uart_utils.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/EEPROM.o: ../EEPROM.c  .generated_files/flags/default/32f928a866d2b8e49d369d663bffeb2abb33fc3c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/EEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/EEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../EEPROM.c  -o ${OBJECTDIR}/_ext/1472/EEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/EEPROM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/nv_mem.o: ../nv_mem.c  .generated_files/flags/default/313dd4c18e3a102e76c90186cbd129f99fc472b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/nv_mem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/nv_mem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../nv_mem.c  -o ${OBJECTDIR}/_ext/1472/nv_mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/nv_mem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Announce.o: ../TCPIP\ Stack/Announce.c  .generated_files/flags/default/d632b09c6f71295234920bfc124dbccf2518846 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Announce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Announce.c"  -o ${OBJECTDIR}/_ext/1563683617/Announce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Announce.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/ARP.o: ../TCPIP\ Stack/ARP.c  .generated_files/flags/default/87f2193e95def540e2f2b07744d56fc23f4aa2a2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ARP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ARP.c"  -o ${OBJECTDIR}/_ext/1563683617/ARP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ARP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/AutoIP.o: ../TCPIP\ Stack/AutoIP.c  .generated_files/flags/default/d9fc11abaf03a25f088564d72220ed0acb953f37 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/AutoIP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/AutoIP.c"  -o ${OBJECTDIR}/_ext/1563683617/AutoIP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/AutoIP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o: ../TCPIP\ Stack/BerkeleyAPI.c  .generated_files/flags/default/c922c0b66fcbaadba594bcad2152f2e86d457543 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/BerkeleyAPI.c"  -o ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Delay.o: ../TCPIP\ Stack/Delay.c  .generated_files/flags/default/d987f11fdf4fb2734cac7c79072f2c33b45ff6f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Delay.c"  -o ${OBJECTDIR}/_ext/1563683617/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/DHCP.o: ../TCPIP\ Stack/DHCP.c  .generated_files/flags/default/21afd0815fddf6cd9bee48df57c4c682e65eabab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DHCP.c"  -o ${OBJECTDIR}/_ext/1563683617/DHCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DHCP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/DHCPs.o: ../TCPIP\ Stack/DHCPs.c  .generated_files/flags/default/8b4b9d4bec01f4ded9c99cc7fdb5749f37a9ab5b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCPs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DHCPs.c"  -o ${OBJECTDIR}/_ext/1563683617/DHCPs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DHCPs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/DNS.o: ../TCPIP\ Stack/DNS.c  .generated_files/flags/default/f813a6268ad08cf2977355dc94dec7953d23bab5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DNS.c"  -o ${OBJECTDIR}/_ext/1563683617/DNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/DynDNS.o: ../TCPIP\ Stack/DynDNS.c  .generated_files/flags/default/f16d3fd97e54a3c151f79eaa009c9429acdb03fc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DynDNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DynDNS.c"  -o ${OBJECTDIR}/_ext/1563683617/DynDNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DynDNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/FTP.o: ../TCPIP\ Stack/FTP.c  .generated_files/flags/default/50e08bc6cb908e802dd52b3ef166e7de6b9a5ac8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/FTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/FTP.c"  -o ${OBJECTDIR}/_ext/1563683617/FTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/FTP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Hashes.o: ../TCPIP\ Stack/Hashes.c  .generated_files/flags/default/89481f62b12dd2e30ec48cf03a4f3a56b48a1209 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Hashes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Hashes.c"  -o ${OBJECTDIR}/_ext/1563683617/Hashes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Hashes.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Helpers.o: ../TCPIP\ Stack/Helpers.c  .generated_files/flags/default/59e21864e6a38f8bf6ea33658ac39cbae3c6d7f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Helpers.c"  -o ${OBJECTDIR}/_ext/1563683617/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Helpers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/HTTP2.o: ../TCPIP\ Stack/HTTP2.c  .generated_files/flags/default/64fea4f51a9db9857f7e51c9284a4cd5c957253d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/HTTP2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/HTTP2.c"  -o ${OBJECTDIR}/_ext/1563683617/HTTP2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/HTTP2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/ICMP.o: ../TCPIP\ Stack/ICMP.c  .generated_files/flags/default/476913ca07bc26544e62cd3fed9c4d0febb0b4c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ICMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ICMP.c"  -o ${OBJECTDIR}/_ext/1563683617/ICMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ICMP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/IP.o: ../TCPIP\ Stack/IP.c  .generated_files/flags/default/4cc3abd4f583de4a0d5e50d10bd399fd95c38e77 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/IP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/IP.c"  -o ${OBJECTDIR}/_ext/1563683617/IP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/IP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/MPFS2.o: ../TCPIP\ Stack/MPFS2.c  .generated_files/flags/default/7f13b36386fe84260ed31fe3eb12342801586610 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/MPFS2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/MPFS2.c"  -o ${OBJECTDIR}/_ext/1563683617/MPFS2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/MPFS2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/NBNS.o: ../TCPIP\ Stack/NBNS.c  .generated_files/flags/default/51f88ee950425aa164fd234dc8059392f96393d3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/NBNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/NBNS.c"  -o ${OBJECTDIR}/_ext/1563683617/NBNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/NBNS.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Random.o: ../TCPIP\ Stack/Random.c  .generated_files/flags/default/9df988df6a59552acd327720daf606bd35f316e3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Random.c"  -o ${OBJECTDIR}/_ext/1563683617/Random.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Random.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Reboot.o: ../TCPIP\ Stack/Reboot.c  .generated_files/flags/default/224c50fc2b4d867211c72b1bb69565759a40b852 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Reboot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Reboot.c"  -o ${OBJECTDIR}/_ext/1563683617/Reboot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Reboot.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SMTP.o: ../TCPIP\ Stack/SMTP.c  .generated_files/flags/default/f0f35d8c89d48b2bb6182608c38c65f9776cca9e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SMTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SMTP.c"  -o ${OBJECTDIR}/_ext/1563683617/SMTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SMTP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SNMP.o: ../TCPIP\ Stack/SNMP.c  .generated_files/flags/default/eff0e7a917f9e69407bb81c20373da7c051aec92 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SNMP.c"  -o ${OBJECTDIR}/_ext/1563683617/SNMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SNMP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SNTP.o: ../TCPIP\ Stack/SNTP.c  .generated_files/flags/default/e445fd9c7d8854cc5f1224b6854cfdba31f5b1b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SNTP.c"  -o ${OBJECTDIR}/_ext/1563683617/SNTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SNTP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o: ../TCPIP\ Stack/SPIEEPROM.c  .generated_files/flags/default/b1ae17457ffefe5c876dbb037c54e9d22826e649 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIEEPROM.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SPIFlash.o: ../TCPIP\ Stack/SPIFlash.c  .generated_files/flags/default/26ada4e248cedf0b99dbde12f7508dce5cbfd583 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIFlash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIFlash.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIFlash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SPIRAM.o: ../TCPIP\ Stack/SPIRAM.c  .generated_files/flags/default/2ab3220f4f0104c003a30039ae40a6cfd4bf6060 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIRAM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIRAM.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIRAM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SSL.o: ../TCPIP\ Stack/SSL.c  .generated_files/flags/default/a2d73970f7cf7899afea6d73ef18512315d6cb9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SSL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SSL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SSL.c"  -o ${OBJECTDIR}/_ext/1563683617/SSL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SSL.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/StackTsk.o: ../TCPIP\ Stack/StackTsk.c  .generated_files/flags/default/4c1d69da9fc1bbb001c2647d8ce70aae77a7f02d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/StackTsk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/StackTsk.c"  -o ${OBJECTDIR}/_ext/1563683617/StackTsk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/StackTsk.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/TCP.o: ../TCPIP\ Stack/TCP.c  .generated_files/flags/default/b539c986a13c71fab6fb9971a729f9d90ea79556 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TCP.c"  -o ${OBJECTDIR}/_ext/1563683617/TCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TCP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o: ../TCPIP\ Stack/TCPPerformanceTest.c  .generated_files/flags/default/bdbfec5b5d7803b8640dc3e05808c119a897334 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TCPPerformanceTest.c"  -o ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Telnet.o: ../TCPIP\ Stack/Telnet.c  .generated_files/flags/default/bafc6448c0a957491b3c4680cc36d751978c76c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Telnet.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Telnet.c"  -o ${OBJECTDIR}/_ext/1563683617/Telnet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Telnet.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/TFTPc.o: ../TCPIP\ Stack/TFTPc.c  .generated_files/flags/default/a1cdf8d087f996c243032a3ad2eb1b91f7ab1736 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TFTPc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TFTPc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TFTPc.c"  -o ${OBJECTDIR}/_ext/1563683617/TFTPc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TFTPc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Tick.o: ../TCPIP\ Stack/Tick.c  .generated_files/flags/default/ac9c356c21546580b5bc902dfd4b16b49151e206 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Tick.c"  -o ${OBJECTDIR}/_ext/1563683617/Tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Tick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/UDP.o: ../TCPIP\ Stack/UDP.c  .generated_files/flags/default/cef8a8bb8bf80a12c6c8b43a0cb2047b362b5547 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UDP.c"  -o ${OBJECTDIR}/_ext/1563683617/UDP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UDP.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o: ../TCPIP\ Stack/UDPPerformanceTest.c  .generated_files/flags/default/3c56a97ed36c7a24f55e2bd5531892b651fa1d1b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UDPPerformanceTest.c"  -o ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/ENCX24J600.o: ../TCPIP\ Stack/ENCX24J600.c  .generated_files/flags/default/97d7a76c2a56e5e2073a005660bc28d4950a33cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ENCX24J600.c"  -o ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/ENC28J60.o: ../TCPIP\ Stack/ENC28J60.c  .generated_files/flags/default/fc8b99dd50ffc74cbbddb17dfcb61102a1d7b87c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENC28J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ENC28J60.c"  -o ${OBJECTDIR}/_ext/1563683617/ENC28J60.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o: ../TCPIP\ Stack/UART1TCPBridge.c  .generated_files/flags/default/c0a6d27d5f11763527c32bdd23c7e9a0748cafac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UART1TCPBridge.c"  -o ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/CustomHTTPApp.o: ../CustomHTTPApp.c  .generated_files/flags/default/8c76765f6f93b8935d47a5d586db9fcfafbe03d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CustomHTTPApp.c  -o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/Main.o: ../Main.c  .generated_files/flags/default/7cee017c9ebd56fb25a26e6df7dfc24c83d37872 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Main.c  -o ${OBJECTDIR}/_ext/1472/Main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/Main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/interrupts.o: ../interrupts.c  .generated_files/flags/default/61e8e17f514cd51157b4af4fa49bac48c22c5fcb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../interrupts.c  -o ${OBJECTDIR}/_ext/1472/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/03_variables.o: ../03_variables.c  .generated_files/flags/default/35f7f430702c5f9c9b7be26b60005ab676170a52 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/03_variables.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/03_variables.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../03_variables.c  -o ${OBJECTDIR}/_ext/1472/03_variables.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/03_variables.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/02_Constantes.o: ../02_Constantes.c  .generated_files/flags/default/85b93399d11f95d455885389e00b612be6341aa8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/02_Constantes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/02_Constantes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../02_Constantes.c  -o ${OBJECTDIR}/_ext/1472/02_Constantes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/02_Constantes.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/04_Fonctions.o: ../04_Fonctions.c  .generated_files/flags/default/6f1be49acb1f24630bffd0b9397570626718a6c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/04_Fonctions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/04_Fonctions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../04_Fonctions.c  -o ${OBJECTDIR}/_ext/1472/04_Fonctions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/04_Fonctions.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1472/board_init.o: ../board_init.c  .generated_files/flags/default/846eb80547ad6b4736dd7b93a02e40937388516c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/board_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/board_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../board_init.c  -o ${OBJECTDIR}/_ext/1472/board_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/board_init.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/app_init.o: ../app_init.c  .generated_files/flags/default/65203579ac231677d8ae49e11608390048a16599 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/app_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/app_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app_init.c  -o ${OBJECTDIR}/_ext/1472/app_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/app_init.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/net_tasks.o: ../net_tasks.c  .generated_files/flags/default/f9d093db06f3e88fad4543b4ac587d6375e75d30 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/net_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/net_tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../net_tasks.c  -o ${OBJECTDIR}/_ext/1472/net_tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/net_tasks.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/uart_utils.o: ../uart_utils.c  .generated_files/flags/default/9476e411fab232bdacc09eaeae54e9a1b7531b45 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/uart_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/uart_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../uart_utils.c  -o ${OBJECTDIR}/_ext/1472/uart_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/uart_utils.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/EEPROM.o: ../EEPROM.c  .generated_files/flags/default/59107e33f844ab9f9158c65876d2185175d6b1aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/EEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/EEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../EEPROM.c  -o ${OBJECTDIR}/_ext/1472/EEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/EEPROM.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/nv_mem.o: ../nv_mem.c  .generated_files/flags/default/459060e120e5b4228430344ba98a0a33317cfea3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/nv_mem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/nv_mem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../nv_mem.c  -o ${OBJECTDIR}/_ext/1472/nv_mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/nv_mem.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Announce.o: ../TCPIP\ Stack/Announce.c  .generated_files/flags/default/612c42f93f0739519e5db64ce92913e7d6139b99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Announce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Announce.c"  -o ${OBJECTDIR}/_ext/1563683617/Announce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Announce.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/ARP.o: ../TCPIP\ Stack/ARP.c  .generated_files/flags/default/b986bc2344a4477dd37043cee04f0fb43d6694c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ARP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ARP.c"  -o ${OBJECTDIR}/_ext/1563683617/ARP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ARP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/AutoIP.o: ../TCPIP\ Stack/AutoIP.c  .generated_files/flags/default/9c49e182076605549812973ddd4ff1a42ce1b096 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/AutoIP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/AutoIP.c"  -o ${OBJECTDIR}/_ext/1563683617/AutoIP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/AutoIP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o: ../TCPIP\ Stack/BerkeleyAPI.c  .generated_files/flags/default/7c18b5af3eff426c88af97c326b58a0c8ce3809 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/BerkeleyAPI.c"  -o ${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/BerkeleyAPI.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Delay.o: ../TCPIP\ Stack/Delay.c  .generated_files/flags/default/3fed73435d2e59de0cc495a5c48787d97472bf5f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Delay.c"  -o ${OBJECTDIR}/_ext/1563683617/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Delay.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/DHCP.o: ../TCPIP\ Stack/DHCP.c  .generated_files/flags/default/351ea2b21428b8c0b6556cce40ff71a32bd862c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DHCP.c"  -o ${OBJECTDIR}/_ext/1563683617/DHCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DHCP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/DHCPs.o: ../TCPIP\ Stack/DHCPs.c  .generated_files/flags/default/c0aa8de13d61d6999210432041ba5853c3a4a547 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DHCPs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DHCPs.c"  -o ${OBJECTDIR}/_ext/1563683617/DHCPs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DHCPs.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/DNS.o: ../TCPIP\ Stack/DNS.c  .generated_files/flags/default/2c1f45b9f79294e15fd1d5c35a26dbe54bcf08bd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DNS.c"  -o ${OBJECTDIR}/_ext/1563683617/DNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DNS.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/DynDNS.o: ../TCPIP\ Stack/DynDNS.c  .generated_files/flags/default/4e1b0c6e7da4375f8aed1e919057ce6433a38fb2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/DynDNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/DynDNS.c"  -o ${OBJECTDIR}/_ext/1563683617/DynDNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/DynDNS.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/FTP.o: ../TCPIP\ Stack/FTP.c  .generated_files/flags/default/eb482686a4ba101d894dc56357798f9e9d93469b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/FTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/FTP.c"  -o ${OBJECTDIR}/_ext/1563683617/FTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/FTP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Hashes.o: ../TCPIP\ Stack/Hashes.c  .generated_files/flags/default/30d2b98cbff15fa6ff8fcd6df2cf88528b0f4a4b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Hashes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Hashes.c"  -o ${OBJECTDIR}/_ext/1563683617/Hashes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Hashes.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Helpers.o: ../TCPIP\ Stack/Helpers.c  .generated_files/flags/default/a7ed253f324223ec66c9fc71b3fe06acb979392f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Helpers.c"  -o ${OBJECTDIR}/_ext/1563683617/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Helpers.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/HTTP2.o: ../TCPIP\ Stack/HTTP2.c  .generated_files/flags/default/4a34857cebef678bc6b33d309ca1c90953f1a933 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/HTTP2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/HTTP2.c"  -o ${OBJECTDIR}/_ext/1563683617/HTTP2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/HTTP2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/ICMP.o: ../TCPIP\ Stack/ICMP.c  .generated_files/flags/default/c5006ee43593d4bcc4c946263b125940889ddac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ICMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ICMP.c"  -o ${OBJECTDIR}/_ext/1563683617/ICMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ICMP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/IP.o: ../TCPIP\ Stack/IP.c  .generated_files/flags/default/36bb0dba234ac947c0abfc2799bbcafa1dc2ca89 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/IP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/IP.c"  -o ${OBJECTDIR}/_ext/1563683617/IP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/IP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/MPFS2.o: ../TCPIP\ Stack/MPFS2.c  .generated_files/flags/default/45571ae4287ee07395fa5840e7bcb76660e8e38d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/MPFS2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/MPFS2.c"  -o ${OBJECTDIR}/_ext/1563683617/MPFS2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/MPFS2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/NBNS.o: ../TCPIP\ Stack/NBNS.c  .generated_files/flags/default/8ec2d2879252e8abb7b553cd2a587018997471d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/NBNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/NBNS.c"  -o ${OBJECTDIR}/_ext/1563683617/NBNS.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/NBNS.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Random.o: ../TCPIP\ Stack/Random.c  .generated_files/flags/default/500538344d50e1e9acb8578d2779a4642d0a8532 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Random.c"  -o ${OBJECTDIR}/_ext/1563683617/Random.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Random.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Reboot.o: ../TCPIP\ Stack/Reboot.c  .generated_files/flags/default/a10083e8407f9b717b06ed02545bfe433fed8cfd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Reboot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Reboot.c"  -o ${OBJECTDIR}/_ext/1563683617/Reboot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Reboot.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SMTP.o: ../TCPIP\ Stack/SMTP.c  .generated_files/flags/default/17bdd6dfaa62e52d59e0f351fa3516112253b0ff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SMTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SMTP.c"  -o ${OBJECTDIR}/_ext/1563683617/SMTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SMTP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SNMP.o: ../TCPIP\ Stack/SNMP.c  .generated_files/flags/default/d7b27eafdce5544213bd8fa74ce1eed9cd7bbc33 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SNMP.c"  -o ${OBJECTDIR}/_ext/1563683617/SNMP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SNMP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SNTP.o: ../TCPIP\ Stack/SNTP.c  .generated_files/flags/default/f06f67150657001a57d5e45b2138862455db6aa3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SNTP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SNTP.c"  -o ${OBJECTDIR}/_ext/1563683617/SNTP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SNTP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o: ../TCPIP\ Stack/SPIEEPROM.c  .generated_files/flags/default/25da110d72c236e5365cab062b11bb86014ffa89 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIEEPROM.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIEEPROM.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SPIFlash.o: ../TCPIP\ Stack/SPIFlash.c  .generated_files/flags/default/42ac3474319b1e6e45ba3e3109320dc8866f5c81 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIFlash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIFlash.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIFlash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIFlash.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SPIRAM.o: ../TCPIP\ Stack/SPIRAM.c  .generated_files/flags/default/c986907bef752d2a6e03612d4262994a3e5fd3cb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SPIRAM.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SPIRAM.c"  -o ${OBJECTDIR}/_ext/1563683617/SPIRAM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SPIRAM.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/SSL.o: ../TCPIP\ Stack/SSL.c  .generated_files/flags/default/12bd9bbaf39a966d5b0a4978813380a0892e0df2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SSL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/SSL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/SSL.c"  -o ${OBJECTDIR}/_ext/1563683617/SSL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/SSL.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/StackTsk.o: ../TCPIP\ Stack/StackTsk.c  .generated_files/flags/default/d975a6fd69caf270948b2bb7484440df29c7ad44 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/StackTsk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/StackTsk.c"  -o ${OBJECTDIR}/_ext/1563683617/StackTsk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/StackTsk.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/TCP.o: ../TCPIP\ Stack/TCP.c  .generated_files/flags/default/ac1207e2d3532ce5ffc24be6b718107ffd0503b7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TCP.c"  -o ${OBJECTDIR}/_ext/1563683617/TCP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TCP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o: ../TCPIP\ Stack/TCPPerformanceTest.c  .generated_files/flags/default/6bb34748ac3e136a3aeae38e51b7ea6896eef831 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TCPPerformanceTest.c"  -o ${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TCPPerformanceTest.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Telnet.o: ../TCPIP\ Stack/Telnet.c  .generated_files/flags/default/3da014af173da931d79563ab6e7e2b5d9dde40ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Telnet.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Telnet.c"  -o ${OBJECTDIR}/_ext/1563683617/Telnet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Telnet.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/TFTPc.o: ../TCPIP\ Stack/TFTPc.c  .generated_files/flags/default/9774def851f5df34ea9fbcdd95fe2bbe319f2e46 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TFTPc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/TFTPc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/TFTPc.c"  -o ${OBJECTDIR}/_ext/1563683617/TFTPc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/TFTPc.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/Tick.o: ../TCPIP\ Stack/Tick.c  .generated_files/flags/default/eeeed1a9de9bef9bdb05378c367be12a18900827 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/Tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/Tick.c"  -o ${OBJECTDIR}/_ext/1563683617/Tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/Tick.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/UDP.o: ../TCPIP\ Stack/UDP.c  .generated_files/flags/default/98c77c0a535458352c914e3c95e4f985e86f14e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UDP.c"  -o ${OBJECTDIR}/_ext/1563683617/UDP.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UDP.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o: ../TCPIP\ Stack/UDPPerformanceTest.c  .generated_files/flags/default/b34a634f9c9121fa32fa2a690955cfb325e2c9a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UDPPerformanceTest.c"  -o ${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UDPPerformanceTest.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/ENCX24J600.o: ../TCPIP\ Stack/ENCX24J600.c  .generated_files/flags/default/b754a37726da9fa2fa782fa3a7f293e4f86586ba .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ENCX24J600.c"  -o ${OBJECTDIR}/_ext/1563683617/ENCX24J600.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ENCX24J600.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/ENC28J60.o: ../TCPIP\ Stack/ENC28J60.c  .generated_files/flags/default/924521dcd52eceb134fed5f582004a1e7a5b71e5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/ENC28J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/ENC28J60.c"  -o ${OBJECTDIR}/_ext/1563683617/ENC28J60.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/ENC28J60.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o: ../TCPIP\ Stack/UART1TCPBridge.c  .generated_files/flags/default/e3e43e15a2edda481dffa743ce832ffbf4d26864 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1563683617" 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d 
	@${RM} ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../TCPIP Stack/UART1TCPBridge.c"  -o ${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1563683617/UART1TCPBridge.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/CustomHTTPApp.o: ../CustomHTTPApp.c  .generated_files/flags/default/7b43cfa0a547986691c6cd47b8d0a0968b8eb548 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CustomHTTPApp.c  -o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/Main.o: ../Main.c  .generated_files/flags/default/c555c570dd6925c6d54b3b0dcd06e3351701429b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Main.c  -o ${OBJECTDIR}/_ext/1472/Main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/Main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/interrupts.o: ../interrupts.c  .generated_files/flags/default/f31271a211316ef6304694a2688c3e68b1010cf1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../interrupts.c  -o ${OBJECTDIR}/_ext/1472/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/interrupts.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/03_variables.o: ../03_variables.c  .generated_files/flags/default/6a86038893df4546365cbea242ad304644d470 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/03_variables.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/03_variables.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../03_variables.c  -o ${OBJECTDIR}/_ext/1472/03_variables.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/03_variables.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/02_Constantes.o: ../02_Constantes.c  .generated_files/flags/default/31127af752301b08907ce0d62838862b90fcdd32 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/02_Constantes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/02_Constantes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../02_Constantes.c  -o ${OBJECTDIR}/_ext/1472/02_Constantes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/02_Constantes.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/04_Fonctions.o: ../04_Fonctions.c  .generated_files/flags/default/5eb3db60cbd3376099106b669279aebf7b661b90 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/04_Fonctions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/04_Fonctions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../04_Fonctions.c  -o ${OBJECTDIR}/_ext/1472/04_Fonctions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/04_Fonctions.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I".." -I"../Output file" -I"../TCPIP Stack" -I"." -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/164278092/PW_indus.o: ../Output\ file/PW_indus.s  .generated_files/flags/default/7887504657cdcfebcf7b08140cf17517f61796a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/164278092" 
	@${RM} ${OBJECTDIR}/_ext/164278092/PW_indus.o.d 
	@${RM} ${OBJECTDIR}/_ext/164278092/PW_indus.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  "../Output file/PW_indus.s"  -o ${OBJECTDIR}/_ext/164278092/PW_indus.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD5=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/164278092/PW_indus.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD5=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/164278092/PW_indus.o: ../Output\ file/PW_indus.s  .generated_files/flags/default/fcd2bf6353114e6984a9eefccec80f589346cc56 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/164278092" 
	@${RM} ${OBJECTDIR}/_ext/164278092/PW_indus.o.d 
	@${RM} ${OBJECTDIR}/_ext/164278092/PW_indus.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  "../Output file/PW_indus.s"  -o ${OBJECTDIR}/_ext/164278092/PW_indus.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/164278092/PW_indus.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_ICD5=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_ICD5=1,$(MP_LINKER_FILE_OPTION),--heap=1024,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/Horloge_principale_1.X.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=1024,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/Horloge_principale_1.X.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/test_indus.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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

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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/WifiTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/WifiTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c wf_mcu_driver_stub.c winc1500/src/wf_asic.c winc1500/src/wf_hif.c winc1500/src/wf_ota.c winc1500/src/wf_socket.c winc1500/src/wf_spi.c winc1500/src/wf_spi_flash.c winc1500/src/wf_utils.c winc1500/src/wf_wifi.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/wf_mcu_driver_stub.o ${OBJECTDIR}/winc1500/src/wf_asic.o ${OBJECTDIR}/winc1500/src/wf_hif.o ${OBJECTDIR}/winc1500/src/wf_ota.o ${OBJECTDIR}/winc1500/src/wf_socket.o ${OBJECTDIR}/winc1500/src/wf_spi.o ${OBJECTDIR}/winc1500/src/wf_spi_flash.o ${OBJECTDIR}/winc1500/src/wf_utils.o ${OBJECTDIR}/winc1500/src/wf_wifi.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/wf_mcu_driver_stub.o.d ${OBJECTDIR}/winc1500/src/wf_asic.o.d ${OBJECTDIR}/winc1500/src/wf_hif.o.d ${OBJECTDIR}/winc1500/src/wf_ota.o.d ${OBJECTDIR}/winc1500/src/wf_socket.o.d ${OBJECTDIR}/winc1500/src/wf_spi.o.d ${OBJECTDIR}/winc1500/src/wf_spi_flash.o.d ${OBJECTDIR}/winc1500/src/wf_utils.o.d ${OBJECTDIR}/winc1500/src/wf_wifi.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/wf_mcu_driver_stub.o ${OBJECTDIR}/winc1500/src/wf_asic.o ${OBJECTDIR}/winc1500/src/wf_hif.o ${OBJECTDIR}/winc1500/src/wf_ota.o ${OBJECTDIR}/winc1500/src/wf_socket.o ${OBJECTDIR}/winc1500/src/wf_spi.o ${OBJECTDIR}/winc1500/src/wf_spi_flash.o ${OBJECTDIR}/winc1500/src/wf_utils.o ${OBJECTDIR}/winc1500/src/wf_wifi.o

# Source Files
SOURCEFILES=main.c wf_mcu_driver_stub.c winc1500/src/wf_asic.c winc1500/src/wf_hif.c winc1500/src/wf_ota.c winc1500/src/wf_socket.c winc1500/src/wf_spi.c winc1500/src/wf_spi_flash.c winc1500/src/wf_utils.c winc1500/src/wf_wifi.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/WifiTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFG144
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/wf_mcu_driver_stub.o: wf_mcu_driver_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/wf_mcu_driver_stub.o.d 
	@${RM} ${OBJECTDIR}/wf_mcu_driver_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/wf_mcu_driver_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/wf_mcu_driver_stub.o.d" -o ${OBJECTDIR}/wf_mcu_driver_stub.o wf_mcu_driver_stub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_asic.o: winc1500/src/wf_asic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_asic.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_asic.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_asic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_asic.o.d" -o ${OBJECTDIR}/winc1500/src/wf_asic.o winc1500/src/wf_asic.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_hif.o: winc1500/src/wf_hif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_hif.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_hif.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_hif.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_hif.o.d" -o ${OBJECTDIR}/winc1500/src/wf_hif.o winc1500/src/wf_hif.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_ota.o: winc1500/src/wf_ota.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_ota.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_ota.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_ota.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_ota.o.d" -o ${OBJECTDIR}/winc1500/src/wf_ota.o winc1500/src/wf_ota.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_socket.o: winc1500/src/wf_socket.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_socket.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_socket.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_socket.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_socket.o.d" -o ${OBJECTDIR}/winc1500/src/wf_socket.o winc1500/src/wf_socket.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_spi.o: winc1500/src/wf_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_spi.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_spi.o.d" -o ${OBJECTDIR}/winc1500/src/wf_spi.o winc1500/src/wf_spi.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_spi_flash.o: winc1500/src/wf_spi_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_spi_flash.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_spi_flash.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_spi_flash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_spi_flash.o.d" -o ${OBJECTDIR}/winc1500/src/wf_spi_flash.o winc1500/src/wf_spi_flash.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_utils.o: winc1500/src/wf_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_utils.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_utils.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_utils.o.d" -o ${OBJECTDIR}/winc1500/src/wf_utils.o winc1500/src/wf_utils.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_wifi.o: winc1500/src/wf_wifi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_wifi.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_wifi.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_wifi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_wifi.o.d" -o ${OBJECTDIR}/winc1500/src/wf_wifi.o winc1500/src/wf_wifi.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/wf_mcu_driver_stub.o: wf_mcu_driver_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/wf_mcu_driver_stub.o.d 
	@${RM} ${OBJECTDIR}/wf_mcu_driver_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/wf_mcu_driver_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/wf_mcu_driver_stub.o.d" -o ${OBJECTDIR}/wf_mcu_driver_stub.o wf_mcu_driver_stub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_asic.o: winc1500/src/wf_asic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_asic.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_asic.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_asic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_asic.o.d" -o ${OBJECTDIR}/winc1500/src/wf_asic.o winc1500/src/wf_asic.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_hif.o: winc1500/src/wf_hif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_hif.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_hif.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_hif.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_hif.o.d" -o ${OBJECTDIR}/winc1500/src/wf_hif.o winc1500/src/wf_hif.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_ota.o: winc1500/src/wf_ota.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_ota.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_ota.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_ota.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_ota.o.d" -o ${OBJECTDIR}/winc1500/src/wf_ota.o winc1500/src/wf_ota.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_socket.o: winc1500/src/wf_socket.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_socket.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_socket.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_socket.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_socket.o.d" -o ${OBJECTDIR}/winc1500/src/wf_socket.o winc1500/src/wf_socket.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_spi.o: winc1500/src/wf_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_spi.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_spi.o.d" -o ${OBJECTDIR}/winc1500/src/wf_spi.o winc1500/src/wf_spi.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_spi_flash.o: winc1500/src/wf_spi_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_spi_flash.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_spi_flash.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_spi_flash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_spi_flash.o.d" -o ${OBJECTDIR}/winc1500/src/wf_spi_flash.o winc1500/src/wf_spi_flash.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_utils.o: winc1500/src/wf_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_utils.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_utils.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_utils.o.d" -o ${OBJECTDIR}/winc1500/src/wf_utils.o winc1500/src/wf_utils.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/winc1500/src/wf_wifi.o: winc1500/src/wf_wifi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/winc1500/src" 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_wifi.o.d 
	@${RM} ${OBJECTDIR}/winc1500/src/wf_wifi.o 
	@${FIXDEPS} "${OBJECTDIR}/winc1500/src/wf_wifi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/winc1500/src/wf_wifi.o.d" -o ${OBJECTDIR}/winc1500/src/wf_wifi.o winc1500/src/wf_wifi.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/WifiTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_SIMULATOR=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/WifiTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/WifiTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/WifiTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/WifiTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

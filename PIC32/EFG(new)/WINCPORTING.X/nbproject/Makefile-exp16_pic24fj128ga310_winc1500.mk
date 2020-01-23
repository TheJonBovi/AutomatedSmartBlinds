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
ifeq "$(wildcard nbproject/Makefile-local-exp16_pic24fj128ga310_winc1500.mk)" "nbproject/Makefile-local-exp16_pic24fj128ga310_winc1500.mk"
include nbproject/Makefile-local-exp16_pic24fj128ga310_winc1500.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=exp16_pic24fj128ga310_winc1500
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/WINCPORTING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/WINCPORTING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=app/demo_support/iot/http/http_client.c app/demo_support/iot/json.c app/demo_support/iot/stream_writer.c app/demo_support/iot/sw_timer.c app/demo_support/winc1500_support_stub.c app/winc1500_ap_scan/ota_event_stub.c app/winc1500_ap_scan/socket_event_stub.c app/winc1500_ap_scan/wifi_event_stub.c app/winc1500_ap_scan/winc1500_ap_scan.c app/winc1500_provision_ap/winc1500_provision_ap.c app/winc1500_pubnub/PubNub.c app/winc1500_pubnub/winc1500_pubnub.c app/winc1500_simple_growl/growl.c app/winc1500_simple_growl/winc1500_simple_growl.c app/winc1500_udp_client/ota_event_stub.c app/winc1500_udp_client/socket_event_stub.c app/winc1500_udp_client/wifi_event_stub.c app/winc1500_udp_client/winc1500_udp_client.c app/winc1500_udp_server/ota_event_stub.c app/winc1500_udp_server/socket_event_stub.c app/winc1500_udp_server/wifi_event_stub.c app/winc1500_udp_server/winc1500_udp_server.c app/winc1500_fw_update_over_serial.c app/winc1500_http_download.c app/winc1500_locate_ip_address.c app/winc1500_mac_address.c app/winc1500_mode_ap.c app/winc1500_mode_change.c app/winc1500_mode_p2p.c app/winc1500_mode_sta.c app/winc1500_ota_firmware_update.c app/winc1500_power_save_mode.c app/winc1500_provision_http.c app/winc1500_security_wep_wpa.c app/winc1500_security_wps.c app/winc1500_send_email.c app/winc1500_signal_strength.c app/winc1500_ssl_connect.c app/winc1500_tcp_client.c app/winc1500_tcp_server.c app/winc1500_time_client.c app/winc1500_weather_client.c bsp/bsp.c framework/driver/winc1500/src/wf_asic.c framework/driver/winc1500/src/wf_hif.c framework/driver/winc1500/src/wf_ota.c framework/driver/winc1500/src/wf_socket.c framework/driver/winc1500/src/wf_spi.c framework/driver/winc1500/src/wf_spi_flash.c framework/driver/winc1500/src/wf_utils.c framework/driver/winc1500/src/wf_wifi.c mcc_generated_files/traps.c mcc_generated_files/uart2.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/ext_int.c stubs/wf_mcu_driver_stub.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/app/demo_support/iot/http/http_client.o ${OBJECTDIR}/app/demo_support/iot/json.o ${OBJECTDIR}/app/demo_support/iot/stream_writer.o ${OBJECTDIR}/app/demo_support/iot/sw_timer.o ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o ${OBJECTDIR}/app/winc1500_simple_growl/growl.o ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o ${OBJECTDIR}/app/winc1500_http_download.o ${OBJECTDIR}/app/winc1500_locate_ip_address.o ${OBJECTDIR}/app/winc1500_mac_address.o ${OBJECTDIR}/app/winc1500_mode_ap.o ${OBJECTDIR}/app/winc1500_mode_change.o ${OBJECTDIR}/app/winc1500_mode_p2p.o ${OBJECTDIR}/app/winc1500_mode_sta.o ${OBJECTDIR}/app/winc1500_ota_firmware_update.o ${OBJECTDIR}/app/winc1500_power_save_mode.o ${OBJECTDIR}/app/winc1500_provision_http.o ${OBJECTDIR}/app/winc1500_security_wep_wpa.o ${OBJECTDIR}/app/winc1500_security_wps.o ${OBJECTDIR}/app/winc1500_send_email.o ${OBJECTDIR}/app/winc1500_signal_strength.o ${OBJECTDIR}/app/winc1500_ssl_connect.o ${OBJECTDIR}/app/winc1500_tcp_client.o ${OBJECTDIR}/app/winc1500_tcp_server.o ${OBJECTDIR}/app/winc1500_time_client.o ${OBJECTDIR}/app/winc1500_weather_client.o ${OBJECTDIR}/bsp/bsp.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/uart2.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/ext_int.o ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d ${OBJECTDIR}/app/demo_support/iot/json.o.d ${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d ${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d ${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d ${OBJECTDIR}/app/winc1500_http_download.o.d ${OBJECTDIR}/app/winc1500_locate_ip_address.o.d ${OBJECTDIR}/app/winc1500_mac_address.o.d ${OBJECTDIR}/app/winc1500_mode_ap.o.d ${OBJECTDIR}/app/winc1500_mode_change.o.d ${OBJECTDIR}/app/winc1500_mode_p2p.o.d ${OBJECTDIR}/app/winc1500_mode_sta.o.d ${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d ${OBJECTDIR}/app/winc1500_power_save_mode.o.d ${OBJECTDIR}/app/winc1500_provision_http.o.d ${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d ${OBJECTDIR}/app/winc1500_security_wps.o.d ${OBJECTDIR}/app/winc1500_send_email.o.d ${OBJECTDIR}/app/winc1500_signal_strength.o.d ${OBJECTDIR}/app/winc1500_ssl_connect.o.d ${OBJECTDIR}/app/winc1500_tcp_client.o.d ${OBJECTDIR}/app/winc1500_tcp_server.o.d ${OBJECTDIR}/app/winc1500_time_client.o.d ${OBJECTDIR}/app/winc1500_weather_client.o.d ${OBJECTDIR}/bsp/bsp.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/uart2.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/tmr1.o.d ${OBJECTDIR}/mcc_generated_files/ext_int.o.d ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/app/demo_support/iot/http/http_client.o ${OBJECTDIR}/app/demo_support/iot/json.o ${OBJECTDIR}/app/demo_support/iot/stream_writer.o ${OBJECTDIR}/app/demo_support/iot/sw_timer.o ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o ${OBJECTDIR}/app/winc1500_simple_growl/growl.o ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o ${OBJECTDIR}/app/winc1500_http_download.o ${OBJECTDIR}/app/winc1500_locate_ip_address.o ${OBJECTDIR}/app/winc1500_mac_address.o ${OBJECTDIR}/app/winc1500_mode_ap.o ${OBJECTDIR}/app/winc1500_mode_change.o ${OBJECTDIR}/app/winc1500_mode_p2p.o ${OBJECTDIR}/app/winc1500_mode_sta.o ${OBJECTDIR}/app/winc1500_ota_firmware_update.o ${OBJECTDIR}/app/winc1500_power_save_mode.o ${OBJECTDIR}/app/winc1500_provision_http.o ${OBJECTDIR}/app/winc1500_security_wep_wpa.o ${OBJECTDIR}/app/winc1500_security_wps.o ${OBJECTDIR}/app/winc1500_send_email.o ${OBJECTDIR}/app/winc1500_signal_strength.o ${OBJECTDIR}/app/winc1500_ssl_connect.o ${OBJECTDIR}/app/winc1500_tcp_client.o ${OBJECTDIR}/app/winc1500_tcp_server.o ${OBJECTDIR}/app/winc1500_time_client.o ${OBJECTDIR}/app/winc1500_weather_client.o ${OBJECTDIR}/bsp/bsp.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/uart2.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/ext_int.o ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=app/demo_support/iot/http/http_client.c app/demo_support/iot/json.c app/demo_support/iot/stream_writer.c app/demo_support/iot/sw_timer.c app/demo_support/winc1500_support_stub.c app/winc1500_ap_scan/ota_event_stub.c app/winc1500_ap_scan/socket_event_stub.c app/winc1500_ap_scan/wifi_event_stub.c app/winc1500_ap_scan/winc1500_ap_scan.c app/winc1500_provision_ap/winc1500_provision_ap.c app/winc1500_pubnub/PubNub.c app/winc1500_pubnub/winc1500_pubnub.c app/winc1500_simple_growl/growl.c app/winc1500_simple_growl/winc1500_simple_growl.c app/winc1500_udp_client/ota_event_stub.c app/winc1500_udp_client/socket_event_stub.c app/winc1500_udp_client/wifi_event_stub.c app/winc1500_udp_client/winc1500_udp_client.c app/winc1500_udp_server/ota_event_stub.c app/winc1500_udp_server/socket_event_stub.c app/winc1500_udp_server/wifi_event_stub.c app/winc1500_udp_server/winc1500_udp_server.c app/winc1500_fw_update_over_serial.c app/winc1500_http_download.c app/winc1500_locate_ip_address.c app/winc1500_mac_address.c app/winc1500_mode_ap.c app/winc1500_mode_change.c app/winc1500_mode_p2p.c app/winc1500_mode_sta.c app/winc1500_ota_firmware_update.c app/winc1500_power_save_mode.c app/winc1500_provision_http.c app/winc1500_security_wep_wpa.c app/winc1500_security_wps.c app/winc1500_send_email.c app/winc1500_signal_strength.c app/winc1500_ssl_connect.c app/winc1500_tcp_client.c app/winc1500_tcp_server.c app/winc1500_time_client.c app/winc1500_weather_client.c bsp/bsp.c framework/driver/winc1500/src/wf_asic.c framework/driver/winc1500/src/wf_hif.c framework/driver/winc1500/src/wf_ota.c framework/driver/winc1500/src/wf_socket.c framework/driver/winc1500/src/wf_spi.c framework/driver/winc1500/src/wf_spi_flash.c framework/driver/winc1500/src/wf_utils.c framework/driver/winc1500/src/wf_wifi.c mcc_generated_files/traps.c mcc_generated_files/uart2.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/ext_int.c stubs/wf_mcu_driver_stub.c main.c



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
	${MAKE}  -f nbproject/Makefile-exp16_pic24fj128ga310_winc1500.mk dist/${CND_CONF}/${IMAGE_TYPE}/WINCPORTING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ128GA310
MP_LINKER_FILE_OPTION=,--script=p24FJ128GA310.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/app/demo_support/iot/http/http_client.o: app/demo_support/iot/http/http_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot/http" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/http/http_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/iot/http/http_client.c  -o ${OBJECTDIR}/app/demo_support/iot/http/http_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/demo_support/iot/json.o: app/demo_support/iot/json.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/json.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/json.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/iot/json.c  -o ${OBJECTDIR}/app/demo_support/iot/json.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/iot/json.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/json.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/demo_support/iot/stream_writer.o: app/demo_support/iot/stream_writer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/stream_writer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/iot/stream_writer.c  -o ${OBJECTDIR}/app/demo_support/iot/stream_writer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/demo_support/iot/sw_timer.o: app/demo_support/iot/sw_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/sw_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/iot/sw_timer.c  -o ${OBJECTDIR}/app/demo_support/iot/sw_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/demo_support/winc1500_support_stub.o: app/demo_support/winc1500_support_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support" 
	@${RM} ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/winc1500_support_stub.c  -o ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o: app/winc1500_ap_scan/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ap_scan/ota_event_stub.c  -o ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o: app/winc1500_ap_scan/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ap_scan/socket_event_stub.c  -o ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o: app/winc1500_ap_scan/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ap_scan/wifi_event_stub.c  -o ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o: app/winc1500_ap_scan/winc1500_ap_scan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ap_scan/winc1500_ap_scan.c  -o ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o: app/winc1500_provision_ap/winc1500_provision_ap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_provision_ap" 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_provision_ap/winc1500_provision_ap.c  -o ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_pubnub/PubNub.o: app/winc1500_pubnub/PubNub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_pubnub" 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_pubnub/PubNub.c  -o ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o: app/winc1500_pubnub/winc1500_pubnub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_pubnub" 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_pubnub/winc1500_pubnub.c  -o ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_simple_growl/growl.o: app/winc1500_simple_growl/growl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_simple_growl" 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/growl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_simple_growl/growl.c  -o ${OBJECTDIR}/app/winc1500_simple_growl/growl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o: app/winc1500_simple_growl/winc1500_simple_growl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_simple_growl" 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_simple_growl/winc1500_simple_growl.c  -o ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o: app/winc1500_udp_client/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_client/ota_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o: app/winc1500_udp_client/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_client/socket_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o: app/winc1500_udp_client/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_client/wifi_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o: app/winc1500_udp_client/winc1500_udp_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_client/winc1500_udp_client.c  -o ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o: app/winc1500_udp_server/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_server/ota_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o: app/winc1500_udp_server/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_server/socket_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o: app/winc1500_udp_server/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_server/wifi_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o: app/winc1500_udp_server/winc1500_udp_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_server/winc1500_udp_server.c  -o ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_fw_update_over_serial.o: app/winc1500_fw_update_over_serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_fw_update_over_serial.c  -o ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_http_download.o: app/winc1500_http_download.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_http_download.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_http_download.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_http_download.c  -o ${OBJECTDIR}/app/winc1500_http_download.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_http_download.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_http_download.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_locate_ip_address.o: app/winc1500_locate_ip_address.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_locate_ip_address.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_locate_ip_address.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_locate_ip_address.c  -o ${OBJECTDIR}/app/winc1500_locate_ip_address.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_locate_ip_address.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_locate_ip_address.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mac_address.o: app/winc1500_mac_address.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mac_address.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mac_address.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mac_address.c  -o ${OBJECTDIR}/app/winc1500_mac_address.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mac_address.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mac_address.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mode_ap.o: app/winc1500_mode_ap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_ap.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_ap.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mode_ap.c  -o ${OBJECTDIR}/app/winc1500_mode_ap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mode_ap.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_ap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mode_change.o: app/winc1500_mode_change.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_change.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_change.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mode_change.c  -o ${OBJECTDIR}/app/winc1500_mode_change.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mode_change.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_change.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mode_p2p.o: app/winc1500_mode_p2p.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_p2p.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_p2p.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mode_p2p.c  -o ${OBJECTDIR}/app/winc1500_mode_p2p.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mode_p2p.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_p2p.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mode_sta.o: app/winc1500_mode_sta.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_sta.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_sta.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mode_sta.c  -o ${OBJECTDIR}/app/winc1500_mode_sta.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mode_sta.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_sta.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ota_firmware_update.o: app/winc1500_ota_firmware_update.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ota_firmware_update.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ota_firmware_update.c  -o ${OBJECTDIR}/app/winc1500_ota_firmware_update.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_power_save_mode.o: app/winc1500_power_save_mode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_power_save_mode.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_power_save_mode.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_power_save_mode.c  -o ${OBJECTDIR}/app/winc1500_power_save_mode.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_power_save_mode.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_power_save_mode.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_provision_http.o: app/winc1500_provision_http.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_http.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_http.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_provision_http.c  -o ${OBJECTDIR}/app/winc1500_provision_http.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_provision_http.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_provision_http.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_security_wep_wpa.o: app/winc1500_security_wep_wpa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wep_wpa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_security_wep_wpa.c  -o ${OBJECTDIR}/app/winc1500_security_wep_wpa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_security_wps.o: app/winc1500_security_wps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wps.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_security_wps.c  -o ${OBJECTDIR}/app/winc1500_security_wps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_security_wps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_security_wps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_send_email.o: app/winc1500_send_email.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_send_email.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_send_email.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_send_email.c  -o ${OBJECTDIR}/app/winc1500_send_email.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_send_email.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_send_email.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_signal_strength.o: app/winc1500_signal_strength.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_signal_strength.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_signal_strength.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_signal_strength.c  -o ${OBJECTDIR}/app/winc1500_signal_strength.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_signal_strength.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_signal_strength.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ssl_connect.o: app/winc1500_ssl_connect.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_ssl_connect.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ssl_connect.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ssl_connect.c  -o ${OBJECTDIR}/app/winc1500_ssl_connect.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ssl_connect.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ssl_connect.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_tcp_client.o: app/winc1500_tcp_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_tcp_client.c  -o ${OBJECTDIR}/app/winc1500_tcp_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_tcp_client.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_tcp_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_tcp_server.o: app/winc1500_tcp_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_server.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_server.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_tcp_server.c  -o ${OBJECTDIR}/app/winc1500_tcp_server.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_tcp_server.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_tcp_server.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_time_client.o: app/winc1500_time_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_time_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_time_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_time_client.c  -o ${OBJECTDIR}/app/winc1500_time_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_time_client.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_time_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_weather_client.o: app/winc1500_weather_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_weather_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_weather_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_weather_client.c  -o ${OBJECTDIR}/app/winc1500_weather_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_weather_client.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_weather_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/bsp/bsp.o: bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/bsp.o.d 
	@${RM} ${OBJECTDIR}/bsp/bsp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/bsp.c  -o ${OBJECTDIR}/bsp/bsp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/bsp/bsp.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/bsp/bsp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o: framework/driver/winc1500/src/wf_asic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_asic.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o: framework/driver/winc1500/src/wf_hif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_hif.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o: framework/driver/winc1500/src/wf_ota.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_ota.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o: framework/driver/winc1500/src/wf_socket.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_socket.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o: framework/driver/winc1500/src/wf_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_spi.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o: framework/driver/winc1500/src/wf_spi_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_spi_flash.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o: framework/driver/winc1500/src/wf_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_utils.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o: framework/driver/winc1500/src/wf_wifi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_wifi.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/uart2.o: mcc_generated_files/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart2.c  -o ${OBJECTDIR}/mcc_generated_files/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mcc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/ext_int.o: mcc_generated_files/ext_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/ext_int.c  -o ${OBJECTDIR}/mcc_generated_files/ext_int.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/ext_int.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/stubs/wf_mcu_driver_stub.o: stubs/wf_mcu_driver_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/stubs" 
	@${RM} ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d 
	@${RM} ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  stubs/wf_mcu_driver_stub.c  -o ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/app/demo_support/iot/http/http_client.o: app/demo_support/iot/http/http_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot/http" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/http/http_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/iot/http/http_client.c  -o ${OBJECTDIR}/app/demo_support/iot/http/http_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/demo_support/iot/json.o: app/demo_support/iot/json.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/json.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/json.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/iot/json.c  -o ${OBJECTDIR}/app/demo_support/iot/json.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/iot/json.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/json.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/demo_support/iot/stream_writer.o: app/demo_support/iot/stream_writer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/stream_writer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/iot/stream_writer.c  -o ${OBJECTDIR}/app/demo_support/iot/stream_writer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/demo_support/iot/sw_timer.o: app/demo_support/iot/sw_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/sw_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/iot/sw_timer.c  -o ${OBJECTDIR}/app/demo_support/iot/sw_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/demo_support/winc1500_support_stub.o: app/demo_support/winc1500_support_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support" 
	@${RM} ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/demo_support/winc1500_support_stub.c  -o ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o: app/winc1500_ap_scan/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ap_scan/ota_event_stub.c  -o ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o: app/winc1500_ap_scan/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ap_scan/socket_event_stub.c  -o ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o: app/winc1500_ap_scan/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ap_scan/wifi_event_stub.c  -o ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o: app/winc1500_ap_scan/winc1500_ap_scan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ap_scan/winc1500_ap_scan.c  -o ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o: app/winc1500_provision_ap/winc1500_provision_ap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_provision_ap" 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_provision_ap/winc1500_provision_ap.c  -o ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_pubnub/PubNub.o: app/winc1500_pubnub/PubNub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_pubnub" 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_pubnub/PubNub.c  -o ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o: app/winc1500_pubnub/winc1500_pubnub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_pubnub" 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_pubnub/winc1500_pubnub.c  -o ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_simple_growl/growl.o: app/winc1500_simple_growl/growl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_simple_growl" 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/growl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_simple_growl/growl.c  -o ${OBJECTDIR}/app/winc1500_simple_growl/growl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o: app/winc1500_simple_growl/winc1500_simple_growl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_simple_growl" 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_simple_growl/winc1500_simple_growl.c  -o ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o: app/winc1500_udp_client/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_client/ota_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o: app/winc1500_udp_client/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_client/socket_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o: app/winc1500_udp_client/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_client/wifi_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o: app/winc1500_udp_client/winc1500_udp_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_client/winc1500_udp_client.c  -o ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o: app/winc1500_udp_server/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_server/ota_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o: app/winc1500_udp_server/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_server/socket_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o: app/winc1500_udp_server/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_server/wifi_event_stub.c  -o ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o: app/winc1500_udp_server/winc1500_udp_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_udp_server/winc1500_udp_server.c  -o ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_fw_update_over_serial.o: app/winc1500_fw_update_over_serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_fw_update_over_serial.c  -o ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_http_download.o: app/winc1500_http_download.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_http_download.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_http_download.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_http_download.c  -o ${OBJECTDIR}/app/winc1500_http_download.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_http_download.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_http_download.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_locate_ip_address.o: app/winc1500_locate_ip_address.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_locate_ip_address.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_locate_ip_address.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_locate_ip_address.c  -o ${OBJECTDIR}/app/winc1500_locate_ip_address.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_locate_ip_address.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_locate_ip_address.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mac_address.o: app/winc1500_mac_address.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mac_address.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mac_address.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mac_address.c  -o ${OBJECTDIR}/app/winc1500_mac_address.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mac_address.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mac_address.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mode_ap.o: app/winc1500_mode_ap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_ap.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_ap.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mode_ap.c  -o ${OBJECTDIR}/app/winc1500_mode_ap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mode_ap.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_ap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mode_change.o: app/winc1500_mode_change.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_change.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_change.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mode_change.c  -o ${OBJECTDIR}/app/winc1500_mode_change.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mode_change.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_change.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mode_p2p.o: app/winc1500_mode_p2p.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_p2p.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_p2p.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mode_p2p.c  -o ${OBJECTDIR}/app/winc1500_mode_p2p.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mode_p2p.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_p2p.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_mode_sta.o: app/winc1500_mode_sta.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_sta.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_sta.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_mode_sta.c  -o ${OBJECTDIR}/app/winc1500_mode_sta.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_mode_sta.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_sta.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ota_firmware_update.o: app/winc1500_ota_firmware_update.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ota_firmware_update.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ota_firmware_update.c  -o ${OBJECTDIR}/app/winc1500_ota_firmware_update.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_power_save_mode.o: app/winc1500_power_save_mode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_power_save_mode.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_power_save_mode.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_power_save_mode.c  -o ${OBJECTDIR}/app/winc1500_power_save_mode.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_power_save_mode.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_power_save_mode.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_provision_http.o: app/winc1500_provision_http.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_http.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_http.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_provision_http.c  -o ${OBJECTDIR}/app/winc1500_provision_http.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_provision_http.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_provision_http.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_security_wep_wpa.o: app/winc1500_security_wep_wpa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wep_wpa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_security_wep_wpa.c  -o ${OBJECTDIR}/app/winc1500_security_wep_wpa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_security_wps.o: app/winc1500_security_wps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wps.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_security_wps.c  -o ${OBJECTDIR}/app/winc1500_security_wps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_security_wps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_security_wps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_send_email.o: app/winc1500_send_email.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_send_email.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_send_email.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_send_email.c  -o ${OBJECTDIR}/app/winc1500_send_email.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_send_email.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_send_email.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_signal_strength.o: app/winc1500_signal_strength.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_signal_strength.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_signal_strength.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_signal_strength.c  -o ${OBJECTDIR}/app/winc1500_signal_strength.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_signal_strength.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_signal_strength.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_ssl_connect.o: app/winc1500_ssl_connect.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_ssl_connect.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ssl_connect.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_ssl_connect.c  -o ${OBJECTDIR}/app/winc1500_ssl_connect.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_ssl_connect.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ssl_connect.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_tcp_client.o: app/winc1500_tcp_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_tcp_client.c  -o ${OBJECTDIR}/app/winc1500_tcp_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_tcp_client.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_tcp_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_tcp_server.o: app/winc1500_tcp_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_server.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_server.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_tcp_server.c  -o ${OBJECTDIR}/app/winc1500_tcp_server.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_tcp_server.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_tcp_server.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_time_client.o: app/winc1500_time_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_time_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_time_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_time_client.c  -o ${OBJECTDIR}/app/winc1500_time_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_time_client.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_time_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/app/winc1500_weather_client.o: app/winc1500_weather_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_weather_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_weather_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app/winc1500_weather_client.c  -o ${OBJECTDIR}/app/winc1500_weather_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app/winc1500_weather_client.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_weather_client.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/bsp/bsp.o: bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/bsp.o.d 
	@${RM} ${OBJECTDIR}/bsp/bsp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/bsp.c  -o ${OBJECTDIR}/bsp/bsp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/bsp/bsp.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/bsp/bsp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o: framework/driver/winc1500/src/wf_asic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_asic.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o: framework/driver/winc1500/src/wf_hif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_hif.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o: framework/driver/winc1500/src/wf_ota.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_ota.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o: framework/driver/winc1500/src/wf_socket.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_socket.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o: framework/driver/winc1500/src/wf_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_spi.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o: framework/driver/winc1500/src/wf_spi_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_spi_flash.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o: framework/driver/winc1500/src/wf_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_utils.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o: framework/driver/winc1500/src/wf_wifi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  framework/driver/winc1500/src/wf_wifi.c  -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/uart2.o: mcc_generated_files/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart2.c  -o ${OBJECTDIR}/mcc_generated_files/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mcc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/ext_int.o: mcc_generated_files/ext_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/ext_int.c  -o ${OBJECTDIR}/mcc_generated_files/ext_int.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/mcc_generated_files/ext_int.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/stubs/wf_mcu_driver_stub.o: stubs/wf_mcu_driver_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/stubs" 
	@${RM} ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d 
	@${RM} ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  stubs/wf_mcu_driver_stub.c  -o ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -mlarge-data -O0 -I"mcc_generated_files" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -I"app" -I"bsp" -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/WINCPORTING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/WINCPORTING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp=${DFP_DIR}/xc16 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/WINCPORTING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/WINCPORTING.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_exp16_pic24fj128ga310_winc1500=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp=${DFP_DIR}/xc16 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/WINCPORTING.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp=${DFP_DIR}/xc16 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/exp16_pic24fj128ga310_winc1500
	${RM} -r dist/exp16_pic24fj128ga310_winc1500

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

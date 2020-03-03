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
ifeq "$(wildcard nbproject/Makefile-local-pic32mz2048efg144_winc1500.mk)" "nbproject/Makefile-local-pic32mz2048efg144_winc1500.mk"
include nbproject/Makefile-local-pic32mz2048efg144_winc1500.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=pic32mz2048efg144_winc1500
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SmartBlinds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SmartBlinds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=app/demo_support/iot/http/http_client.c app/demo_support/iot/json.c app/demo_support/iot/stream_writer.c app/demo_support/iot/sw_timer.c app/demo_support/winc1500_support_stub.c app/winc1500_ap_scan/ota_event_stub.c app/winc1500_ap_scan/socket_event_stub.c app/winc1500_ap_scan/wifi_event_stub.c app/winc1500_ap_scan/winc1500_ap_scan.c app/winc1500_provision_ap/winc1500_provision_ap.c app/winc1500_pubnub/PubNub.c app/winc1500_pubnub/winc1500_pubnub.c app/winc1500_simple_growl/growl.c app/winc1500_simple_growl/winc1500_simple_growl.c app/winc1500_udp_client/ota_event_stub.c app/winc1500_udp_client/socket_event_stub.c app/winc1500_udp_client/wifi_event_stub.c app/winc1500_udp_client/winc1500_udp_client.c app/winc1500_udp_server/ota_event_stub.c app/winc1500_udp_server/socket_event_stub.c app/winc1500_udp_server/wifi_event_stub.c app/winc1500_udp_server/winc1500_udp_server.c app/winc1500_fw_update_over_serial.c app/winc1500_http_download.c app/winc1500_locate_ip_address.c app/winc1500_mac_address.c app/winc1500_mode_ap.c app/winc1500_mode_change.c app/winc1500_mode_p2p.c app/winc1500_mode_sta.c app/winc1500_ota_firmware_update.c app/winc1500_power_save_mode.c app/winc1500_provision_http.c app/winc1500_security_wep_wpa.c app/winc1500_security_wps.c app/winc1500_send_email.c app/winc1500_signal_strength.c app/winc1500_ssl_connect.c app/winc1500_tcp_client.c app/winc1500_tcp_server.c app/winc1500_time_client.c app/winc1500_weather_client.c bsp/bsp.c framework/driver/winc1500/src/wf_asic.c framework/driver/winc1500/src/wf_hif.c framework/driver/winc1500/src/wf_ota.c framework/driver/winc1500/src/wf_socket.c framework/driver/winc1500/src/wf_spi.c framework/driver/winc1500/src/wf_spi_flash.c framework/driver/winc1500/src/wf_utils.c framework/driver/winc1500/src/wf_wifi.c mcc_generated_files/traps.c mcc_generated_files/uart2.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/ext_int.c mcc_generated_files/led.c mcc_generated_files/tmr2_3.c mcc_generated_files/adc.c mcc_generated_files/tmr4_5.c mcc_generated_files/stepper_test.c mcc_generated_files/SPI1.c mcc_generated_files/I2C1.c mcc_generated_files/camera.c mcc_generated_files/ov2640_regs.c stubs/wf_mcu_driver_stub.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/app/demo_support/iot/http/http_client.o ${OBJECTDIR}/app/demo_support/iot/json.o ${OBJECTDIR}/app/demo_support/iot/stream_writer.o ${OBJECTDIR}/app/demo_support/iot/sw_timer.o ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o ${OBJECTDIR}/app/winc1500_simple_growl/growl.o ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o ${OBJECTDIR}/app/winc1500_http_download.o ${OBJECTDIR}/app/winc1500_locate_ip_address.o ${OBJECTDIR}/app/winc1500_mac_address.o ${OBJECTDIR}/app/winc1500_mode_ap.o ${OBJECTDIR}/app/winc1500_mode_change.o ${OBJECTDIR}/app/winc1500_mode_p2p.o ${OBJECTDIR}/app/winc1500_mode_sta.o ${OBJECTDIR}/app/winc1500_ota_firmware_update.o ${OBJECTDIR}/app/winc1500_power_save_mode.o ${OBJECTDIR}/app/winc1500_provision_http.o ${OBJECTDIR}/app/winc1500_security_wep_wpa.o ${OBJECTDIR}/app/winc1500_security_wps.o ${OBJECTDIR}/app/winc1500_send_email.o ${OBJECTDIR}/app/winc1500_signal_strength.o ${OBJECTDIR}/app/winc1500_ssl_connect.o ${OBJECTDIR}/app/winc1500_tcp_client.o ${OBJECTDIR}/app/winc1500_tcp_server.o ${OBJECTDIR}/app/winc1500_time_client.o ${OBJECTDIR}/app/winc1500_weather_client.o ${OBJECTDIR}/bsp/bsp.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/uart2.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/ext_int.o ${OBJECTDIR}/mcc_generated_files/led.o ${OBJECTDIR}/mcc_generated_files/tmr2_3.o ${OBJECTDIR}/mcc_generated_files/adc.o ${OBJECTDIR}/mcc_generated_files/tmr4_5.o ${OBJECTDIR}/mcc_generated_files/stepper_test.o ${OBJECTDIR}/mcc_generated_files/SPI1.o ${OBJECTDIR}/mcc_generated_files/I2C1.o ${OBJECTDIR}/mcc_generated_files/camera.o ${OBJECTDIR}/mcc_generated_files/ov2640_regs.o ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d ${OBJECTDIR}/app/demo_support/iot/json.o.d ${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d ${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d ${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d ${OBJECTDIR}/app/winc1500_http_download.o.d ${OBJECTDIR}/app/winc1500_locate_ip_address.o.d ${OBJECTDIR}/app/winc1500_mac_address.o.d ${OBJECTDIR}/app/winc1500_mode_ap.o.d ${OBJECTDIR}/app/winc1500_mode_change.o.d ${OBJECTDIR}/app/winc1500_mode_p2p.o.d ${OBJECTDIR}/app/winc1500_mode_sta.o.d ${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d ${OBJECTDIR}/app/winc1500_power_save_mode.o.d ${OBJECTDIR}/app/winc1500_provision_http.o.d ${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d ${OBJECTDIR}/app/winc1500_security_wps.o.d ${OBJECTDIR}/app/winc1500_send_email.o.d ${OBJECTDIR}/app/winc1500_signal_strength.o.d ${OBJECTDIR}/app/winc1500_ssl_connect.o.d ${OBJECTDIR}/app/winc1500_tcp_client.o.d ${OBJECTDIR}/app/winc1500_tcp_server.o.d ${OBJECTDIR}/app/winc1500_time_client.o.d ${OBJECTDIR}/app/winc1500_weather_client.o.d ${OBJECTDIR}/bsp/bsp.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/uart2.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/tmr1.o.d ${OBJECTDIR}/mcc_generated_files/ext_int.o.d ${OBJECTDIR}/mcc_generated_files/led.o.d ${OBJECTDIR}/mcc_generated_files/tmr2_3.o.d ${OBJECTDIR}/mcc_generated_files/adc.o.d ${OBJECTDIR}/mcc_generated_files/tmr4_5.o.d ${OBJECTDIR}/mcc_generated_files/stepper_test.o.d ${OBJECTDIR}/mcc_generated_files/SPI1.o.d ${OBJECTDIR}/mcc_generated_files/I2C1.o.d ${OBJECTDIR}/mcc_generated_files/camera.o.d ${OBJECTDIR}/mcc_generated_files/ov2640_regs.o.d ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/app/demo_support/iot/http/http_client.o ${OBJECTDIR}/app/demo_support/iot/json.o ${OBJECTDIR}/app/demo_support/iot/stream_writer.o ${OBJECTDIR}/app/demo_support/iot/sw_timer.o ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o ${OBJECTDIR}/app/winc1500_simple_growl/growl.o ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o ${OBJECTDIR}/app/winc1500_http_download.o ${OBJECTDIR}/app/winc1500_locate_ip_address.o ${OBJECTDIR}/app/winc1500_mac_address.o ${OBJECTDIR}/app/winc1500_mode_ap.o ${OBJECTDIR}/app/winc1500_mode_change.o ${OBJECTDIR}/app/winc1500_mode_p2p.o ${OBJECTDIR}/app/winc1500_mode_sta.o ${OBJECTDIR}/app/winc1500_ota_firmware_update.o ${OBJECTDIR}/app/winc1500_power_save_mode.o ${OBJECTDIR}/app/winc1500_provision_http.o ${OBJECTDIR}/app/winc1500_security_wep_wpa.o ${OBJECTDIR}/app/winc1500_security_wps.o ${OBJECTDIR}/app/winc1500_send_email.o ${OBJECTDIR}/app/winc1500_signal_strength.o ${OBJECTDIR}/app/winc1500_ssl_connect.o ${OBJECTDIR}/app/winc1500_tcp_client.o ${OBJECTDIR}/app/winc1500_tcp_server.o ${OBJECTDIR}/app/winc1500_time_client.o ${OBJECTDIR}/app/winc1500_weather_client.o ${OBJECTDIR}/bsp/bsp.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/uart2.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/ext_int.o ${OBJECTDIR}/mcc_generated_files/led.o ${OBJECTDIR}/mcc_generated_files/tmr2_3.o ${OBJECTDIR}/mcc_generated_files/adc.o ${OBJECTDIR}/mcc_generated_files/tmr4_5.o ${OBJECTDIR}/mcc_generated_files/stepper_test.o ${OBJECTDIR}/mcc_generated_files/SPI1.o ${OBJECTDIR}/mcc_generated_files/I2C1.o ${OBJECTDIR}/mcc_generated_files/camera.o ${OBJECTDIR}/mcc_generated_files/ov2640_regs.o ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=app/demo_support/iot/http/http_client.c app/demo_support/iot/json.c app/demo_support/iot/stream_writer.c app/demo_support/iot/sw_timer.c app/demo_support/winc1500_support_stub.c app/winc1500_ap_scan/ota_event_stub.c app/winc1500_ap_scan/socket_event_stub.c app/winc1500_ap_scan/wifi_event_stub.c app/winc1500_ap_scan/winc1500_ap_scan.c app/winc1500_provision_ap/winc1500_provision_ap.c app/winc1500_pubnub/PubNub.c app/winc1500_pubnub/winc1500_pubnub.c app/winc1500_simple_growl/growl.c app/winc1500_simple_growl/winc1500_simple_growl.c app/winc1500_udp_client/ota_event_stub.c app/winc1500_udp_client/socket_event_stub.c app/winc1500_udp_client/wifi_event_stub.c app/winc1500_udp_client/winc1500_udp_client.c app/winc1500_udp_server/ota_event_stub.c app/winc1500_udp_server/socket_event_stub.c app/winc1500_udp_server/wifi_event_stub.c app/winc1500_udp_server/winc1500_udp_server.c app/winc1500_fw_update_over_serial.c app/winc1500_http_download.c app/winc1500_locate_ip_address.c app/winc1500_mac_address.c app/winc1500_mode_ap.c app/winc1500_mode_change.c app/winc1500_mode_p2p.c app/winc1500_mode_sta.c app/winc1500_ota_firmware_update.c app/winc1500_power_save_mode.c app/winc1500_provision_http.c app/winc1500_security_wep_wpa.c app/winc1500_security_wps.c app/winc1500_send_email.c app/winc1500_signal_strength.c app/winc1500_ssl_connect.c app/winc1500_tcp_client.c app/winc1500_tcp_server.c app/winc1500_time_client.c app/winc1500_weather_client.c bsp/bsp.c framework/driver/winc1500/src/wf_asic.c framework/driver/winc1500/src/wf_hif.c framework/driver/winc1500/src/wf_ota.c framework/driver/winc1500/src/wf_socket.c framework/driver/winc1500/src/wf_spi.c framework/driver/winc1500/src/wf_spi_flash.c framework/driver/winc1500/src/wf_utils.c framework/driver/winc1500/src/wf_wifi.c mcc_generated_files/traps.c mcc_generated_files/uart2.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/ext_int.c mcc_generated_files/led.c mcc_generated_files/tmr2_3.c mcc_generated_files/adc.c mcc_generated_files/tmr4_5.c mcc_generated_files/stepper_test.c mcc_generated_files/SPI1.c mcc_generated_files/I2C1.c mcc_generated_files/camera.c mcc_generated_files/ov2640_regs.c stubs/wf_mcu_driver_stub.c main.c



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
	${MAKE}  -f nbproject/Makefile-pic32mz2048efg144_winc1500.mk dist/${CND_CONF}/${IMAGE_TYPE}/SmartBlinds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/app/demo_support/iot/http/http_client.o: app/demo_support/iot/http/http_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot/http" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/http/http_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d" -o ${OBJECTDIR}/app/demo_support/iot/http/http_client.o app/demo_support/iot/http/http_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/demo_support/iot/json.o: app/demo_support/iot/json.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/json.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/json.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/json.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/iot/json.o.d" -o ${OBJECTDIR}/app/demo_support/iot/json.o app/demo_support/iot/json.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/demo_support/iot/stream_writer.o: app/demo_support/iot/stream_writer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/stream_writer.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d" -o ${OBJECTDIR}/app/demo_support/iot/stream_writer.o app/demo_support/iot/stream_writer.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/demo_support/iot/sw_timer.o: app/demo_support/iot/sw_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/sw_timer.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d" -o ${OBJECTDIR}/app/demo_support/iot/sw_timer.o app/demo_support/iot/sw_timer.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/demo_support/winc1500_support_stub.o: app/demo_support/winc1500_support_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support" 
	@${RM} ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d" -o ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o app/demo_support/winc1500_support_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o: app/winc1500_ap_scan/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o app/winc1500_ap_scan/ota_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o: app/winc1500_ap_scan/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o app/winc1500_ap_scan/socket_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o: app/winc1500_ap_scan/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o app/winc1500_ap_scan/wifi_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o: app/winc1500_ap_scan/winc1500_ap_scan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d" -o ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o app/winc1500_ap_scan/winc1500_ap_scan.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o: app/winc1500_provision_ap/winc1500_provision_ap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_provision_ap" 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d" -o ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o app/winc1500_provision_ap/winc1500_provision_ap.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_pubnub/PubNub.o: app/winc1500_pubnub/PubNub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_pubnub" 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d" -o ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o app/winc1500_pubnub/PubNub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o: app/winc1500_pubnub/winc1500_pubnub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_pubnub" 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d" -o ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o app/winc1500_pubnub/winc1500_pubnub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_simple_growl/growl.o: app/winc1500_simple_growl/growl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_simple_growl" 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/growl.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d" -o ${OBJECTDIR}/app/winc1500_simple_growl/growl.o app/winc1500_simple_growl/growl.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o: app/winc1500_simple_growl/winc1500_simple_growl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_simple_growl" 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d" -o ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o app/winc1500_simple_growl/winc1500_simple_growl.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o: app/winc1500_udp_client/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o app/winc1500_udp_client/ota_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o: app/winc1500_udp_client/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o app/winc1500_udp_client/socket_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o: app/winc1500_udp_client/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o app/winc1500_udp_client/wifi_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o: app/winc1500_udp_client/winc1500_udp_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d" -o ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o app/winc1500_udp_client/winc1500_udp_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o: app/winc1500_udp_server/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o app/winc1500_udp_server/ota_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o: app/winc1500_udp_server/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o app/winc1500_udp_server/socket_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o: app/winc1500_udp_server/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o app/winc1500_udp_server/wifi_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o: app/winc1500_udp_server/winc1500_udp_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d" -o ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o app/winc1500_udp_server/winc1500_udp_server.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_fw_update_over_serial.o: app/winc1500_fw_update_over_serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d" -o ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o app/winc1500_fw_update_over_serial.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_http_download.o: app/winc1500_http_download.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_http_download.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_http_download.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_http_download.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_http_download.o.d" -o ${OBJECTDIR}/app/winc1500_http_download.o app/winc1500_http_download.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_locate_ip_address.o: app/winc1500_locate_ip_address.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_locate_ip_address.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_locate_ip_address.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_locate_ip_address.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_locate_ip_address.o.d" -o ${OBJECTDIR}/app/winc1500_locate_ip_address.o app/winc1500_locate_ip_address.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mac_address.o: app/winc1500_mac_address.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mac_address.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mac_address.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mac_address.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mac_address.o.d" -o ${OBJECTDIR}/app/winc1500_mac_address.o app/winc1500_mac_address.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mode_ap.o: app/winc1500_mode_ap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_ap.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_ap.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_ap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mode_ap.o.d" -o ${OBJECTDIR}/app/winc1500_mode_ap.o app/winc1500_mode_ap.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mode_change.o: app/winc1500_mode_change.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_change.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_change.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_change.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mode_change.o.d" -o ${OBJECTDIR}/app/winc1500_mode_change.o app/winc1500_mode_change.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mode_p2p.o: app/winc1500_mode_p2p.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_p2p.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_p2p.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_p2p.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mode_p2p.o.d" -o ${OBJECTDIR}/app/winc1500_mode_p2p.o app/winc1500_mode_p2p.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mode_sta.o: app/winc1500_mode_sta.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_sta.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_sta.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_sta.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mode_sta.o.d" -o ${OBJECTDIR}/app/winc1500_mode_sta.o app/winc1500_mode_sta.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ota_firmware_update.o: app/winc1500_ota_firmware_update.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ota_firmware_update.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d" -o ${OBJECTDIR}/app/winc1500_ota_firmware_update.o app/winc1500_ota_firmware_update.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_power_save_mode.o: app/winc1500_power_save_mode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_power_save_mode.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_power_save_mode.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_power_save_mode.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_power_save_mode.o.d" -o ${OBJECTDIR}/app/winc1500_power_save_mode.o app/winc1500_power_save_mode.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_provision_http.o: app/winc1500_provision_http.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_http.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_http.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_provision_http.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_provision_http.o.d" -o ${OBJECTDIR}/app/winc1500_provision_http.o app/winc1500_provision_http.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_security_wep_wpa.o: app/winc1500_security_wep_wpa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wep_wpa.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d" -o ${OBJECTDIR}/app/winc1500_security_wep_wpa.o app/winc1500_security_wep_wpa.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_security_wps.o: app/winc1500_security_wps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wps.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wps.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_security_wps.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_security_wps.o.d" -o ${OBJECTDIR}/app/winc1500_security_wps.o app/winc1500_security_wps.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_send_email.o: app/winc1500_send_email.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_send_email.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_send_email.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_send_email.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_send_email.o.d" -o ${OBJECTDIR}/app/winc1500_send_email.o app/winc1500_send_email.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_signal_strength.o: app/winc1500_signal_strength.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_signal_strength.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_signal_strength.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_signal_strength.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_signal_strength.o.d" -o ${OBJECTDIR}/app/winc1500_signal_strength.o app/winc1500_signal_strength.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ssl_connect.o: app/winc1500_ssl_connect.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_ssl_connect.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ssl_connect.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ssl_connect.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ssl_connect.o.d" -o ${OBJECTDIR}/app/winc1500_ssl_connect.o app/winc1500_ssl_connect.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_tcp_client.o: app/winc1500_tcp_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_tcp_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_tcp_client.o.d" -o ${OBJECTDIR}/app/winc1500_tcp_client.o app/winc1500_tcp_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_tcp_server.o: app/winc1500_tcp_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_server.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_server.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_tcp_server.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_tcp_server.o.d" -o ${OBJECTDIR}/app/winc1500_tcp_server.o app/winc1500_tcp_server.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_time_client.o: app/winc1500_time_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_time_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_time_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_time_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_time_client.o.d" -o ${OBJECTDIR}/app/winc1500_time_client.o app/winc1500_time_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_weather_client.o: app/winc1500_weather_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_weather_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_weather_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_weather_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_weather_client.o.d" -o ${OBJECTDIR}/app/winc1500_weather_client.o app/winc1500_weather_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/bsp/bsp.o: bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/bsp.o.d 
	@${RM} ${OBJECTDIR}/bsp/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/bsp/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/bsp/bsp.o.d" -o ${OBJECTDIR}/bsp/bsp.o bsp/bsp.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o: framework/driver/winc1500/src/wf_asic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o framework/driver/winc1500/src/wf_asic.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o: framework/driver/winc1500/src/wf_hif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o framework/driver/winc1500/src/wf_hif.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o: framework/driver/winc1500/src/wf_ota.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o framework/driver/winc1500/src/wf_ota.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o: framework/driver/winc1500/src/wf_socket.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o framework/driver/winc1500/src/wf_socket.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o: framework/driver/winc1500/src/wf_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o framework/driver/winc1500/src/wf_spi.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o: framework/driver/winc1500/src/wf_spi_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o framework/driver/winc1500/src/wf_spi_flash.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o: framework/driver/winc1500/src/wf_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o framework/driver/winc1500/src/wf_utils.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o: framework/driver/winc1500/src/wf_wifi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o framework/driver/winc1500/src/wf_wifi.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/traps.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d" -o ${OBJECTDIR}/mcc_generated_files/traps.o mcc_generated_files/traps.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/uart2.o: mcc_generated_files/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/uart2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart2.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart2.o mcc_generated_files/uart2.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mcc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr1.o mcc_generated_files/tmr1.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/ext_int.o: mcc_generated_files/ext_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" -o ${OBJECTDIR}/mcc_generated_files/ext_int.o mcc_generated_files/ext_int.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/led.o: mcc_generated_files/led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/led.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/led.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/led.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/led.o.d" -o ${OBJECTDIR}/mcc_generated_files/led.o mcc_generated_files/led.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/tmr2_3.o: mcc_generated_files/tmr2_3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2_3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2_3.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr2_3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2_3.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr2_3.o mcc_generated_files/tmr2_3.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/adc.o: mcc_generated_files/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc.o mcc_generated_files/adc.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/tmr4_5.o: mcc_generated_files/tmr4_5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr4_5.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr4_5.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr4_5.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr4_5.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr4_5.o mcc_generated_files/tmr4_5.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/stepper_test.o: mcc_generated_files/stepper_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/stepper_test.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/stepper_test.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/stepper_test.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/stepper_test.o.d" -o ${OBJECTDIR}/mcc_generated_files/stepper_test.o mcc_generated_files/stepper_test.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/SPI1.o: mcc_generated_files/SPI1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/SPI1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/SPI1.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/SPI1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/SPI1.o.d" -o ${OBJECTDIR}/mcc_generated_files/SPI1.o mcc_generated_files/SPI1.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/I2C1.o: mcc_generated_files/I2C1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/I2C1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/I2C1.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/I2C1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/I2C1.o.d" -o ${OBJECTDIR}/mcc_generated_files/I2C1.o mcc_generated_files/I2C1.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/camera.o: mcc_generated_files/camera.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/camera.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/camera.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/camera.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/camera.o.d" -o ${OBJECTDIR}/mcc_generated_files/camera.o mcc_generated_files/camera.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/ov2640_regs.o: mcc_generated_files/ov2640_regs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ov2640_regs.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ov2640_regs.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/ov2640_regs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/ov2640_regs.o.d" -o ${OBJECTDIR}/mcc_generated_files/ov2640_regs.o mcc_generated_files/ov2640_regs.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/stubs/wf_mcu_driver_stub.o: stubs/wf_mcu_driver_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/stubs" 
	@${RM} ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d 
	@${RM} ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d" -o ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o stubs/wf_mcu_driver_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/app/demo_support/iot/http/http_client.o: app/demo_support/iot/http/http_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot/http" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/http/http_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/iot/http/http_client.o.d" -o ${OBJECTDIR}/app/demo_support/iot/http/http_client.o app/demo_support/iot/http/http_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/demo_support/iot/json.o: app/demo_support/iot/json.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/json.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/json.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/json.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/iot/json.o.d" -o ${OBJECTDIR}/app/demo_support/iot/json.o app/demo_support/iot/json.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/demo_support/iot/stream_writer.o: app/demo_support/iot/stream_writer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/stream_writer.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/iot/stream_writer.o.d" -o ${OBJECTDIR}/app/demo_support/iot/stream_writer.o app/demo_support/iot/stream_writer.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/demo_support/iot/sw_timer.o: app/demo_support/iot/sw_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support/iot" 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/iot/sw_timer.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/iot/sw_timer.o.d" -o ${OBJECTDIR}/app/demo_support/iot/sw_timer.o app/demo_support/iot/sw_timer.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/demo_support/winc1500_support_stub.o: app/demo_support/winc1500_support_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/demo_support" 
	@${RM} ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d 
	@${RM} ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/demo_support/winc1500_support_stub.o.d" -o ${OBJECTDIR}/app/demo_support/winc1500_support_stub.o app/demo_support/winc1500_support_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o: app/winc1500_ap_scan/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_ap_scan/ota_event_stub.o app/winc1500_ap_scan/ota_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o: app/winc1500_ap_scan/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_ap_scan/socket_event_stub.o app/winc1500_ap_scan/socket_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o: app/winc1500_ap_scan/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_ap_scan/wifi_event_stub.o app/winc1500_ap_scan/wifi_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o: app/winc1500_ap_scan/winc1500_ap_scan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_ap_scan" 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o.d" -o ${OBJECTDIR}/app/winc1500_ap_scan/winc1500_ap_scan.o app/winc1500_ap_scan/winc1500_ap_scan.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o: app/winc1500_provision_ap/winc1500_provision_ap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_provision_ap" 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o.d" -o ${OBJECTDIR}/app/winc1500_provision_ap/winc1500_provision_ap.o app/winc1500_provision_ap/winc1500_provision_ap.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_pubnub/PubNub.o: app/winc1500_pubnub/PubNub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_pubnub" 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_pubnub/PubNub.o.d" -o ${OBJECTDIR}/app/winc1500_pubnub/PubNub.o app/winc1500_pubnub/PubNub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o: app/winc1500_pubnub/winc1500_pubnub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_pubnub" 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o.d" -o ${OBJECTDIR}/app/winc1500_pubnub/winc1500_pubnub.o app/winc1500_pubnub/winc1500_pubnub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_simple_growl/growl.o: app/winc1500_simple_growl/growl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_simple_growl" 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/growl.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_simple_growl/growl.o.d" -o ${OBJECTDIR}/app/winc1500_simple_growl/growl.o app/winc1500_simple_growl/growl.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o: app/winc1500_simple_growl/winc1500_simple_growl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_simple_growl" 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o.d" -o ${OBJECTDIR}/app/winc1500_simple_growl/winc1500_simple_growl.o app/winc1500_simple_growl/winc1500_simple_growl.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o: app/winc1500_udp_client/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_client/ota_event_stub.o app/winc1500_udp_client/ota_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o: app/winc1500_udp_client/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_client/socket_event_stub.o app/winc1500_udp_client/socket_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o: app/winc1500_udp_client/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_client/wifi_event_stub.o app/winc1500_udp_client/wifi_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o: app/winc1500_udp_client/winc1500_udp_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_client" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o.d" -o ${OBJECTDIR}/app/winc1500_udp_client/winc1500_udp_client.o app/winc1500_udp_client/winc1500_udp_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o: app/winc1500_udp_server/ota_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_server/ota_event_stub.o app/winc1500_udp_server/ota_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o: app/winc1500_udp_server/socket_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_server/socket_event_stub.o app/winc1500_udp_server/socket_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o: app/winc1500_udp_server/wifi_event_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o.d" -o ${OBJECTDIR}/app/winc1500_udp_server/wifi_event_stub.o app/winc1500_udp_server/wifi_event_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o: app/winc1500_udp_server/winc1500_udp_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app/winc1500_udp_server" 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o.d" -o ${OBJECTDIR}/app/winc1500_udp_server/winc1500_udp_server.o app/winc1500_udp_server/winc1500_udp_server.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_fw_update_over_serial.o: app/winc1500_fw_update_over_serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_fw_update_over_serial.o.d" -o ${OBJECTDIR}/app/winc1500_fw_update_over_serial.o app/winc1500_fw_update_over_serial.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_http_download.o: app/winc1500_http_download.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_http_download.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_http_download.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_http_download.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_http_download.o.d" -o ${OBJECTDIR}/app/winc1500_http_download.o app/winc1500_http_download.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_locate_ip_address.o: app/winc1500_locate_ip_address.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_locate_ip_address.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_locate_ip_address.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_locate_ip_address.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_locate_ip_address.o.d" -o ${OBJECTDIR}/app/winc1500_locate_ip_address.o app/winc1500_locate_ip_address.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mac_address.o: app/winc1500_mac_address.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mac_address.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mac_address.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mac_address.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mac_address.o.d" -o ${OBJECTDIR}/app/winc1500_mac_address.o app/winc1500_mac_address.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mode_ap.o: app/winc1500_mode_ap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_ap.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_ap.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_ap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mode_ap.o.d" -o ${OBJECTDIR}/app/winc1500_mode_ap.o app/winc1500_mode_ap.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mode_change.o: app/winc1500_mode_change.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_change.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_change.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_change.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mode_change.o.d" -o ${OBJECTDIR}/app/winc1500_mode_change.o app/winc1500_mode_change.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mode_p2p.o: app/winc1500_mode_p2p.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_p2p.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_p2p.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_p2p.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mode_p2p.o.d" -o ${OBJECTDIR}/app/winc1500_mode_p2p.o app/winc1500_mode_p2p.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_mode_sta.o: app/winc1500_mode_sta.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_sta.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_mode_sta.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_mode_sta.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_mode_sta.o.d" -o ${OBJECTDIR}/app/winc1500_mode_sta.o app/winc1500_mode_sta.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ota_firmware_update.o: app/winc1500_ota_firmware_update.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ota_firmware_update.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ota_firmware_update.o.d" -o ${OBJECTDIR}/app/winc1500_ota_firmware_update.o app/winc1500_ota_firmware_update.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_power_save_mode.o: app/winc1500_power_save_mode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_power_save_mode.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_power_save_mode.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_power_save_mode.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_power_save_mode.o.d" -o ${OBJECTDIR}/app/winc1500_power_save_mode.o app/winc1500_power_save_mode.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_provision_http.o: app/winc1500_provision_http.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_http.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_provision_http.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_provision_http.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_provision_http.o.d" -o ${OBJECTDIR}/app/winc1500_provision_http.o app/winc1500_provision_http.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_security_wep_wpa.o: app/winc1500_security_wep_wpa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wep_wpa.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_security_wep_wpa.o.d" -o ${OBJECTDIR}/app/winc1500_security_wep_wpa.o app/winc1500_security_wep_wpa.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_security_wps.o: app/winc1500_security_wps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wps.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_security_wps.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_security_wps.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_security_wps.o.d" -o ${OBJECTDIR}/app/winc1500_security_wps.o app/winc1500_security_wps.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_send_email.o: app/winc1500_send_email.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_send_email.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_send_email.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_send_email.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_send_email.o.d" -o ${OBJECTDIR}/app/winc1500_send_email.o app/winc1500_send_email.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_signal_strength.o: app/winc1500_signal_strength.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_signal_strength.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_signal_strength.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_signal_strength.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_signal_strength.o.d" -o ${OBJECTDIR}/app/winc1500_signal_strength.o app/winc1500_signal_strength.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_ssl_connect.o: app/winc1500_ssl_connect.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_ssl_connect.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_ssl_connect.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_ssl_connect.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_ssl_connect.o.d" -o ${OBJECTDIR}/app/winc1500_ssl_connect.o app/winc1500_ssl_connect.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_tcp_client.o: app/winc1500_tcp_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_tcp_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_tcp_client.o.d" -o ${OBJECTDIR}/app/winc1500_tcp_client.o app/winc1500_tcp_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_tcp_server.o: app/winc1500_tcp_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_server.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_tcp_server.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_tcp_server.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_tcp_server.o.d" -o ${OBJECTDIR}/app/winc1500_tcp_server.o app/winc1500_tcp_server.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_time_client.o: app/winc1500_time_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_time_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_time_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_time_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_time_client.o.d" -o ${OBJECTDIR}/app/winc1500_time_client.o app/winc1500_time_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/app/winc1500_weather_client.o: app/winc1500_weather_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/app" 
	@${RM} ${OBJECTDIR}/app/winc1500_weather_client.o.d 
	@${RM} ${OBJECTDIR}/app/winc1500_weather_client.o 
	@${FIXDEPS} "${OBJECTDIR}/app/winc1500_weather_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/app/winc1500_weather_client.o.d" -o ${OBJECTDIR}/app/winc1500_weather_client.o app/winc1500_weather_client.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/bsp/bsp.o: bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/bsp.o.d 
	@${RM} ${OBJECTDIR}/bsp/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/bsp/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/bsp/bsp.o.d" -o ${OBJECTDIR}/bsp/bsp.o bsp/bsp.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o: framework/driver/winc1500/src/wf_asic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_asic.o framework/driver/winc1500/src/wf_asic.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o: framework/driver/winc1500/src/wf_hif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_hif.o framework/driver/winc1500/src/wf_hif.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o: framework/driver/winc1500/src/wf_ota.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_ota.o framework/driver/winc1500/src/wf_ota.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o: framework/driver/winc1500/src/wf_socket.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_socket.o framework/driver/winc1500/src/wf_socket.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o: framework/driver/winc1500/src/wf_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi.o framework/driver/winc1500/src/wf_spi.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o: framework/driver/winc1500/src/wf_spi_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_spi_flash.o framework/driver/winc1500/src/wf_spi_flash.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o: framework/driver/winc1500/src/wf_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_utils.o framework/driver/winc1500/src/wf_utils.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o: framework/driver/winc1500/src/wf_wifi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/driver/winc1500/src" 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d 
	@${RM} ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o 
	@${FIXDEPS} "${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o.d" -o ${OBJECTDIR}/framework/driver/winc1500/src/wf_wifi.o framework/driver/winc1500/src/wf_wifi.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/traps.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d" -o ${OBJECTDIR}/mcc_generated_files/traps.o mcc_generated_files/traps.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/uart2.o: mcc_generated_files/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/uart2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart2.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart2.o mcc_generated_files/uart2.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mcc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr1.o mcc_generated_files/tmr1.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/ext_int.o: mcc_generated_files/ext_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" -o ${OBJECTDIR}/mcc_generated_files/ext_int.o mcc_generated_files/ext_int.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/led.o: mcc_generated_files/led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/led.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/led.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/led.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/led.o.d" -o ${OBJECTDIR}/mcc_generated_files/led.o mcc_generated_files/led.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/tmr2_3.o: mcc_generated_files/tmr2_3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2_3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2_3.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr2_3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2_3.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr2_3.o mcc_generated_files/tmr2_3.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/adc.o: mcc_generated_files/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc.o mcc_generated_files/adc.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/tmr4_5.o: mcc_generated_files/tmr4_5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr4_5.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr4_5.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr4_5.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr4_5.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr4_5.o mcc_generated_files/tmr4_5.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/stepper_test.o: mcc_generated_files/stepper_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/stepper_test.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/stepper_test.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/stepper_test.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/stepper_test.o.d" -o ${OBJECTDIR}/mcc_generated_files/stepper_test.o mcc_generated_files/stepper_test.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/SPI1.o: mcc_generated_files/SPI1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/SPI1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/SPI1.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/SPI1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/SPI1.o.d" -o ${OBJECTDIR}/mcc_generated_files/SPI1.o mcc_generated_files/SPI1.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/I2C1.o: mcc_generated_files/I2C1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/I2C1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/I2C1.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/I2C1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/I2C1.o.d" -o ${OBJECTDIR}/mcc_generated_files/I2C1.o mcc_generated_files/I2C1.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/camera.o: mcc_generated_files/camera.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/camera.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/camera.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/camera.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/camera.o.d" -o ${OBJECTDIR}/mcc_generated_files/camera.o mcc_generated_files/camera.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/ov2640_regs.o: mcc_generated_files/ov2640_regs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ov2640_regs.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ov2640_regs.o 
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/ov2640_regs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/mcc_generated_files/ov2640_regs.o.d" -o ${OBJECTDIR}/mcc_generated_files/ov2640_regs.o mcc_generated_files/ov2640_regs.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/stubs/wf_mcu_driver_stub.o: stubs/wf_mcu_driver_stub.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/stubs" 
	@${RM} ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d 
	@${RM} ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o 
	@${FIXDEPS} "${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/stubs/wf_mcu_driver_stub.o.d" -o ${OBJECTDIR}/stubs/wf_mcu_driver_stub.o stubs/wf_mcu_driver_stub.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"app" -I"bsp" -I"framework" -I"mcc_generated_files" -I"stubs" -I"app/demo_support/iot" -I"framework/driver/winc1500" -I"framework/driver/winc1500/src" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/SmartBlinds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SmartBlinds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/SmartBlinds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SmartBlinds.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32mz2048efg144_winc1500=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/SmartBlinds.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/pic32mz2048efg144_winc1500
	${RM} -r dist/pic32mz2048efg144_winc1500

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

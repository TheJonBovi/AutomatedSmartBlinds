/**
 *
 * \file
 *
 * \brief WINC1500 Station Mode Example.
 *
 * Copyright (c) 2016-2018 Microchip Technology Inc. and its subsidiaries.
 *
 * \asf_license_start
 *
 * \page License
 *
 * Subject to your compliance with these terms, you may use Microchip
 * software and any derivatives exclusively with Microchip products.
 * It is your responsibility to comply with third party license terms applicable
 * to your use of third party software (including open source software) that
 * may accompany Microchip software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
 * INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY,
 * AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE
 * LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL
 * LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE
 * SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE
 * POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE FULLEST EXTENT
 * ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN ANY WAY
 * RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
 * THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * \asf_license_stop
 *
 */

/** \mainpage
 * \section intro Introduction
 * This example demonstrates the use of the WINC1500 with the SAMD21 Xplained Pro
 * board to behave as a station.<br>
 * It uses the following hardware:
 * - the SAMD21 Xplained Pro.
 * - the WINC1500 on EXT1.
 *
 * \section files Main Files
 * - main.c : Initialize the WINC1500 and connect AP as a station mode.
 *
 * \section usage Usage
 * -# Configure below code in the config main.h for AP information to be connected.
 * \code
 *    #define MAIN_WLAN_SSID         "DEMO_AP"
 *    #define MAIN_WLAN_AUTH         M2M_WIFI_SEC_WPA_PSK
 *    #define MAIN_WLAN_PSK          "12345678"
 * \endcode
 * -# Build the program and download it into the board.
 * -# On the computer, open and configure a terminal application as the follows.
 * \code
 *    Baud Rate : 115200
 *    Data : 8bit
 *    Parity bit : none
 *    Stop bit : 1bit
 *    Flow control : none
 * \endcode
 * -# Start the application.
 * -# In the terminal window, the following text should appear:
 * \code
 *    -- WINC1500 station mode example --
 *    -- SAMD21_XPLAINED_PRO --
 *    -- Compiled: xxx xx xxxx xx:xx:xx --
 *    Connecting to XXXXXX.
 *    Wi-Fi connected
 *    Wi-Fi IP is xxx.xxx.xxx.xxx
 * \endcode
 *
 * \section compinfo Compilation Information
 * This software was written for the GNU GCC compiler using Atmel Studio 6.2
 * Other compilers may or may not work.
 *
 * \section contactinfo Contact Information
 * For further information, visit
 * <A href="http://www.microchip.com">Microchip</A>.\n
 */

#include "asf.h"
#include "main.h"
#include "driver/include/m2m_wifi.h"
#include "driver/source/nmasic.h"
#include "bsp/include/nm_bsp.h"
#include "socket/include/socket.h"



#define STRING_EOL    "\r\n"
#define STRING_HEADER "-- WINC1500 station mode/weather client example --"STRING_EOL \
	"-- "BOARD_NAME " --"STRING_EOL	\
	"-- Compiled: "__DATE__ " "__TIME__ " --"STRING_EOL

/** IP address of host. */
uint32_t gu32HostIp = 0;

/** UART module for debug. */
static struct usart_module cdc_uart_module;


/** TCP client socket handlers. */
static SOCKET tcp_client_socket = -1;


/** Receive buffer definition. */
static uint8_t gau8ReceivedBuffer[MAIN_WIFI_M2M_BUFFER_SIZE] = {0};


/** Wi-Fi status variable. */
static bool gbConnectedWifi = false;

/** Get host IP status variable. */
static bool gbHostIpByName = false;

/** TCP Connection status variable. */
static bool gbTcpConnection = false;

/**
 * \brief Configure UART console.
 */
static void configure_console(void)
{
	struct usart_config usart_conf;

	usart_get_config_defaults(&usart_conf);
	usart_conf.mux_setting = EDBG_CDC_SERCOM_MUX_SETTING;
	usart_conf.pinmux_pad0 = EDBG_CDC_SERCOM_PINMUX_PAD0;
	usart_conf.pinmux_pad1 = EDBG_CDC_SERCOM_PINMUX_PAD1;
	usart_conf.pinmux_pad2 = EDBG_CDC_SERCOM_PINMUX_PAD2;
	usart_conf.pinmux_pad3 = EDBG_CDC_SERCOM_PINMUX_PAD3;
	usart_conf.baudrate    = 115200;

	stdio_serial_init(&cdc_uart_module, EDBG_CDC_MODULE, &usart_conf);
	usart_enable(&cdc_uart_module);
}

/**
 * \brief Callback to get the Wi-Fi status update.
 *
 * \param[in] u8MsgType type of Wi-Fi notification. Possible types are:
 *  - [M2M_WIFI_RESP_CON_STATE_CHANGED](@ref M2M_WIFI_RESP_CON_STATE_CHANGED)
 *  - [M2M_WIFI_REQ_DHCP_CONF](@ref M2M_WIFI_REQ_DHCP_CONF)
 * \param[in] pvMsg A pointer to a buffer containing the notification parameters
 * (if any). It should be casted to the correct data type corresponding to the
 * notification type.
 */

/**
 * \brief Callback function of IP address.
 *
 * \param[in] hostName Domain name.
 * \param[in] hostIp Server IP.
 *
 * \return None.
 */
static void resolve_cb(uint8_t *hostName, uint32_t hostIp)
{
	gu32HostIp = hostIp;
	gbHostIpByName = true;
	printf("resolve_cb: %s IP address is %d.%d.%d.%d\r\n\r\n", hostName,
			(int)IPV4_BYTE(hostIp, 0), (int)IPV4_BYTE(hostIp, 1),
			(int)IPV4_BYTE(hostIp, 2), (int)IPV4_BYTE(hostIp, 3));
}

/**
 * \brief Callback function of TCP client socket.
 *
 * \param[in] sock socket handler.
 * \param[in] u8Msg Type of Socket notification
 * \param[in] pvMsg A structure contains notification informations.
 *
 * \return None.
 */
static void socket_cb(SOCKET sock, uint8_t u8Msg, void *pvMsg)
{
	/* Check for socket event on TCP socket. */
	if (sock == tcp_client_socket) {
		switch (u8Msg) {
		case SOCKET_MSG_CONNECT:
		{
			if (gbTcpConnection) {
				memset(gau8ReceivedBuffer, 0, sizeof(gau8ReceivedBuffer));
				sprintf((char *)gau8ReceivedBuffer, "%s%s%s", MAIN_PREFIX_BUFFER, (char *)MAIN_CITY_NAME, MAIN_POST_BUFFER);
				//sprintf((char *)gau8ReceivedBuffer, "%s", MAIN_POST_BUFFER);

				tstrSocketConnectMsg *pstrConnect = (tstrSocketConnectMsg *)pvMsg;
				if (pstrConnect && pstrConnect->s8Error >= SOCK_ERR_NO_ERROR) {
					send(tcp_client_socket, gau8ReceivedBuffer, strlen((char *)gau8ReceivedBuffer), 0);

					memset(gau8ReceivedBuffer, 0, MAIN_WIFI_M2M_BUFFER_SIZE);
					recv(tcp_client_socket, &gau8ReceivedBuffer[0], MAIN_WIFI_M2M_BUFFER_SIZE, 0);
				} else {
					printf("socket_cb: connect error!\r\n");
					gbTcpConnection = false;
					close(tcp_client_socket);
					tcp_client_socket = -1;
				}
			}
		}
		break;

		case SOCKET_MSG_RECV:
		{
			char *pcIndxPtr;
			char *pcEndPtr;

			tstrSocketRecvMsg *pstrRecv = (tstrSocketRecvMsg *)pvMsg;
			if (pstrRecv && pstrRecv->s16BufferSize > 0) {

				/* Get city name. */
				pcIndxPtr = strstr((char *)pstrRecv->pu8Buffer, "name=");
				printf("City: ");
				if (NULL != pcIndxPtr) {
					pcIndxPtr = pcIndxPtr + strlen("name=") + 1;
					pcEndPtr = strstr(pcIndxPtr, "\">");
					if (NULL != pcEndPtr) {
						*pcEndPtr = 0;
					}

					printf("%s\r\n", pcIndxPtr);
				} else {
					printf("N/A\r\n");
					break;
				}
				
				/* Get latitude */
				
				pcIndxPtr = strstr(pcEndPtr + 1, "lat=");
				printf("Lat: ");
				if (NULL != pcIndxPtr) {
					pcIndxPtr = pcIndxPtr + strlen("lat=") + 1;
					pcEndPtr = strstr(pcIndxPtr, "\">");
					if (NULL != pcEndPtr) {
						*pcEndPtr = 0;
					}

					printf("%s\r\n", pcIndxPtr);
				} else {
					printf("N/A\r\n");
					break;
				}
				
				
				/* Get Country */
				
				pcIndxPtr = strstr(pcEndPtr + 1, "country>");
				printf("Country: ");
				if (NULL != pcIndxPtr) {
					pcIndxPtr = pcIndxPtr + strlen("country") + 1;
					pcEndPtr = strstr(pcIndxPtr, "<");
					if (NULL != pcEndPtr) {
						*pcEndPtr = 0;
					}

					printf("%s\r\n", pcIndxPtr);
				} else {
					printf("N/A\r\n");
					break;
				}

				/* Get temperature. */
				pcIndxPtr = strstr(pcEndPtr + 1, "temperature value");
				printf("Temperature: ");
				if (NULL != pcIndxPtr) {
					pcIndxPtr = pcIndxPtr + strlen("temperature value") + 2;
					pcEndPtr = strstr(pcIndxPtr, "\" ");
					if (NULL != pcEndPtr) {
						*pcEndPtr = 0;
					}

					printf("%s\r\n", pcIndxPtr);
				} else {
					printf("N/A\r\n");
					break;
				}

				/* Get weather condition. */
				pcIndxPtr = strstr(pcEndPtr + 1, "weather number");
				if (NULL != pcIndxPtr) {
					printf("Weather Condition: ");
					pcIndxPtr = pcIndxPtr + strlen("weather number") + 14;
					pcEndPtr = strstr(pcIndxPtr, "\" ");
					if (NULL != pcEndPtr) {
						*pcEndPtr = 0;
					}
					printf("%s\r\n", pcIndxPtr);
					
					/* Response processed, now close connection. */
					close(tcp_client_socket);
					tcp_client_socket = -1;
					gbTcpConnection = false;
					port_pin_set_output_level(LED_0_PIN, false);
					break;
				}

				memset(gau8ReceivedBuffer, 0, sizeof(gau8ReceivedBuffer));
				recv(tcp_client_socket, &gau8ReceivedBuffer[0], MAIN_WIFI_M2M_BUFFER_SIZE, 0);
			} else {
				printf("socket_cb: recv error!\r\n");
				close(tcp_client_socket);
				tcp_client_socket = -1;
			}
		}
		break;

		default:
			break;
		}
	}
}

static void set_dev_name_to_mac(uint8_t *name, uint8_t *mac_addr)
{
	/* Name must be in the format WINC1500_00:00 */
	uint16 len;

	len = m2m_strlen(name);
	if (len >= 5) {
		name[len - 1] = MAIN_HEX2ASCII((mac_addr[5] >> 0) & 0x0f);
		name[len - 2] = MAIN_HEX2ASCII((mac_addr[5] >> 4) & 0x0f);
		name[len - 4] = MAIN_HEX2ASCII((mac_addr[4] >> 0) & 0x0f);
		name[len - 5] = MAIN_HEX2ASCII((mac_addr[4] >> 4) & 0x0f);
	}
}

static void wifi_cb(uint8_t u8MsgType, void *pvMsg)
{
	switch (u8MsgType) {
	case M2M_WIFI_RESP_CON_STATE_CHANGED:
	{
		tstrM2mWifiStateChanged *pstrWifiState = (tstrM2mWifiStateChanged *)pvMsg;
		if (pstrWifiState->u8CurrState == M2M_WIFI_CONNECTED) {
			printf("wifi_cb: M2M_WIFI_CONNECTED\r\n");
			m2m_wifi_request_dhcp_client();
		} else if (pstrWifiState->u8CurrState == M2M_WIFI_DISCONNECTED) {
			printf("Wi-Fi disconnected\r\n");
			printf("Error code: %d\r\n",pstrWifiState->u8ErrCode);
			gbConnectedWifi = false;
			
			/* Connect to defined AP. */
			//m2m_wifi_connect((char *)MAIN_WLAN_SSID, sizeof(MAIN_WLAN_SSID), MAIN_WLAN_AUTH, (void *)MAIN_WLAN_PSK, M2M_WIFI_CH_ALL);
		}

		break;
	}

	case M2M_WIFI_REQ_DHCP_CONF:
	{
		
		uint8_t *pu8IPAddress = (uint8_t *)pvMsg;
		printf("wifi_cb: IP address is %u.%u.%u.%u\r\n",
				pu8IPAddress[0], pu8IPAddress[1], pu8IPAddress[2], pu8IPAddress[3]);
		gbConnectedWifi = true;
		/* Obtain the IP Address by network name */
		gethostbyname((uint8_t *)MAIN_WEATHER_SERVER_NAME);
		break;
		
	}
	case M2M_WIFI_RESP_PROVISION_INFO:
	{
		tstrM2MProvisionInfo *pstrProvInfo = (tstrM2MProvisionInfo *)pvMsg;
		printf("wifi_cb: M2M_WIFI_RESP_PROVISION_INFO\r\n");

		if (pstrProvInfo->u8Status == M2M_SUCCESS) {
			m2m_wifi_connect((char *)pstrProvInfo->au8SSID, strlen((char *)pstrProvInfo->au8SSID), pstrProvInfo->u8SecType,
					pstrProvInfo->au8Password, M2M_WIFI_CH_ALL);
		} else {
			printf("wifi_cb: provision failed!\r\n");
		}
	}
	break;

	default:
	{
		break;
	}
	}
}

/**
 * \brief Main application function.
 *
 * Application entry point.
 *
 * \return program return value.
 */
int main(void)
{
	tstrWifiInitParam param;
	int8_t ret;
	
	uint8_t mac_addr[6];
	uint8_t u8IsMacAddrValid;
	struct sockaddr_in addr_in;
	

	/* Initialize the board. */
	system_init();

	/* Initialize the UART console. */
	configure_console();
	printf(STRING_HEADER);

	/* Initialize the BSP. */
	nm_bsp_init();

	/* Initialize Wi-Fi parameters structure. */
	memset((uint8_t *)&param, 0, sizeof(tstrWifiInitParam));

	/* Initialize Wi-Fi driver with data and status callbacks. */
	param.pfAppWifiCb = wifi_cb;
	ret = m2m_wifi_init(&param); //initialize bus interface for host mcu to get to WINC1500 via SPI
	if (M2M_SUCCESS != ret) {
		printf("main: m2m_wifi_init call error!(%d)\r\n", ret);
		while (1) {
		}
	}
/* Initialize socket API. */
	socketInit();
	registerSocketCallback(socket_cb, resolve_cb);
	
	m2m_wifi_get_otp_mac_address(mac_addr, &u8IsMacAddrValid);
	if (!u8IsMacAddrValid) {
		m2m_wifi_set_mac_address(gau8MacAddr);
	}
	
		///* Retrieve MAC address of the WINC and use it for AP name. */
		//m2m_wifi_get_mac_address(gau8MacAddr);
		//set_dev_name_to_mac((uint8_t *)gacDeviceName, gau8MacAddr);
		//set_dev_name_to_mac((uint8_t *)gstrM2MAPConfig.au8SSID, gau8MacAddr);
		//m2m_wifi_set_device_name((uint8_t *)gacDeviceName, (uint8_t)m2m_strlen((uint8_t *)gacDeviceName));
		//gstrM2MAPConfig.au8DHCPServerIP[0] = 0xC0; /* 192 */
		//gstrM2MAPConfig.au8DHCPServerIP[1] = 0xA8; /* 168 */
		//gstrM2MAPConfig.au8DHCPServerIP[2] = 0x01; /* 1 */
		//gstrM2MAPConfig.au8DHCPServerIP[3] = 0x01; /* 1 */

	printf("Connecting to %s.\r\n", (char *)MAIN_WLAN_SSID);
	/* Connect to defined AP. */
	m2m_wifi_connect((char *)MAIN_WLAN_SSID, sizeof(MAIN_WLAN_SSID), MAIN_WLAN_AUTH, (void *)MAIN_WLAN_PSK, M2M_WIFI_CH_ALL);

		
	
		uint8_t sendmultiple = 100;
		int intCnt = 1;
		
	while (1) {
		
		//printf("How many times do we hit the while loop: %s", intCnt++);
		intCnt++;
		/* Handle pending events from network controller. */
			//(m2m_wifi_handle_events(NULL) != M2M_SUCCESS); 
		m2m_wifi_handle_events(NULL);
//if(intCnt > 10000)
//{
	//gbTcpConnection = false;
	//
//}

		if (gbConnectedWifi && !gbTcpConnection) {
			if (gbHostIpByName) {
				/* Open TCP client socket. */
				if (tcp_client_socket < 0) {
					if ((tcp_client_socket = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
						printf("main: failed to create TCP client socket error!\r\n");
						continue;
					}
				}

				/* Connect TCP client socket. */
				addr_in.sin_family = AF_INET;
				addr_in.sin_port = _htons(MAIN_SERVER_PORT);
				addr_in.sin_addr.s_addr = gu32HostIp;
				if (connect(tcp_client_socket, (struct sockaddr *)&addr_in, sizeof(struct sockaddr_in)) != SOCK_ERR_NO_ERROR) {
					printf("main: failed to connect socket error!\r\n");
					continue;
				}
				/*should consider clearing recv buffer here
				it is recommended to call the recv() function after each successful
				socket connection (client or server). Otherwise, received data will be buffered in the ATWINC1500
				firmware wasting the system resources until the socket is explicitly closed using a close() function call.*/
				
				gbTcpConnection = true;
			}		
	
		}
		
	}

	return 0;
}

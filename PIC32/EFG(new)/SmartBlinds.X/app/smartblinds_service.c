/*******************************************************************************
  File Name:
    smartblinds_service.c

  Summary:
    WINC1500 Smartblinds Service Component

  Description:
    This demo performs the following steps:
        1) Starts Wi-Fi connection to the specified Access Point (AP)
        2) Waits for the connection and get IP address
        3) Send DNS for server's IP address
 
    The configuration defines for this demo are:    
        WLAN_SSID             -- AP to connect to
        WLAN_AUTH             -- Security type of the AP
        WLAN_PSK              -- Passphrase if using WPA security

    The demo uses these callback functions to handle events:
        socket_cb()
        resolve_cb()
        wifi_cb()
*******************************************************************************/

//DOM-IGNORE-BEGIN
/*==============================================================================
Copyright 2016 Microchip Technology Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

//==============================================================================
// INCLUDES
//==============================================================================

#include "winc1500_api.h"
#include "demo_config.h"
#include "wf_common.h"
#include "defines.h"

#if defined(USING_SMARTBLINDS_SERVICE)

//==============================================================================
// DEMO CONFIGURATION
//==============================================================================

/** Wi-Fi AP Settings. */

#define WLAN_SSID              "OOP_2.4"             // target AP
//#define WLAN_SSID               "guesthouse guests"
#define WLAN_AUTH              M2M_WIFI_SEC_WPA_PSK   // AP Security 
#define WLAN_PSK               "goatcheese"            // security password
//#define WLAN_PSK                  "guesthouse1"

#define WIFI_BUFFER_SIZE       1400                  // Receive buffer size.
#define SERVER_PORT            (80)                  // Using broadcast address for simplicity

#define smartblinds_server_name   "smartblinds.eastus.cloudapp.azure.com"
#define log_entry1                "GET /SmartBlindsWebService.asmx/LogAllEntry?func=1&tempVal="
#define log_entry2                "&proxVal="
#define log_entry3                "&gasLog="
#define log_entry4                "&sbHorxLog="
#define log_entry5                "&sbVertLog="
#define log_entry6                "\r\n\r\n"
#define getxml_buffer             "GET /SmartBlindsWebService.asmx/GetXML HTTP/1.1\r\nHost: smartblinds.eastus.cloudapp.azure.com\r\nAccept: */*\r\n\r\n"

#define IPV4_BYTE(val, index)  ((val >> (index * 8)) & 0xFF)  // IP address parsing.
#define HEX2ASCII(x)           (((x) >= 10) ? (((x) - 10) + 'A') : ((x) + '0'))

#define SetAppState(state)     g_appState = state
#define GetAppState()          g_appState

extern int temperatureAlarm;
extern double current_temp;
extern uint8_t message_type;
extern int proxyAlarm;
extern int gasAlarm;
extern int motorTargetUD;
extern int motorTargetOC;

// application states
typedef enum
{
    APP_STATE_WAIT_FOR_DRIVER_INIT,
    APP_STATE_START,
    APP_STATE_WAIT_CONNECT_AND_DHCP,
    APP_STATE_WORKING,  
    APP_STATE_DONE
} t_AppState;

t_AppState g_appState = APP_STATE_WAIT_FOR_DRIVER_INIT;
static uint8_t s_ReceivedBuffer[WIFI_BUFFER_SIZE] = {0}; // Receive buffer
static SOCKET tcp_client_socket = -1; // TCP client socket handlers
static struct sockaddr_in addr_in;
static uint32_t s_HostIp = 0;         // IP address of host.
static bool s_ConnectedWifi = false;  // Wi-Fi status
static bool s_HostIpByName = false;   // host IP status
static bool s_TcpConnection = false;  // TCP Connection status
static char g_ssid[] = {WLAN_SSID};

static void wifi_cb(uint8_t msgType, void *pvMsg);
static void socket_cb(SOCKET sock, uint8_t message, void *pvMsg);
static void resolve_cb(char *pu8DomainName, uint32_t serverIP);

uint8_t testvar =1;
char testcvar[100];


void ApplicationTask(void)
{
    switch (GetAppState())
    {
    case APP_STATE_WAIT_FOR_DRIVER_INIT:
        if (isDriverInitComplete())
        {
            SetAppState(APP_STATE_START);
        }
        break;
        
    case APP_STATE_START:
        registerWifiCallback(wifi_cb);
        registerSocketCallback(socket_cb, resolve_cb);
        
        m2m_wifi_connect(g_ssid,
                         strlen(WLAN_SSID),
                         WLAN_AUTH,
                         (void *)WLAN_PSK,
                         M2M_WIFI_CH_ALL);
        SetAppState(APP_STATE_WAIT_CONNECT_AND_DHCP);
        break;

    case APP_STATE_WAIT_CONNECT_AND_DHCP:
        if (s_ConnectedWifi)
        {
            if (s_HostIpByName) 
            {
                /* Open TCP client socket. */
                if (tcp_client_socket < 0) 
                {
                    if ((tcp_client_socket = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
                    {
                        printf("main: failed to create TCP client socket error!\r\n");
                        SetAppState(APP_STATE_DONE);
                        break;
                    }
                }

                /* Connect TCP client socket. */
                addr_in.sin_family = AF_INET;
                addr_in.sin_port = _htons(SERVER_PORT);
                addr_in.sin_addr.s_addr = s_HostIp;
                if (connect(tcp_client_socket, (struct sockaddr *)&addr_in, sizeof(struct sockaddr_in)) != SOCK_ERR_NO_ERROR) 
                {
                    printf("main: failed to connect socket error!\r\n");
                    SetAppState(APP_STATE_DONE);
                    break;
                }

                s_TcpConnection = true;
                SetAppState(APP_STATE_WORKING);
            }
        }
        break;

    case APP_STATE_WORKING:       

        testvar++;
        
        break;
        
    case APP_STATE_DONE:
        testvar++;
        break;
    default:
        break;
    }
}

static void resolve_cb(char *hostName, uint32_t hostIp)
{
    s_HostIp = hostIp;
    s_HostIpByName = true;
    printf("%s IP address is %d.%d.%d.%d\r\n\r\n", hostName,
            (int)IPV4_BYTE(hostIp, 0), (int)IPV4_BYTE(hostIp, 1),
            (int)IPV4_BYTE(hostIp, 2), (int)IPV4_BYTE(hostIp, 3));
}

static void socket_cb(SOCKET sock, uint8_t message, void *pvMsg)
{
    /* Check for socket event on TCP socket. */
    if (sock == tcp_client_socket) 
    {
        switch (message) {
        case M2M_SOCKET_CONNECT_EVENT:
        {
            if (s_TcpConnection) 
            {
                // Load up s_RecievedBuffer with HTTP Command
                memset(s_ReceivedBuffer, 0, sizeof(s_ReceivedBuffer));
                if ( message_type == WIFI_LOG_ENTRY_MODE )
                {
                    //sprintf((char *)s_ReceivedBuffer, "%s", LOG_ENTRY_BUFFER);
                    sprintf((char *)s_ReceivedBuffer, "%s%u%s%u%s%u%s%u%s%u%s", log_entry1, current_temp, log_entry2, proxyAlarm, log_entry3, gasAlarm, log_entry4, motorTargetUD, log_entry5, motorTargetOC, log_entry6);
                }
                else if ( message_type == WIFI_HELLOXML_MODE )
                {
                    sprintf((char *)s_ReceivedBuffer, "%s", getxml_buffer);
                }
               
                t_socketConnect *pstrConnect = (t_socketConnect *)pvMsg;
                if (pstrConnect && pstrConnect->error >= SOCK_ERR_NO_ERROR) 
                {
                    send(tcp_client_socket, s_ReceivedBuffer, strlen((char *)s_ReceivedBuffer), 0);
                    memset(s_ReceivedBuffer, 0, WIFI_BUFFER_SIZE);
                    recv(tcp_client_socket, &s_ReceivedBuffer[0], WIFI_BUFFER_SIZE, 0);
                } 
                else 
                {
                    printf("connect error!\r\n");
                    s_TcpConnection = false;
                    close(tcp_client_socket);
                    tcp_client_socket = -1;
                }
            }
        }
        break;

        case M2M_SOCKET_RECV_EVENT:
        {
            char *pcIndxPtr;
            char *pcEndPtr;

            t_socketRecv *pstrRecv = (t_socketRecv *)pvMsg;
            if (pstrRecv && pstrRecv->bufSize > 0) 
            {
                /* Get temperature. */
                pcIndxPtr = strstr((char *)pstrRecv->p_rxBuf, "\">");
                printf("Value Returned: ");
                if (NULL != pcIndxPtr) 
                {
                    pcIndxPtr = pcIndxPtr + strlen("\">");
                    pcEndPtr = strstr(pcIndxPtr, "</");
                    if (NULL != pcEndPtr) 
                    {
                        *pcEndPtr = 0;
                    }
                    strcpy(testcvar, pcIndxPtr );
                    printf("%s\r\n", pcIndxPtr);
                } 
                else 
                {
                    printf("N/A\r\n");
                    break;
                }

                /* Get temperature. */
                pcIndxPtr = strstr(pcEndPtr + 1, "temperature value");
                printf("Temperature: ");
                if (NULL != pcIndxPtr) 
                {
                    pcIndxPtr = pcIndxPtr + strlen("temperature value") + 2;
                    pcEndPtr = strstr(pcIndxPtr, "\" ");
                    if (NULL != pcEndPtr) 
                    {
                        *pcEndPtr = 0;
                    }
                     strcpy(testcvar, pcIndxPtr );
                    printf("%s\r\n", pcIndxPtr);
                } 
                else 
                {
                    printf("N/A\r\n");
                    SetAppState(APP_STATE_START); //start process over again
                    strcpy(testcvar, "Reset");
                    break;
                }

                /* Get weather condition. */
                pcIndxPtr = strstr(pcEndPtr + 1, "weather number");
                if (NULL != pcIndxPtr) 
                {
                    printf("Weather Condition: ");
                    pcIndxPtr = pcIndxPtr + strlen("weather number") + 14;
                    pcEndPtr = strstr(pcIndxPtr, "\" ");
                    if (NULL != pcEndPtr) 
                    {
                        *pcEndPtr = 0;
                    }
                    printf("%s\r\n", pcIndxPtr);
                     strcpy(testcvar, pcIndxPtr );
                    /* Response processed, now close connection. */
                    close(tcp_client_socket);
                    tcp_client_socket = -1;
                    
                    break;
                }

                memset(s_ReceivedBuffer, 0, sizeof(s_ReceivedBuffer));
                recv(tcp_client_socket, &s_ReceivedBuffer[0], WIFI_BUFFER_SIZE, 0);
            } 
            else 
            {
                printf("recv error!\r\n");
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

static void wifi_cb(uint8_t msgType, void *pvMsg)
{
    switch (msgType) {
    case M2M_WIFI_CONN_STATE_CHANGED_EVENT:
    {
        tstrM2mWifiStateChanged *pWifiConnState = (tstrM2mWifiStateChanged *)pvMsg;
        if (pWifiConnState->u8CurrState == M2M_WIFI_CONNECTED)
        {
            printf("Connected -- starting DHCP client\r\n");
        }
        else if (pWifiConnState->u8CurrState == M2M_WIFI_DISCONNECTED) 
        {
            s_ConnectedWifi = false;
            printf("disconnected -- starting connect again\r\n");
            m2m_wifi_connect((char *)WLAN_SSID,
                             strlen(WLAN_SSID),
                             WLAN_AUTH, 
                             (char *)WLAN_PSK,
                             M2M_WIFI_CH_ALL);
        }
        break;
    }

    case M2M_WIFI_IP_ADDRESS_ASSIGNED_EVENT:
    {
        uint8_t *pu8IPAddress = (uint8_t *)pvMsg;
        printf("IP address is %u.%u.%u.%u\r\n",
                pu8IPAddress[0], pu8IPAddress[1], pu8IPAddress[2], pu8IPAddress[3]);
        s_ConnectedWifi = true;
        /* Obtain the IP Address by network name */
        gethostbyname((const char *)smartblinds_server_name);
        break;
    }

    default:
    {
        break;
    }
    }
}

#endif

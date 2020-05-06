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

#include <xc.h>
#include "winc1500_api.h"
#include "demo_config.h"
#include "wf_common.h"
#include "defines.h"
#include <string.h>

#if defined(USING_SMARTBLINDS_SERVICE)

//==============================================================================
// DEMO CONFIGURATION
//==============================================================================

/** Wi-Fi AP Settings. */

#ifdef DREW_HOUSE
#define WLAN_SSID              "OOP_2.4"             // target AP
#define WLAN_PSK               "goatcheese"            // security password
#endif

#ifdef DREW_PHONE
#define WLAN_SSID              "DrewPhone"             // target AP
#define WLAN_PSK               "password"            // security password
#endif

#ifdef CHAD_HOUSE
#define WLAN_SSID              "JapanEXP"        //target AP
#define WLAN_PSK               "USSAlcatraz1465!!"        //security password
#endif

#define WLAN_AUTH              M2M_WIFI_SEC_WPA_PSK   // AP Security 

#define WIFI_BUFFER_SIZE       1400                  // Receive buffer size.
#define SERVER_PORT            (80)                  // Using broadcast address for simplicity

#define smartblinds_server_name     "smartblinds.eastus.cloudapp.azure.com"
#define log_entry1                  "GET /SmartBlindsWebService.asmx/LogAllEntry?func=1&tempVal="
#define log_entry2                  "&proxVal="
#define log_entry3                  "&gasLog="
#define log_entry4                  "&sbHorxLog="
#define log_entry5                  "&sbVertLog="
#define log_entry6                  "&sbTempAlarm="
#define log_entry7                  " HTTP/1.1\r\nHost: smartblinds.eastus.cloudapp.azure.com\r\nAccept: */*\r\n\r\n"

#define getxml_buffer               "GET /SmartBlindsWebService.asmx/GetXML HTTP/1.1\r\nHost: smartblinds.eastus.cloudapp.azure.com\r\nAccept: */*\r\n\r\n"

#define log_entry_buffer            "GET /SmartBlindsWebService.asmx/LogEntry?func=0&val=6969\r\n\r\n"

#define recieve_buffer              "GET /SmartBlindsWebService.asmx/GetBlindsSettings? HTTP/1.1\r\nHost: smartblinds.eastus.cloudapp.azure.com\r\nAccept: */*\r\n\r\n"

//#define upload_entry1               "GET /SmartBlindsWebService.asmx/UploadFile?f="
//#define upload_entry2               "&f="
//#define upload_entry3               "&fileName=img.jpg HTTP/1.1\r\nHost: smartblinds.eastus.cloudapp.azure.com\r\nAccept: */*\r\n\r\n"

#define upload_entry1               "POST /SmartBlindsWebService.asmx HTTP/1.1\r\nContent-Type: text/xml; charset=utf-8\r\nSOAPAction: \"http://smartblinds.eastus.cloudapp.azure.com/UploadFile\"\r\nHost: smartblinds.eastus.cloudapp.azure.com\r\nContent-Length: 316\r\nExpect: 100-continue\r\nAccept-Encoding: gzip, deflate\r\n"
//#define upload_entry1               "POST /SmartBlindsWebService.asmx HTTP/1.1\r\nContent-Type: text/xml; charset=utf-8\r\nSOAPAction: \"http://smartblinds.eastus.cloudapp.azure.com/UploadFile\"\r\nHost: smartblinds.eastus.cloudapp.azure.com\r\nContent-Length: 316\r\n"

#define upload_entry2               "<s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\"><s:Body xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"><UploadFile xmlns=\"http://smartblinds.eastus.cloudapp.azure.com/\"><f>dGVzdA==</f><fileName>test.txt</fileName></UploadFile></s:Body></s:Envelope>"

#define upload_entry_test           "GET /SmartBlindsWebService.asmx/UploadFile?f=dGVzdA==&f=&fileName=test.txt HTTP/1.1\r\nHost: smartblinds.eastus.cloudapp.azure.com\r\nAccept: */*\r\n\r\n"

#define IPV4_BYTE(val, index)  ((val >> (index * 8)) & 0xFF)  // IP address parsing.
#define HEX2ASCII(x)           (((x) >= 10) ? (((x) - 10) + 'A') : ((x) + '0'))

#define SetAppState(state)     g_appState = state
#define GetAppState()          g_appState

// Motor Control Global Variables
extern int rcv_UD_target;
extern int rcv_OC_target;
extern int motorTargetUD;
extern int motorTargetOC;
extern int motorUD;
extern int motorOC;
int newMotorTargetUD = 1024;
int newMotorTargetOC = 0;

// Proximity Sensor Global Variables
extern int proxyAlarmState;

// Gas Sensor Global Variables
extern int gasAlarmState;

// Temperature Sensor Global Variables
extern int temperatureAlarmState;
extern double rcv_temp_target;
extern double current_temp_avg;
extern double temp_high;
double new_temp_high;


// Buffers to receive web UI 
char conv_rcv_UD_target[20] = {0};
char conv_rcv_OC_target[20] = {0};
char conv_rcv_temp_target[20] = {0};

// Message variable to determine what socket to open
extern uint8_t message_type;
extern int callControlState;
int callControlDelay = CALL_IDLE_STATE;

int img_done_test = 0;

int8_t send_test;

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
        
    // begin wifi connection
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

    // once connection secured, go to working state
    case APP_STATE_WAIT_CONNECT_AND_DHCP:
        if (s_ConnectedWifi)
        {
            if (s_HostIpByName) 
            {
                s_TcpConnection = true;
                SetAppState(APP_STATE_WORKING);
            }
        }
        break;

    case APP_STATE_WORKING:
        /* Connect TCP client socket, but only if there is no socket open */
        // Set message_type to determine what type of socket transmission
        switch (message_type)
        {
            case WIFI_DO_NOTHING:
                break;
            case WIFI_LOG_ENTRY_MODE:
            case WIFI_HELLOXML_MODE:
            case WIFI_RECIEVE_MODE:
            case WIFI_IMG_UPLOAD_MODE:
                if (tcp_client_socket < 0)
                {
                    if ((tcp_client_socket = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
                    {
                        //failed to create TCP client socket error!
                        SetAppState(APP_STATE_DONE);
                        break;
                    }

                    addr_in.sin_family = AF_INET;
                    addr_in.sin_port = _htons(SERVER_PORT);
                    addr_in.sin_addr.s_addr = s_HostIp;
                    if (connect(tcp_client_socket, (struct sockaddr *)&addr_in, sizeof(struct sockaddr_in)) != SOCK_ERR_NO_ERROR) 
                    {
                        //failed to connect socket error!
                        SetAppState(APP_STATE_DONE);
                        break;
                    }

                    s_TcpConnection = true;
                }
                break;
            default:
                break;
        }
        break;
        
    case APP_STATE_DONE:
        
        // We should not get here
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
                // Clear up recievedbuffer
                memset(s_ReceivedBuffer, 0, sizeof(s_ReceivedBuffer));
                
                // Load up s_RecievedBuffer with HTTP Command
                switch (message_type)
                {
                    case WIFI_LOG_ENTRY_MODE:
                        sprintf((char *)s_ReceivedBuffer, "%s%f%s%i%s%i%s%i%s%i%s%i%s", log_entry1, current_temp_avg, log_entry2, proxyAlarmState, log_entry3, gasAlarmState, log_entry4, motorTargetUD, log_entry5, motorTargetOC, log_entry6, temperatureAlarmState, log_entry7);
                        break;
                    case WIFI_HELLOXML_MODE:
                        sprintf((char *)s_ReceivedBuffer, "%s", getxml_buffer);
                        break;
                    case WIFI_RECIEVE_MODE:
                        sprintf((char *)s_ReceivedBuffer, "%s", recieve_buffer);
                        break;
                    case WIFI_IMG_UPLOAD_MODE:
                        // Initial Image sending packet
                        sprintf((char *)s_ReceivedBuffer, "%s", upload_entry1);
                        
                        break;
                }
               
                t_socketConnect *pstrConnect = (t_socketConnect *)pvMsg;
                if (pstrConnect && pstrConnect->error >= SOCK_ERR_NO_ERROR) 
                {
                    send_test = send(tcp_client_socket, s_ReceivedBuffer, strlen((char *)s_ReceivedBuffer), 0);
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
                if (message_type == WIFI_RECIEVE_MODE)
                {
                    if (pstrRecv && pstrRecv->bufSize > 0) 
                    {

                        /* Get Horizontal */
                        pcIndxPtr = strstr((char *)pstrRecv->p_rxBuf, "h=");
                        if (NULL != pcIndxPtr) 
                        {
                            pcIndxPtr = pcIndxPtr + strlen("h=") + 1;
                            pcEndPtr = strstr(pcIndxPtr, "\" />");
                            if (NULL != pcEndPtr) *pcEndPtr = 0;
                            strcpy(conv_rcv_OC_target, pcIndxPtr );
                        } else 
                        {
                            break;
                        }

                        /* Get Vertical. */
                        pcIndxPtr = strstr(pcEndPtr + 1, "v=");
                        if (NULL != pcIndxPtr) 
                        {
                            pcIndxPtr = pcIndxPtr + strlen("v=") + 1;
                            pcEndPtr = strstr(pcIndxPtr, "\" />");
                            if (NULL != pcEndPtr) *pcEndPtr = 0;
                            strcpy(conv_rcv_UD_target, pcIndxPtr );
                        } else 
                        {
                            break;
                        }

                        /* Get Proximity*/
                        pcIndxPtr = strstr(pcEndPtr + 1, "p=");
                        if (NULL != pcIndxPtr) 
                        {
                            pcIndxPtr = pcIndxPtr + strlen("p=") + 1;
                            pcEndPtr = strstr(pcIndxPtr, "\" />");
                            if (NULL != pcEndPtr) *pcEndPtr = 0;
                            //strcpy(TARGET_FOR_PROX_NOT_IMPLEMENTED, pcIndxPtr );

                        /* Get Temperature*/
                        pcIndxPtr = strstr(pcEndPtr + 1, "t=");
                        if (NULL != pcIndxPtr) 
                        {
                            pcIndxPtr = pcIndxPtr + strlen("t=") + 1;
                            pcEndPtr = strstr(pcIndxPtr, "\" />");
                            if (NULL != pcEndPtr) *pcEndPtr = 0;
                        }
                            strcpy(conv_rcv_temp_target, pcIndxPtr );
                            message_type = WIFI_DO_NOTHING;

                            // pull out the values from parsed strings
                            newMotorTargetUD = atoi(conv_rcv_UD_target);
                            newMotorTargetOC = atoi(conv_rcv_OC_target);
                            new_temp_high = (double) atoi(conv_rcv_temp_target);

                            /* Response processed, now close connection. */
                            close(tcp_client_socket);
                            tcp_client_socket = -1;
                            break;
                        }

                    } else 
                    {
                        message_type = WIFI_DO_NOTHING;
                        close(tcp_client_socket);
                        tcp_client_socket = -1;
                    }
                }
                else if (message_type == WIFI_IMG_UPLOAD_MODE)
                {
                    
                }
		}
		break;
        
        case M2M_SOCKET_SEND_EVENT:
        {
            if (message_type == WIFI_LOG_ENTRY_MODE || message_type == WIFI_HELLOXML_MODE)
            {
                message_type = WIFI_DO_NOTHING;
                // Log updated, close socket after sending 
                close(tcp_client_socket);
                tcp_client_socket = -1;
            }
            else if (message_type == WIFI_IMG_UPLOAD_MODE)
            {
                // Clear up s_ReceivedBuffer
                //memset(s_ReceivedBuffer, 0, sizeof(s_ReceivedBuffer));
                // Load up second packet
                
                
                t_socketConnect *pstrConnect = (t_socketConnect *)pvMsg;
//                if ( img_done_test == 0 && pstrConnect && pstrConnect->error >= SOCK_ERR_NO_ERROR) 
//                {
//                    img_done_test = 1;
//                    sprintf((char *)s_ReceivedBuffer, "%s", upload_entry2);
//                    send_test = send(tcp_client_socket, s_ReceivedBuffer, strlen((char *)s_ReceivedBuffer), 0);
//                    memset(s_ReceivedBuffer, 0, WIFI_BUFFER_SIZE);
//                    recv(tcp_client_socket, &s_ReceivedBuffer[0], WIFI_BUFFER_SIZE, 0);
//                } 
//                else if (img_done_test == 1)
//                {
//                    img_done_test == 2;
////                    close(tcp_client_socket);
////                    tcp_client_socket = -1;
//                }
//                else 
//                {
//                    printf("connect error!\r\n");
//                    s_TcpConnection = false;
//                    close(tcp_client_socket);
//                    tcp_client_socket = -1;
//                }     
            }
            break;
        }
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


// This function will be logging and checking for any updates from the web
// service at regular intervals
void call_control(void)
{
    switch(callControlState)
    {
        case CALL_IDLE_STATE:
            if (callControlDelay < callControlDelayMAX) ++callControlDelay;
            else 
            {
                callControlState = CALL_LOG_STATE;
                callControlDelay = 0;
            }
            break;
        case CALL_LOG_STATE:
            message_type = WIFI_LOG_ENTRY_MODE;
            callControlState = CALL_LOG_WAIT_STATE;
            break;
        case CALL_LOG_WAIT_STATE:
            if (tcp_client_socket > 0) callControlState = CALL_LOG_WAIT_STATE;
            else callControlState = CALL_RCV_STATE;
            break;
        case CALL_RCV_STATE:
            message_type = WIFI_RECIEVE_MODE;
            callControlState = CALL_RCV_WAIT_STATE;
            break;
        case CALL_RCV_WAIT_STATE:
            if (tcp_client_socket > 0) callControlState = CALL_RCV_WAIT_STATE;
            else callControlState = CALL_RCV_PROCESS_STATE;
            break;
        case CALL_RCV_PROCESS_STATE:
            // TODO: need to address recieving commands in alert mode
            if (proxyAlarmState == 0)
            {
                if (newMotorTargetUD != motorTargetUD)
                {
                    motorTargetUD = newMotorTargetUD;
                    motorUD = true;       
                    MOTOR_ON();
                }
                if (newMotorTargetOC != motorTargetOC)
                {
                    motorTargetOC = newMotorTargetOC;
                    motorOC = true;       
                    MOTOR_ON();
                }
            }
            
            
            temp_high = new_temp_high;
            callControlState = CALL_IDLE_STATE;
            //callControlState = 100;
            break;
        case 100:
            break;
    }

}

#endif

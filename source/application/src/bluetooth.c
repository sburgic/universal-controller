/**
 ** Name
 **   bluetooth.c
 **
 ** Purpose
 **   Bluetooth HC-06 driver
 **
 ** Revision
 **   16-Dec-2020 (SSB) [] Initial
 **/

#include "bluetooth.h"

#include "common.h"
#include "time.h"
#include "utils.h"

#define BT_INIT_TIMEOUT_MS ((Bsp_Time)1000)

#define BT_MSG_TIMEOUT_MS  ((Bsp_Time)64)
#define BT_MSG_MIN_SIZE    8
#define BT_MSG_HEADER      ((uint8_t*)"RTSBT")
#define BT_MSG_HEADER_SIZE 5

#define BT_NAME ((uint8_t*)"RTS-BT-HC06")
#define BT_PIN  ((uint8_t*)"0410")

#define BT_CMD_AT       ((uint8_t*)"AT")
#define BT_CMD_SET_NAME ((uint8_t*)"AT+NAME")
#define BT_CMD_SET_PIN  ((uint8_t*)"AT+PIN")

#define BT_RESP_AT_OK   ((uint8_t*)"OK")
#define BT_RESP_AT_NAME ((uint8_t*)"OKsetname")
#define BT_RESP_AT_PIN  ((uint8_t*)"OKsetPIN")

static uint8_t          bt_buff[BT_MSG_MIN_SIZE << 1] = {0};
static Com_Temp_Data_t* temp_data                     = NULL;

static uint16_t bt_get_response( uint8_t* buff, uint16_t len )
{
    uint16_t cnt = 0;
    Bsp_Time timeout;
    bool_t   is_timed_out;
    bool_t   is_empty;

    bsp_set_timeout( BT_INIT_TIMEOUT_MS
                   , BSP_TIME_MSEC
                   , &timeout
                   );

    do
    {
        is_timed_out = bsp_is_timeout( timeout );
        is_empty     = uart_buff_empty( BT_UART );

        if ( FALSE == is_empty )
        {
            buff[cnt] = uart_getc( BT_UART );
            cnt++;
        }
    } while (( cnt < len ) && ( is_timed_out != TRUE ));

    return cnt;
}

status_t bt_init( void )
{
    status_t ret = STATUS_OK;

    ret = uart_init( BT_UART, BT_BAUDRATE );

    if ( STATUS_ERROR != ret )
    {
        uart_send( BT_UART, BT_CMD_AT, 2 );
    }

    bt_get_response( bt_buff, 2 );

    if ( 0 != util_strcmp( bt_buff, BT_RESP_AT_OK, 2 ))
    {
        ret = STATUS_ERROR;
    }

    if ( STATUS_ERROR != ret )
    {
        uart_send( BT_UART, BT_CMD_SET_NAME, 7 );
        uart_send( BT_UART, BT_NAME, 11 );

        bt_get_response( bt_buff, 9 );

        if ( 0 != util_strcmp( bt_buff, BT_RESP_AT_NAME, 9 ))
        {
            ret = STATUS_ERROR;
        }
    }

    if ( STATUS_ERROR != ret )
    {
        uart_send( BT_UART, BT_CMD_SET_PIN, 6 );
        uart_send( BT_UART, BT_PIN, 4 );

        bt_get_response( bt_buff, 8 );

        if ( 0 != util_strcmp( bt_buff, BT_RESP_AT_PIN, 8 ))
        {
            ret = STATUS_ERROR;
        }
    }

    if ( STATUS_ERROR != ret )
    {
        temp_data = com_get_temp_hdl();

        if ( NULL == temp_data )
        {
            ret = STATUS_ERROR;
        }
    }

    return ret;
}

void bt_task( void )
{
    uint16_t cnt = 0;
    Bsp_Time timeout;
    bool_t   is_timed_out;
    bool_t   is_empty;
    uint8_t  state;
    uint8_t  io;

    is_empty = uart_buff_empty( BT_UART );

    if ( FALSE == is_empty )
    {
        bsp_set_timeout( BT_MSG_TIMEOUT_MS
                       , BSP_TIME_MSEC
                       , &timeout
                       );
        do
        {
            is_timed_out = bsp_is_timeout( timeout );
            is_empty     = uart_buff_empty( BT_UART );

            if ( FALSE == is_empty )
            {
                bt_buff[cnt] = uart_getc( BT_UART );
                cnt++;
            }
        } while ( is_timed_out != TRUE );
    }

    if ( cnt >= BT_MSG_MIN_SIZE )
    {
        if ( 0 == util_strcmp( bt_buff, BT_MSG_HEADER, BT_MSG_HEADER_SIZE ))
        {
            if ( 'G' == bt_buff[BT_MSG_HEADER_SIZE])
            {
                if ( 'I' == bt_buff[BT_MSG_HEADER_SIZE + 1])
                {
                    io    = bt_buff[BT_MSG_HEADER_SIZE + 2] - '0';
                    state = com_get_input_state( io );

                    if ( 0xFF != state )
                    {
                        com_input_state_to_string( bt_buff
                                                 , &cnt
                                                 , io
                                                 , state
                                                 );
                        uart_send( BT_UART, bt_buff, cnt );
                        uart_send( BT_UART, (uint8_t*) "\r\n", 2 );
                    }
                }
                else if ( 'O' == bt_buff[BT_MSG_HEADER_SIZE + 1])
                {
                    io    = bt_buff[BT_MSG_HEADER_SIZE + 2] - '0';
                    state = com_get_output_state( io );

                    if ( 0xFF != state )
                    {
                        com_output_state_to_string( bt_buff
                                                  , &cnt
                                                  , io
                                                  , state
                                                  );
                        uart_send( BT_UART, bt_buff, cnt );
                        uart_send( BT_UART, (uint8_t*) "\r\n", 2 );
                    }
                }
                else if ( 'T' == bt_buff[BT_MSG_HEADER_SIZE + 1])
                {
                    if ( 1 == ( bt_buff[BT_MSG_HEADER_SIZE + 2 ] - '0' ))
                    {
                        uart_send( BT_UART
                                 , temp_data->ds_buff.out[0]
                                 , temp_data->ds_buff.len[0] - 1
                                 );
                        uart_send( BT_UART, (uint8_t*) "\r\n", 2 );
                    }
                    else if ( 2 == ( bt_buff[BT_MSG_HEADER_SIZE + 2 ] - '0' ))
                    {
                        uart_send( BT_UART
                                 , temp_data->ds_buff.out[1]
                                 , temp_data->ds_buff.len[1] - 1
                                 );
                        uart_send( BT_UART, (uint8_t*) "\r\n", 2 );
                    }
                }
            }
            else if ( 'S' == bt_buff[BT_MSG_HEADER_SIZE])
            {
                if ( 'O' == bt_buff[BT_MSG_HEADER_SIZE + 1])
                {
                    com_set_output_state( bt_buff[BT_MSG_HEADER_SIZE + 2] - '0'
                                        , bt_buff[BT_MSG_HEADER_SIZE + 3] - '0'
                                        );
                }
                else if ( 'T' == bt_buff[BT_MSG_HEADER_SIZE + 1])
                {
                }
            }
        }
    }
}

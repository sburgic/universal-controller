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
#define BT_RESP_TIMEOUT_MS ((Bsp_Time)1000)

#define BT_MSG_TIMEOUT_MS  ((Bsp_Time)64)

#define BT_DEF_NAME ((uint8_t*)"RTS-BT-HC06")
#define BT_DEF_PIN  ((uint8_t*)"0410")

#define BT_CMD_AT       ((uint8_t*)"AT")
#define BT_CMD_SET_NAME ((uint8_t*)"AT+NAME")
#define BT_CMD_SET_PIN  ((uint8_t*)"AT+PIN")

#define BT_RESP_AT_OK   ((uint8_t*)"OK")
#define BT_RESP_AT_NAME ((uint8_t*)"OKsetname\r\n")
#define BT_RESP_AT_PIN  ((uint8_t*)"OKsetPIN\r\n")

static uint8_t* bt_buff;

static uint16_t bt_get_response( uint8_t* buff, uint8_t* expected )
{
    uint16_t cnt = 0;
    Bsp_Time timeout;
    bool_t   is_timed_out;
    bool_t   is_empty;
    bool_t   first_read = TRUE;
    uint8_t  ch;

    bsp_set_timeout( BT_RESP_TIMEOUT_MS
                   , BSP_TIME_MSEC
                   , &timeout
                   );

    do
    {
        is_timed_out = bsp_is_timeout( timeout );
        is_empty     = uart_buff_empty( BT_UART );

        if ( FALSE == is_empty )
        {
            ch = uart_getc( BT_UART );

            if ( 0 != ch )
            {
                if ( FALSE != first_read )
                {
                    if ( ch == expected[0] )
                    {
                        buff[cnt++]  = ch;
                        first_read = FALSE;
                    }
                }
                else
                {
                    buff[cnt++] = ch;

                    if ( UART1_STRING_DELIMITER == buff[cnt - 1] )
                    {
                        break;
                    }
                }
            }
        }
    } while ( FALSE == is_timed_out );

    return cnt;
}

status_t bt_init( void )
{
    status_t ret = STATUS_OK;
    uint16_t cnt = 0;
    int16_t  res = -1;

    bt_buff = com_get_buff_hdl();
    bsp_wait( 1000, BSP_TIME_MSEC );
    ret = uart_init( BT_UART, BT_BAUDRATE );

    if ( STATUS_ERROR != ret )
    {
        ret = STATUS_ERROR;
        uart_send( BT_UART, BT_CMD_AT, 2 );

        cnt = bt_get_response( bt_buff, BT_RESP_AT_OK );

        if ( cnt == util_strnlen( BT_RESP_AT_OK, COM_BUFF_SIZE ))
        {
            res = util_strcmp( bt_buff, BT_RESP_AT_OK, cnt );

            if ( 0 == res )
            {
                ret = STATUS_OK;
            }
        }
    }

    if ( STATUS_ERROR != ret )
    {
        ret = STATUS_ERROR;
        uart_send( BT_UART, BT_CMD_SET_NAME, 7 );
        uart_send( BT_UART, BT_DEF_NAME, 11 );

        cnt = bt_get_response( bt_buff, BT_RESP_AT_NAME );

        if ( cnt == util_strnlen( BT_RESP_AT_NAME, COM_BUFF_SIZE ))
        {
            res = util_strcmp( bt_buff, BT_RESP_AT_NAME, cnt );

            if ( 0 == res )
            {
                ret = STATUS_OK;
            }
        }
    }

    if ( STATUS_ERROR != ret )
    {
        ret = STATUS_ERROR;
        uart_send( BT_UART, BT_CMD_SET_PIN, 6 );
        uart_send( BT_UART, BT_DEF_PIN, 4 );

        cnt = bt_get_response( bt_buff, BT_RESP_AT_PIN );

        if ( cnt == util_strnlen( BT_RESP_AT_PIN, COM_BUFF_SIZE ))
        {
            res = util_strcmp( bt_buff, BT_RESP_AT_PIN, cnt );

            if ( 0 == res )
            {
                ret = STATUS_OK;
            }
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
        } while ( FALSE == is_timed_out );
    }

     bt_buff[cnt] = '\0';

    if ( cnt >= COM_MSG_MIN_SIZE )
    {
        if ( 0 == util_strcmp( bt_buff, COM_MSG_HEADER, COM_MSG_HEADER_SIZE ))
        {
            is_empty = com_process_msg( bt_buff, &cnt, COM_MSG_HEADER_SIZE );

            if ( FALSE != is_empty )
            {
                uart_send( BT_UART, bt_buff, cnt );
                uart_send( BT_UART, (uint8_t*) "\r\n", 2 );
            }
        }
    }
}

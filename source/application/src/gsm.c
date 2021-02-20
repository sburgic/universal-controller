/**
 ** Name
 **   gsm.c
 **
 ** Purpose
 **   SIM800 module driver
 **
 ** Revision
 **   12-Feb-2020 (SSB) [] Initial
 **/

#include "gsm.h"

#include "common.h"
#include "gpio.h"
#include "lcd2wire.h"
#include "time.h"
#include "uart.h"
#include "utils.h"

#include <stdio.h>

static uint8_t*         gsm_buff;
static uint8_t          gsm_net_quality[2] = {0};
static uint8_t          gsm_net_status;
static bool_t           gsm_call_active = FALSE;
static Com_Gsm_Props_t* gsm_props;
static bool_t           gsm_configured  = FALSE;

#define GSM_RESP_TIMEOUT_MS ((Bsp_Time)1000)
#define GSM_NO_OF_RETRIES   10
#define GSM_MSG_MIN_SIZE    4
#define GSM_MSG_TIMEOUT_MS  ((Bsp_Time)64)
#define GSM_RING_TIMEOUT_MS ((Bsp_Time)120)

#define GSM_CMD_AT               ((uint8_t*)"AT\r\n")
#define GSM_CMD_ECHO_OFF         ((uint8_t*)"ATE0\r\n")
#define GSM_CMD_CSQ              ((uint8_t*)"AT+CSQ\r\n")
#define GSM_CMD_CALL_READY       ((uint8_t*)"AT+CCALR?\r\n")
#define GSM_CMD_AUTO_ANSWER_RING ((uint8_t*)"ATS0=3\r\n")
#define GSM_CMD_SMS_MODE_TEXT    ((uint8_t*)"AT+CMGF=1\r\n")
#define GSM_CMD_SMS_SEND         ((uint8_t*)"AT+CMGS=")
#define GSM_CMD_SMS_SET_MODE     ((uint8_t*)"AT+CNMI=2,2,0,0,0\r\n")
#define GSM_CMD_SMS_SET_STORAGE  ((uint8_t*)"AT+CPMS=\"SM\",\"SM\",\"SM\"\r\n")

#define GSM_RESP_OK            ((uint8_t*)"OK\r\n")
#define GSM_RESP_CSQ           ((uint8_t*)"+CSQ:")
#define GSM_RESP_CALL_READY    ((uint8_t*)"+CCALR:")
#define GSM_RESP_NO_CARRIER    ((uint8_t*)"NO CARRIER\r\n")
#define GSM_RESP_SMS_MODE_TEXT ((uint8_t*)"+CMGF:1\r\n")
#define GSM_RESP_SMS_RECEIVED  ((uint8_t*)"+CMT: \"")

static void gsm_gpio_init( void )
{
    GPIO_InitTypeDef gpio = {0};

    IO1_CLOCK_ENABLE();
    IO2_CLOCK_ENABLE();

    HAL_GPIO_WritePin( IO1_PORT, IO1_PIN, GPIO_PIN_SET );

    gpio.Pin   = IO1_PIN;
    gpio.Mode  = GPIO_MODE_OUTPUT_PP;
    gpio.Pull  = GPIO_NOPULL;
    gpio.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init( IO1_PORT, &gpio );

    gpio.Pin   = IO2_PIN;
    gpio.Mode  = GPIO_MODE_INPUT;
    gpio.Pull  = GPIO_NOPULL;
    gpio.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init( IO2_PORT, &gpio );
}

static void gsm_send( uint8_t* buff, uint16_t len )
{
    uart_send( GSM_UART, buff, len );
}

static uint16_t gsm_get_response( uint8_t* buff, uint8_t* expected )
{
    uint16_t cnt = 0;
    Bsp_Time timeout;
    bool_t   is_timed_out;
    bool_t   is_empty;
    bool_t   first_read = TRUE;
    uint8_t  ch;

    bsp_set_timeout( GSM_RESP_TIMEOUT_MS
                   , BSP_TIME_MSEC
                   , &timeout
                   );

    do
    {
        is_timed_out = bsp_is_timeout( timeout );
        is_empty     = uart_buff_empty( GSM_UART );

        if ( FALSE == is_empty )
        {
            ch = uart_getc( GSM_UART );

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
    } while ( FALSE == is_timed_out );

    return cnt;
}

static void gsm_check_ring( void )
{
    static Bsp_Time old_timestamp;
    Bsp_Time        new_timestamp;
    static bool_t   ts_meas_started = FALSE;
    GPIO_PinState   gpio_state;

    gpio_state = HAL_GPIO_ReadPin( IO2_PORT, IO2_PIN );

    if ( GPIO_PIN_RESET == gpio_state )
    {
        if ( FALSE == ts_meas_started )
        {
            bsp_get_time( &old_timestamp );
            ts_meas_started = TRUE;
        }
        else
        {
            bsp_get_time( &new_timestamp );

            if (((( new_timestamp - old_timestamp ) / 1000 )
              >= ( GSM_RING_TIMEOUT_MS))
              && ( FALSE != gsm_props->ring_auto_answer ))
            {
                gsm_call_active = TRUE;
                ts_meas_started = FALSE;
            }
        }
    }
    else
    {
        ts_meas_started = FALSE;

        if ( FALSE != gsm_call_active )
        {
            lcd_putch_xy( '*', 15, 1 );
        }
        else
        {
            lcd_putch_xy( ' ', 15, 1 );
        }
    }
}

static status_t gsm_send_sms( uint8_t* number, uint8_t* data, uint16_t len )
{
    status_t ret = STATUS_ERROR;
    Bsp_Time timeout;
    bool_t   is_timed_out;
    uint8_t  ch      = 34;
    uint16_t cnt     = 0;
    int16_t  res     = -1;
    uint8_t  retries = 0;

    gsm_send( GSM_CMD_SMS_SEND
            , util_strnlen( GSM_CMD_SMS_SEND, COM_BUFF_SIZE )
            );
    gsm_send( &ch, 1 );
    gsm_send( number, util_strnlen( number, GSM_NUMBER_MAX_SIZE));
    gsm_send( &ch, 1 );

    ch = 13;
    gsm_send( &ch, 1 );

    bsp_set_timeout( GSM_RESP_TIMEOUT_MS
                   , BSP_TIME_MSEC
                   , &timeout
                   );

    do
    {
        is_timed_out = bsp_is_timeout( timeout );
        ch           = uart_getc( GSM_UART );

        if ( '>' == ch )
        {
            ret = STATUS_OK;
            break;
        }
    } while ( FALSE == is_timed_out );

    gsm_send( data, len );
    ch = 26; /* Ctrl + Z */
    gsm_send( &ch, 1 );

    if ( STATUS_ERROR != ret )
    {
        do
        {
            ret = STATUS_ERROR;

            cnt = gsm_get_response( gsm_buff, GSM_RESP_OK );

            if ( cnt == util_strnlen( GSM_RESP_OK, COM_BUFF_SIZE ))
            {
                res = util_strcmp( gsm_buff, GSM_RESP_OK, cnt );
            }

            if ( 0 == res )
            {
                ret = STATUS_OK;
            }

            retries++;
        }
        while (( retries < GSM_NO_OF_RETRIES ) && ( STATUS_ERROR == ret ));
    }

    return ret;
}

static status_t gsm_configure( void )
{
    status_t    ret     = STATUS_ERROR;
    uint16_t    cnt     = 0;
    uint8_t     retries = 0;
    int16_t     res     = -1;

    gsm_buff = com_get_buff_hdl();

    gsm_send( GSM_CMD_SMS_SET_MODE
            , util_strnlen( GSM_CMD_SMS_SET_MODE, COM_BUFF_SIZE )
            );

    retries = 0;

    do
    {
        ret = STATUS_ERROR;
        cnt = gsm_get_response( gsm_buff, GSM_RESP_OK );

        if ( cnt == util_strnlen( GSM_RESP_OK, COM_BUFF_SIZE ))
        {
            res = util_strcmp( gsm_buff, GSM_RESP_OK, cnt );
        }

        if ( 0 == res )
        {
            ret = STATUS_OK;
        }

        retries++;
    }
    while (( retries < GSM_NO_OF_RETRIES ) && ( STATUS_ERROR == ret ));

    return ret;
}

static void gsm_extract_number( uint8_t* number, uint8_t* buff )
{
    uint16_t i = 0;
    uint16_t j = 0;

    /* Go to the begining of number */
    while( '"' != buff[i] )
    {
        i++;
    }

    /* '"' found, move to the next character */
    i++;

    for ( j = 0; ( '"' != buff[i] ) && ( j < GSM_NUMBER_MAX_SIZE ); i++, j++ )
    {
        number[j] = buff[i];
    }
}

static status_t gsm_check_number( uint8_t* number )
{
    status_t ret = STATUS_ERROR;
    uint16_t i;
    int16_t  res = -1;

    if ( FALSE != gsm_props->master_ctrl_enable )
    {
        for ( i = 0; i < GSM_NUMBER_MAX_MASTER; i++ )
        {
            res = util_strcmp( number
                             , gsm_props->master_number[i]
                             , GSM_NUMBER_MAX_SIZE
                             );

            if ( 0 == res )
            {
                ret = STATUS_OK;
                break;
            }
        }
    }
    else
    {
        ret = STATUS_OK;
    }

    return ret;
}

static void gsm_process_msg( uint8_t* number, uint8_t* msg, uint16_t len )
{
    status_t ret;

    ret = gsm_check_number( number );

    if ( STATUS_ERROR != ret )
    {
        if ( len > COM_MSG_HEADER_SIZE )
        {
            com_process_msg( gsm_buff, &len, COM_MSG_HEADER_SIZE );
        }
    }
}

static void gsm_listen( void )
{
    uint16_t cnt = 0;
    Bsp_Time timeout;
    bool_t   is_timed_out;
    bool_t   is_empty;
    int16_t  res = -1;
    uint16_t tmp;
    uint8_t  current_number[GSM_NUMBER_MAX_SIZE] = {0};

    is_empty = uart_buff_empty( GSM_UART );

    if ( FALSE == is_empty )
    {
        bsp_set_timeout( GSM_MSG_TIMEOUT_MS
                       , BSP_TIME_MSEC
                       , &timeout
                       );
        do
        {
            is_timed_out = bsp_is_timeout( timeout );
            is_empty     = uart_buff_empty( GSM_UART );

            if ( FALSE == is_empty )
            {
                gsm_buff[cnt] = uart_getc( GSM_UART );
                cnt++;

                if ( UART1_STRING_DELIMITER == gsm_buff[cnt - 1] )
                {
                    break;
                }
            }
        } while ( FALSE == is_timed_out );
    }

     gsm_buff[cnt] = '\0';

    if ( cnt >= GSM_MSG_MIN_SIZE )
    {
        /* Call finished */
        tmp = util_strnlen( GSM_RESP_NO_CARRIER, COM_BUFF_SIZE );

        if ( cnt == tmp )
        {
            res = util_strcmp( gsm_buff, GSM_RESP_NO_CARRIER, cnt );

            if ( 0 == res )
            {
                gsm_call_active = FALSE;
            }
        }

        /* New SMS arrived */
        tmp = util_strnlen( GSM_RESP_SMS_RECEIVED, COM_BUFF_SIZE );

        if ( cnt > util_strnlen( GSM_RESP_SMS_RECEIVED, COM_BUFF_SIZE ))
        {
            res = util_strcmp( gsm_buff
                             , GSM_RESP_SMS_RECEIVED
                             , tmp
                             );

            if ( 0 == res )
            {
                gsm_extract_number( current_number, gsm_buff );

                cnt = 0;
                do
                {
                    is_empty = uart_buff_empty( GSM_UART );

                    if ( FALSE == is_empty )
                    {
                        gsm_buff[cnt] = uart_getc( GSM_UART );
                        cnt++;
                    }
                } while ( UART1_STRING_DELIMITER != gsm_buff[cnt - 1]);

                gsm_process_msg( current_number, gsm_buff, cnt );
            }
        }
    }
}

status_t gsm_init( void )
{
    status_t    ret     = STATUS_ERROR;
    uint16_t    cnt     = 0;
    uint8_t     retries = 0;
    int16_t     res     = -1;

    gsm_buff  = com_get_buff_hdl();
    gsm_props = com_get_gsm_props_hdl();
    ret       = uart_init( GSM_UART, GSM_BAUDRATE );

    HAL_GPIO_WritePin( IO1_PORT, IO1_PIN, GPIO_PIN_RESET );
    bsp_wait( 200, BSP_TIME_MSEC );
    HAL_GPIO_WritePin( IO1_PORT, IO1_PIN, GPIO_PIN_SET );

    if ( STATUS_ERROR != ret )
    {
        gsm_gpio_init();
        bsp_wait( 3000, BSP_TIME_MSEC );

        do
        {
            ret = STATUS_ERROR;

            gsm_send( GSM_CMD_ECHO_OFF
                    , util_strnlen( GSM_CMD_ECHO_OFF, COM_BUFF_SIZE )
                    );

            cnt = gsm_get_response( gsm_buff, GSM_RESP_OK );

            if ( cnt == util_strnlen( GSM_RESP_OK, COM_BUFF_SIZE ))
            {
                res = util_strcmp( gsm_buff, GSM_RESP_OK, cnt );
            }

            if ( 0 == res )
            {
                ret = STATUS_OK;
            }

            retries++;
        }
        while (( retries < GSM_NO_OF_RETRIES ) && ( STATUS_ERROR == ret ));
    }

    if ( STATUS_ERROR != ret )
    {
        gsm_send( GSM_CMD_SMS_MODE_TEXT
                , util_strnlen( GSM_CMD_SMS_MODE_TEXT, COM_BUFF_SIZE )
                );

        retries = 0;

        do
        {
            ret = STATUS_ERROR;
            cnt = gsm_get_response( gsm_buff, GSM_RESP_SMS_MODE_TEXT );

            if ( cnt == util_strnlen( GSM_RESP_SMS_MODE_TEXT, COM_BUFF_SIZE ))
            {
                res = util_strcmp( gsm_buff, GSM_RESP_SMS_MODE_TEXT, cnt );
            }

            if ( 0 == res )
            {
                ret = STATUS_OK;
            }

            retries++;
        }
        while (( retries < GSM_NO_OF_RETRIES ) && ( STATUS_ERROR == ret ));
    }

    /* Discard all received content during the initialization */
    uart_buff_empty( GSM_UART );

    return ret;
}

void gsm_task_lcd_network_status( void )
{
    uint8_t lcd_out[16] = {0};
    uint8_t i;

    lcd_clear_row( 1 );

    util_memcpy( &lcd_out[0], (uint8_t*)"NS:", 3 );

    if ( 1 == ( gsm_net_status - 48 ))
    {
        util_memcpy( &lcd_out[3], (uint8_t*)"OK", 2 );
    }
    else
    {
        util_memcpy( &lcd_out[3], (uint8_t*)"N/A", 3 );
    }

    lcd_puts_xy( lcd_out, 0, 1 );

    for ( i = 0; i < 16; i++ )
    {
        lcd_out[i] = 0;
    }

    util_memcpy( &lcd_out[0], (uint8_t*)"NQ:", 3 );
    util_memcpy( &lcd_out[3], gsm_net_quality, 2 );
    lcd_puts_xy( lcd_out, 8, 1 );
}

void gsm_task( void )
{
    status_t        ret;
    Bsp_Time        time_actual;
    static Bsp_Time time_old = 0;
    static bool_t   task_flag = FALSE;
    uint16_t        cnt;
    uint8_t         retries = 0;
    int16_t         res     = -1;

    bsp_get_time( &time_actual );

    if (( time_actual - time_old ) > 2000000 )
    {
        time_old = time_actual;

        if ( FALSE == task_flag )
        {
            gsm_send( GSM_CMD_CSQ
                    , util_strnlen( GSM_CMD_CSQ, COM_BUFF_SIZE )
                    );

            do
            {
                ret = STATUS_ERROR;
                cnt = gsm_get_response( gsm_buff, GSM_RESP_CSQ );

                if ( cnt > util_strnlen( GSM_RESP_CSQ, COM_BUFF_SIZE ))
                {
                    res = util_strcmp
                                ( gsm_buff
                                , GSM_RESP_CSQ
                                , util_strnlen( GSM_RESP_CSQ, COM_BUFF_SIZE )
                                );
                }

                if ( 0 == res )
                {
                    int16_t dot;

                    dot = util_find_char( &gsm_buff[6], 3, ',' );

                    if ( -1 != dot )
                    {
                        /* In case previously were 2 digits */
                        gsm_net_quality[1] = 0;

                        util_memcpy( gsm_net_quality, &gsm_buff[6], dot );
                        ret = STATUS_OK;
                    }
                }

                retries++;
            }
            while (( retries < GSM_NO_OF_RETRIES ) && ( STATUS_ERROR == ret ));
        }
        else
        {
            gsm_send( GSM_CMD_CALL_READY
                    , util_strnlen( GSM_CMD_CALL_READY, COM_BUFF_SIZE )
                    );

            do
            {
                ret = STATUS_ERROR;
                cnt = gsm_get_response( gsm_buff, GSM_RESP_CALL_READY );

                if ( cnt > util_strnlen( GSM_RESP_CALL_READY, COM_BUFF_SIZE ))
                {
                    res = util_strcmp
                            ( gsm_buff
                            , GSM_RESP_CALL_READY
                            , util_strnlen( GSM_RESP_CALL_READY, COM_BUFF_SIZE )
                            );
                }

                if ( 0 == res )
                {
                    gsm_net_status = gsm_buff[8];
                    ret = STATUS_OK;

                    if ( FALSE == gsm_configured )
                    {
                        if ( 1 == ( gsm_net_status - 48 ))
                        {
                            ret = gsm_configure();
                            ret = STATUS_OK;

                            if ( STATUS_ERROR != ret )
                            {
                                gsm_configured = TRUE;
                                printf( "GSM: Configured.\r\n" );
                            }
                            else
                            {
                                printf( "GSM: Failed to configure.\r\n" );
                            }
                        }
                    }
                }

                retries++;
            }
            while (( retries < GSM_NO_OF_RETRIES ) && ( STATUS_ERROR == ret ));
        }
        task_flag = ~task_flag;
    }

    gsm_listen();
    gsm_check_ring();
}

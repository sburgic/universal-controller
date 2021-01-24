/**
 ** Name
 **   common.c
 **
 ** Purpose
 **   Common routines for all extension boards
 **
 ** Revision
 **   17-Dec-2020 (SSB) [] Initial
 **   17-Jan-2021 (SSB) [] Use common buffer for all modules
 **   24-Jan-2021 (SSB) [] Add support for IAR compiler
 **/

#include "common.h"

#include "gpio.h"
#include "lcd2wire.h"
#include "time.h"
#include "utils.h"

#ifndef __UINT64_MAX__
#define __UINT64_MAX__ 0xFFFFFFFFFFFFFFFF
#endif

typedef struct
{
    bool_t   active[2];
    Bsp_Time time[2];
    Bsp_Time timestamp[2];
} Com_Out_Timer_t;

static uint8_t         ext_type                     = BOARD_NONE;
static uint8_t         lcd_out[16]                  = {0};
static Com_Temp_Data_t temperature_data             = {0};
static Com_Out_Timer_t out_timer                    = {0};
static uint8_t         common_buffer[COM_BUFF_SIZE] = {0};


static int16_t com_find_char( uint8_t* str, uint16_t len, uint8_t ch )
{
    int16_t  ret = -1;
    uint16_t i;

    for ( i = 0; i < len; i++ )
    {
        if ( str[i] == ch )
        {
            ret = i;
            break;
        }
    }

    return ret;
}

static void com_msg_cfg_timer( uint8_t* data, uint8_t io )
{
    int16_t tmp;

    tmp = util_atoi( data );
    out_timer.active[io - 1] = TRUE;
    out_timer.time[io - 1]   = tmp;
    bsp_get_time( &out_timer.timestamp[io - 1]);
}

void com_error_handler( void )
{
    bsp_wait( 5, BSP_TIME_SEC );
    HAL_NVIC_SystemReset();
}

uint8_t com_ext_board_detect( void )
{
    uint8_t ret = 0;

    ret |= ( HAL_GPIO_ReadPin( HW_ADDR1_PORT, HW_ADDR1_PIN ) << 3 );
    ret |= ( HAL_GPIO_ReadPin( HW_ADDR2_PORT, HW_ADDR2_PIN ) << 2 );
    ret |= ( HAL_GPIO_ReadPin( HW_ADDR3_PORT, HW_ADDR3_PIN ) << 1 );
    ret |=   HAL_GPIO_ReadPin( HW_ADDR4_PORT, HW_ADDR4_PIN );

    return ret;
}

uint8_t com_get_output_state( uint8_t output )
{
    uint8_t state = 0xFF;

    if ( 1 == output )
    {
        state = (uint8_t) HAL_GPIO_ReadPin( RELAY1_PORT, RELAY1_PIN );
    }
    else if ( 2 == output )
    {
        state = (uint8_t) HAL_GPIO_ReadPin( RELAY2_PORT, RELAY2_PIN );
    }

    return state;
}

status_t com_set_output_state( uint8_t output, uint8_t new_state )
{
    status_t ret = STATUS_OK;

    if ( new_state < 2 )
    {
        switch ( output )
        {
            case 1:
                HAL_GPIO_WritePin( RELAY1_PORT
                                 , RELAY1_PIN
                                 , (GPIO_PinState) new_state
                                 );
                ret = STATUS_OK;
                break;
            case 2:
                HAL_GPIO_WritePin( RELAY2_PORT
                                 , RELAY2_PIN
                                 , (GPIO_PinState) new_state
                                 );
                ret = STATUS_OK;
                break;
            default:
                ret = STATUS_ERROR;
                break;
        }
    }
    else
    {
        ret = STATUS_ERROR;
    }

    return ret;
}

uint8_t com_get_input_state( uint8_t input )
{
    uint8_t state = 0xFF;

    if ( 1 == input )
    {
        state = (uint8_t) HAL_GPIO_ReadPin( IN1_PORT, IN1_PIN );
    }
    else if ( 2 == input )
    {
        state = (uint8_t) HAL_GPIO_ReadPin( IN2_PORT, IN2_PIN );
    }

    if ( 0 == state )
    {
        state = 1;
    }
    else if ( 1 == state )
    {
        state = 0;
    }

    return state;
}

void com_input_state_to_string( uint8_t*  buff
                              , uint16_t* len
                              , uint8_t   input
                              , uint8_t   state
                              )
{
    if (( NULL != buff ) && ( NULL != len ))
    {
        *len = 4;
        util_memcpy( buff
                   , ( input == 1 ) ? \
                     (uint8_t*)"IN1:" : (uint8_t*)"IN2:"
                   , *len
                   );

        util_memcpy( &buff[*len]
                   , ( state == 1 ) ? \
                     (uint8_t*)"1" : (uint8_t*)"0"
                   , 1
                   );
        *len += 1;

        buff[*len] = '\0';
    }
}

void com_output_state_to_string( uint8_t*  buff
                               , uint16_t* len
                               , uint8_t   output
                               , uint8_t   state
                               )
{
    if (( NULL != buff ) && ( NULL != len ))
    {
        *len = 5;
        util_memcpy( buff
                   , ( output == 1 ) ? \
                     (uint8_t*)"OUT1:" : (uint8_t*)"OUT2:"
                   , *len
                   );

        util_memcpy( &buff[*len]
                   , ( state == 1 ) ? \
                     (uint8_t*)"1" : (uint8_t*)"0"
                   , 1
                   );
        *len += 1;

        buff[*len] = '\0';
    }
}

void com_heating_cooling_state_to_string( uint8_t*  buff
                                        , uint16_t* len
                                        , uint8_t   io
                                        , bool_t    flag
                                        )
{
    if ((( NULL != buff ) && ( NULL != len )) && (( io - 1) < 2 ))
    {
        uint16_t cnt;
        int32_t  tmp = 0;

        *len = 4;

        if ( FALSE != flag )
        {
            util_memcpy( buff
                       , ( io == 1 ) ? \
                         (uint8_t*)"TH1:" : (uint8_t*)"TH2:"
                       , *len
                       );

            if ( FALSE != temperature_data.heat_cool.flag[io - 1])
            {
                tmp = temperature_data.heat_cool.value[io - 1];
            }
        }
        else
        {
            util_memcpy( buff
                       , ( io == 1 ) ? \
                           (uint8_t*)"TC1:" : (uint8_t*)"TC2:"
                       , *len
                       );

            if ( FALSE == temperature_data.heat_cool.flag[io - 1])
            {
                tmp = temperature_data.heat_cool.value[io - 1];
            }
        }

        cnt = util_itoa( tmp
                       , &buff[*len]
                       , 3
                       );
        *len += cnt;
    }
}

void com_set_heating_cooling( uint8_t sens, int16_t temperature, bool_t flag )
{
    if (( 1 == sens ) || ( 2 == sens ))
    {
        if (( temperature > 0 ) && ( temperature <= 125 ))
        {
            temperature_data.heat_cool.active[sens - 1] = TRUE;
            temperature_data.heat_cool.value[sens - 1]  = temperature;
            temperature_data.heat_cool.flag[sens - 1]   = flag;
        }
        else
        {
            temperature_data.heat_cool.active[sens - 1] = FALSE;
            temperature_data.heat_cool.value[sens - 1]  = 0;
            temperature_data.heat_cool.flag[sens - 1]   = FALSE;

            com_set_output_state( sens, 0 );
        }
    }
}

void com_basic_init( uint8_t ext_board_type )
{
    temperature_data.ds_hdl         = ds18b20_get_hdl();
    temperature_data.heat_cool.active[0] = FALSE;
    temperature_data.heat_cool.active[1] = FALSE;
    temperature_data.heat_cool.flag[0]   = FALSE;
    temperature_data.heat_cool.flag[1]   = FALSE;

    util_memcpy( &temperature_data.ds_buff.out[0][0], (uint8_t*) "T1:", 3 );
    util_memcpy( &temperature_data.ds_buff.out[1][0], (uint8_t*) "T2:", 3 );

    ext_type = ext_board_type;
}

bool_t com_process_msg( uint8_t* msg, uint16_t* len, uint16_t offset )
{
    bool_t  ret = FALSE;
    uint8_t state;
    uint8_t io;
    uint8_t i;

    if (( NULL != msg ) && ( len > 0 ))
    {
        if ( 'G' == msg[offset])
        {
            if ( 'I' == msg[offset + 1])
            {
                io    = msg[offset + 2] - '0';
                state = com_get_input_state( io );

                if ( 0xFF != state )
                {
                    com_input_state_to_string( msg
                                             , len
                                             , io
                                             , state
                                             );

                    ret = TRUE;
                }
            }
            else if ( 'O' == msg[offset + 1])
            {
                io    = msg[offset + 2] - '0';
                state = com_get_output_state( io );

                if ( 0xFF != state )
                {
                    com_output_state_to_string( msg
                                              , len
                                              , io
                                              , state
                                              );

                    ret = TRUE;
                }
            }
            else if ( 'T' == msg[offset + 1])
            {
                io = msg[offset + 2 ] - '0';

                if (( io - 1 ) < 2 )
                {
                    util_memcpy( msg
                               , temperature_data.ds_buff.out[io - 1]
                               , temperature_data.ds_buff.len[io - 1] - 1
                               );
                    *len = temperature_data.ds_buff.len[io - 1] - 1;

                    ret = TRUE;
                }
            }
            else if ( 'A' == msg[offset + 1])
            {
                uint16_t cnt = 0;

                *len = 0;

                for ( i = 0; i < 2; i++ )
                {
                    state = com_get_input_state( i + 1 );
                    com_input_state_to_string( &msg[*len]
                                             , &cnt
                                             , i + 1
                                             , state
                                             );
                    *len += cnt;
                    msg[*len] = ';';
                    *len += 1;
                }

                for ( i = 0; i < 2; i++ )
                {
                    state = com_get_output_state( i + 1 );
                    com_output_state_to_string( &msg[*len]
                                              , &cnt
                                              , i + 1
                                              , state
                                              );
                    *len += cnt;
                    msg[*len] = ';';
                    *len += 1;
                }

                util_memcpy( &msg[*len]
                           , temperature_data.ds_buff.out[0]
                           , temperature_data.ds_buff.len[0] - 1
                           );
                *len += temperature_data.ds_buff.len[0] - 1;
                msg[*len - 1] = ';';

                util_memcpy( &msg[*len]
                           , temperature_data.ds_buff.out[1]
                           , temperature_data.ds_buff.len[1] - 1
                           );
                *len += temperature_data.ds_buff.len[1] - 1;
                msg[*len - 1] = ';';

                for ( i = 0; i < 2; i++ )
                {
                    com_heating_cooling_state_to_string( &msg[*len]
                                                       , &cnt
                                                       , i + 1
                                                       , TRUE
                                                       );
                    *len += cnt;
                    msg[*len] = ';';
                    *len += 1;
                }

                for ( i = 0; i < 2; i++ )
                {
                    com_heating_cooling_state_to_string( &msg[*len]
                                                       , &cnt
                                                       , i + 1
                                                       , FALSE
                                                       );
                    *len += cnt;
                    msg[*len] = ';';
                    *len += 1;
                }

                ret = TRUE;
            }
        }
        else if ( 'S' == msg[offset])
        {
            int16_t dot;
            int16_t tmp;

            if ( 'O' == msg[offset + 1])
            {
                io    = msg[offset + 2] - '0';
                state = msg[offset + 3] - '0';
                com_set_output_state( io
                                    , state
                                    );

                if (( 0 != state ) && (( io - 1 ) < 2 ))
                {
                    dot = com_find_char( &msg[offset + 3], *len - 4, '.' );

                    if ( -1 != dot )
                    {
                        com_msg_cfg_timer( &msg[offset + 3 + dot + 1], io );
                    }
                }
            }
            else if ( 'T' == msg[offset + 1])
            {
                if (( 'H' == msg[offset + 2] ) || ( 'C' == msg[offset + 2] ))
                {
                    io  = msg[offset + 3] - '0';
                    tmp = util_atoi( &msg[offset + 4]);

                    com_set_heating_cooling( io
                                           , tmp
                                           , ( 'H' == msg[offset + 2] ) ? \
                                             TRUE : FALSE
                                           );

                    if (( tmp > 0 ) && (( io - 1 ) < 2 ))
                    {
                        dot = com_find_char( &msg[offset + 4], *len - 4, '.' );

                        if ( -1 != dot )
                        {
                            com_msg_cfg_timer( &msg[offset + 4 + dot + 1], io );
                        }
                    }
                }
            }
            else if ( 'N' == msg[offset + 1])
            {
            }
        }
    }

    return ret;
}

void com_task_temp( void )
{
    uint8_t i;

    ds18b20_update();

    if ( temperature_data.ds_hdl->no_of_dev > 0 )
    {
        ds18b20_temp_to_string( &temperature_data.ds_buff.out[0][3]
                              , temperature_data.ds_hdl->last_temperature[0]
                              );

        if (( temperature_data.ds_hdl->last_temperature[0] >> 4 ) < 100 )
        {
            temperature_data.ds_buff.out[0][7] = ' ';
        }

        temperature_data.ds_buff.out[0][8] = '\0';
        temperature_data.ds_buff.len[0]    = 9;

        if ( temperature_data.ds_hdl->no_of_dev > 1 )
        {
            ds18b20_temp_to_string
                        ( &temperature_data.ds_buff.out[1][3]
                        , temperature_data.ds_hdl->last_temperature[1]
                        );

            if (( temperature_data.ds_hdl->last_temperature[1] >> 4 ) < 100 )
            {
                temperature_data.ds_buff.out[1][7] = ' ';
            }

            temperature_data.ds_buff.out[1][8] = '\0';
            temperature_data.ds_buff.len[1]    = 9;
        }
        else
        {
            util_memcpy( &temperature_data.ds_buff.out[1][3]
                       , (uint8_t*) "N/A "
                       , 4
                       );
            temperature_data.ds_buff.len[1] = 7;
        }
    }
    else
    {
        util_memcpy( &temperature_data.ds_buff.out[0][3]
                   , (uint8_t*) "N/A "
                   , 4
                   );
        temperature_data.ds_buff.len[0] = 7;

        util_memcpy( &temperature_data.ds_buff.out[1][3]
                   , (uint8_t*) "N/A "
                   , 4
                   );
        temperature_data.ds_buff.len[1] = 7;
    }

    for ( i = 0; i < 2; i++ )
    {
        lcd_puts_xy( temperature_data.ds_buff.out[i]
                    , ( 0 == i ) ? 0 : 8
                    , 0
                    );
    }
}

void com_task_heating_cooling( void )
{
    uint8_t i;

    for ( i = 0; i < 2; i++ )
    {
        if (( FALSE != temperature_data.heat_cool.active[i] )
        && ( DS_SENSOR_ERROR != temperature_data.ds_hdl->last_temperature[i] ))
        {
            if ( FALSE != temperature_data.heat_cool.flag[i] )
            {
                if ( temperature_data.heat_cool.value[i]
                > ( temperature_data.ds_hdl->last_temperature[i] >> 4 ))
                {
                    com_set_output_state( i + 1, 1 );
                }
                else
                {
                    com_set_output_state( i + 1, 0 );
                }
            }
            else
            {
                if ( temperature_data.heat_cool.value[i]
                < ( temperature_data.ds_hdl->last_temperature[i] >> 4 ))
                {
                    com_set_output_state( i + 1, 1 );
                }
                else
                {
                    com_set_output_state( i + 1, 0 );
                }
            }
        }
    }
}

void com_task_timer( void )
{
    uint8_t  i;
    Bsp_Time curr_time[2];
    bool_t   done[2] = {FALSE};

    for ( i = 0; i < 2; i++ )
    {
        if ( FALSE != out_timer.active[i] )
        {
            bsp_get_time( &curr_time[i] );

            if ( curr_time[i] > out_timer.timestamp[i])
            {
                if ( out_timer.time[i]
                <= (( curr_time[i] - out_timer.timestamp[i]) / 60000000 ))
                {
                    done[i] = TRUE;
                }
            }
            else
            {
                if ((( __UINT64_MAX__ - out_timer.timestamp[i]
                   +  curr_time[i]) / 60000000 )
                   >= out_timer.time[i])
                 {
                     done[i] = TRUE;
                 }
            }

            if ( FALSE != done[i] )
            {
                com_set_output_state( i + 1, 0 );

                out_timer.active[i]    = FALSE;
                out_timer.time[i]      = 0;
                out_timer.timestamp[i] = 0;

                if ( FALSE != temperature_data.heat_cool.active[i] )
                {
                    temperature_data.heat_cool.active[i] = FALSE;
                    temperature_data.heat_cool.value[i]  = 0;
                }
            }
        }
    }
}

void com_task_lcd_inputs( void )
{
    uint8_t  state;
    uint16_t len;
    uint8_t  i;

    if ( BOARD_NONE != ext_type )
    {
        lcd_clear_row( 1 );

        for ( i = 0; i < 2; i++ )
        {
            state = com_get_input_state( i + 1 );
            com_input_state_to_string( lcd_out, &len, i + 1, state );
            if ( len < 16 )
            {
                lcd_puts_xy( lcd_out, ( i == 0 ) ? 0 : 8, 1 );
            }
        }
    }
}

void com_task_lcd_outputs( void )
{
    uint8_t  state;
    uint16_t len;
    uint8_t  i;

    if ( BOARD_NONE != ext_type )
    {
        lcd_clear_row( 1 );

        for ( i = 0; i < 2; i++ )
        {
            state = com_get_output_state( i + 1 );
            com_output_state_to_string( lcd_out, &len, i + 1, state );
            if ( len < 16 )
            {
                lcd_puts_xy( lcd_out, ( i == 0 ) ? 0 : 8, 1 );
            }
        }
    }
}

void com_task_lcd_heating_cooling( bool_t flag )
{
    uint16_t len;
    uint8_t  i;

    if ( BOARD_NONE != ext_type )
    {
        lcd_clear_row( 1 );

        for ( i = 0; i < 2; i++ )
        {

            com_heating_cooling_state_to_string( lcd_out
                                               , &len
                                               , i + 1
                                               , flag
                                               );

            if ( len < 16 )
            {
                lcd_puts_xy( lcd_out, ( i == 0 ) ? 0 : 8, 1 );
            }
        }
    }
}

Com_Temp_Data_t* com_get_temp_hdl( void )
{
    return &temperature_data;
}

uint8_t* com_get_buff_hdl( void )
{
    return &common_buffer[0];
}

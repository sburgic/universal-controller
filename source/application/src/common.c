/**
 ** Name
 **   common.c
 **
 ** Purpose
 **   Common routines for all extension boards
 **
 ** Revision
 **   17-Dec-2020 (SSB) [] Initial
 **/

#include "common.h"

#include "gpio.h"
#include "lcd2wire.h"
#include "time.h"
#include "utils.h"

static uint8_t         ext_type         = BOARD_NONE;
static uint8_t         lcd_out[16]      = {0};
static Com_Temp_Data_t temperature_data = {0};

void com_error_handler( void )
{
    bsp_wait( 5, BSP_TIME_SEC );
    HAL_NVIC_SystemReset();
}

uint8_t com_ext_board_detect( void )
{
    uint8_t ret = 0;

    ret |= ( HAL_GPIO_ReadPin( HW_ADDR1_PORT, HW_ADDR1_PIN ) << 3 );
    ret |= ( HAL_GPIO_ReadPin( HW_ADDR2_PORT, HW_ADDR1_PIN ) << 2 );
    ret |= ( HAL_GPIO_ReadPin( HW_ADDR3_PORT, HW_ADDR1_PIN ) << 1 );
    ret |= HAL_GPIO_ReadPin( HW_ADDR4_PORT, HW_ADDR1_PIN );

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

void com_basic_init( uint8_t ext_board_type )
{
    temperature_data.ds_hdl         = ds18b20_get_hdl();
    temperature_data.heat.active[0] = FALSE;
    temperature_data.heat.active[1] = FALSE;

    util_memcpy( &temperature_data.ds_buff.out[0][0], (uint8_t*) "T1:", 3 );
    util_memcpy( &temperature_data.ds_buff.out[1][0], (uint8_t*) "T2:", 3 );

    ext_type = ext_board_type;
}

void com_task_temp( void )
{
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
            lcd_puts_xy( temperature_data.ds_buff.out[1], 11, 0 );

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
    }

    lcd_puts_xy( temperature_data.ds_buff.out[0], 0, 0 );
    lcd_puts_xy( temperature_data.ds_buff.out[1], 8, 0 );
}

void com_task_lcd_inputs( void )
{
    uint8_t  state;
    uint16_t len;

    if ( BOARD_NONE != ext_type )
    {
        lcd_clear_row( 1 );

        state = com_get_input_state( 1 );
        com_input_state_to_string( lcd_out, &len, 1, state );
        if ( len < 16 )
        {
            lcd_puts_xy( lcd_out, 0, 1 );
        }

        state = com_get_input_state( 1 );
        com_input_state_to_string( lcd_out, &len, 2, state );
        if ( len < 16 )
        {
            lcd_puts_xy( lcd_out, 6, 1 );
        }
    }
}

void com_task_lcd_outputs( void )
{
    uint8_t  state;
    uint16_t len;

    if ( BOARD_NONE != ext_type )
    {
        lcd_clear_row( 1 );

        state = com_get_output_state( 1 );
        com_output_state_to_string( lcd_out, &len, 1, state );
        if ( len < 16 )
        {
            lcd_puts_xy( lcd_out, 0, 1 );
        }

        state = com_get_output_state( 1 );
        com_output_state_to_string( lcd_out, &len, 2, state );
        if ( len < 16 )
        {
            lcd_puts_xy( lcd_out, 7, 1 );
        }
    }
}

Com_Temp_Data_t* com_get_temp_hdl( void )
{
    return &temperature_data;
}

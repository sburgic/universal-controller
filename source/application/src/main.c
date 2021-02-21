/**
 ** Name
 **   main.c
 **
 ** Purpose
 **   Main application
 **
 ** Revision
 **   10-Dec-2020 (SSB) [] Initial
 **   24-Feb-2021 (SSB) [] Add GSM support
 **/

#include "main.h"

#include "bluetooth.h"
#include "cc1101_task.h"
#include "common.h"
#include "flash.h"
#include "gpio.h"
#include "gsm.h"
#include "ptypes.h"
#include "time.h"
#include "scheduler.h"
#include "system_init.h"

#include <ds18b20.h>
#include <cc1101.h>
#include <lcd2wire.h>

#include <stdio.h>

int main( void )
{
    status_t       ret;
    uint8_t        ext_type;
    uint8_t        active_tasks = 4;
    static uint8_t switch_task  = 0;

    system_clk_cfg();
    HAL_Init();
    bsp_tmr_init();
    bsp_sched_tmr_init();

    bsp_wait( 100, BSP_TIME_MSEC );

    gpio_init();
    lcd_init();
    bsp_wait( 100, BSP_TIME_MSEC );
    lcd_puts_xy((uint8_t*) APP_SW_VERSION, 2, 1 );
    ds18b20_init( GPIOA, GPIO_PIN_8 );

    ret = uart_init( USART2, 115200 );
    if ( STATUS_OK != ret )
    {
        com_error_handler();
    }
    else
    {
        printf( "UART2 Debug initialized.\r\n" );
    }

    ext_type = com_ext_board_detect();

    switch( ext_type )
    {
        case BOARD_GSM:
            ret = gsm_init();
            if ( STATUS_OK != ret )
            {
                lcd_puts_xy((uint8_t*) "E:GSM init fail.", 0, 1 );
                com_error_handler();
            }
            else
            {
                active_tasks += 1;
            }
            break;
        case BOARD_RF_BT:
            ret = bt_init();
            if ( STATUS_OK != ret )
            {
                lcd_puts_xy((uint8_t*) "E:BT init fail.", 0, 1 );
                com_error_handler();
            }
            break;
        case BOARD_RF_CC:
            ret = cc_init( CC_MOD_DEFAULT
                         , CC_ISM_434_MHZ
                         , CC_OUTPUT_PWR_M30
                         , CC_RF_CHANNEL_1
                         );
            if ( STATUS_OK != ret )
            {
                lcd_puts_xy((uint8_t*) "E:RF init fail.", 0, 1 );
                com_error_handler();
            }
            else
            {
                cc_goto_rx_mode();
            }
            break;
        default:
            lcd_puts_xy((uint8_t*) "E:No ext. board", 0, 1 );
            ret = flash_erase();
            if ( STATUS_OK != ret )
            {
                com_error_handler();
            }
            break;
    }

    com_basic_init( ext_type );
    sched_enable();

    for(;;)
    {
        switch( ext_type )
        {
            case BOARD_GSM:
                gsm_task();
                break;
            case BOARD_RF_BT:
                bt_task();
                break;
            case BOARD_RF_CC:
                cc_task();
                break;
            default:
                break;
        }

        if ( FALSE != task_1024 )
        {
            com_task_temp();
            com_task_heating_cooling();
            com_task_timer();
            task_1024 = FALSE;
        }

        if ( FALSE != task_4096 )
        {
            if ( 0 == ( switch_task % active_tasks ))
            {
                com_task_lcd_outputs();
            }
            else if ( 1 == ( switch_task % active_tasks ))
            {
                com_task_lcd_inputs();
            }
            else if ( 2 == ( switch_task % active_tasks ))
            {
                com_task_lcd_heating_cooling( TRUE );
            }
            else if ( 3 == ( switch_task % active_tasks ))
            {
                com_task_lcd_heating_cooling( FALSE );
            }
            else if ( 4 == ( switch_task % active_tasks ))
            {
                gsm_task_lcd_network_status();
            }

            switch_task++;

            task_4096 = FALSE;
        }
    }

#ifndef __ICCARM__
    return 0;
#endif
}

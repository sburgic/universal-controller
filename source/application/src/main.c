/**
 ** Name
 **   main.c
 **
 ** Purpose
 **   Main application
 **
 ** Revision
 **   10-Dec-2020 (SSB) [] Initial
 **   17-Jan-2021 (SSB) [] Add CC1101
                           Remove GSM support
 **/

#include "main.h"

#include "bluetooth.h"
#include "cc1101.h"
#include "common.h"
#include "ds18b20.h"
#include "gpio.h"
#include "lcd2wire.h"
#include "ptypes.h"
#include "time.h"
#include "scheduler.h"
#include "system_init.h"

#define ACTIVE_TASKS 4

int main( void )
{
    status_t       ret;
    uint8_t        ext_type;
    static uint8_t switch_task = 0;

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

    ext_type = com_ext_board_detect();

    switch( ext_type )
    {
        case BOARD_RF_BT:
            ret = bt_init();
            if ( STATUS_OK != ret )
            {
                lcd_puts_xy((uint8_t*) "E:BT init fail.", 0, 1 );
                com_error_handler();
            }
            break;
        case BOARD_RF_CC:
            ret = cc_init( CC_MOD_GFSK_1_2_KB
                         , CC_ISM_434_MHZ
                         , CC_OUTPUT_PWR_M30
                         , CC_RF_CHANNEL_0
                         );
            if ( STATUS_OK != ret )
            {
                lcd_puts_xy((uint8_t*) "E:RF init fail.", 0, 1 );
                com_error_handler();
            }
            break;
        default:
            lcd_puts_xy((uint8_t*) "E:No ext. board", 0, 1 );
            break;
    }

    com_basic_init( ext_type );
    sched_enable();

    for(;;)
    {
        switch( ext_type )
        {
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
            if ( 0 == ( switch_task % ACTIVE_TASKS ))
            {
                com_task_lcd_outputs();
            }
            else if ( 1 == ( switch_task % ACTIVE_TASKS ))
            {
                com_task_lcd_inputs();
            }
            else if ( 2 == ( switch_task % ACTIVE_TASKS ))
            {
                com_task_lcd_heating_cooling( TRUE );
            }
            else if ( 3 == ( switch_task % ACTIVE_TASKS ))
            {
                com_task_lcd_heating_cooling( FALSE );
            }

            switch_task++;

            task_4096 = FALSE;
        }
    }

    return 0;
}

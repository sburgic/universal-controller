/**
 ** Name
 **   main.c
 **
 ** Purpose
 **   Main application
 **
 ** Revision
 **   10-Dec-2020 (SSB) [] Initial
 **/

#include "main.h"

#include "bluetooth.h"
#include "common.h"
#include "ds18b20.h"
#include "gpio.h"
#include "lcd2wire.h"
#include "ptypes.h"
#include "time.h"
#include "scheduler.h"
#include "system_init.h"


int main( void )
{
    status_t      ret;
    uint8_t       ext_type;
    static bool_t switch_task = FALSE;

    system_clk_cfg();
    HAL_Init();
    bsp_tmr_init();
    bsp_sched_tmr_init();

    bsp_wait( 100, BSP_TIME_MSEC );

    gpio_init();
    lcd_init();
    ds18b20_init( GPIOA, GPIO_PIN_8 );

    ext_type = com_ext_board_detect();

    switch( ext_type )
    {
        case BOARD_GSM:
            // gsm_init();
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
            // cc_init();
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
            case BOARD_GSM:
                // gsm_task();
                break;
            case BOARD_RF_BT:
                bt_task();
                break;
            case BOARD_RF_CC:
                // cc_task();
                break;
            default:
                break;
        }

        if ( FALSE != task_1024 )
        {
            com_task_temp();
            task_1024 = FALSE;
        }

        if ( FALSE != task_4096 )
        {
            if ( FALSE != switch_task )
            {
                com_task_lcd_outputs();
            }
            else
            {
                com_task_lcd_inputs();
            }

            switch_task = ~switch_task;
            task_4096   = FALSE;
        }
    }

    return 0;
}

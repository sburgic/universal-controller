/**
 ** Name
 **   callbacks.c
 **
 ** Purpose
 **   Application callbacks
 **
 ** Revision
 **   31-Jan-2021 (SSB) [] Initial
 **/

#include "callbacks.h"

#include "cc1101.h"

void callback_cc_gdo0( void )
{
    HAL_GPIO_EXTI_IRQHandler( CC_GDO0_PIN );
}

void HAL_GPIO_EXTI_Callback( uint16_t gpio_pin )
{
    if ( CC_GDO0_PIN == gpio_pin )
    {
        cc_set_gdo0_flag();
    }
}

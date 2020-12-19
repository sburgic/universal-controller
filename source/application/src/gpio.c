/**
 ** Name
 **   gpio.c
 **
 ** Purpose
 **   GPIO routines
 **
 ** Revision
 **   19-Apr-2020 (SSB) [] Initial
 **/

#include "gpio.h"

status_t gpio_init( void )
{
    status_t         ret = STATUS_OK;
    GPIO_InitTypeDef gpio = {0};

    IN1_CLOCK_ENABLE();
    IN2_CLOCK_ENABLE();
    RELAY1_CLOCK_ENABLE();
    RELAY2_CLOCK_ENABLE();
    HW_ADDR1_CLOCK_ENABLE();
    HW_ADDR2_CLOCK_ENABLE();
    HW_ADDR3_CLOCK_ENABLE();
    HW_ADDR4_CLOCK_ENABLE();

    gpio.Pin   = IN1_PIN;
    gpio.Mode  = GPIO_MODE_INPUT;
    gpio.Pull  = GPIO_NOPULL;
    gpio.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init( IN1_PORT, &gpio );

    gpio.Pin = IN2_PIN;
    HAL_GPIO_Init( IN2_PORT, &gpio );

    gpio.Pull = GPIO_PULLDOWN;
    gpio.Pin  = HW_ADDR1_PIN;
    HAL_GPIO_Init( HW_ADDR1_PORT, &gpio );

    gpio.Pin = HW_ADDR2_PIN;
    HAL_GPIO_Init( HW_ADDR2_PORT, &gpio );

    gpio.Pin = HW_ADDR3_PIN;
    HAL_GPIO_Init( HW_ADDR3_PORT, &gpio );

    gpio.Pin = HW_ADDR4_PIN;
    HAL_GPIO_Init( HW_ADDR4_PORT, &gpio );

    gpio.Pin  = RELAY1_PIN;
    gpio.Mode = GPIO_MODE_OUTPUT_PP;
    HAL_GPIO_Init( RELAY1_PORT, &gpio );

    gpio.Pin = RELAY2_PIN;
    HAL_GPIO_Init( RELAY2_PORT, &gpio );

    return ret;
}

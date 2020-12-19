/**
 ** Name
 **   gpio.h
 **
 ** Purpose
 **   GPIO routines
 **
 ** Revision
 **   19-Apr-2020 (SSB) [] Initial
 **/

#ifndef __GPIO_H__
#define __GPIO_H__

#include "ptypes.h"

#include <stm32f1xx_hal.h>

/* Digital inputs */
#define IN1_PIN  GPIO_PIN_6
#define IN1_PORT GPIOB

#define IN1_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOB_CLK_ENABLE(); } while(0)

#define IN2_PIN  GPIO_PIN_7
#define IN2_PORT GPIOB

#define IN2_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOB_CLK_ENABLE(); } while(0)

/* Relays */
#define RELAY1_PIN  GPIO_PIN_8
#define RELAY1_PORT GPIOB

#define RELAY1_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOB_CLK_ENABLE(); } while(0)

#define RELAY2_PIN  GPIO_PIN_9
#define RELAY2_PORT GPIOB

#define RELAY2_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOB_CLK_ENABLE(); } while(0)

/* HW addressing */
#define HW_ADDR1_PIN  GPIO_PIN_4
#define HW_ADDR1_PORT GPIOA

#define HW_ADDR1_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOA_CLK_ENABLE(); } while(0)

#define HW_ADDR2_PIN  GPIO_PIN_5
#define HW_ADDR2_PORT GPIOA

#define HW_ADDR2_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOA_CLK_ENABLE(); } while(0)

#define HW_ADDR3_PIN  GPIO_PIN_6
#define HW_ADDR3_PORT GPIOA

#define HW_ADDR3_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOA_CLK_ENABLE(); } while(0)

#define HW_ADDR4_PIN  GPIO_PIN_7
#define HW_ADDR4_PORT GPIOA

#define HW_ADDR4_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOA_CLK_ENABLE(); } while(0)

/* General purpose I/O */
#define IO1_PIN  GPIO_PIN_6
#define IO1_PORT GPIOB

#define IO1_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOB_CLK_ENABLE(); } while(0)

#define IO2_PIN  GPIO_PIN_7
#define IO2_PORT GPIOB

#define IO2_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOB_CLK_ENABLE(); } while(0)

/* Shared with I2C_SCK */
#define IO3_PIN  GPIO_PIN_10
#define IO3_PORT GPIOB

#define IO3_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOA_CLK_ENABLE(); } while(0)

/* Shared with I2C_DATA */
#define IO4_PIN  GPIO_PIN_11
#define IO4_PORT GPIOB

#define IO4_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOB_CLK_ENABLE(); } while(0)

status_t gpio_init( void );

#endif /* __GPIO_H__ */

/**
 ** Name
 **   cc1101_cfg.h
 **
 ** Purpose
 **   CC1101 driver configuration
 **
 ** Revision
 **   31-Jan-2021 (SSB) [] Initial
 **/

#ifndef __CC1100_CFG_H__
#define __CC1100_CFG_H__

#include "gpio.h"

#include <stm32f1xx_hal.h>

#define CC_SPI           SPI2
#define CC_SPI_PRESCALER SPI_BAUDRATEPRESCALER_4

#define CC_CS_PIN    GPIO_PIN_12
#define CC_CS_PORT   GPIOB

#define CC_GDO0_PIN  IO1_PIN
#define CC_GDO0_PORT IO1_PORT
#define CC_GDO0_IRQN EXTI0_IRQn

#define CC_GPIO_CLK_ENABLE()                            \
            do { IO1_CLOCK_ENABLE();                    \
                 __HAL_RCC_GPIOB_CLK_ENABLE(); } while(0)

#endif /* __CC1100_CFG_H__ */

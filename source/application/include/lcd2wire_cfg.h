/**
 ** Name
 **   lcd2wire_cfg.h
 **
 ** Purpose
 **   LCD2Wire driver configuration
 **
 ** Revision
 **   31-Jan-2021 (SSB) [] Initial
 **/

#ifndef __LCD2WIRE_CFG_H__
#define __LCD2WIRE_CFG_H__

#include <stm32f1xx_hal.h>

#define LCD2WIRE_DATA_PIN  GPIO_PIN_11
#define LCD2WIRE_DATA_PORT GPIOA

#define LCD2WIRE_CLK_PIN  GPIO_PIN_12
#define LCD2WIRE_CLK_PORT GPIOA

#define LCD2WIRE_GPIO_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOA_CLK_ENABLE(); } while(0)

#endif /* __LCD2WIRE_CFG_H__ */

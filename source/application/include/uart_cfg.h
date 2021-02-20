/**
 ** Name
 **   uart_cfg.h
 **
 ** Purpose
 **   UART driver configuration
 **
 ** Revision
 **   30-Jan-2021 (SSB) [] Initial
 **/

#ifndef __UART_CFG_H__
#define __UART_CFG_H__

#include <stm32f1xx_hal.h>

#define UART1_ENABLE           1
#define UART1_BUFFER_SIZE      1024
#define UART1_STRING_DELIMITER ((uint8_t)'\n')

#define UART2_ENABLE           1
#define UART2_BUFFER_SIZE      64
#define UART2_STRING_DELIMITER ((uint8_t)'\n')

#define UART_RETARGET_PRINTF USART2

#endif /* __UART_CFG_H__ */

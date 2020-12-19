#ifndef __LCD2WIRE_H__
#define __LCD2WIRE_H__

#include "ptypes.h"

#include <stm32f1xx_hal.h>

#define LCD2WIRE_DATA_PIN  GPIO_PIN_11
#define LCD2WIRE_DATA_PORT GPIOA

#define LCD2WIRE_CLK_PIN  GPIO_PIN_12
#define LCD2WIRE_CLK_PORT GPIOA

#define LCD2WIRE_GPIO_CLOCK_ENABLE() \
    do { __HAL_RCC_GPIOA_CLK_ENABLE(); } while(0)

/* Print a character on display at defined position */
void lcd_putch_xy( uint8_t byte, uint8_t x, uint8_t y );
/* Print string on display at defined position */
int8_t lcd_puts_xy( const uint8_t* str, uint8_t x, uint8_t y );
/* Print string on display at defined position and clear the rest of row */
void lcd_puts_xy_cl( const uint8_t* str, uint8_t x, uint8_t y );
/* Initialize LCD display */
void lcd_init( void );
/* Clear display */
void lcd_clear( void );
/* Clear row */
void lcd_clear_row( uint8_t row );

#endif /* __LCD2WIRE_H__ */

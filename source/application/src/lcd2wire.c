#include "lcd2wire.h"

#include "time.h"

/* Standard commands should work with most common devices */
#define clear_lcd        0x01 /* Clear Display */
#define return_home      0x02 /* Cursor to Home position */
#define entry_mode       0x06 /* Normal entry mode */
#define entry_mode_shift 0x07 /* With shift */
#define system_set_8_bit 0x38 /* 8 bit data mode 2 line */
#define system_set_4_bit 0x28 /* 4 bit data mode 2 line */
#define display_on       0x0C /* Switch ON Display */
#define display_off      0x08 /* Cursor plus blink */
#define set_dd_line1     0x80 /* Line 1 */
#define set_dd_line2     0xC0 /* Line 2 */
#define set_dd_line3     0x94 /* Line 3 */
#define set_dd_line4     0xD4 /* Line 4 */
#define write_data       0x00 /* With RS = 1 */
#define cursor_on        0x0E /* Switch Cursor ON */
#define cursor_on_blink  0x0F /* Switch Cursor BLINKING ON */
#define cursor_off       0x0C /* Switch Cursor OFF */

/* LCD Procedures for HD44780 */
#define lcd_cursor(x)       lcd_cmd(((x)&0x7F)|0x80)
#define lcd_clear_all()     lcd_cmd(0x01)
#define lcd_goto(x)         lcd_cmd(0x80+(x))
#define lcd_gotoxy(x,y)     lcd_cmd(0x80+x+(0x40*y))
#define lcd_cursor_right()  lcd_cmd(0x14)
#define lcd_cursor_left()   lcd_cmd(0x10)
#define lcd_display_shift() lcd_cmd(0x1C)
#define lcd_home()          lcd_cmd(0x02)

#define NOP_WAIT   (1)
#define DELAY_WAIT (5)

static void lcd_gpio_init( void )
{
    GPIO_InitTypeDef gpio = {0};

    LCD2WIRE_GPIO_CLOCK_ENABLE();

    gpio.Pin   = LCD2WIRE_DATA_PIN;
    gpio.Mode  = GPIO_MODE_OUTPUT_PP;
    gpio.Pull  = GPIO_NOPULL;
    gpio.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init( LCD2WIRE_DATA_PORT, &gpio );

    gpio.Pin = LCD2WIRE_CLK_PIN;
    HAL_GPIO_Init( LCD2WIRE_CLK_PORT, &gpio );
}

static void lcd_nibble_out( uint8_t nibble, uint8_t rs )
{
    int i = 0;

    HAL_GPIO_WritePin( LCD2WIRE_DATA_PORT, LCD2WIRE_DATA_PIN, GPIO_PIN_RESET );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );

    for ( i = 6; i > 0; --i )
    {
        HAL_GPIO_WritePin( LCD2WIRE_CLK_PORT, LCD2WIRE_CLK_PIN, GPIO_PIN_SET );
        bsp_wait( NOP_WAIT, BSP_TIME_USEC );
        HAL_GPIO_WritePin( LCD2WIRE_CLK_PORT
                         , LCD2WIRE_CLK_PIN
                         , GPIO_PIN_RESET
                         );
        bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    }

    HAL_GPIO_WritePin( LCD2WIRE_DATA_PORT, LCD2WIRE_DATA_PIN, GPIO_PIN_SET );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    HAL_GPIO_WritePin( LCD2WIRE_CLK_PORT, LCD2WIRE_CLK_PIN, GPIO_PIN_SET );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    HAL_GPIO_WritePin( LCD2WIRE_CLK_PORT, LCD2WIRE_CLK_PIN, GPIO_PIN_RESET );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    HAL_GPIO_WritePin( LCD2WIRE_DATA_PORT, LCD2WIRE_DATA_PIN, rs );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    HAL_GPIO_WritePin( LCD2WIRE_CLK_PORT, LCD2WIRE_CLK_PIN, GPIO_PIN_SET );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    HAL_GPIO_WritePin( LCD2WIRE_CLK_PORT, LCD2WIRE_CLK_PIN, GPIO_PIN_RESET );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );

    for ( i = 0x08; i > 0; i >>= 1 )
    {
        HAL_GPIO_WritePin( LCD2WIRE_DATA_PORT
                         , LCD2WIRE_DATA_PIN
                         , (i & nibble) ? GPIO_PIN_SET : GPIO_PIN_RESET
                         );
        bsp_wait( NOP_WAIT, BSP_TIME_USEC );
        HAL_GPIO_WritePin( LCD2WIRE_CLK_PORT, LCD2WIRE_CLK_PIN, GPIO_PIN_SET );
        bsp_wait( NOP_WAIT, BSP_TIME_USEC );
        HAL_GPIO_WritePin( LCD2WIRE_CLK_PORT
                         , LCD2WIRE_CLK_PIN
                         , GPIO_PIN_RESET
                         );
        bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    }

    HAL_GPIO_WritePin( LCD2WIRE_DATA_PORT, LCD2WIRE_DATA_PIN, GPIO_PIN_SET );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    HAL_GPIO_WritePin( LCD2WIRE_DATA_PORT, LCD2WIRE_DATA_PIN, GPIO_PIN_RESET );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
}

static void lcd_cmd ( uint8_t byte )
{
    lcd_nibble_out( byte >> 4, 0 );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    lcd_nibble_out( byte & 0x0F, 0 );
    bsp_wait( DELAY_WAIT, BSP_TIME_MSEC );
}

static void lcd_goto_rc ( uint8_t row, uint8_t col )
{
    if ( 0 == row )
    {
        lcd_cmd( set_dd_line1 + col );
    }
    else if ( 1 == row )
    {
        lcd_cmd( set_dd_line2 + col );
    }
    else if ( 2 == row )
    {
        lcd_cmd( set_dd_line3 + col );
    }
    else if ( 3 == row )
    {
        lcd_cmd( set_dd_line4 + col );
    }
}

static void lcd_putch( uint8_t byte )
{
    lcd_nibble_out( byte >> 4, 1 );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    lcd_nibble_out( byte & 0x0F, 1 );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
    bsp_wait( NOP_WAIT, BSP_TIME_USEC );
}

void lcd_putch_xy( uint8_t byte, uint8_t x, uint8_t y )
{
    lcd_goto_rc( y, x );
    lcd_putch( byte );
}

int8_t lcd_puts_xy( const uint8_t* str, uint8_t x, uint8_t y )
{
    int8_t i = -1;

    if ( NULL != str )
    {
        lcd_goto_rc( y, x );

        for ( i = 0; str[i]!='\0'; i++ )
        {
            lcd_putch( str[i] );
        }
    }

    return i;
}

void lcd_puts_xy_cl( const uint8_t* str, uint8_t x, uint8_t y )
{
    int8_t i;

    i = lcd_puts_xy( str, x, y );

    while ( i++ < 16 )
    {
        lcd_putch(' ');
    }
}

void lcd_init( void )
{
    lcd_gpio_init();

    /* 8 bit interface/and wait 5ms */
    lcd_cmd( 0xF3 );
    bsp_wait( DELAY_WAIT, BSP_TIME_MSEC );
    /* 8 bit interface/and wait 160uS */
    lcd_cmd( 0xF3 );
    bsp_wait( 160, BSP_TIME_USEC );
    /* {8 bit interface/and wait 160uS */
    lcd_cmd( 0xF3 );
    bsp_wait( 160, BSP_TIME_USEC );
    /* {4 bit interface} */
    lcd_cmd( 0xF2 );
    bsp_wait( DELAY_WAIT, BSP_TIME_MSEC );
    lcd_cmd( 0x20+0x08 ); /* 4 bit, 2 rows, 5x7 */
    bsp_wait( DELAY_WAIT, BSP_TIME_MSEC );
    lcd_cmd( 0x06 ); /* Increment position, display shift off */
    lcd_cmd( 0x0C ); /* Display = On, Cursor = Off, Blink = Off */

    lcd_clear();
    bsp_wait( DELAY_WAIT, BSP_TIME_MSEC );
    lcd_home();
}

void lcd_clear( void )
{
    lcd_clear_all();
}

void lcd_clear_row( uint8_t row )
{
    uint8_t i = 0;

    if ( row < 2 )
    {
        while( i < 16 )
        {
            lcd_putch_xy( ' ', i, row );
            i++;
        }
    }
}

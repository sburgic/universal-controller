/**
 ** Name
 **   bluetooth.h
 **
 ** Purpose
 **   Bluetooth HC-06 driver
 **
 ** Revision
 **   16-Dec-2020 (SSB) [] Initial
 **/

#ifndef __BLUETOOTH_H__
#define __BLUETOOTH_H__

#include "uart.h"

#define BT_UART     USART1
#define BT_BAUDRATE 9600

status_t bt_init( void );
void bt_task( void );

#endif /* __BLUETOOTH_H__ */

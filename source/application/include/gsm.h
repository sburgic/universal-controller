/**
 ** Name
 **   gsm.h
 **
 ** Purpose
 **   SIM800 module driver
 **
 ** Revision
 **   12-Feb-2020 (SSB) [] Initial
 **/

#include "ptypes.h"

#define GSM_UART     USART1
#define GSM_BAUDRATE 115200

status_t gsm_init( void );
void gsm_task_lcd_network_status( void );
void gsm_task( void );

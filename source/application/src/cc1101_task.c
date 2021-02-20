/**
 ** Name
 **   cc1101_task.c
 **
 ** Purpose
 **   CC1101 task
 **
 ** Revision
 **   31-Dec-2020 (SSB) [] Initial
 **/

#include "cc1101_task.h"

#include "common.h"
#include "utils.h"

#include <cc1101.h>

#define CC_MSG_MIN_SIZE    9

static uint8_t* cc_buff;
static uint8_t  cc_ack[4] = { 3, 'A', 'C', 'K' };

void cc_task( void )
{
    uint16_t len = 0;
    bool_t   gdo0_flag;
    bool_t   is_empty;

    cc_buff = com_get_buff_hdl();

    gdo0_flag = cc_get_gdo0_flag();

    if ( FALSE != gdo0_flag )
    {
        uint8_t tmp = 0;

        /* TODO: Add timeout */
        do
        {
            cc_read_data( CC_ST_REG_RXBYTES, (uint8_t*) &len, 1 );

            tmp = len;
        } while (( len != tmp ) && ( 0 == len ));

        cc_read_data( CC_RXFIFO, cc_buff, (uint8_t) len );
        cc_buff[len] = '\0';

        /* Check CRC and process the message */
        if ( 0 != ( cc_buff[len-1] & 0x80 ))
        {
            if ( len >= CC_MSG_MIN_SIZE )
            {
                if ( 0 == util_strcmp( &cc_buff[1]
                                     , COM_MSG_HEADER, COM_MSG_HEADER_SIZE
                                     ))
                {
                    len -= 2;
                    is_empty = com_process_msg( &cc_buff[1]
                                              , (uint16_t*) &len
                                              , COM_MSG_HEADER_SIZE
                                              );

                    if ( FALSE != is_empty )
                    {
                        cc_buff[0] = len - 1;
                        cc_send_frame( cc_buff, len );
                    }
                    else
                    {
                        cc_send_frame( cc_ack, sizeof(cc_ack));
                    }
                }
            }
        }
        cc_goto_rx_mode();
    }
}

/**
 ** Name
 **   common.h
 **
 ** Purpose
 **   Common routines for all extension boards
 **
 ** Revision
 **   17-Dec-2020 (SSB) [] Initial
 **   24-Feb-2021 (SSB) [] Add GSM support
 **/

#ifndef __COMMON_H__
#define __COMMON_H__

#include "ptypes.h"

#include "ds18b20.h"

#define COM_MSG_MIN_SIZE    6
#define COM_MSG_HEADER      ((uint8_t*)"RTS.")
#define COM_MSG_HEADER_SIZE 4

#define COM_MAX_TEMP_DEVICES 2
#define COM_MAX_INPUTS       2
#define COM_BUFF_SIZE        1024

#define GSM_NUMBER_MAX_SIZE   16
#define GSM_NUMBER_MAX_MASTER 8

typedef struct
{
    bool_t   ring_auto_answer;
    uint8_t  ring_relay_attach;
    uint16_t ring_relay_toggle_time;
    bool_t   input_sms_on_change[COM_MAX_INPUTS];
    uint16_t temperature_threshold_up[COM_MAX_TEMP_DEVICES];
    uint16_t temperature_threshold_down[COM_MAX_TEMP_DEVICES];
    bool_t   master_ctrl_enable;
    uint8_t  master_number[GSM_NUMBER_MAX_MASTER + 1][GSM_NUMBER_MAX_SIZE];
} Com_Gsm_Props_t;

enum
{
    BOARD_NONE  = 0x0,
    BOARD_GSM   = 0x5,
    BOARD_RF_BT = 0x6,
    BOARD_RF_CC = 0x7
};

typedef struct
{
    uint8_t out[COM_MAX_TEMP_DEVICES][10];
    uint8_t len[COM_MAX_TEMP_DEVICES];
} Com_Ds_Buff_t;

typedef struct
{
    bool_t  active[COM_MAX_TEMP_DEVICES];
    bool_t  flag[COM_MAX_TEMP_DEVICES];
    int16_t value[COM_MAX_TEMP_DEVICES];
} Com_Temp_Heat_Cool_t;

typedef struct
{
    Ds_Hdl_t*            ds_hdl;
    Com_Ds_Buff_t        ds_buff;
    Com_Temp_Heat_Cool_t heat_cool;
} Com_Temp_Data_t;

void com_error_handler( void );
uint8_t com_ext_board_detect( void );
uint8_t com_get_output_state( uint8_t output );
status_t com_toggle_output_state( uint8_t output );
status_t com_set_output_state( uint8_t output, uint8_t new_state );
uint8_t com_get_input_state( uint8_t input );
void com_input_state_to_string( uint8_t*  buff
                              , uint16_t* len
                              , uint8_t   input
                              , uint8_t   state
                              );
void com_output_state_to_string( uint8_t*  buff
                               , uint16_t* len
                               , uint8_t   output
                               , uint8_t   state
                               );
void com_heating_cooling_state_to_string( uint8_t*  buff
                                        , uint16_t* len
                                        , uint8_t   io
                                        , bool_t    flag
                                        );
void com_set_heating_cooling( uint8_t sens, int16_t temperature, bool_t flag );
void com_basic_init( uint8_t ext_board_type );
bool_t com_process_msg( uint8_t* msg, uint16_t* len, uint16_t offset );
void com_task_temp( void );
void com_task_heating_cooling( void );
void com_task_timer( void );
void com_task_lcd_inputs( void );
void com_task_lcd_outputs( void );
void com_task_lcd_heating_cooling( bool_t flag );
Com_Temp_Data_t* com_get_temp_hdl( void );
uint8_t* com_get_buff_hdl( void );
Com_Gsm_Props_t* com_get_gsm_props_hdl( void );
bool_t* com_get_gsm_call_cfg_flag_hdl( void );

#endif /* __COMMON_H__ */

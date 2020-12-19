/**
 ** Name
 **   cli_ds18b20.c
 **
 ** Purpose
 **   DS18B20 temperature sensor commands
 **
 ** Revision
 **   28-Aug-2020 (SSB) [] Initial
 **/

#include "cli.h"

#include "ds18b20.h"

static Cli_Ret cli_ds_list( Cli_Cmd_Args* args )
{
    Cli_Ret     ret = CLI_RET_OK;
    one_wire_t* ds;

    (void) args;

    ds = ds18b20_get_handle();
    ow_reset_search_state( ds );
    ow_list_all_devices( ds, TRUE );

    return ret;
}

static Cli_Ret cli_ds_read( Cli_Cmd_Args* args )
{
    Cli_Ret     ret = CLI_RET_OK;
    one_wire_t* ds;
    int16_t     temp;

    ds = ds18b20_get_handle();

    if (( args->num[2] < 1 ) || ( args->num[2] > OW_MAX_DEVICES ))
    {
        ret = CLI_RET_INV_CMD;
    }
    else
    {
        temp = ds18b20_read_temp( ds, args->num[2] - 1 );
        ds18b20_temp_to_string( NULL, temp );
    }

    return ret;
}

static const Cli_Cmd ds_cmds[] =
{
    { "list"
    , cli_ds_list
    , "List devices attached to 1-wire bus"
    }
    ,
    { "read"
    , cli_ds_read
    , "Read temperature from sensor - Usage: ds read <dev_idx>"
    }
};

const Cli_Cmd_List cmd_ds_list =
{
    "ds"
    , ds_cmds
    , sizeof ( ds_cmds ) / sizeof ( ds_cmds[0] )
    , "DS18B20 commands"
};

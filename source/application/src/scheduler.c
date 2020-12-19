/**
 ** Name
 **   scheduler.c
 **
 ** Purpose
 **   Task scheduler
 **
 ** Revision
 **   17-Dec-2020 (SSB) [] Initial
 **/

#include "scheduler.h"

#include "common.h"

bool_t task_1024 = FALSE;
bool_t task_4096 = FALSE;

typedef enum
{
    SS_32MS   = 0x01,
    SS_64MS   = 0x02,
    SS_128MS  = 0x04,
    SS_256MS  = 0x08,
    SS_512MS  = 0x10,
    SS_1024MS = 0x20,
    SS_2048MS = 0x40,
    SS_4096MS = 0x80
} Scheduler_Slot_t;

static uint32_t sched_status;
static uint32_t sched_status_inv;

static uint32_t get_scheduler_state( void )
{
    uint32_t ret = SCHEDULER_DISABLE;

    if ( 0xFFFFFFFF == ( sched_status ^ sched_status_inv ))
    {
        ret = sched_status;
    }

    return ret;
}

void sched_exec( void )
{
    uint32_t         state;
    Scheduler_Slot_t curr_slot;
    static uint8_t   tick = 1;

    state     = get_scheduler_state();
    curr_slot = (Scheduler_Slot_t)( tick & ~( tick - 1 ));
    tick++;

    if ( SCHEDULER_ENABLE == state )
    {
        switch ( curr_slot )
        {
            case SS_32MS:
                sched_task_32ms();
                break;
            case SS_64MS:
                sched_task_64ms();
                break;
            case SS_128MS:
                sched_task_128ms();
                break;
            case SS_256MS:
                sched_task_256ms();
                break;
            case SS_512MS:
                sched_task_512ms();
                break;
            case SS_1024MS:
                sched_task_1024ms();
                break;
            case SS_2048MS:
                sched_task_2048ms();
                break;
            case SS_4096MS:
                sched_task_4096ms();
                break;
            default:
                tick = 1; /* Re-init the scheduler in case of failure */
                break;
        }
    }
}

void sched_enable( void )
{
    sched_status     =  SCHEDULER_ENABLE;
    sched_status_inv = ~SCHEDULER_ENABLE;
}

void sched_disable( void )
{
    sched_status     =  SCHEDULER_DISABLE;
    sched_status_inv = ~SCHEDULER_DISABLE;
}

void sched_task_32ms( void )
{
}

void sched_task_64ms( void )
{
}

void sched_task_128ms( void )
{
}

void sched_task_256ms( void )
{
}

void sched_task_512ms( void )
{
}

void sched_task_1024ms( void )
{
    task_1024 = TRUE;
}

void sched_task_2048ms( void )
{
}

void sched_task_4096ms( void )
{
    task_4096 = TRUE;
}

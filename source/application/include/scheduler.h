/**
 ** Name
 **   scheduler.h
 **
 ** Purpose
 **   Task scheduler
 **
 ** Revision
 **   17-Dec-2020 (SSB) [] Initial
 **/

#ifndef __SCHEDULER_H__
#define __SCHEDULER_H__

#include "ptypes.h"

#define SCHEDULER_ENABLE  (0x42557342) /* Magic value to enable the scheduler */
#define SCHEDULER_DISABLE (0x0)

extern bool_t task_1024;
extern bool_t task_4096;

void sched_exec( void );
void sched_enable( void );
void sched_disable( void );
void sched_task_32ms( void );
void sched_task_64ms( void );
void sched_task_128ms( void );
void sched_task_256ms( void );
void sched_task_512ms( void );
void sched_task_1024ms( void );
void sched_task_2048ms( void );
void sched_task_4096ms( void );

#endif /* __SCHEDULER_H__ */

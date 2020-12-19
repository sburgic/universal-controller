/**
 ** Name
 **   interrupt.c
 **
 ** Purpose
 **   IRQ routines
 **
 ** Revision
 **   19-Apr-2020 (SSB) [] Initial
 **/

#include "interrupt.h"

#include "common.h"
#include "led.h"
#include "time.h"

void NMI_Handler( void )
{
}

void HardFault_Handler( void )
{
    while (1)
    {;}
}

void MemManage_Handler( void )
{
    while (1)
    {;}
}

void BusFault_Handler( void )
{
    while (1)
    {;}
}

void UsageFault_Handler( void )
{
    while (1)
    {;}
}

void DebugMon_Handler( void )
{
    while (1)
    {;}
}

void SysTick_Handler( void )
{
    HAL_IncTick();
}

void TIM2_IRQHandler( void )
{
    bsp_tmr_slave_irq_hdl();
}

void TIM4_IRQHandler( void )
{
    bsp_tmr_sched_irq_hdl();
}

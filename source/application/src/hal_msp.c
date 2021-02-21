/**
 ** Name
 **   hal_msp.c
 **
 ** Purpose
 **   STM32F4xx HAL MSP
 **
 ** Revision
 **   31-Jan-2021 (SSB) [] Initial
 **   24-Feb-2021 (SSB) [] Add GSM support
 **/

#include <stm32f1xx_hal.h>

void HAL_SPI_MspInit( SPI_HandleTypeDef* spi_base )
{
    GPIO_InitTypeDef gpio_init = {0};

    if( SPI2 == spi_base->Instance )
    {
        __HAL_RCC_SPI2_CLK_ENABLE();
        __HAL_RCC_GPIOB_CLK_ENABLE();

        /* SPI1 GPIO configuration
         * PB13     ------> SPI2_SCK
         * PB14     ------> SPI2_MISO
         * PB15     ------> SPI2_MOSI
         */
        gpio_init.Pin       = GPIO_PIN_13 | GPIO_PIN_15;
        gpio_init.Mode      = GPIO_MODE_AF_PP;
        gpio_init.Pull      = GPIO_NOPULL;
        gpio_init.Speed     = GPIO_SPEED_FREQ_HIGH;
        HAL_GPIO_Init( GPIOB, &gpio_init );

        gpio_init.Pin       = GPIO_PIN_14;
        gpio_init.Mode      = GPIO_MODE_INPUT;
        gpio_init.Pull      = GPIO_NOPULL;
        HAL_GPIO_Init( GPIOB, &gpio_init );
    }
}

void HAL_UART_MspInit( UART_HandleTypeDef* huart )
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    if ( USART1 == huart->Instance )
    {
        __HAL_RCC_USART1_CLK_ENABLE();
        __HAL_RCC_GPIOA_CLK_ENABLE();

        GPIO_InitStruct.Pin   = GPIO_PIN_9;
        GPIO_InitStruct.Mode  = GPIO_MODE_AF_PP;
        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
        HAL_GPIO_Init( GPIOA, &GPIO_InitStruct );

        GPIO_InitStruct.Pin  = GPIO_PIN_10;
        GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        HAL_GPIO_Init( GPIOA, &GPIO_InitStruct );

        HAL_NVIC_SetPriority( USART1_IRQn, 0, 0 );
        HAL_NVIC_EnableIRQ( USART1_IRQn );
        HAL_NVIC_ClearPendingIRQ( USART1_IRQn );
    }
    else if ( USART2 == huart->Instance )
    {
        __HAL_RCC_USART2_CLK_ENABLE();
        __HAL_RCC_GPIOA_CLK_ENABLE();

        GPIO_InitStruct.Pin   = GPIO_PIN_2;
        GPIO_InitStruct.Mode  = GPIO_MODE_AF_PP;
        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
        HAL_GPIO_Init( GPIOA, &GPIO_InitStruct );

        GPIO_InitStruct.Pin  = GPIO_PIN_3;
        GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        HAL_GPIO_Init( GPIOA, &GPIO_InitStruct );

        HAL_NVIC_SetPriority( USART2_IRQn, 4, 3 );
        HAL_NVIC_EnableIRQ( USART2_IRQn );
        HAL_NVIC_ClearPendingIRQ( USART2_IRQn );
    }
}

void HAL_UART_MspDeInit( UART_HandleTypeDef* huart )
{
    if ( USART1 == huart->Instance )
    {
        __HAL_RCC_USART1_FORCE_RESET();
        __HAL_RCC_USART1_RELEASE_RESET();

        HAL_GPIO_DeInit( GPIOA, GPIO_PIN_9 );
        HAL_GPIO_DeInit( GPIOA, GPIO_PIN_10 );
    }
}

void HAL_MspInit( void )
{
    __HAL_RCC_AFIO_CLK_ENABLE();
    __HAL_RCC_PWR_CLK_ENABLE();

    HAL_NVIC_SetPriority( PendSV_IRQn, 15, 0 );
}

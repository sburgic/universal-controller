/**
 ** Name
 **   cc1101.c
 **
 ** Purpose
 **   CC1101 driver
 **
 ** Revision
 **   16-Jan-2021 (SSB) [] Initial
 **/

#include "cc1101.h"
#include "cc1101_cfg.h"

#include "common.h"
#include "time.h"

#define CC_SPI_TIMEOUT ((uint16_t)100)
#define CC_XTAL_FREQ_M ((float)2.6)

static SPI_HandleTypeDef spi_hdl;

static __inline__ void cc_spi_cs_enable( void )
{
    HAL_GPIO_WritePin( CC_CS_PORT, CC_CS_PIN, GPIO_PIN_RESET );
}

static __inline__ void cc_spi_cs_disable( void )
{
    HAL_GPIO_WritePin( CC_CS_PORT, CC_CS_PIN, GPIO_PIN_SET );
}

static void cc_gpio_init( void )
{
    GPIO_InitTypeDef gpio = {0};

    CC_CS_CLK_ENABLE();
    gpio.Pin   = CC_CS_PIN;
    gpio.Mode  = GPIO_MODE_OUTPUT_PP;
    gpio.Pull  = GPIO_NOPULL;
    gpio.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init( CC_CS_PORT, &gpio );

    cc_spi_cs_disable();
}

static status_t cc_spi_init( SPI_TypeDef* spi )
{
    status_t          ret = STATUS_OK;
    HAL_StatusTypeDef hret;

    spi_hdl.Instance               = spi;
    spi_hdl.Init.Mode              = SPI_MODE_MASTER;
    spi_hdl.Init.Direction         = SPI_DIRECTION_2LINES;
    spi_hdl.Init.DataSize          = SPI_DATASIZE_8BIT;
    spi_hdl.Init.CLKPolarity       = SPI_POLARITY_LOW;
    spi_hdl.Init.CLKPhase          = SPI_PHASE_1EDGE;
    spi_hdl.Init.NSS               = SPI_NSS_SOFT;
    spi_hdl.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_16;
    spi_hdl.Init.FirstBit          = SPI_FIRSTBIT_MSB;
    spi_hdl.Init.TIMode            = SPI_TIMODE_DISABLE;
    spi_hdl.Init.CRCCalculation    = SPI_CRCCALCULATION_DISABLE;
    spi_hdl.Init.CRCPolynomial     = 0x10;

    hret = HAL_SPI_Init( &spi_hdl );

    if ( HAL_OK != hret )
    {
        ret = STATUS_ERROR;
    }

    return ret;
}

static status_t cc_read( uint8_t* addr, uint8_t* data, uint16_t size )
{
    status_t          ret = STATUS_OK;
    HAL_StatusTypeDef hret;

    cc_spi_cs_enable();
    hret = HAL_SPI_Transmit( &spi_hdl, addr, 1, CC_SPI_TIMEOUT );

    if ( HAL_OK == hret )
    {
        hret = HAL_SPI_Receive( &spi_hdl, data, size, CC_SPI_TIMEOUT );
    }

    if ( HAL_OK != hret )
    {
        ret = STATUS_ERROR;
    }

    cc_spi_cs_disable();

    return ret;
}

static status_t cc_write( uint8_t* addr, uint8_t* data, uint16_t size )
{
    status_t          ret  = STATUS_OK;
    HAL_StatusTypeDef hret = HAL_ERROR;

    cc_spi_cs_enable();
    hret = HAL_SPI_Transmit( &spi_hdl, addr, 1, CC_SPI_TIMEOUT );

    if (( STATUS_ERROR != ret ) && ( NULL != data ))
    {
        hret = HAL_SPI_Transmit( &spi_hdl, data, size, CC_SPI_TIMEOUT );
    }

    if ( HAL_OK != hret )
    {
        ret = STATUS_ERROR;
    }

    cc_spi_cs_disable();

    return ret;
}

static status_t cc_write_strobe( uint8_t strobe )
{
    status_t ret;

    strobe = CC_WRITE( strobe );
    ret = cc_write( &strobe, NULL, 0 );

    return ret;

}

static void cc_reset( void )
{
    cc_spi_cs_enable();
    bsp_wait( BSP_TIME_USEC, 10 );

    cc_spi_cs_disable();
    bsp_wait( BSP_TIME_USEC, 40 );

    cc_write_strobe( CC_CMD_SRES );
    bsp_wait( BSP_TIME_MSEC, 1 );
}

static uint8_t cc_read_register( uint8_t reg )
{
    uint8_t data = 0;

    reg = CC_READ( reg );
    cc_read( &reg, &data, 1 );

    return data;
}

static status_t cc_write_register( uint8_t reg, uint8_t data )
{
    status_t ret;

    reg = CC_WRITE( reg );
    ret = cc_write( &reg, &data, 1 );

    return ret;
}

static status_t cc_idle( void )
{
    status_t ret;
    uint8_t  marcstate = 0xFF; /* Set unknown/dummy value*/

    ret = cc_write_strobe( CC_CMD_SIDLE );

    while( marcstate != CC_STATE_IDLE )
    {
        marcstate = ( cc_read_register( CC_ST_REG_MARCSTATE ) & 0x1F );
    }

    return ret;
}

uint8_t cc_check_version( void )
{
    uint8_t ver = 0;

    ver = cc_read_register( CC_ST_REG_VERSION );

    return ver;
}

status_t cc_init( Cc_Modulation_t mode
                , Cc_Ism_Band_t   ism_band
                , Cc_Output_Pwr_t out_pwr
                , Cc_Rf_Channel_t rf_chan
                )
{
    status_t ret;
    uint8_t  ver = 0;
    uint8_t  res = 0;

    cc_gpio_init();

    ret = cc_spi_init( CC_SPI );

    if ( STATUS_ERROR != ret )
    {
        cc_reset();
        ver = cc_check_version();
    }

    if ( CC_CHIP_VER != ver )
    {
        ret = STATUS_ERROR;
    }

    if ( STATUS_ERROR != ret )
    {
        /* Flush Tx FIFO */
        cc_write_strobe( CC_CMD_SFTX );
        bsp_wait( BSP_TIME_MSEC, 1 );

        /* Flush Rx FIFO */
        cc_write_strobe( CC_CMD_SFRX );
        bsp_wait( BSP_TIME_MSEC, 1 );

        ret = cc_set_modulation_mode( mode );
    }

    if ( STATUS_ERROR != ret )
    {
        ret = cc_set_ism_band( ism_band );
    }

    if ( STATUS_ERROR != ret )
    {
        ret = cc_set_channel( rf_chan );
    }

    if ( STATUS_ERROR != ret )
    {
        ret = cc_set_output_power_level( out_pwr );
    }

    if ( STATUS_ERROR != ret )
    {
        ret = cc_idle();

        if ( STATUS_ERROR != ret )
        {
            res = cc_read_register( CC_ST_REG_MARCSTATE );
        }

        if ( 0x01 != res )
        {
            ret = STATUS_ERROR;
        }
        else
        {
            cc_set_carrier_freq( 433.98 );
        }
    }

    return ret;
}

status_t cc_write_data( uint8_t addr, uint8_t* data, uint8_t size )
{
    status_t ret;

    if ( size > 1 )
    {
        addr = CC_WRITE_BURST( addr );
    }
    else
    {
        addr = CC_WRITE( addr );
    }

    ret = cc_write( &addr, data, size );

    return ret;
}

status_t cc_set_modulation_mode( Cc_Modulation_t mode )
{
    status_t ret = STATUS_OK;
    uint8_t* cfg_reg;

    switch ( mode )
    {
        case CC_MOD_GFSK_1_2_KB:
            cfg_reg = cc1101_gfsk_1_2_kb;
            break;
        case CC_MOD_GFSK_38_4_KB:
            cfg_reg = cc1101_gfsk_38_4_kb;
            break;
        case CC_MOD_GFSK_100_KB:
            cfg_reg = cc1101_gfsk_100_kb;
            break;
        case CC_MOD_MSK_250_KB:
            cfg_reg = cc1101_msk_250_kb;
            break;
        case CC_MOD_MSK_500_KB:
            cfg_reg = cc1101_msk_500_kb;
            break;
        case CC_MOD_OOK_4_8_KB:
            cfg_reg = cc1100_OOK_4_8_kb;
            break;
        default:
            ret = STATUS_ERROR;
            break;
    }

    if ( STATUS_ERROR != ret )
    {
        ret = cc_write_data( CC_WRITE_BURST( CC_CFG_MODULATION_ADDR )
                           , cfg_reg
                           , CC_CFG_MODULATION_SIZE
                           );
    }

    return ret;
}

status_t cc_set_ism_band( Cc_Ism_Band_t ism_band )
{
    status_t ret   = STATUS_OK;
    uint8_t  freq0 = 0;
    uint8_t  freq1 = 0;
    uint8_t  freq2 = 0;
    uint8_t* patable;

    switch ( ism_band )
    {
        case CC_ISM_315_MHZ:
            freq2 = 0x0C;
            freq1 = 0x1D;
            freq0 = 0x89;
            patable = patable_power_315;
            break;
        case CC_ISM_434_MHZ: /* 433.92 MHz */
            freq2 = 0x10;
            freq1 = 0xB0;
            freq0 = 0x71;
            patable = patable_power_433;
            break;
        case CC_ISM_868_MHZ: /* 868.3 MHz */
            freq2 = 0x21;
            freq1 = 0x65;
            freq0 = 0x6A;
            patable = patable_power_868;
            break;
        case CC_ISM_915_MHZ:
            freq2 = 0x23;
            freq1 = 0x31;
            freq0 = 0x3B;
            patable = patable_power_915;
            break;
        default:
            ret = STATUS_ERROR;
            break;
    }

    if ( STATUS_ERROR != ret )
    {
        ret  = cc_write_register( CC_CFG_REG_FREQ2, freq2 );
        ret |= cc_write_register( CC_CFG_REG_FREQ1, freq1 );
        ret |= cc_write_register( CC_CFG_REG_FREQ0, freq0 );
        ret |= cc_write_data( CC_PATABLE_BURST
                            , patable
                            , CC_CFG_PATABLE_SIZE
                            );
    }

    return ret;
}

status_t cc_set_channel( uint8_t channel )
{
    status_t ret;

    ret = cc_write_register( CC_CFG_REG_CHANNR, channel );

    return ret;
}

status_t cc_set_output_power_level( int8_t dbm )
{
    status_t ret;
    uint8_t  pa = 0xC0;

    if ( dbm <= CC_OUTPUT_PWR_M30 )
    {
        pa = 0x00;
    }
    else if ( dbm <= CC_OUTPUT_PWR_M20)
    {
        pa = 0x01;
    }
    else if ( dbm <= CC_OUTPUT_PWR_M15 )
    {
        pa = 0x02;
    }
    else if ( dbm <= CC_OUTPUT_PWR_M10 )
    {
        pa = 0x03;
    }
    else if ( dbm <= CC_OUTPUT_PWR_0 )
    {
        pa = 0x04;
    }
    else if ( dbm <= CC_OUTPUT_PWR_P5 )
    {
        pa = 0x05;
    }
    else if ( dbm <= CC_OUTPUT_PWR_P7 )
    {
        pa = 0x06;
    }
    else if ( dbm <= CC_OUTPUT_PWR_P10 )
    {
        pa = 0x07;
    }

    ret = cc_write_register( CC_CFG_REG_FREND0 , pa );

    return ret;
}

float cc_set_carrier_freq( float target_freq )
{
    return 0.0;
}

void cc_task( void )
{
}

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

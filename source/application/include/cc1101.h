/**
 ** Name
 **   cc1101.h
 **
 ** Purpose
 **   CC1101 driver
 **
 ** Revision
 **   16-Jan-2021 (SSB) [] Initial
 **/

#ifndef __CC1100_H__
#define __CC1100_H__

#include "ptypes.h"

#include <stm32f1xx_hal.h>

#define CC_SPI SPI2

#define CC_CS_PIN  GPIO_PIN_12
#define CC_CS_PORT GPIOB

#define CC_CS_CLK_ENABLE() \
            do { __HAL_RCC_GPIOB_CLK_ENABLE(); } while(0)

#define CC_CHIP_VER (0x14)

/* R/W offsets */
#define CC_WRITE(addr)       (addr)
#define CC_WRITE_BURST(addr) (addr | 0x40)
#define CC_READ(addr)        (addr | 0x80)
#define CC_READ_BURST(addr)  (addr | 0xC0)

/* FIFO commands */
#define CC_PATABLE_BURST       (0x7E)
#define CC_PATABLE_SINGLE_BYTE (0xFE)
#define CC_TXFIFO_BURST        (0x7F)
#define CC_TXFIFO              (0x3F)
#define CC_RXFIFO_BURST        (0xFF)
#define CC_RXFIFO              (0xBF)

/* Data defines */
#define CC_FIFO_SIZE           (64)

/* Command strobes */
#define CC_CMD_SRES     0x30 /* Reset chip */
#define CC_CMD_SFSTXON  0x31 /* Enable/calibrate freq synthesizer */
#define CC_CMD_SXOFF    0x32 /* Turn off crystal oscillator */
#define CC_CMD_SCAL     0x33 /* Calibrate freq synthesizer & disable */
#define CC_CMD_SRX      0x34 /* Enable RX */
#define CC_CMD_STX      0x35 /* Enable TX */
#define CC_CMD_SIDLE    0x36 /* Exit RX / TX */
#define CC_CMD_SAFC     0x37 /* AFC adjustment of freq synthesizer */
#define CC_CMD_SWOR     0x38 /* Start automatic RX polling sequence */
#define CC_CMD_SPWD     0x39 /* Enter ppower down mode when CS goes high */
#define CC_CMD_SFRX     0x3A /* Flush the RX FIFO buffer */
#define CC_CMD_SFTX     0x3B /* Flush the TX FIFO buffer */
#define CC_CMD_SWORRST  0x3C /* Reset real time clock */
#define CC_CMD_SNOP     0x3D /* No operation */

/* Status register */
#define CC_ST_REG_PARTNUM        0xF0 /*  Part number */
#define CC_ST_REG_VERSION        0xF1 /*  Current version number */
#define CC_ST_REG_FREQEST        0xF2 /*  Frequency offset estimate */
#define CC_ST_REG_LQI            0xF3 /*  Demodulator estimate for link quality */
#define CC_ST_REG_RSSI           0xF4 /*  Received signal strength indication */
#define CC_ST_REG_MARCSTATE      0xF5 /*  Control state machine state */
#define CC_ST_REG_WORTIME1       0xF6 /*  High byte of WOR timer */
#define CC_ST_REG_WORTIME0       0xF7 /*  Low byte of WOR timer */
#define CC_ST_REG_PKTSTATUS      0xF8 /*  Current GDOx status and packet status */
#define CC_ST_REG_VCO_VC_DAC     0xF9 /*  Current setting from PLL cal module */
#define CC_ST_REG_TXBYTES        0xFA /*  Underflow and # of bytes in TXFIFO */
#define CC_ST_REG_RXBYTES        0xFB /*  Overflow and # of bytes in RXFIFO */
#define CC_ST_REG_RCCTRL1_STATUS 0xFC /* Last RC Oscillator Calibration Result */
#define CC_ST_REG_RCCTRL0_STATUS 0xFD /* Last RC Oscillator Calibration Result */

/* Config register */
#define CC_CFG_REG_IOCFG2   0x00 /* GDO2 output pin configuration */
#define CC_CFG_REG_IOCFG1   0x01 /* GDO1 output pin configuration */
#define CC_CFG_REG_IOCFG0   0x02 /* GDO0 output pin configuration */
#define CC_CFG_REG_FIFOTHR  0x03 /* RX FIFO and TX FIFO thresholds */
#define CC_CFG_REG_SYNC1    0x04 /* Sync word, high byte */
#define CC_CFG_REG_SYNC0    0x05 /* Sync word, low byte */
#define CC_CFG_REG_PKTLEN   0x06 /* Packet length */
#define CC_CFG_REG_PKTCTRL1 0x07 /* Packet automation control */
#define CC_CFG_REG_PKTCTRL0 0x08 /* Packet automation control */
#define CC_CFG_REG_ADDR     0x09 /* Device address */
#define CC_CFG_REG_CHANNR   0x0A /* Channel number */
#define CC_CFG_REG_FSCTRL1  0x0B /* Frequency synthesizer control */
#define CC_CFG_REG_FSCTRL0  0x0C /* Frequency synthesizer control */
#define CC_CFG_REG_FREQ2    0x0D /* Frequency control word, high byte */
#define CC_CFG_REG_FREQ1    0x0E /* Frequency control word, middle byte */
#define CC_CFG_REG_FREQ0    0x0F /* Frequency control word, low byte */
#define CC_CFG_REG_MDMCFG4  0x10 /* Modem configuration */
#define CC_CFG_REG_MDMCFG3  0x11 /* Modem configuration */
#define CC_CFG_REG_MDMCFG2  0x12 /* Modem configuration */
#define CC_CFG_REG_MDMCFG1  0x13 /* Modem configuration */
#define CC_CFG_REG_MDMCFG0  0x14 /* Modem configuration */
#define CC_CFG_REG_DEVIATN  0x15 /* Modem deviation setting */
#define CC_CFG_REG_MCSM2    0x16 /* Main Radio Cntrl State Machine config */
#define CC_CFG_REG_MCSM1    0x17 /* Main Radio Cntrl State Machine config */
#define CC_CFG_REG_MCSM0    0x18 /* Main Radio Cntrl State Machine config */
#define CC_CFG_REG_FOCCFG   0x19 /* Frequency Offset Compensation config */
#define CC_CFG_REG_BSCFG    0x1A /* Bit Synchronization configuration */
#define CC_CFG_REG_AGCCTRL2 0x1B /* AGC control */
#define CC_CFG_REG_AGCCTRL1 0x1C /* AGC control */
#define CC_CFG_REG_AGCCTRL0 0x1D /* AGC control */
#define CC_CFG_REG_WOREVT1  0x1E /* High byte Event 0 timeout */
#define CC_CFG_REG_WOREVT0  0x1F /* Low byte Event 0 timeout */
#define CC_CFG_REG_WORCTRL  0x20 /* Wake On Radio control */ */
#define CC_CFG_REG_FREND1   0x21 /* Front end RX configuration */
#define CC_CFG_REG_FREND0   0x22 /* Front end TX configuration */
#define CC_CFG_REG_FSCAL3   0x23 /* Frequency synthesizer calibration */
#define CC_CFG_REG_FSCAL2   0x24 /* Frequency synthesizer calibration */
#define CC_CFG_REG_FSCAL1   0x25 /* Frequency synthesizer calibration */
#define CC_CFG_REG_FSCAL0   0x26 /* Frequency synthesizer calibration */
#define CC_CFG_REG_RCCTRL1  0x27 /* RC oscillator configuration */
#define CC_CFG_REG_RCCTRL0  0x28 /* RC oscillator configuration */
#define CC_CFG_REG_FSTEST   0x29 /* Frequency synthesizer cal control */
#define CC_CFG_REG_PTEST    0x2A /* Production test */
#define CC_CFG_REG_AGCTEST  0x2B /* AGC test */
#define CC_CFG_REG_TEST2    0x2C /* Various test settings */
#define CC_CFG_REG_TEST1    0x2D /* Various test settings */
#define CC_CFG_REG_TEST0    0x2E /* Various test settings */

typedef enum
{
    CC_MOD_GFSK_1_2_KB = 0,
    CC_MOD_GFSK_38_4_KB,
    CC_MOD_GFSK_100_KB,
    CC_MOD_MSK_250_KB,
    CC_MOD_MSK_500_KB,
    CC_MOD_OOK_4_8_KB
} Cc_Modulation_t;

typedef enum
{
    CC_ISM_315_MHZ = 0,
    CC_ISM_434_MHZ,
    CC_ISM_868_MHZ,
    CC_ISM_915_MHZ,
} Cc_Ism_Band_t;

typedef enum
{
    CC_OUTPUT_PWR_M30 = -30,
    CC_OUTPUT_PWR_M20 = -20,
    CC_OUTPUT_PWR_M15 = -15,
    CC_OUTPUT_PWR_M10 = -10,
    CC_OUTPUT_PWR_0   =  0,
    CC_OUTPUT_PWR_P5  =  5,
    CC_OUTPUT_PWR_P7  =  7,
    CC_OUTPUT_PWR_P10 =  10
} Cc_Output_Pwr_t;

typedef enum
{
    CC_RF_CHANNEL_0 = 0
} Cc_Rf_Channel_t;

typedef enum
{
   CC_STATE_IDLE             = 0x01,
   CC_STATE_VCOON_MC         = 0x03,
   CC_STATE_REGON_MC         = 0x04,
   CC_STATE_MANCAL           = 0x05,
   CC_STATE_VCOON            = 0x06,
   CC_STATE_REGON            = 0x07,
   CC_STATE_STARTCAL         = 0x08,
   CC_STATE_BWBOOST          = 0x09,
   CC_STATE_FS_LOCK          = 0x0A,
   CC_STATE_IFADCON          = 0x0B,
   CC_STATE_ENDCAL           = 0x0C,
   CC_STATE_RX               = 0x0D,
   CC_STATE_RX_END           = 0x0E,
   CC_STATE_RX_RST           = 0x0F,
   CC_STATE_TXRX_SWITCH      = 0x10,
   CC_STATE_RXFIFO_OVERFLOW  = 0x11,
   CC_STATE_FSTXON           = 0x12,
   CC_STATE_TX               = 0x13,
   CC_STATE_TX_END           = 0x14,
   CC_STATE_RXTX_SWITCH      = 0x15,
   CC_STATE_TXFIFO_UNDERFLOW = 0x16
} Cc_State_t;

status_t cc_init( Cc_Modulation_t mode
                , Cc_Ism_Band_t   ism_band
                , Cc_Output_Pwr_t out_pwr
                , Cc_Rf_Channel_t rf_chan
                );
uint8_t cc_check_version( void );
status_t cc_read_data( uint8_t addr, uint8_t* data, uint8_t size );
status_t cc_write_data( uint8_t addr, uint8_t* data, uint8_t size );
status_t cc_set_modulation_mode( Cc_Modulation_t mode );
status_t cc_set_ism_band( Cc_Ism_Band_t ism_band );
status_t cc_set_channel( uint8_t channel );
status_t cc_set_output_power_level( int8_t dbm );
float cc_set_carrier_freq( float target_freq );
void cc_task( void );

#endif /* __CC1100_H__ */

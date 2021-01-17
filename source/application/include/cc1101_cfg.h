/**
 ** Name
 **   cc1101.h
 **
 ** Purpose
 **   CC1101 congifuration data
 **
 ** Revision
 **   21-Apr-2020 (SSB) [] Initial
 **/

#ifndef __CC1101_CFG_H__
#define __CC1101_CFG_H__

#include "ptypes.h"

#define CC_CFG_MODULATION_ADDR  (0)
#define CC_CFG_MODULATION_SIZE  (47)
#define CC_CFG_PATABLE_SIZE     (8)

/*
 * Registers presets for various frequencies.
 * These values are (suposed) optimal values for
 * -30, -20, -15, -10, 0, 5, 7, 10 dBm for each carrier frequency.
 */
static uint8_t patable_power_315[CC_CFG_PATABLE_SIZE] =
{
    0x17,
    0x1D,
    0x26,
    0x69,
    0x51,
    0x86,
    0xCC,
    0xC3
};

static uint8_t patable_power_433[CC_CFG_PATABLE_SIZE] =
{
    0x6C,
    0x1C,
    0x06,
    0x3A,
    0x51,
    0x85,
    0xC8,
    0xC0
};

static uint8_t patable_power_868[CC_CFG_PATABLE_SIZE] =
{
    0x03,
    0x17,
    0x1D,
    0x26,
    0x50,
    0x86,
    0xCD,
    0xC0
};

static uint8_t patable_power_915[CC_CFG_PATABLE_SIZE] =
{
    0x0B,
    0x1B,
    0x6D,
    0x67,
    0x50,
    0x85,
    0xC9,
    0xC1
};

static uint8_t cc1101_gfsk_1_2_kb[CC_CFG_MODULATION_SIZE] =
{
    0x07, /* IOCFG2   */
    0x2E, /* IOCFG1   */
    0x80, /* IOCFG0   */
    0x07, /* FIFOTHR  */
    0x57, /* SYNC1    */
    0x43, /* SYNC0    */
    0x3E, /* PKTLEN   */
    0xD8, /* PKTCTRL1 */
    0x45, /* PKTCTRL0 */
    0xFF, /* ADDR     */
    0x00, /* CHANNR   */
    0x08, /* FSCTRL1  */
    0x00, /* FSCTRL0  */
    0x21, /* FREQ2    */
    0x65, /* FREQ1    */
    0x6A, /* FREQ0    */
    0xF5, /* MDMCFG4  */
    0x83, /* MDMCFG3  */
    0x13, /* MDMCFG2  */
    0xC0, /* MDMCFG1  */
    0xF8, /* MDMCFG0  */
    0x15, /* DEVIATN  */
    0x07, /* MCSM2    */
    0x00, /* MCSM1    */
    0x18, /* MCSM0    */
    0x16, /* FOCCFG   */
    0x6C, /* BSCFG    */
    0x03, /* AGCCTRL2 */
    0x40, /* AGCCTRL1 */
    0x91, /* AGCCTRL0 */
    0x02, /* WOREVT1  */
    0x26, /* WOREVT0  */
    0x09, /* WORCTRL  */
    0x56, /* FREND1   */
    0x17, /* FREND0   */
    0xA9, /* FSCAL3   */
    0x0A, /* FSCAL2   */
    0x00, /* FSCAL1   */
    0x11, /* FSCAL0   */
    0x41, /* RCCTRL1  */
    0x00, /* RCCTRL0  */
    0x59, /* FSTEST   */
    0x7F, /* PTEST    */
    0x3F, /* AGCTEST  */
    0x81, /* TEST2    */
    0x3F, /* TEST1    */
    0x0B  /* TEST0    */
};

static uint8_t cc1101_gfsk_38_4_kb[CC_CFG_MODULATION_SIZE] =
{
    0x07, /* IOCFG2   */
    0x2E, /* IOCFG1   */
    0x80, /* IOCFG0   */
    0x07, /* FIFOTHR  */
    0x57, /* SYNC1    */
    0x43, /* SYNC0    */
    0x3E, /* PKTLEN   */
    0xDC, /* PKTCTRL1 */
    0x45, /* PKTCTRL0 */
    0xFF, /* ADDR     */
    0x00, /* CHANNR   */
    0x06, /* FSCTRL1  */
    0x00, /* FSCTRL0  */
    0x21, /* FREQ2    */
    0x65, /* FREQ1    */
    0x6A, /* FREQ0    */
    0xCA, /* MDMCFG4  */
    0x83, /* MDMCFG3  */
    0x13, /* MDMCFG2  */
    0xA0, /* MDMCFG1  */
    0xF8, /* MDMCFG0  */
    0x34, /* DEVIATN  */
    0x07, /* MCSM2    */
    0x0C, /* MCSM1    */
    0x18, /* MCSM0    */
    0x16, /* FOCCFG   */
    0x6C, /* BSCFG    */
    0x43, /* AGCCTRL2 */
    0x40, /* AGCCTRL1 */
    0x91, /* AGCCTRL0 */
    0x02, /* WOREVT1  */
    0x26, /* WOREVT0  */
    0x09, /* WORCTRL  */
    0x56, /* FREND1   */
    0x17, /* FREND0   */
    0xA9, /* FSCAL3   */
    0x0A, /* FSCAL2   */
    0x00, /* FSCAL1   */
    0x11, /* FSCAL0   */
    0x41, /* RCCTRL1  */
    0x00, /* RCCTRL0  */
    0x59, /* FSTEST   */
    0x7F, /* PTEST    */
    0x3F, /* AGCTEST  */
    0x81, /* TEST2    */
    0x3F, /* TEST1    */
    0x0B  /* TEST0    */
};

static uint8_t cc1101_gfsk_100_kb[CC_CFG_MODULATION_SIZE] =
{
    0x07, /* IOCFG2   */
    0x2E, /* IOCFG1   */
    0x80, /* IOCFG0   */
    0x07, /* FIFOTHR  */
    0x57, /* SYNC1    */
    0x43, /* SYNC0    */
    0x3E, /* PKTLEN   */
    0xDC, /* PKTCTRL1 */
    0x45, /* PKTCTRL0 */
    0xFF, /* ADDR     */
    0x00, /* CHANNR   */
    0x08, /* FSCTRL1  */
    0x00, /* FSCTRL0  */
    0x21, /* FREQ2    */
    0x65, /* FREQ1    */
    0x6A, /* FREQ0    */
    0x5B, /* MDMCFG4  */
    0xF8, /* MDMCFG3  */
    0x13, /* MDMCFG2  */
    0xA0, /* MDMCFG1  */
    0xF8, /* MDMCFG0  */
    0x47, /* DEVIATN  */
    0x07, /* MCSM2    */
    0x0C, /* MCSM1    */
    0x18, /* MCSM0    */
    0x1D, /* FOCCFG   */
    0x1C, /* BSCFG    */
    0xC7, /* AGCCTRL2 */
    0x00, /* AGCCTRL1 */
    0xB2, /* AGCCTRL0 */
    0x02, /* WOREVT1  */
    0x26, /* WOREVT0  */
    0x09, /* WORCTRL  */
    0xB6, /* FREND1   */
    0x17, /* FREND0   */
    0xEA, /* FSCAL3   */
    0x0A, /* FSCAL2   */
    0x00, /* FSCAL1   */
    0x11, /* FSCAL0   */
    0x41, /* RCCTRL1  */
    0x00, /* RCCTRL0  */
    0x59, /* FSTEST   */
    0x7F, /* PTEST    */
    0x3F, /* AGCTEST  */
    0x81, /* TEST2    */
    0x3F, /* TEST1    */
    0x0B  /* TEST0    */
};

static uint8_t cc1101_msk_250_kb[CC_CFG_MODULATION_SIZE] =
{
    0x07, /* IOCFG2   */
    0x2E, /* IOCFG1   */
    0x80, /* IOCFG0   */
    0x07, /* FIFOTHR  */
    0x57, /* SYNC1    */
    0x43, /* SYNC0    */
    0x3E, /* PKTLEN   */
    0xDC, /* PKTCTRL1 */
    0x45, /* PKTCTRL0 */
    0xFF, /* ADDR     */
    0x00, /* CHANNR   */
    0x0B, /* FSCTRL1  */
    0x00, /* FSCTRL0  */
    0x21, /* FREQ2    */
    0x65, /* FREQ1    */
    0x6A, /* FREQ0    */
    0x2D, /* MDMCFG4  */
    0x3B, /* MDMCFG3  */
    0x73, /* MDMCFG2  */
    0xA0, /* MDMCFG1  */
    0xF8, /* MDMCFG0  */
    0x00, /* DEVIATN  */
    0x07, /* MCSM2    */
    0x0C, /* MCSM1    */
    0x18, /* MCSM0    */
    0x1D, /* FOCCFG   */
    0x1C, /* BSCFG    */
    0xC7, /* AGCCTRL2 */
    0x00, /* AGCCTRL1 */
    0xB2, /* AGCCTRL0 */
    0x02, /* WOREVT1  */
    0x26, /* WOREVT0  */
    0x09, /* WORCTRL  */
    0xB6, /* FREND1   */
    0x17, /* FREND0   */
    0xEA, /* FSCAL3   */
    0x0A, /* FSCAL2   */
    0x00, /* FSCAL1   */
    0x11, /* FSCAL0   */
    0x41, /* RCCTRL1  */
    0x00, /* RCCTRL0  */
    0x59, /* FSTEST   */
    0x7F, /* PTEST    */
    0x3F, /* AGCTEST  */
    0x81, /* TEST2    */
    0x3F, /* TEST1    */
    0x0B  /* TEST0    */
};

static uint8_t cc1101_msk_500_kb[CC_CFG_MODULATION_SIZE] =
{
    0x07, /* IOCFG2   */
    0x2E, /* IOCFG1   */
    0x80, /* IOCFG0   */
    0x07, /* FIFOTHR  */
    0x57, /* SYNC1    */
    0x43, /* SYNC0    */
    0x3E, /* PKTLEN   */
    0xDC, /* PKTCTRL1 */
    0x45, /* PKTCTRL0 */
    0xFF, /* ADDR     */
    0x00, /* CHANNR   */
    0x0C, /* FSCTRL1  */
    0x00, /* FSCTRL0  */
    0x21, /* FREQ2    */
    0x65, /* FREQ1    */
    0x6A, /* FREQ0    */
    0x0E, /* MDMCFG4  */
    0x3B, /* MDMCFG3  */
    0x73, /* MDMCFG2  */
    0xA0, /* MDMCFG1  */
    0xF8, /* MDMCFG0  */
    0x00, /* DEVIATN  */
    0x07, /* MCSM2    */
    0x0C, /* MCSM1    */
    0x18, /* MCSM0    */
    0x1D, /* FOCCFG   */
    0x1C, /* BSCFG    */
    0xC7, /* AGCCTRL2 */
    0x40, /* AGCCTRL1 */
    0xB2, /* AGCCTRL0 */
    0x02, /* WOREVT1  */
    0x26, /* WOREVT0  */
    0x09, /* WORCTRL  */
    0xB6, /* FREND1   */
    0x17, /* FREND0   */
    0xEA, /* FSCAL3   */
    0x0A, /* FSCAL2   */
    0x00, /* FSCAL1   */
    0x19, /* FSCAL0   */
    0x41, /* RCCTRL1  */
    0x00, /* RCCTRL0  */
    0x59, /* FSTEST   */
    0x7F, /* PTEST    */
    0x3F, /* AGCTEST  */
    0x81, /* TEST2    */
    0x3F, /* TEST1    */
    0x0B  /* TEST0    */
};

static uint8_t cc1100_OOK_4_8_kb[CC_CFG_MODULATION_SIZE] =
{
    0x02, /* IOCFG2   */
    0x2E, /* IOCFG1   */
    0x06, /* IOCFG0   */
    0x48, /* FIFOTHR  */
    0x57, /* SYNC1    */
    0x43, /* SYNC0    */
    0xFF, /* PKTLEN   */
    0xDC, /* PKTCTRL1 */
    0x05, /* PKTCTRL0 */
    0x00, /* ADDR     */
    0x00, /* CHANNR   */
    0x06, /* FSCTRL1  */
    0x00, /* FSCTRL0  */
    0x21, /* FREQ2    */
    0x65, /* FREQ1    */
    0x6A, /* FREQ0    */
    0x87, /* MDMCFG4  */
    0x83, /* MDMCFG3  */
    0x3B, /* MDMCFG2  */
    0x22, /* MDMCFG1  */
    0xF8, /* MDMCFG0  */
    0x15, /* DEVIATN  */
    0x07, /* MCSM2    */
    0x30, /* MCSM1    */
    0x18, /* MCSM0    */
    0x14, /* FOCCFG   */
    0x6C, /* BSCFG    */
    0x07, /* AGCCTRL2 */
    0x00, /* AGCCTRL1 */
    0x92, /* AGCCTRL0 */
    0x87, /* WOREVT1  */
    0x6B, /* WOREVT0  */
    0xFB, /* WORCTRL  */
    0x56, /* FREND1   */
    0x17, /* FREND0   */
    0xE9, /* FSCAL3   */
    0x2A, /* FSCAL2   */
    0x00, /* FSCAL1   */
    0x1F, /* FSCAL0   */
    0x41, /* RCCTRL1  */
    0x00, /* RCCTRL0  */
    0x59, /* FSTEST   */
    0x7F, /* PTEST    */
    0x3F, /* AGCTEST  */
    0x81, /* TEST2    */
    0x35, /* TEST1    */
    0x09, /* TEST0    */
};

#endif /* __CC1101_CFG_H__ */

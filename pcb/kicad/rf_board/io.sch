EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J?
U 1 1 607F8E27
P 2200 2650
AR Path="/607F8E27" Ref="J?"  Part="1" 
AR Path="/607E9420/607F8E27" Ref="J2"  Part="1" 
F 0 "J2" H 2250 3167 50  0000 C CNN
F 1 "B2B_B" H 2250 3076 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x07_P2.54mm_Vertical" H 2200 2650 50  0001 C CNN
F 3 "~" H 2200 2650 50  0001 C CNN
	1    2200 2650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 607F8E2D
P 1800 1950
AR Path="/607F8E2D" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8E2D" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 1800 1700 50  0001 C CNN
F 1 "GND" H 1805 1777 50  0000 C CNN
F 2 "" H 1800 1950 50  0001 C CNN
F 3 "" H 1800 1950 50  0001 C CNN
	1    1800 1950
	1    0    0    -1  
$EndComp
Text GLabel 1700 2350 0    50   Input ~ 0
UART1_TX
Text GLabel 2600 2350 2    50   Input ~ 0
UART1_RX
Text GLabel 1700 2550 0    50   Input ~ 0
UART2_TX
$Comp
L power:GND #PWR?
U 1 1 607F8E36
P 2600 2650
AR Path="/607F8E36" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8E36" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 2600 2400 50  0001 C CNN
F 1 "GND" V 2605 2522 50  0000 R CNN
F 2 "" H 2600 2650 50  0001 C CNN
F 3 "" H 2600 2650 50  0001 C CNN
	1    2600 2650
	0    -1   1    0   
$EndComp
Text GLabel 2600 2550 2    50   Input ~ 0
UART2_RX
$Comp
L power:GND #PWR?
U 1 1 607F8E3D
P 1700 2650
AR Path="/607F8E3D" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8E3D" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 1700 2400 50  0001 C CNN
F 1 "GND" V 1705 2522 50  0000 R CNN
F 2 "" H 1700 2650 50  0001 C CNN
F 3 "" H 1700 2650 50  0001 C CNN
	1    1700 2650
	0    1    -1   0   
$EndComp
Text GLabel 1700 2950 0    50   Input ~ 0
IO1
Text GLabel 2600 2950 2    50   Input ~ 0
IO2
Text GLabel 1700 1650 0    50   Input ~ 0
HW_ADDR1
Text GLabel 2600 1650 2    50   Input ~ 0
HW_ADDR2
Text GLabel 2600 1750 2    50   Input ~ 0
HW_ADDR4
$Comp
L power:+3V3 #PWR?
U 1 1 607F8E48
P 2550 1150
AR Path="/607F8E48" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8E48" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 2550 1000 50  0001 C CNN
F 1 "+3V3" H 2565 1323 50  0000 C CNN
F 2 "" H 2550 1150 50  0001 C CNN
F 3 "" H 2550 1150 50  0001 C CNN
	1    2550 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 607F8E4E
P 1700 1450
AR Path="/607F8E4E" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8E4E" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 1700 1300 50  0001 C CNN
F 1 "+12V" H 1715 1623 50  0000 C CNN
F 2 "" H 1700 1450 50  0001 C CNN
F 3 "" H 1700 1450 50  0001 C CNN
	1    1700 1450
	0    -1   -1   0   
$EndComp
Text GLabel 4100 1550 0    50   Input ~ 0
HW_ADDR1
Text GLabel 4100 1650 0    50   Input ~ 0
HW_ADDR2
Text GLabel 4100 1750 0    50   Input ~ 0
HW_ADDR3
Text GLabel 4100 1850 0    50   Input ~ 0
HW_ADDR4
$Comp
L power:+3V3 #PWR?
U 1 1 607F8E58
P 5100 1050
AR Path="/607F8E58" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8E58" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 5100 900 50  0001 C CNN
F 1 "+3V3" H 5115 1223 50  0000 C CNN
F 2 "" H 5100 1050 50  0001 C CNN
F 3 "" H 5100 1050 50  0001 C CNN
	1    5100 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 607F8E5E
P 4600 1550
AR Path="/607F8E5E" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8E5E" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 4600 1300 50  0001 C CNN
F 1 "GND" H 4605 1377 50  0000 C CNN
F 2 "" H 4600 1550 50  0001 C CNN
F 3 "" H 4600 1550 50  0001 C CNN
	1    4600 1550
	0    -1   -1   0   
$EndComp
Text GLabel 4100 2650 0    50   Input ~ 0
UART2_TX
Text GLabel 4100 2750 0    50   Input ~ 0
UART2_RX
$Comp
L power:GND #PWR?
U 1 1 607F8E85
P 4100 2950
AR Path="/607F8E85" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8E85" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 4100 2700 50  0001 C CNN
F 1 "GND" H 4105 2777 50  0000 C CNN
F 2 "" H 4100 2950 50  0001 C CNN
F 3 "" H 4100 2950 50  0001 C CNN
	1    4100 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 607F8E8B
P 4550 2750
AR Path="/607F8E8B" Ref="J?"  Part="1" 
AR Path="/607E9420/607F8E8B" Ref="J3"  Part="1" 
F 0 "J3" H 4522 2774 50  0000 R CNN
F 1 "UART_DBG" H 4522 2683 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 4550 2750 50  0001 C CNN
F 3 "~" H 4550 2750 50  0001 C CNN
	1    4550 2750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4100 2950 4100 2850
Wire Wire Line
	4100 2850 4350 2850
Wire Wire Line
	4350 2750 4100 2750
Wire Wire Line
	4100 2650 4350 2650
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J?
U 1 1 607F8E95
P 2200 1550
AR Path="/607F8E95" Ref="J?"  Part="1" 
AR Path="/607E9420/607F8E95" Ref="J1"  Part="1" 
F 0 "J1" H 2250 2067 50  0000 C CNN
F 1 "B2B_A" H 2250 1976 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x07_P2.54mm_Vertical" H 2200 1550 50  0001 C CNN
F 3 "~" H 2200 1550 50  0001 C CNN
	1    2200 1550
	-1   0    0    1   
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 607F8E9B
P 1750 1150
AR Path="/607F8E9B" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8E9B" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 1750 1000 50  0001 C CNN
F 1 "+3V3" H 1765 1323 50  0000 C CNN
F 2 "" H 1750 1150 50  0001 C CNN
F 3 "" H 1750 1150 50  0001 C CNN
	1    1750 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 607F8EA1
P 2500 1950
AR Path="/607F8EA1" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8EA1" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 2500 1700 50  0001 C CNN
F 1 "GND" H 2505 1777 50  0000 C CNN
F 2 "" H 2500 1950 50  0001 C CNN
F 3 "" H 2500 1950 50  0001 C CNN
	1    2500 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1850 1900 1850
Wire Wire Line
	2400 1850 2500 1850
Text GLabel 1700 1750 0    50   Input ~ 0
HW_ADDR3
$Comp
L power:+12V #PWR?
U 1 1 607F8EAA
P 2600 1450
AR Path="/607F8EAA" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8EAA" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 2600 1300 50  0001 C CNN
F 1 "+12V" H 2615 1623 50  0000 C CNN
F 2 "" H 2600 1450 50  0001 C CNN
F 3 "" H 2600 1450 50  0001 C CNN
	1    2600 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 1150 1750 1250
Wire Wire Line
	1750 1250 1900 1250
Wire Wire Line
	2550 1250 2550 1150
Wire Wire Line
	2400 1250 2550 1250
Wire Wire Line
	2500 1850 2500 1950
Wire Wire Line
	1800 1950 1800 1850
Wire Wire Line
	2400 1450 2500 1450
$Comp
L power:+5V #PWR?
U 1 1 607F8EB9
P 2700 1250
AR Path="/607F8EB9" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8EB9" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 2700 1100 50  0001 C CNN
F 1 "+5V" H 2715 1423 50  0000 C CNN
F 2 "" H 2700 1250 50  0001 C CNN
F 3 "" H 2700 1250 50  0001 C CNN
	1    2700 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1350 2700 1350
Wire Wire Line
	2700 1350 2700 1250
$Comp
L power:+5V #PWR?
U 1 1 607F8EC1
P 1600 1200
AR Path="/607F8EC1" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/607F8EC1" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 1600 1050 50  0001 C CNN
F 1 "+5V" H 1615 1373 50  0000 C CNN
F 2 "" H 1600 1200 50  0001 C CNN
F 3 "" H 1600 1200 50  0001 C CNN
	1    1600 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1200 1600 1350
Wire Wire Line
	1600 1350 1900 1350
Text GLabel 1700 2450 0    50   Input ~ 0
I2C_SCK
Text GLabel 2600 2450 2    50   Input ~ 0
I2C_SDA
Text GLabel 1700 2850 0    50   Input ~ 0
SPI_MISO
Text GLabel 1700 2750 0    50   Input ~ 0
SPI_CS
Text GLabel 2600 2850 2    50   Input ~ 0
SPI_MOSI
Text GLabel 2600 2750 2    50   Input ~ 0
SPI_CLK
Wire Wire Line
	1700 1450 1800 1450
Wire Wire Line
	1900 1550 1800 1550
Wire Wire Line
	1800 1550 1800 1450
Connection ~ 1800 1450
Wire Wire Line
	1800 1450 1900 1450
Wire Wire Line
	2400 1550 2500 1550
Wire Wire Line
	2500 1550 2500 1450
Connection ~ 2500 1450
Wire Wire Line
	2500 1450 2600 1450
Wire Wire Line
	1700 1650 1900 1650
Wire Wire Line
	2400 1650 2600 1650
Wire Wire Line
	1700 1750 1900 1750
Wire Wire Line
	2400 1750 2600 1750
Wire Wire Line
	1700 2350 1900 2350
Wire Wire Line
	2400 2350 2600 2350
Wire Wire Line
	2400 2450 2600 2450
Wire Wire Line
	2400 2550 2600 2550
Wire Wire Line
	2400 2650 2600 2650
Wire Wire Line
	2400 2750 2600 2750
Wire Wire Line
	2400 2850 2600 2850
Wire Wire Line
	2400 2950 2600 2950
Wire Wire Line
	1700 2450 1900 2450
Wire Wire Line
	1700 2550 1900 2550
Wire Wire Line
	1700 2650 1900 2650
Wire Wire Line
	1700 2750 1900 2750
Wire Wire Line
	1700 2850 1900 2850
Wire Wire Line
	1700 2950 1900 2950
$Comp
L TCA6416APWR:TCA6416APWR U?
U 1 1 607F8EF1
P 7800 2250
AR Path="/607F8EF1" Ref="U?"  Part="1" 
AR Path="/607E9420/607F8EF1" Ref="U3"  Part="1" 
F 0 "U3" H 7800 3420 50  0000 C CNN
F 1 "TCA6416APWR" H 7800 3329 50  0000 C CNN
F 2 "TCA6416APWR:SOP65P640X120-24N" H 7800 2250 50  0001 L BNN
F 3 "" H 7800 2250 50  0001 L BNN
	1    7800 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08 RN?
U 1 1 607F8EF7
P 5500 1350
AR Path="/607F8EF7" Ref="RN?"  Part="1" 
AR Path="/607E9420/607F8EF7" Ref="RN1"  Part="1" 
F 0 "RN1" H 5888 1396 50  0000 L CNN
F 1 "R_Network08" H 5888 1305 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5975 1350 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5500 1350 50  0001 C CNN
	1    5500 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1050 5100 1150
Wire Wire Line
	5100 1650 5100 1550
Wire Wire Line
	4100 1650 5100 1650
Wire Wire Line
	5200 1750 5200 1550
Wire Wire Line
	4100 1750 5200 1750
Wire Wire Line
	5300 1850 5300 1550
Wire Wire Line
	4100 1850 5300 1850
Wire Wire Line
	7100 1650 5800 1650
Wire Wire Line
	5800 1650 5800 1550
$Comp
L power:GND #PWR?
U 1 1 608139E4
P 6450 1750
AR Path="/608139E4" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/608139E4" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 6450 1500 50  0001 C CNN
F 1 "GND" H 6455 1577 50  0000 C CNN
F 2 "" H 6450 1750 50  0001 C CNN
F 3 "" H 6450 1750 50  0001 C CNN
	1    6450 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 2050 5700 2050
Wire Wire Line
	5700 2050 5700 1550
Wire Wire Line
	7100 2150 5800 2150
Wire Wire Line
	5600 2150 5600 1550
Wire Wire Line
	7100 2250 5900 2250
Wire Wire Line
	5500 2250 5500 1550
Wire Wire Line
	7100 2350 6000 2350
Wire Wire Line
	5400 2350 5400 1550
$Comp
L power:+3V3 #PWR?
U 1 1 60819DD1
P 8700 1150
AR Path="/60819DD1" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/60819DD1" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 8700 1000 50  0001 C CNN
F 1 "+3V3" H 8715 1323 50  0000 C CNN
F 2 "" H 8700 1150 50  0001 C CNN
F 3 "" H 8700 1150 50  0001 C CNN
	1    8700 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 1350 8700 1350
Wire Wire Line
	8700 1350 8700 1150
Wire Wire Line
	8500 1450 8700 1450
Wire Wire Line
	8700 1450 8700 1350
Connection ~ 8700 1350
$Comp
L Device:C C9
U 1 1 6081D122
P 9000 1600
F 0 "C9" H 8750 1650 50  0000 L CNN
F 1 "100nF" H 8650 1550 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 9038 1450 50  0001 C CNN
F 3 "~" H 9000 1600 50  0001 C CNN
	1    9000 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 6081D4FC
P 9300 1600
F 0 "C10" H 9415 1646 50  0000 L CNN
F 1 "100nF" H 9415 1555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 9338 1450 50  0001 C CNN
F 3 "~" H 9300 1600 50  0001 C CNN
	1    9300 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1350 9000 1350
Wire Wire Line
	9300 1350 9300 1450
Wire Wire Line
	9000 1450 9000 1350
Connection ~ 9000 1350
Wire Wire Line
	9000 1350 9300 1350
Wire Wire Line
	9000 1750 9000 1850
Wire Wire Line
	9000 1850 9150 1850
Wire Wire Line
	9300 1850 9300 1750
$Comp
L power:GND #PWR?
U 1 1 60821FBD
P 9150 1950
AR Path="/60821FBD" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/60821FBD" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 9150 1700 50  0001 C CNN
F 1 "GND" H 9155 1777 50  0000 C CNN
F 2 "" H 9150 1950 50  0001 C CNN
F 3 "" H 9150 1950 50  0001 C CNN
	1    9150 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 1950 9150 1850
Connection ~ 9150 1850
Wire Wire Line
	9150 1850 9300 1850
$Comp
L power:GND #PWR?
U 1 1 60823E87
P 8700 3150
AR Path="/60823E87" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/60823E87" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 8700 2900 50  0001 C CNN
F 1 "GND" H 8705 2977 50  0000 C CNN
F 2 "" H 8700 3150 50  0001 C CNN
F 3 "" H 8700 3150 50  0001 C CNN
	1    8700 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3050 8700 3050
Wire Wire Line
	8700 3050 8700 3150
$Comp
L Switch:SW_DIP_x04 SW1
U 1 1 60826974
P 5900 2850
F 0 "SW1" V 5946 2620 50  0000 R CNN
F 1 "SW_DIP_x04" V 5855 2620 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5900 2850 50  0001 C CNN
F 3 "~" H 5900 2850 50  0001 C CNN
	1    5900 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5700 2550 5700 2050
Connection ~ 5700 2050
Wire Wire Line
	5800 2550 5800 2150
Connection ~ 5800 2150
Wire Wire Line
	5800 2150 5600 2150
Wire Wire Line
	5900 2550 5900 2250
Connection ~ 5900 2250
Wire Wire Line
	5900 2250 5500 2250
Wire Wire Line
	6000 2550 6000 2350
Connection ~ 6000 2350
Wire Wire Line
	6000 2350 5400 2350
$Comp
L power:GND #PWR?
U 1 1 6082F729
P 5850 3350
AR Path="/6082F729" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/6082F729" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 5850 3100 50  0001 C CNN
F 1 "GND" H 5855 3177 50  0000 C CNN
F 2 "" H 5850 3350 50  0001 C CNN
F 3 "" H 5850 3350 50  0001 C CNN
	1    5850 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3150 5700 3250
Wire Wire Line
	5700 3250 5800 3250
Wire Wire Line
	6000 3250 6000 3150
Wire Wire Line
	5900 3150 5900 3250
Connection ~ 5900 3250
Wire Wire Line
	5900 3250 6000 3250
Wire Wire Line
	5800 3150 5800 3250
Connection ~ 5800 3250
Wire Wire Line
	5800 3250 5850 3250
Wire Wire Line
	5850 3350 5850 3250
Connection ~ 5850 3250
Wire Wire Line
	5850 3250 5900 3250
$Comp
L Interface_USB:MCP2200-I-SS U2
U 1 1 60841F13
P 3400 6100
F 0 "U2" H 3400 5211 50  0000 C CNN
F 1 "MCP2200-I-SS" H 3400 5120 50  0000 C CNN
F 2 "Package_SO:SSOP-20_5.3x7.2mm_P0.65mm" H 3400 4950 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/200022228D.pdf" H 3400 5100 50  0001 C CNN
	1    3400 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal XTAL2
U 1 1 60843F22
P 5000 6550
F 0 "XTAL2" V 4954 6681 50  0000 L CNN
F 1 "12MHz" V 5045 6681 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 5000 6550 50  0001 C CNN
F 3 "~" H 5000 6550 50  0001 C CNN
	1    5000 6550
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 6500 4400 6500
Wire Wire Line
	4400 6500 4400 6350
Wire Wire Line
	4300 6700 4400 6700
Wire Wire Line
	4400 6700 4400 6850
$Comp
L Device:C C7
U 1 1 6084AB8F
P 5150 6200
F 0 "C7" V 4898 6200 50  0000 C CNN
F 1 "22pF" V 4989 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 5188 6050 50  0001 C CNN
F 3 "~" H 5150 6200 50  0001 C CNN
	1    5150 6200
	0    1    1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 6084E1C3
P 5150 6900
F 0 "C8" V 5400 6900 50  0000 C CNN
F 1 "22pF" V 5300 6900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 5188 6750 50  0001 C CNN
F 3 "~" H 5150 6900 50  0001 C CNN
	1    5150 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 6200 5450 6200
Wire Wire Line
	5450 6200 5450 6550
Wire Wire Line
	5450 6900 5300 6900
$Comp
L power:GND #PWR023
U 1 1 6085492C
P 5600 6550
F 0 "#PWR023" H 5600 6300 50  0001 C CNN
F 1 "GND" V 5605 6422 50  0000 R CNN
F 2 "" H 5600 6550 50  0001 C CNN
F 3 "" H 5600 6550 50  0001 C CNN
	1    5600 6550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5450 6550 5600 6550
Connection ~ 5450 6550
Wire Wire Line
	5450 6550 5450 6900
$Comp
L power:GND #PWR018
U 1 1 6085D0CD
P 3400 7150
F 0 "#PWR018" H 3400 6900 50  0001 C CNN
F 1 "GND" H 3405 6977 50  0000 C CNN
F 2 "" H 3400 7150 50  0001 C CNN
F 3 "" H 3400 7150 50  0001 C CNN
	1    3400 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 7150 3400 6900
$Comp
L Device:C C6
U 1 1 60860B33
P 3750 5050
F 0 "C6" V 4002 5050 50  0000 C CNN
F 1 "100nF" V 3911 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 3788 4900 50  0001 C CNN
F 3 "~" H 3750 5050 50  0001 C CNN
	1    3750 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 5300 3500 5050
Wire Wire Line
	3500 5050 3600 5050
$Comp
L power:GND #PWR?
U 1 1 6086490D
P 4000 5150
AR Path="/6086490D" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/6086490D" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 4000 4900 50  0001 C CNN
F 1 "GND" H 4005 4977 50  0000 C CNN
F 2 "" H 4000 5150 50  0001 C CNN
F 3 "" H 4000 5150 50  0001 C CNN
	1    4000 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5050 4000 5050
Wire Wire Line
	4000 5050 4000 5150
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 6086C47B
P 2800 4850
F 0 "JP1" H 2800 5054 50  0000 C CNN
F 1 "MCP2200_POWER" H 2800 4963 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_Pad1.0x1.5mm" H 2800 4850 50  0001 C CNN
F 3 "~" H 2800 4850 50  0001 C CNN
	1    2800 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 5000 2800 5050
Wire Wire Line
	2800 5150 3300 5150
Wire Wire Line
	3300 5150 3300 5300
$Comp
L power:+3V3 #PWR010
U 1 1 60871CF0
P 2250 4700
F 0 "#PWR010" H 2250 4550 50  0001 C CNN
F 1 "+3V3" H 2265 4873 50  0000 C CNN
F 2 "" H 2250 4700 50  0001 C CNN
F 3 "" H 2250 4700 50  0001 C CNN
	1    2250 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+3V8 #PWR017
U 1 1 60875CD7
P 3300 4700
F 0 "#PWR017" H 3300 4550 50  0001 C CNN
F 1 "+3V8" H 3315 4873 50  0000 C CNN
F 2 "" H 3300 4700 50  0001 C CNN
F 3 "" H 3300 4700 50  0001 C CNN
	1    3300 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4850 3300 4850
Wire Wire Line
	3300 4700 3300 4850
$Comp
L Device:C C5
U 1 1 6087D913
P 2500 5150
F 0 "C5" V 2752 5150 50  0000 C CNN
F 1 "100nF" V 2661 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 2538 5000 50  0001 C CNN
F 3 "~" H 2500 5150 50  0001 C CNN
	1    2500 5150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 5150 2800 5150
Connection ~ 2800 5150
$Comp
L power:GND #PWR?
U 1 1 60881876
P 2250 5200
AR Path="/60881876" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/60881876" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 2250 4950 50  0001 C CNN
F 1 "GND" H 2255 5027 50  0000 C CNN
F 2 "" H 2250 5200 50  0001 C CNN
F 3 "" H 2250 5200 50  0001 C CNN
	1    2250 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 5150 2250 5150
Wire Wire Line
	2250 5150 2250 5200
Wire Wire Line
	2250 4850 2250 4700
Wire Wire Line
	2250 4850 2550 4850
$Comp
L Device:R R6
U 1 1 6088A52E
P 1850 5250
F 0 "R6" H 1920 5296 50  0000 L CNN
F 1 "10K" H 1920 5205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1780 5250 50  0001 C CNN
F 3 "~" H 1850 5250 50  0001 C CNN
	1    1850 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5500 1850 5500
Wire Wire Line
	2800 5050 1850 5050
Wire Wire Line
	1850 5050 1850 5100
Connection ~ 2800 5050
Wire Wire Line
	2800 5050 2800 5150
Wire Wire Line
	1850 5400 1850 5500
$Comp
L Device:C C4
U 1 1 60897712
P 1600 5500
F 0 "C4" V 1852 5500 50  0000 C CNN
F 1 "100nF" V 1761 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 1638 5350 50  0001 C CNN
F 3 "~" H 1600 5500 50  0001 C CNN
	1    1600 5500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1750 5500 1850 5500
Connection ~ 1850 5500
$Comp
L power:GND #PWR?
U 1 1 6089BF24
P 1300 5500
AR Path="/6089BF24" Ref="#PWR?"  Part="1" 
AR Path="/607E9420/6089BF24" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 1300 5250 50  0001 C CNN
F 1 "GND" H 1305 5327 50  0000 C CNN
F 2 "" H 1300 5500 50  0001 C CNN
F 3 "" H 1300 5500 50  0001 C CNN
	1    1300 5500
	0    1    1    0   
$EndComp
Text GLabel 2100 5600 0    50   Input ~ 0
UART2_TX
Wire Wire Line
	1300 5500 1450 5500
Wire Wire Line
	2100 5600 2300 5600
Text GLabel 2100 5700 0    50   Input ~ 0
UART2_RX
Wire Wire Line
	2100 5700 2500 5700
$Comp
L Device:R R3
U 1 1 608B9F2C
P 1300 5850
F 0 "R3" V 1507 5850 50  0000 C CNN
F 1 "33K" V 1416 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1230 5850 50  0001 C CNN
F 3 "~" H 1300 5850 50  0001 C CNN
	1    1300 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1450 5850 2300 5850
Wire Wire Line
	2300 5850 2300 5600
Connection ~ 2300 5600
Wire Wire Line
	2300 5600 2500 5600
Wire Wire Line
	1150 5850 1000 5850
Wire Wire Line
	1000 5850 1000 5050
Wire Wire Line
	1000 5050 1850 5050
Connection ~ 1850 5050
$Comp
L Device:LED D1
U 1 1 608C4BCC
P 1400 6450
F 0 "D1" H 1393 6195 50  0000 C CNN
F 1 "RX_LED" H 1393 6286 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1400 6450 50  0001 C CNN
F 3 "~" H 1400 6450 50  0001 C CNN
	1    1400 6450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 608C5447
P 1400 6850
F 0 "D2" H 1393 6595 50  0000 C CNN
F 1 "TX_LED" H 1393 6686 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1400 6850 50  0001 C CNN
F 3 "~" H 1400 6850 50  0001 C CNN
	1    1400 6850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 608C5AA6
P 1800 6450
F 0 "R4" V 2007 6450 50  0000 C CNN
F 1 "2K2" V 1916 6450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1730 6450 50  0001 C CNN
F 3 "~" H 1800 6450 50  0001 C CNN
	1    1800 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 608C5DD1
P 1800 6850
F 0 "R5" V 2007 6850 50  0000 C CNN
F 1 "2K2" V 1916 6850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1730 6850 50  0001 C CNN
F 3 "~" H 1800 6850 50  0001 C CNN
	1    1800 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2500 6600 2150 6600
Wire Wire Line
	2500 6700 2150 6700
Wire Wire Line
	2150 6700 2150 6850
Wire Wire Line
	2150 6850 1950 6850
Wire Wire Line
	1950 6450 2150 6450
Wire Wire Line
	2150 6450 2150 6600
Wire Wire Line
	1550 6450 1650 6450
Wire Wire Line
	1550 6850 1650 6850
Wire Wire Line
	1250 6850 1000 6850
Wire Wire Line
	1000 6850 1000 6450
Wire Wire Line
	1000 6450 1250 6450
Wire Wire Line
	1000 5850 1000 6450
Connection ~ 1000 5850
Connection ~ 1000 6450
$Comp
L Connector:USB_B J4
U 1 1 6092AEF9
P 6500 5600
F 0 "J4" H 6270 5589 50  0000 R CNN
F 1 "USB_B" H 6270 5498 50  0000 R CNN
F 2 "Connector_USB:USB_B_Lumberg_2411_02_Horizontal" H 6650 5550 50  0001 C CNN
F 3 " ~" H 6650 5550 50  0001 C CNN
	1    6500 5600
	-1   0    0    -1  
$EndComp
$Comp
L Device:Varistor RV1
U 1 1 60937237
P 6600 6250
F 0 "RV1" H 6703 6296 50  0000 L CNN
F 1 "Varistor" H 6703 6205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6530 6250 50  0001 C CNN
F 3 "~" H 6600 6250 50  0001 C CNN
	1    6600 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 6000 6600 6100
$Comp
L power:GND #PWR030
U 1 1 6093E64A
P 6550 6500
F 0 "#PWR030" H 6550 6250 50  0001 C CNN
F 1 "GND" H 6555 6327 50  0000 C CNN
F 2 "" H 6550 6500 50  0001 C CNN
F 3 "" H 6550 6500 50  0001 C CNN
	1    6550 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6000 6500 6450
Wire Wire Line
	6500 6450 6550 6450
Wire Wire Line
	6600 6450 6600 6400
Wire Wire Line
	6550 6500 6550 6450
Connection ~ 6550 6450
Wire Wire Line
	6550 6450 6600 6450
$Comp
L Jumper:Jumper_2_Open JP2
U 1 1 609641F7
P 5100 5400
F 0 "JP2" H 5100 5635 50  0000 C CNN
F 1 "Vusb" H 5100 5544 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 5100 5400 50  0001 C CNN
F 3 "~" H 5100 5400 50  0001 C CNN
	1    5100 5400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR029
U 1 1 6096DC6F
P 4800 5250
F 0 "#PWR029" H 4800 5100 50  0001 C CNN
F 1 "+5V" H 4815 5423 50  0000 C CNN
F 2 "" H 4800 5250 50  0001 C CNN
F 3 "" H 4800 5250 50  0001 C CNN
	1    4800 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5250 4800 5300
Wire Wire Line
	4800 5400 4900 5400
$Comp
L Device:C C11
U 1 1 60976046
P 4500 5300
F 0 "C11" V 4752 5300 50  0000 C CNN
F 1 "10nF" V 4661 5300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 4538 5150 50  0001 C CNN
F 3 "~" H 4500 5300 50  0001 C CNN
	1    4500 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 5300 4800 5300
Connection ~ 4800 5300
Wire Wire Line
	4800 5300 4800 5400
Wire Wire Line
	4350 5300 4200 5300
Wire Wire Line
	4200 5300 4200 5050
Wire Wire Line
	4200 5050 4000 5050
Connection ~ 4000 5050
$Comp
L Device:R R7
U 1 1 6099953D
P 5750 5600
F 0 "R7" V 5650 5600 50  0000 C CNN
F 1 "22R" V 5750 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5680 5600 50  0001 C CNN
F 3 "~" H 5750 5600 50  0001 C CNN
	1    5750 5600
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 6099A068
P 5750 5800
F 0 "R8" V 5650 5800 50  0000 C CNN
F 1 "22R" V 5750 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5680 5800 50  0001 C CNN
F 3 "~" H 5750 5800 50  0001 C CNN
	1    5750 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 5500 4800 5500
Wire Wire Line
	4800 5500 4800 5600
Wire Wire Line
	4800 5600 5600 5600
Wire Wire Line
	5900 5800 6050 5800
Wire Wire Line
	6050 5800 6050 5700
Wire Wire Line
	5400 5800 5400 5700
Wire Wire Line
	5400 5700 4300 5700
Wire Wire Line
	5400 5800 5600 5800
$Comp
L Device:LED D3
U 1 1 609C3933
P 9550 2450
F 0 "D3" H 9543 2195 50  0000 C CNN
F 1 "LED_GP1" H 9543 2286 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2450 50  0001 C CNN
F 3 "~" H 9550 2450 50  0001 C CNN
	1    9550 2450
	1    0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 609C4B20
P 9550 2850
F 0 "D4" H 9543 2595 50  0000 C CNN
F 1 "LED_GP2" H 9543 2686 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2850 50  0001 C CNN
F 3 "~" H 9550 2850 50  0001 C CNN
	1    9550 2850
	1    0    0    1   
$EndComp
$Comp
L Device:LED D5
U 1 1 609C4ED9
P 9550 3250
F 0 "D5" H 9543 2995 50  0000 C CNN
F 1 "LED_GP3" H 9543 3086 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3250 50  0001 C CNN
F 3 "~" H 9550 3250 50  0001 C CNN
	1    9550 3250
	1    0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 609C5316
P 9550 3650
F 0 "D6" H 9543 3395 50  0000 C CNN
F 1 "LED_GP4" H 9543 3486 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3650 50  0001 C CNN
F 3 "~" H 9550 3650 50  0001 C CNN
	1    9550 3650
	1    0    0    1   
$EndComp
$Comp
L Device:R R9
U 1 1 609E0B01
P 10000 2450
F 0 "R9" V 9800 2450 50  0000 C CNN
F 1 "220R" V 9900 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9930 2450 50  0001 C CNN
F 3 "~" H 10000 2450 50  0001 C CNN
	1    10000 2450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 609E1642
P 10000 2850
F 0 "R10" V 9800 2850 50  0000 C CNN
F 1 "220R" V 9900 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9930 2850 50  0001 C CNN
F 3 "~" H 10000 2850 50  0001 C CNN
	1    10000 2850
	0    -1   1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 609E19CE
P 10000 3250
F 0 "R11" V 9800 3250 50  0000 C CNN
F 1 "220R" V 9900 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9930 3250 50  0001 C CNN
F 3 "~" H 10000 3250 50  0001 C CNN
	1    10000 3250
	0    -1   1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 609E1BA9
P 10000 3650
F 0 "R12" V 9800 3650 50  0000 C CNN
F 1 "220R" V 9900 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9930 3650 50  0001 C CNN
F 3 "~" H 10000 3650 50  0001 C CNN
	1    10000 3650
	0    -1   1    0   
$EndComp
Wire Wire Line
	9850 2450 9700 2450
Wire Wire Line
	9850 2850 9700 2850
Wire Wire Line
	9850 3250 9700 3250
Wire Wire Line
	9850 3650 9700 3650
Wire Wire Line
	8500 2450 9400 2450
Wire Wire Line
	8500 2550 9300 2550
Wire Wire Line
	9300 2550 9300 2850
Wire Wire Line
	9300 2850 9400 2850
Wire Wire Line
	9400 3250 9200 3250
Wire Wire Line
	9200 3250 9200 2650
Wire Wire Line
	9200 2650 8500 2650
Wire Wire Line
	8500 2750 9100 2750
Wire Wire Line
	9100 2750 9100 3650
Wire Wire Line
	9100 3650 9400 3650
Wire Wire Line
	10300 3650 10150 3650
Wire Wire Line
	10150 3250 10300 3250
Connection ~ 10300 3250
Wire Wire Line
	10300 3250 10300 3650
Wire Wire Line
	10150 2850 10300 2850
Connection ~ 10300 2850
Wire Wire Line
	10300 2850 10300 3250
Wire Wire Line
	10150 2450 10300 2450
Wire Wire Line
	10300 2450 10300 2850
Text GLabel 6950 1850 0    50   Input ~ 0
I2C_SCK
Text GLabel 6950 2950 0    50   Input ~ 0
I2C_SDA
Wire Wire Line
	6950 2950 7100 2950
Wire Wire Line
	6950 1850 7100 1850
Wire Wire Line
	6450 1750 7100 1750
$Comp
L Device:R R13
U 1 1 60B6EF8A
P 4700 6850
F 0 "R13" V 4600 6850 50  0000 C CNN
F 1 "0R" V 4700 6850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 4630 6850 50  0001 C CNN
F 3 "~" H 4700 6850 50  0001 C CNN
	1    4700 6850
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 6850 4550 6850
Wire Wire Line
	5000 6200 5000 6350
Wire Wire Line
	5000 6700 5000 6850
Wire Wire Line
	5300 5400 6200 5400
Wire Wire Line
	5900 5600 6200 5600
Wire Wire Line
	6050 5700 6200 5700
Wire Wire Line
	4850 6850 5000 6850
Connection ~ 5000 6850
Wire Wire Line
	5000 6850 5000 6900
Wire Wire Line
	4400 6350 5000 6350
Connection ~ 5000 6350
Wire Wire Line
	5000 6350 5000 6400
$Comp
L Jumper:Jumper_3_Bridged12 JP5
U 1 1 60BDF0CE
P 10300 1350
F 0 "JP5" H 10300 1554 50  0000 C CNN
F 1 "LED_POWER" H 10300 1463 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_Pad1.0x1.5mm" H 10300 1350 50  0001 C CNN
F 3 "~" H 10300 1350 50  0001 C CNN
	1    10300 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10300 1500 10300 2450
Connection ~ 10300 2450
Wire Wire Line
	10050 1350 9300 1350
Connection ~ 9300 1350
$Comp
L power:+3V8 #PWR048
U 1 1 60C0C6B1
P 10650 1250
F 0 "#PWR048" H 10650 1100 50  0001 C CNN
F 1 "+3V8" H 10665 1423 50  0000 C CNN
F 2 "" H 10650 1250 50  0001 C CNN
F 3 "" H 10650 1250 50  0001 C CNN
	1    10650 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 1350 10650 1350
Wire Wire Line
	10650 1350 10650 1250
$Comp
L Device:R R14
U 1 1 60CBC38D
P 4350 1550
F 0 "R14" V 4143 1550 50  0000 C CNN
F 1 "10K" V 4234 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4280 1550 50  0001 C CNN
F 3 "~" H 4350 1550 50  0001 C CNN
	1    4350 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 1550 4200 1550
Wire Wire Line
	4500 1550 4600 1550
$EndSCHEMATC

EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L cc1100:CC1101_433_MODULE U4
U 1 1 60A65984
P 650 1500
F 0 "U4" H 1083 1959 50  0000 C CNN
F 1 "CC1101_433_MODULE" H 1083 1876 39  0000 C CNN
F 2 "cc1101:CC1101_MODULE" H 650 1500 50  0001 C CNN
F 3 "" H 650 1500 50  0001 C CNN
	1    650  1500
	1    0    0    -1  
$EndComp
$Comp
L cc1100:CC1101_433_MODULE_SMALL U5
U 1 1 60A672F3
P 650 2950
F 0 "U5" H 1083 3549 50  0000 C CNN
F 1 "CC1101_433_MODULE_SMALL" H 1083 3466 39  0000 C CNN
F 2 "cc1101:CC1101_MODULE_SMALL" H 650 2950 50  0001 C CNN
F 3 "" H 650 2950 50  0001 C CNN
	1    650  2950
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP4
U 1 1 60A68373
P 2500 950
F 0 "JP4" H 2500 1154 50  0000 C CNN
F 1 "CC1101_POWER" H 2500 1063 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_Pad1.0x1.5mm" H 2500 950 50  0001 C CNN
F 3 "~" H 2500 950 50  0001 C CNN
	1    2500 950 
	1    0    0    -1  
$EndComp
$Comp
L power:+3V8 #PWR034
U 1 1 60A6A72B
P 2050 900
F 0 "#PWR034" H 2050 750 50  0001 C CNN
F 1 "+3V8" H 2065 1073 50  0000 C CNN
F 2 "" H 2050 900 50  0001 C CNN
F 3 "" H 2050 900 50  0001 C CNN
	1    2050 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 900  2050 950 
Wire Wire Line
	2050 950  2250 950 
$Comp
L power:+3V3 #PWR035
U 1 1 60A6AFA3
P 2950 900
F 0 "#PWR035" H 2950 750 50  0001 C CNN
F 1 "+3V3" H 2965 1073 50  0000 C CNN
F 2 "" H 2950 900 50  0001 C CNN
F 3 "" H 2950 900 50  0001 C CNN
	1    2950 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 950  2950 950 
Wire Wire Line
	2950 950  2950 900 
Wire Wire Line
	1500 1250 2500 1250
Wire Wire Line
	1500 2750 2500 2750
$Comp
L power:GND #PWR033
U 1 1 60A6F3AA
P 1650 2200
F 0 "#PWR033" H 1650 1950 50  0001 C CNN
F 1 "GND" H 1655 2027 50  0000 C CNN
F 2 "" H 1650 2200 50  0001 C CNN
F 3 "" H 1650 2200 50  0001 C CNN
	1    1650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2050 1650 2050
Wire Wire Line
	1650 2050 1650 2150
Wire Wire Line
	1500 2150 1650 2150
Connection ~ 1650 2150
Wire Wire Line
	1650 2150 1650 2200
$Comp
L power:GND #PWR032
U 1 1 60A6FB35
P 1600 2650
F 0 "#PWR032" H 1600 2400 50  0001 C CNN
F 1 "GND" V 1605 2522 50  0000 R CNN
F 2 "" H 1600 2650 50  0001 C CNN
F 3 "" H 1600 2650 50  0001 C CNN
	1    1600 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 2650 1600 2650
Text GLabel 1950 1450 2    50   Input ~ 0
SPI_MOSI
Wire Wire Line
	1500 1450 1950 1450
Text GLabel 1950 3150 2    50   Input ~ 0
SPI_MOSI
Wire Wire Line
	1950 3150 1500 3150
Text GLabel 1950 3250 2    50   Input ~ 0
SPI_MISO
Wire Wire Line
	1500 3250 1950 3250
Text GLabel 1950 1650 2    50   Input ~ 0
SPI_MISO
Wire Wire Line
	1950 1650 1500 1650
Text GLabel 1950 1550 2    50   Input ~ 0
SPI_CLK
Wire Wire Line
	1950 1550 1500 1550
Text GLabel 1950 3050 2    50   Input ~ 0
SPI_CLK
Wire Wire Line
	1950 3050 1500 3050
Text GLabel 1950 2950 2    50   Input ~ 0
SPI_CS
Wire Wire Line
	1950 2950 1500 2950
Text GLabel 1950 1850 2    50   Input ~ 0
SPI_CS
Wire Wire Line
	1950 1850 1500 1850
Text GLabel 1950 1950 2    50   Input ~ 0
IO1
Wire Wire Line
	1950 1950 1500 1950
Text GLabel 1950 2850 2    50   Input ~ 0
IO1
Wire Wire Line
	1950 2850 1500 2850
Text GLabel 1950 1750 2    50   Input ~ 0
IO2
Wire Wire Line
	1950 1750 1500 1750
Text GLabel 1950 3350 2    50   Input ~ 0
IO2
Wire Wire Line
	1950 3350 1500 3350
$Comp
L CC1101RGPR:CC1101RGPR U6
U 1 1 60AB2068
P 5450 3900
F 0 "U6" H 5450 5267 50  0000 C CNN
F 1 "CC1101RGPR" H 5450 5176 50  0000 C CNN
F 2 "CC1101RGPR:QFN50P400X400X100-21N" H 5450 3900 50  0001 L BNN
F 3 "" H 5450 3900 50  0001 L BNN
F 4 "Texas Instruments" H 5450 3900 50  0001 L BNN "MANUFACTURER"
F 5 "1mm" H 5450 3900 50  0001 L BNN "MAXIMUM_PACKAGE_HIEGHT"
F 6 "IPC 7351B" H 5450 3900 50  0001 L BNN "STANDARD"
F 7 "6-May-2020" H 5450 3900 50  0001 L BNN "PARTREV"
	1    5450 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:L L131
U 1 1 60AB3FC9
P 7550 3800
F 0 "L131" V 7740 3800 50  0000 C CNN
F 1 "27nH" V 7649 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 7550 3800 50  0001 C CNN
F 3 "~" H 7550 3800 50  0001 C CNN
	1    7550 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C121
U 1 1 60AB6925
P 7550 3450
F 0 "C121" V 7298 3450 50  0000 C CNN
F 1 "3.9pF" V 7389 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 7588 3300 50  0001 C CNN
F 3 "~" H 7550 3450 50  0001 C CNN
	1    7550 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 3700 6800 3700
Wire Wire Line
	7250 3700 7250 3450
Wire Wire Line
	7250 3450 7400 3450
Wire Wire Line
	7700 3450 8000 3450
Wire Wire Line
	8000 3450 8000 3650
Wire Wire Line
	8000 3800 7700 3800
$Comp
L Device:L L121
U 1 1 60AB8CDD
P 6800 3400
F 0 "L121" H 6853 3446 50  0000 L CNN
F 1 "27nH" H 6853 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 6800 3400 50  0001 C CNN
F 3 "~" H 6800 3400 50  0001 C CNN
	1    6800 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3800 7300 3800
Wire Wire Line
	6800 3550 6800 3700
Connection ~ 6800 3700
Wire Wire Line
	6800 3700 7250 3700
$Comp
L Device:C C124
U 1 1 60ABBA80
P 6800 3000
F 0 "C124" H 6915 3046 50  0000 L CNN
F 1 "220pF" H 6915 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 6838 2850 50  0001 C CNN
F 3 "~" H 6800 3000 50  0001 C CNN
	1    6800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3150 6800 3250
$Comp
L power:GND #PWR040
U 1 1 60ABCD92
P 6800 2700
F 0 "#PWR040" H 6800 2450 50  0001 C CNN
F 1 "GND" H 6805 2527 50  0000 C CNN
F 2 "" H 6800 2700 50  0001 C CNN
F 3 "" H 6800 2700 50  0001 C CNN
	1    6800 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	6800 2700 6800 2850
$Comp
L Device:C C131
U 1 1 60ABE153
P 7300 4050
F 0 "C131" H 7415 4096 50  0000 L CNN
F 1 "3.9pF" H 7415 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 7338 3900 50  0001 C CNN
F 3 "~" H 7300 4050 50  0001 C CNN
	1    7300 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3900 7300 3800
Connection ~ 7300 3800
Wire Wire Line
	7300 3800 7400 3800
$Comp
L power:GND #PWR042
U 1 1 60ABEFF7
P 7300 4350
F 0 "#PWR042" H 7300 4100 50  0001 C CNN
F 1 "GND" H 7305 4177 50  0000 C CNN
F 2 "" H 7300 4350 50  0001 C CNN
F 3 "" H 7300 4350 50  0001 C CNN
	1    7300 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4350 7300 4200
$Comp
L Device:L L122
U 1 1 60AC0262
P 8300 3650
F 0 "L122" V 8490 3650 50  0000 C CNN
F 1 "22nH" V 8399 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 8300 3650 50  0001 C CNN
F 3 "~" H 8300 3650 50  0001 C CNN
	1    8300 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8150 3650 8000 3650
Connection ~ 8000 3650
Wire Wire Line
	8000 3650 8000 3800
$Comp
L Device:C C122
U 1 1 60AC1C1B
P 8600 3900
F 0 "C122" H 8715 3946 50  0000 L CNN
F 1 "8.2pF" H 8715 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 8638 3750 50  0001 C CNN
F 3 "~" H 8600 3900 50  0001 C CNN
	1    8600 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3650 8600 3650
Wire Wire Line
	8600 3650 8600 3750
$Comp
L power:GND #PWR045
U 1 1 60AC2E2B
P 8600 4150
F 0 "#PWR045" H 8600 3900 50  0001 C CNN
F 1 "GND" H 8605 3977 50  0000 C CNN
F 2 "" H 8600 4150 50  0001 C CNN
F 3 "" H 8600 4150 50  0001 C CNN
	1    8600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4150 8600 4050
$Comp
L Device:L L123
U 1 1 60AC3D74
P 8950 3650
F 0 "L123" V 9140 3650 50  0000 C CNN
F 1 "27nH" V 9049 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 8950 3650 50  0001 C CNN
F 3 "~" H 8950 3650 50  0001 C CNN
	1    8950 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C123
U 1 1 60AC40D6
P 9300 3900
F 0 "C123" H 9415 3946 50  0000 L CNN
F 1 "5.6pF" H 9415 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 9338 3750 50  0001 C CNN
F 3 "~" H 9300 3900 50  0001 C CNN
	1    9300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3650 8800 3650
Connection ~ 8600 3650
Wire Wire Line
	9100 3650 9300 3650
Wire Wire Line
	9300 3650 9300 3750
$Comp
L power:GND #PWR046
U 1 1 60AC5D3A
P 9300 4150
F 0 "#PWR046" H 9300 3900 50  0001 C CNN
F 1 "GND" H 9305 3977 50  0000 C CNN
F 2 "" H 9300 4150 50  0001 C CNN
F 3 "" H 9300 4150 50  0001 C CNN
	1    9300 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4150 9300 4050
$Comp
L Device:C C125
U 1 1 60AC6F5A
P 9650 3650
F 0 "C125" V 9398 3650 50  0000 C CNN
F 1 "220pF" V 9489 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 9688 3500 50  0001 C CNN
F 3 "~" H 9650 3650 50  0001 C CNN
	1    9650 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 3650 9500 3650
Connection ~ 9300 3650
$Comp
L SMA-J-P-X-ST-TH1:SMA-J-P-X-ST-TH1 J5
U 1 1 60AC90F1
P 10100 3750
F 0 "J5" H 9940 3836 50  0000 R CNN
F 1 "Antenna 50 Ohm" H 9940 3745 50  0000 R CNN
F 2 "SMA-J-P-X-ST-TH1:SAMTEC_SMA-J-P-X-ST-TH1" H 10100 3750 50  0001 L BNN
F 3 "" H 10100 3750 50  0001 L BNN
F 4 "Samtec" H 10100 3750 50  0001 L BNN "MANUFACTURER"
F 5 "9.55mm" H 10100 3750 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "F" H 10100 3750 50  0001 L BNN "PARTREV"
F 7 "Manufacturer Recommendations" H 10100 3750 50  0001 L BNN "STANDARD"
	1    10100 3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9800 3650 10000 3650
$Comp
L power:GND #PWR047
U 1 1 60ACB1DD
P 9900 4150
F 0 "#PWR047" H 9900 3900 50  0001 C CNN
F 1 "GND" H 9905 3977 50  0000 C CNN
F 2 "" H 9900 4150 50  0001 C CNN
F 3 "" H 9900 4150 50  0001 C CNN
	1    9900 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 4150 9900 3750
Wire Wire Line
	9900 3750 10000 3750
$Comp
L Device:R R171
U 1 1 60ACD52A
P 4250 4500
F 0 "R171" V 4150 4500 50  0000 C CNN
F 1 "56K" V 4050 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" V 4180 4500 50  0001 C CNN
F 3 "~" H 4250 4500 50  0001 C CNN
	1    4250 4500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR038
U 1 1 60ACFB7B
P 3950 4600
F 0 "#PWR038" H 3950 4350 50  0001 C CNN
F 1 "GND" H 3955 4427 50  0000 C CNN
F 2 "" H 3950 4600 50  0001 C CNN
F 3 "" H 3950 4600 50  0001 C CNN
	1    3950 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4600 3950 4500
Wire Wire Line
	3950 4500 4100 4500
Wire Wire Line
	4400 4500 4550 4500
$Comp
L power:GND #PWR039
U 1 1 60AD3344
P 6550 5100
F 0 "#PWR039" H 6550 4850 50  0001 C CNN
F 1 "GND" H 6555 4927 50  0000 C CNN
F 2 "" H 6550 5100 50  0001 C CNN
F 3 "" H 6550 5100 50  0001 C CNN
	1    6550 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 5000 6550 5000
Wire Wire Line
	6550 5000 6550 5100
Wire Wire Line
	6550 5000 6550 4900
Wire Wire Line
	6550 4800 6350 4800
Connection ~ 6550 5000
Wire Wire Line
	6350 4900 6550 4900
Connection ~ 6550 4900
Wire Wire Line
	6550 4900 6550 4800
$Comp
L Device:Crystal_GND24 XTAL1
U 1 1 60AD83BB
P 7400 4950
F 0 "XTAL1" V 7600 4700 50  0000 R CNN
F 1 "26Mhz" V 7500 4700 50  0000 R CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm_HandSoldering" H 7400 4950 50  0001 C CNN
F 3 "~" H 7400 4950 50  0001 C CNN
	1    7400 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 4100 6950 4100
Wire Wire Line
	6950 4100 6950 4700
Wire Wire Line
	6950 4700 7400 4700
Wire Wire Line
	7400 4700 7400 4800
Wire Wire Line
	6350 4200 6850 4200
Wire Wire Line
	6850 4200 6850 5200
Wire Wire Line
	6850 5200 7400 5200
Wire Wire Line
	7400 5200 7400 5100
$Comp
L power:GND #PWR041
U 1 1 60ADD257
P 7150 4950
F 0 "#PWR041" H 7150 4700 50  0001 C CNN
F 1 "GND" V 7155 4822 50  0000 R CNN
F 2 "" H 7150 4950 50  0001 C CNN
F 3 "" H 7150 4950 50  0001 C CNN
	1    7150 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 4950 7200 4950
$Comp
L power:GND #PWR043
U 1 1 60ADEDC6
P 7650 4950
F 0 "#PWR043" H 7650 4700 50  0001 C CNN
F 1 "GND" V 7655 4822 50  0000 R CNN
F 2 "" H 7650 4950 50  0001 C CNN
F 3 "" H 7650 4950 50  0001 C CNN
	1    7650 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 4950 7650 4950
$Comp
L Device:C C81
U 1 1 60AE2204
P 8150 4700
F 0 "C81" V 7898 4700 50  0000 C CNN
F 1 "27pF" V 7989 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 8188 4550 50  0001 C CNN
F 3 "~" H 8150 4700 50  0001 C CNN
	1    8150 4700
	0    1    1    0   
$EndComp
$Comp
L Device:C C101
U 1 1 60AE29B6
P 8150 5200
F 0 "C101" V 7898 5200 50  0000 C CNN
F 1 "27pF" V 7989 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 8188 5050 50  0001 C CNN
F 3 "~" H 8150 5200 50  0001 C CNN
	1    8150 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	7400 4700 8000 4700
Connection ~ 7400 4700
Wire Wire Line
	7400 5200 8000 5200
Connection ~ 7400 5200
Wire Wire Line
	8300 4700 8400 4700
Wire Wire Line
	8400 4700 8400 5200
Wire Wire Line
	8400 5200 8300 5200
$Comp
L power:GND #PWR044
U 1 1 60AE827A
P 8400 5300
F 0 "#PWR044" H 8400 5050 50  0001 C CNN
F 1 "GND" H 8405 5127 50  0000 C CNN
F 2 "" H 8400 5300 50  0001 C CNN
F 3 "" H 8400 5300 50  0001 C CNN
	1    8400 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 5300 8400 5200
Connection ~ 8400 5200
Text Notes 6850 5400 0    50   ~ 0
Mouser: \nNX3225SA-26.000M-STD-CSR-3
Text GLabel 4300 4200 0    50   Input ~ 0
IO1
Text GLabel 4300 4300 0    50   Input ~ 0
IO2
Wire Wire Line
	4300 4300 4550 4300
Wire Wire Line
	4300 4200 4550 4200
Text GLabel 4300 3700 0    50   Input ~ 0
SPI_CS
Wire Wire Line
	4300 3700 4550 3700
Text GLabel 4300 3800 0    50   Input ~ 0
SPI_CLK
Wire Wire Line
	4300 3800 4550 3800
Text GLabel 4300 3900 0    50   Input ~ 0
SPI_MOSI
Wire Wire Line
	4300 3900 4550 3900
Text GLabel 4300 4000 0    50   Input ~ 0
SPI_MISO
Wire Wire Line
	4300 4000 4550 4000
$Comp
L Device:C C51
U 1 1 60AFE114
P 4200 3300
F 0 "C51" V 3948 3300 50  0000 C CNN
F 1 "100nF" V 4039 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 4238 3150 50  0001 C CNN
F 3 "~" H 4200 3300 50  0001 C CNN
	1    4200 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 3300 4350 3300
$Comp
L power:GND #PWR037
U 1 1 60B04501
P 3950 3300
F 0 "#PWR037" H 3950 3050 50  0001 C CNN
F 1 "GND" V 3955 3172 50  0000 R CNN
F 2 "" H 3950 3300 50  0001 C CNN
F 3 "" H 3950 3300 50  0001 C CNN
	1    3950 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 3300 4050 3300
Wire Wire Line
	4550 3400 4450 3400
Wire Wire Line
	4450 3400 4450 3200
Wire Wire Line
	4550 2900 4450 2900
Connection ~ 4450 2900
Wire Wire Line
	4450 2900 4450 2800
Wire Wire Line
	4550 3000 4450 3000
Connection ~ 4450 3000
Wire Wire Line
	4450 3000 4450 2900
Wire Wire Line
	4550 3100 4450 3100
Connection ~ 4450 3100
Wire Wire Line
	4450 3100 4450 3000
Wire Wire Line
	4550 3200 4450 3200
Connection ~ 4450 3200
Wire Wire Line
	4450 3200 4450 3100
$Comp
L Device:C C181
U 1 1 60B170CF
P 3100 2050
F 0 "C181" H 2985 2004 50  0000 R CNN
F 1 "220pF" H 2985 2095 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 3138 1900 50  0001 C CNN
F 3 "~" H 3100 2050 50  0001 C CNN
	1    3100 2050
	-1   0    0    1   
$EndComp
$Comp
L Device:C C141
U 1 1 60B17C3D
P 3550 2050
F 0 "C141" H 3435 2004 50  0000 R CNN
F 1 "10nF" H 3435 2095 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 3588 1900 50  0001 C CNN
F 3 "~" H 3550 2050 50  0001 C CNN
	1    3550 2050
	-1   0    0    1   
$EndComp
$Comp
L Device:C C151
U 1 1 60B18B98
P 3950 2050
F 0 "C151" H 3835 2004 50  0000 R CNN
F 1 "220pF" H 3835 2095 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 3988 1900 50  0001 C CNN
F 3 "~" H 3950 2050 50  0001 C CNN
	1    3950 2050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR036
U 1 1 60B2984C
P 3350 2450
F 0 "#PWR036" H 3350 2200 50  0001 C CNN
F 1 "GND" H 3355 2277 50  0000 C CNN
F 2 "" H 3350 2450 50  0001 C CNN
F 3 "" H 3350 2450 50  0001 C CNN
	1    3350 2450
	1    0    0    -1  
$EndComp
Text Notes 3000 1650 0    50   ~ 0
Layout guide:\n    C181 place near pins 14,15\n    C151 place near pins 16,17\n    C141 place near pin 11\n    C91 place near pin 11
$Comp
L Device:C C91
U 1 1 60B2E5F3
P 2650 2050
F 0 "C91" H 2535 2004 50  0000 R CNN
F 1 "100nF" H 2535 2095 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 2688 1900 50  0001 C CNN
F 3 "~" H 2650 2050 50  0001 C CNN
	1    2650 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1500 1350 2500 1350
Wire Wire Line
	2500 1350 2500 1250
Connection ~ 2500 1350
Wire Wire Line
	2500 1250 2500 1100
Connection ~ 2500 1250
Wire Wire Line
	2650 1900 2650 1750
Wire Wire Line
	2650 1750 3100 1750
Wire Wire Line
	3100 1900 3100 1750
Connection ~ 3100 1750
Wire Wire Line
	3550 1900 3550 1750
Wire Wire Line
	3100 1750 3550 1750
Connection ~ 3550 1750
Wire Wire Line
	3550 1750 3950 1750
Wire Wire Line
	3950 1900 3950 1750
Connection ~ 3950 1750
Wire Wire Line
	2650 2200 2650 2300
Wire Wire Line
	3950 2300 3950 2200
Wire Wire Line
	3550 2200 3550 2300
Wire Wire Line
	3350 2450 3350 2300
Connection ~ 3350 2300
Wire Wire Line
	3100 2200 3100 2300
$Comp
L Device:C C41
U 1 1 60D77A8B
P 4400 2050
F 0 "C41" H 4285 2004 50  0000 R CNN
F 1 "100nF" H 4285 2095 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 4438 1900 50  0001 C CNN
F 3 "~" H 4400 2050 50  0001 C CNN
	1    4400 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 2300 4400 2200
Wire Wire Line
	4450 2800 4550 2800
Wire Wire Line
	3950 1750 4400 1750
Wire Wire Line
	4400 1900 4400 1750
Wire Wire Line
	2500 1350 2500 1750
Wire Wire Line
	2650 2300 3100 2300
Wire Wire Line
	3350 2300 3550 2300
Connection ~ 3100 2300
Wire Wire Line
	3100 2300 3350 2300
Connection ~ 3550 2300
Wire Wire Line
	3550 2300 3950 2300
Connection ~ 3950 2300
Wire Wire Line
	3950 2300 4400 2300
Wire Wire Line
	4450 2800 4450 2450
Wire Wire Line
	4450 2450 4750 2450
Wire Wire Line
	4750 2450 4750 1750
Wire Wire Line
	4750 1750 4400 1750
Connection ~ 4450 2800
Connection ~ 4400 1750
Wire Wire Line
	2650 1750 2500 1750
Connection ~ 2650 1750
Connection ~ 2500 1750
Wire Wire Line
	2500 1750 2500 2750
$EndSCHEMATC

EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5850 1300 1350 1950
U 607E8AF1
F0 "cc1101" 50
F1 "cc1101.sch" 50
$EndSheet
$Sheet
S 7500 1300 1350 1950
U 607E9420
F0 "I/O" 50
F1 "io.sch" 50
$EndSheet
$Comp
L Regulator_Linear:LM317_TO-220 U1
U 1 1 607FE4BD
P 2400 1900
F 0 "U1" H 2400 2142 50  0000 C CNN
F 1 "LM317_TO-220" H 2400 2051 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 2400 2150 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 2400 1900 50  0001 C CNN
	1    2400 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 607FF39E
P 3000 2200
F 0 "R1" H 3070 2246 50  0000 L CNN
F 1 "1K2" H 3070 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 2930 2200 50  0001 C CNN
F 3 "~" H 3000 2200 50  0001 C CNN
	1    3000 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 607FFF80
P 3000 2800
F 0 "R2" H 3070 2846 50  0000 L CNN
F 1 "2K" H 3070 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 2930 2800 50  0001 C CNN
F 3 "~" H 3000 2800 50  0001 C CNN
	1    3000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2200 2400 2500
Wire Wire Line
	2400 2500 3000 2500
Wire Wire Line
	3000 2500 3000 2350
Wire Wire Line
	3000 2500 3000 2650
Connection ~ 3000 2500
$Comp
L power:GND #PWR02
U 1 1 60800C0D
P 3000 3150
F 0 "#PWR02" H 3000 2900 50  0001 C CNN
F 1 "GND" H 3005 2977 50  0000 C CNN
F 2 "" H 3000 3150 50  0001 C CNN
F 3 "" H 3000 3150 50  0001 C CNN
	1    3000 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3150 3000 3050
Wire Wire Line
	2700 1900 3000 1900
Wire Wire Line
	3000 1900 3000 2050
Wire Wire Line
	3000 1900 3550 1900
Connection ~ 3000 1900
Wire Wire Line
	1550 1900 1900 1900
$Comp
L Device:C C2
U 1 1 608044BB
P 1900 2150
F 0 "C2" H 2015 2196 50  0000 L CNN
F 1 "100nF" H 2015 2105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 1938 2000 50  0001 C CNN
F 3 "~" H 1900 2150 50  0001 C CNN
	1    1900 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2000 1900 1900
Connection ~ 1900 1900
Wire Wire Line
	1900 1900 2100 1900
Wire Wire Line
	1900 2300 1900 3050
Wire Wire Line
	1900 3050 3000 3050
Connection ~ 3000 3050
Wire Wire Line
	3000 3050 3000 2950
$Comp
L Device:CP C1
U 1 1 608052E1
P 1550 2150
F 0 "C1" H 1200 2200 50  0000 L CNN
F 1 "100uF" H 1200 2100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 1588 2000 50  0001 C CNN
F 3 "~" H 1550 2150 50  0001 C CNN
	1    1550 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2000 1550 1900
Wire Wire Line
	1550 2300 1550 3050
Wire Wire Line
	1550 3050 1900 3050
Connection ~ 1900 3050
$Comp
L Device:CP C3
U 1 1 608060C7
P 3550 2150
F 0 "C3" H 3668 2196 50  0000 L CNN
F 1 "220uF" H 3668 2105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 3588 2000 50  0001 C CNN
F 3 "~" H 3550 2150 50  0001 C CNN
	1    3550 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2000 3550 1900
Wire Wire Line
	3000 3050 3550 3050
Wire Wire Line
	3550 3050 3550 2300
$Comp
L power:+3V8 #PWR03
U 1 1 60808D66
P 3550 1700
F 0 "#PWR03" H 3550 1550 50  0001 C CNN
F 1 "+3V8" H 3565 1873 50  0000 C CNN
F 2 "" H 3550 1700 50  0001 C CNN
F 3 "" H 3550 1700 50  0001 C CNN
	1    3550 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1700 3550 1900
Connection ~ 3550 1900
$Comp
L Jumper:Jumper_3_Bridged12 JP3
U 1 1 609BE34C
P 1550 1600
F 0 "JP3" H 1550 1804 50  0000 C CNN
F 1 "LM317_POWER" H 1550 1713 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_Pad1.0x1.5mm" H 1550 1600 50  0001 C CNN
F 3 "~" H 1550 1600 50  0001 C CNN
	1    1550 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1750 1550 1900
Connection ~ 1550 1900
$Comp
L power:+12V #PWR01
U 1 1 609BF258
P 1100 1400
F 0 "#PWR01" H 1100 1250 50  0001 C CNN
F 1 "+12V" H 1115 1573 50  0000 C CNN
F 2 "" H 1100 1400 50  0001 C CNN
F 3 "" H 1100 1400 50  0001 C CNN
	1    1100 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1400 1100 1600
Wire Wire Line
	1100 1600 1300 1600
$Comp
L power:+5V #PWR031
U 1 1 609BFB25
P 1950 1400
F 0 "#PWR031" H 1950 1250 50  0001 C CNN
F 1 "+5V" H 1965 1573 50  0000 C CNN
F 2 "" H 1950 1400 50  0001 C CNN
F 3 "" H 1950 1400 50  0001 C CNN
	1    1950 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1600 1950 1600
Wire Wire Line
	1950 1600 1950 1400
Text Notes 2600 1450 0    50   ~ 0
+3V8 is actually another +3V3 power supply (+3V6 max).
$Comp
L Connector:TestPoint TP1
U 1 1 60C76A5C
P 3700 1900
F 0 "TP1" V 3654 2088 50  0000 L CNN
F 1 "+3V8" V 3745 2088 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D3.0mm" H 3900 1900 50  0001 C CNN
F 3 "~" H 3900 1900 50  0001 C CNN
	1    3700 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 1900 3700 1900
$Comp
L Connector:TestPoint TP2
U 1 1 60C78A25
P 3700 3050
F 0 "TP2" V 3654 3238 50  0000 L CNN
F 1 "GND" V 3745 3238 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D3.0mm" H 3900 3050 50  0001 C CNN
F 3 "~" H 3900 3050 50  0001 C CNN
	1    3700 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 3050 3550 3050
Connection ~ 3550 3050
$EndSCHEMATC

EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Connector:Screw_Terminal_01x02 J1
U 1 1 5FAE3F5C
P 600 1100
F 0 "J1" H 518 775 50  0000 C CNN
F 1 "Power" H 518 866 50  0000 C CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00001_1x02_P5.00mm_Horizontal" H 600 1100 50  0001 C CNN
F 3 "~" H 600 1100 50  0001 C CNN
	1    600  1100
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4007 D1
U 1 1 5FAE58A6
P 1150 1000
F 0 "D1" H 1150 784 50  0000 C CNN
F 1 "1N4007" H 1150 875 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1150 825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1150 1000 50  0001 C CNN
	1    1150 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	800  1000 1000 1000
Wire Wire Line
	800  1100 950  1100
$Comp
L Device:LED D2
U 1 1 5FAE6E4E
P 1450 1600
F 0 "D2" V 1489 1483 50  0000 R CNN
F 1 "LED" V 1398 1483 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 1450 1600 50  0001 C CNN
F 3 "~" H 1450 1600 50  0001 C CNN
	1    1450 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5FAE8010
P 1450 1200
F 0 "R3" H 1520 1246 50  0000 L CNN
F 1 "4K7" H 1520 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1380 1200 50  0001 C CNN
F 3 "~" H 1450 1200 50  0001 C CNN
	1    1450 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1000 1450 1000
Wire Wire Line
	1450 1000 1450 1050
Wire Wire Line
	1450 1350 1450 1450
$Comp
L Regulator_Linear:LM7805_TO220 U3
U 1 1 5FAEA877
P 3450 1000
F 0 "U3" H 3450 1242 50  0000 C CNN
F 1 "LM7805" H 3450 1151 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 3450 1225 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 3450 950 50  0001 C CNN
	1    3450 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5FAECDEF
P 2350 1400
F 0 "C10" H 2465 1446 50  0000 L CNN
F 1 "100nF" H 2465 1355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2388 1250 50  0001 C CNN
F 3 "~" H 2350 1400 50  0001 C CNN
	1    2350 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C20
U 1 1 5FAEDE47
P 4850 1400
F 0 "C20" H 4968 1446 50  0000 L CNN
F 1 "470uF" H 4968 1355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 4888 1250 50  0001 C CNN
F 3 "~" H 4850 1400 50  0001 C CNN
	1    4850 1400
	1    0    0    -1  
$EndComp
Connection ~ 1450 1000
Wire Wire Line
	3750 1000 3900 1000
Connection ~ 3900 1000
$Comp
L power:GND #PWR08
U 1 1 5FAEF35D
P 2350 2150
F 0 "#PWR08" H 2350 1900 50  0001 C CNN
F 1 "GND" H 2355 1977 50  0000 C CNN
F 2 "" H 2350 2150 50  0001 C CNN
F 3 "" H 2350 2150 50  0001 C CNN
	1    2350 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1000 1900 1000
Connection ~ 1900 1000
Wire Wire Line
	1900 1000 2350 1000
Wire Wire Line
	1900 1000 1900 1250
Wire Wire Line
	2350 1000 2350 1250
Wire Wire Line
	3900 1000 3900 1250
Wire Wire Line
	4350 1250 4350 1000
Wire Wire Line
	3900 1000 4350 1000
Wire Wire Line
	950  2000 1450 2000
Wire Wire Line
	2350 2000 2350 2150
Wire Wire Line
	950  1100 950  2000
Wire Wire Line
	2350 1550 2350 2000
Connection ~ 2350 2000
Wire Wire Line
	1900 1550 1900 2000
Connection ~ 1900 2000
Wire Wire Line
	1900 2000 2350 2000
Wire Wire Line
	1450 1750 1450 2000
Connection ~ 1450 2000
Wire Wire Line
	1450 2000 1900 2000
Wire Wire Line
	3450 1300 3450 2000
Wire Wire Line
	3450 2000 3900 2000
Wire Wire Line
	3900 1550 3900 2000
Connection ~ 3450 2000
Wire Wire Line
	3900 2000 4350 2000
Wire Wire Line
	4350 1550 4350 2000
Connection ~ 3900 2000
$Comp
L power:+5V #PWR012
U 1 1 5FB12B9A
P 4350 800
F 0 "#PWR012" H 4350 650 50  0001 C CNN
F 1 "+5V" H 4365 973 50  0000 C CNN
F 2 "" H 4350 800 50  0001 C CNN
F 3 "" H 4350 800 50  0001 C CNN
	1    4350 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 800  4350 1000
Connection ~ 4350 1000
$Comp
L power:+12V #PWR05
U 1 1 5FB14A57
P 1900 800
F 0 "#PWR05" H 1900 650 50  0001 C CNN
F 1 "+12V" H 1915 973 50  0000 C CNN
F 2 "" H 1900 800 50  0001 C CNN
F 3 "" H 1900 800 50  0001 C CNN
	1    1900 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 800  1900 1000
$Comp
L Connector:TestPoint TP1
U 1 1 5FB187EE
P 1450 800
F 0 "TP1" H 1508 918 50  0000 L CNN
F 1 "+12V" H 1508 827 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.5mm" H 1650 800 50  0001 C CNN
F 3 "~" H 1650 800 50  0001 C CNN
	1    1450 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 800  1450 1000
$Comp
L Connector:TestPoint TP3
U 1 1 5FB1AA37
P 3900 800
F 0 "TP3" H 3958 918 50  0000 L CNN
F 1 "+5V" H 3958 827 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.5mm" H 4100 800 50  0001 C CNN
F 3 "~" H 4100 800 50  0001 C CNN
	1    3900 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 800  3900 1000
$Comp
L Regulator_Linear:TLV75533PDBV U7
U 1 1 5FB22653
P 7250 1100
F 0 "U7" H 7250 1442 50  0000 C CNN
F 1 "TLV75533PDBV" H 7250 1351 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 7250 1400 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tlv755p.pdf" H 7250 1100 50  0001 C CNN
	1    7250 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1100 6850 1100
Wire Wire Line
	6850 1100 6850 1000
Connection ~ 6850 1000
Wire Wire Line
	6850 1000 6950 1000
$Comp
L Device:C C24
U 1 1 5FB26631
P 5800 1400
F 0 "C24" H 5915 1446 50  0000 L CNN
F 1 "10uF*" H 5915 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5838 1250 50  0001 C CNN
F 3 "~" H 5800 1400 50  0001 C CNN
	1    5800 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C33
U 1 1 5FB2CB29
P 8650 1400
F 0 "C33" H 8768 1446 50  0000 L CNN
F 1 "10uF" H 8768 1355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 8688 1250 50  0001 C CNN
F 3 "~" H 8650 1400 50  0001 C CNN
	1    8650 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C34
U 1 1 5FB2CE81
P 9100 1400
F 0 "C34" H 9215 1446 50  0000 L CNN
F 1 "10uF*" H 9215 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9138 1250 50  0001 C CNN
F 3 "~" H 9100 1400 50  0001 C CNN
	1    9100 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1250 6700 1000
Connection ~ 6700 1000
Wire Wire Line
	6700 1000 6850 1000
Wire Wire Line
	9100 1000 9100 1250
Wire Wire Line
	8650 1250 8650 1000
Connection ~ 8650 1000
Wire Wire Line
	8650 1000 9100 1000
Wire Wire Line
	9100 2000 9100 1550
Wire Wire Line
	8650 1550 8650 2000
Connection ~ 8650 2000
Wire Wire Line
	8650 2000 9100 2000
Wire Wire Line
	6700 1550 6700 2000
Connection ~ 6700 2000
Wire Wire Line
	6700 2000 7250 2000
$Comp
L power:GND #PWR028
U 1 1 5FB32FDC
P 6250 2150
F 0 "#PWR028" H 6250 1900 50  0001 C CNN
F 1 "GND" H 6255 1977 50  0000 C CNN
F 2 "" H 6250 2150 50  0001 C CNN
F 3 "" H 6250 2150 50  0001 C CNN
	1    6250 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR041
U 1 1 5FB35CD6
P 9100 800
F 0 "#PWR041" H 9100 650 50  0001 C CNN
F 1 "+3V3" H 9115 973 50  0000 C CNN
F 2 "" H 9100 800 50  0001 C CNN
F 3 "" H 9100 800 50  0001 C CNN
	1    9100 800 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5FB374E7
P 8650 800
F 0 "TP4" H 8708 918 50  0000 L CNN
F 1 "+3V3" H 8708 827 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.5mm" H 8850 800 50  0001 C CNN
F 3 "~" H 8850 800 50  0001 C CNN
	1    8650 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 800  9100 1000
Connection ~ 9100 1000
Wire Wire Line
	8650 800  8650 1000
Wire Wire Line
	7250 1400 7250 2000
$Comp
L Device:C C16
U 1 1 5FAED2D5
P 3900 1400
F 0 "C16" H 4015 1446 50  0000 L CNN
F 1 "100nF" H 4015 1355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3938 1250 50  0001 C CNN
F 3 "~" H 3900 1400 50  0001 C CNN
	1    3900 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C8
U 1 1 5FAED88E
P 1900 1400
F 0 "C8" H 2018 1446 50  0000 L CNN
F 1 "470uF" H 2018 1355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 1938 1250 50  0001 C CNN
F 3 "~" H 1900 1400 50  0001 C CNN
	1    1900 1400
	1    0    0    -1  
$EndComp
$Comp
L Relay:G5LE-1 K1
U 1 1 5FB68D27
P 9700 2900
F 0 "K1" H 10130 2946 50  0000 L CNN
F 1 "FIN36.11.9" H 10130 2855 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 10150 2850 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 9700 2500 50  0001 C CNN
	1    9700 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J9
U 1 1 5FB830C4
P 10800 2900
F 0 "J9" H 10880 2892 50  0000 L CNN
F 1 "OUT1" H 10880 2801 50  0000 L CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00001_1x02_P5.00mm_Horizontal" H 10800 2900 50  0001 C CNN
F 3 "~" H 10800 2900 50  0001 C CNN
	1    10800 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2600 10000 2450
Wire Wire Line
	10000 2450 10500 2450
Wire Wire Line
	10500 2450 10500 2900
Wire Wire Line
	10500 2900 10600 2900
Wire Wire Line
	9900 3200 9900 3300
Wire Wire Line
	9900 3300 10500 3300
Wire Wire Line
	10500 3300 10500 3000
Wire Wire Line
	10500 3000 10600 3000
$Comp
L Transistor_BJT:BC337 Q1
U 1 1 5FB92EB5
P 9400 3550
F 0 "Q1" H 9591 3596 50  0000 L CNN
F 1 "BC337" H 9591 3505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 9600 3475 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 9400 3550 50  0001 L CNN
	1    9400 3550
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP3
U 1 1 5FBB5F55
P 10150 950
F 0 "JP3" H 10150 1154 50  0000 C CNN
F 1 "Relay_Power" H 10150 1063 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_Pad1.0x1.5mm" H 10150 950 50  0001 C CNN
F 3 "~" H 10150 950 50  0001 C CNN
	1    10150 950 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR045
U 1 1 5FBB73AD
P 10500 850
F 0 "#PWR045" H 10500 700 50  0001 C CNN
F 1 "+5V" H 10515 1023 50  0000 C CNN
F 2 "" H 10500 850 50  0001 C CNN
F 3 "" H 10500 850 50  0001 C CNN
	1    10500 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 950  10500 950 
Wire Wire Line
	10500 950  10500 850 
$Comp
L power:+12V #PWR044
U 1 1 5FBBA6B1
P 9800 850
F 0 "#PWR044" H 9800 700 50  0001 C CNN
F 1 "+12V" H 9815 1023 50  0000 C CNN
F 2 "" H 9800 850 50  0001 C CNN
F 3 "" H 9800 850 50  0001 C CNN
	1    9800 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 850  9800 950 
Wire Wire Line
	9800 950  9900 950 
Text GLabel 10150 1250 3    50   Input ~ 0
RLY_PWR
Wire Wire Line
	10150 1100 10150 1250
Text GLabel 9500 2500 1    50   Input ~ 0
RLY_PWR
Wire Wire Line
	9500 2600 9500 2550
$Comp
L Diode:1N4007 D6
U 1 1 5FBDE152
P 9100 2900
F 0 "D6" V 9050 2750 50  0000 L CNN
F 1 "1N4007" H 8950 3000 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9100 2725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 9100 2900 50  0001 C CNN
	1    9100 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 2750 9100 2550
Wire Wire Line
	9100 2550 9500 2550
Connection ~ 9500 2550
Wire Wire Line
	9500 2550 9500 2500
Wire Wire Line
	9100 3050 9100 3250
Wire Wire Line
	9100 3250 9500 3250
Wire Wire Line
	9500 3250 9500 3200
Wire Wire Line
	9500 3350 9500 3250
Connection ~ 9500 3250
$Comp
L power:GND #PWR042
U 1 1 5FBE78E4
P 9500 3850
F 0 "#PWR042" H 9500 3600 50  0001 C CNN
F 1 "GND" H 9505 3677 50  0000 C CNN
F 2 "" H 9500 3850 50  0001 C CNN
F 3 "" H 9500 3850 50  0001 C CNN
	1    9500 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3750 9500 3800
$Comp
L Device:R R12
U 1 1 5FBF0843
P 8700 3550
F 0 "R12" V 8493 3550 50  0000 C CNN
F 1 "2K2" V 8584 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8630 3550 50  0001 C CNN
F 3 "~" H 8700 3550 50  0001 C CNN
	1    8700 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 3550 9000 3550
$Comp
L Device:R R16
U 1 1 5FBF465F
P 9200 3800
F 0 "R16" V 9300 3800 50  0000 C CNN
F 1 "33K" V 9400 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9130 3800 50  0001 C CNN
F 3 "~" H 9200 3800 50  0001 C CNN
	1    9200 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 3800 9500 3800
Connection ~ 9500 3800
Wire Wire Line
	9500 3800 9500 3850
Wire Wire Line
	9050 3800 9000 3800
Wire Wire Line
	9000 3800 9000 3550
Connection ~ 9000 3550
Wire Wire Line
	9000 3550 9200 3550
Text GLabel 8450 3550 0    50   Input ~ 0
OUT1
Wire Wire Line
	8450 3550 8550 3550
$Comp
L Relay_FTR:FTR-LYCA K3
U 1 1 5FC120FF
P 10250 2050
F 0 "K3" H 10478 2096 50  0000 L CNN
F 1 "FTR-LYCA" H 10478 2005 50  0000 L CNN
F 2 "Relay_FTR:FTR-LYCA" H 10180 1950 50  0001 C CNN
F 3 "" H 10180 1950 50  0001 C CNN
	1    10250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 2300 10350 3000
Wire Wire Line
	10350 3000 10500 3000
Connection ~ 10500 3000
Wire Wire Line
	10500 2450 10500 1750
Wire Wire Line
	10500 1750 10400 1750
Wire Wire Line
	10400 1750 10400 1800
Connection ~ 10500 2450
Wire Wire Line
	10150 2350 10150 2300
Wire Wire Line
	9500 2550 9650 2550
Wire Wire Line
	9650 2550 9650 1750
Wire Wire Line
	9650 1750 10150 1750
Wire Wire Line
	10150 1750 10150 1800
Wire Wire Line
	9750 3250 9750 2350
Wire Wire Line
	9750 2350 10150 2350
Wire Wire Line
	9500 3250 9750 3250
$Comp
L Relay:G5LE-1 K2
U 1 1 5FC478C8
P 9700 5250
F 0 "K2" H 10130 5296 50  0000 L CNN
F 1 "FIN36.11.9" H 10130 5205 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 10150 5200 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 9700 4850 50  0001 C CNN
	1    9700 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J10
U 1 1 5FC478D2
P 10800 5250
F 0 "J10" H 10880 5242 50  0000 L CNN
F 1 "OUT2" H 10880 5151 50  0000 L CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00001_1x02_P5.00mm_Horizontal" H 10800 5250 50  0001 C CNN
F 3 "~" H 10800 5250 50  0001 C CNN
	1    10800 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 4950 10000 4800
Wire Wire Line
	10000 4800 10500 4800
Wire Wire Line
	10500 4800 10500 5250
Wire Wire Line
	10500 5250 10600 5250
Wire Wire Line
	9900 5550 9900 5650
Wire Wire Line
	9900 5650 10500 5650
Wire Wire Line
	10500 5650 10500 5350
Wire Wire Line
	10500 5350 10600 5350
$Comp
L Transistor_BJT:BC337 Q2
U 1 1 5FC478E4
P 9400 5900
F 0 "Q2" H 9591 5946 50  0000 L CNN
F 1 "BC337" H 9591 5855 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 9600 5825 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 9400 5900 50  0001 L CNN
	1    9400 5900
	1    0    0    -1  
$EndComp
Text GLabel 9500 4850 1    50   Input ~ 0
RLY_PWR
Wire Wire Line
	9500 4950 9500 4900
$Comp
L Diode:1N4007 D7
U 1 1 5FC478F0
P 9100 5250
F 0 "D7" V 9050 5100 50  0000 L CNN
F 1 "1N4007" H 8950 5350 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9100 5075 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 9100 5250 50  0001 C CNN
	1    9100 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 5100 9100 4900
Wire Wire Line
	9100 4900 9500 4900
Connection ~ 9500 4900
Wire Wire Line
	9500 4900 9500 4850
Wire Wire Line
	9100 5400 9100 5600
Wire Wire Line
	9100 5600 9500 5600
Wire Wire Line
	9500 5600 9500 5550
Wire Wire Line
	9500 5700 9500 5600
Connection ~ 9500 5600
$Comp
L power:GND #PWR043
U 1 1 5FC47903
P 9500 6200
F 0 "#PWR043" H 9500 5950 50  0001 C CNN
F 1 "GND" H 9505 6027 50  0000 C CNN
F 2 "" H 9500 6200 50  0001 C CNN
F 3 "" H 9500 6200 50  0001 C CNN
	1    9500 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 6100 9500 6150
$Comp
L Device:R R13
U 1 1 5FC4790E
P 8700 5900
F 0 "R13" V 8493 5900 50  0000 C CNN
F 1 "2K2" V 8584 5900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8630 5900 50  0001 C CNN
F 3 "~" H 8700 5900 50  0001 C CNN
	1    8700 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 5900 9000 5900
$Comp
L Device:R R17
U 1 1 5FC47919
P 9200 6150
F 0 "R17" V 9300 6150 50  0000 C CNN
F 1 "33K" V 9400 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9130 6150 50  0001 C CNN
F 3 "~" H 9200 6150 50  0001 C CNN
	1    9200 6150
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 6150 9500 6150
Connection ~ 9500 6150
Wire Wire Line
	9500 6150 9500 6200
Wire Wire Line
	9050 6150 9000 6150
Wire Wire Line
	9000 6150 9000 5900
Connection ~ 9000 5900
Wire Wire Line
	9000 5900 9200 5900
Text GLabel 8450 5900 0    50   Input ~ 0
OUT2
Wire Wire Line
	8450 5900 8550 5900
$Comp
L Relay_FTR:FTR-LYCA K4
U 1 1 5FC4792C
P 10250 4400
F 0 "K4" H 10478 4446 50  0000 L CNN
F 1 "FTR-LYCA" H 10478 4355 50  0000 L CNN
F 2 "Relay_FTR:FTR-LYCA" H 10180 4300 50  0001 C CNN
F 3 "" H 10180 4300 50  0001 C CNN
	1    10250 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 4650 10350 5350
Wire Wire Line
	10350 5350 10500 5350
Connection ~ 10500 5350
Wire Wire Line
	10500 4800 10500 4100
Wire Wire Line
	10500 4100 10400 4100
Wire Wire Line
	10400 4100 10400 4150
Connection ~ 10500 4800
Wire Wire Line
	10150 4700 10150 4650
Wire Wire Line
	9500 4900 9650 4900
Wire Wire Line
	9650 4900 9650 4100
Wire Wire Line
	9650 4100 10150 4100
Wire Wire Line
	10150 4100 10150 4150
Wire Wire Line
	9750 5600 9750 4700
Wire Wire Line
	9750 4700 10150 4700
Wire Wire Line
	9500 5600 9750 5600
$Comp
L Device:C C11
U 1 1 5FC97379
P 2800 1400
F 0 "C11" H 2915 1446 50  0000 L CNN
F 1 "100nF*" H 2915 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2838 1250 50  0001 C CNN
F 3 "~" H 2800 1400 50  0001 C CNN
	1    2800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1250 2800 1000
Wire Wire Line
	2800 1000 3150 1000
Wire Wire Line
	2800 1000 2350 1000
Connection ~ 2800 1000
Connection ~ 2350 1000
Wire Wire Line
	2350 2000 2800 2000
Wire Wire Line
	2800 1550 2800 2000
Connection ~ 2800 2000
Wire Wire Line
	2800 2000 3450 2000
$Comp
L Device:C C18
U 1 1 5FCB6803
P 4350 1400
F 0 "C18" H 4465 1446 50  0000 L CNN
F 1 "100nF*" H 4465 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4388 1250 50  0001 C CNN
F 3 "~" H 4350 1400 50  0001 C CNN
	1    4350 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1000 4850 1000
Wire Wire Line
	4350 2000 4850 2000
Connection ~ 4350 2000
Wire Wire Line
	4850 1250 4850 1000
Wire Wire Line
	4850 1550 4850 2000
$Comp
L Device:CP C22
U 1 1 5FCDBE55
P 5350 1400
F 0 "C22" H 5468 1446 50  0000 L CNN
F 1 "10uF" H 5468 1355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 5388 1250 50  0001 C CNN
F 3 "~" H 5350 1400 50  0001 C CNN
	1    5350 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C28
U 1 1 5FCDC908
P 6700 1400
F 0 "C28" H 6815 1446 50  0000 L CNN
F 1 "100nF*" H 6815 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6738 1250 50  0001 C CNN
F 3 "~" H 6700 1400 50  0001 C CNN
	1    6700 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 5FCDCC4D
P 6250 1400
F 0 "C26" H 6365 1446 50  0000 L CNN
F 1 "100nF" H 6365 1355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 6288 1250 50  0001 C CNN
F 3 "~" H 6250 1400 50  0001 C CNN
	1    6250 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1000 5350 1000
Connection ~ 4850 1000
Wire Wire Line
	4850 2000 5350 2000
Connection ~ 4850 2000
Wire Wire Line
	5350 1550 5350 2000
Connection ~ 5350 2000
Wire Wire Line
	5350 2000 5800 2000
Wire Wire Line
	5350 1250 5350 1000
Connection ~ 5350 1000
Wire Wire Line
	5350 1000 5800 1000
Wire Wire Line
	5800 1250 5800 1000
Connection ~ 5800 1000
Wire Wire Line
	5800 1550 5800 2000
Connection ~ 5800 2000
Wire Wire Line
	5800 1000 6250 1000
Wire Wire Line
	6250 1250 6250 1000
Connection ~ 6250 1000
Wire Wire Line
	6250 1000 6700 1000
Wire Wire Line
	6250 1550 6250 2000
Connection ~ 6250 2000
Wire Wire Line
	6250 2000 6700 2000
Wire Wire Line
	5800 2000 6250 2000
Wire Wire Line
	6250 2000 6250 2150
$Comp
L Device:C C30
U 1 1 5FD3B2D5
P 7700 1400
F 0 "C30" H 7815 1446 50  0000 L CNN
F 1 "100nF" H 7815 1355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 7738 1250 50  0001 C CNN
F 3 "~" H 7700 1400 50  0001 C CNN
	1    7700 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C32
U 1 1 5FD42E2D
P 8150 1400
F 0 "C32" H 8265 1446 50  0000 L CNN
F 1 "100nF*" H 8265 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8188 1250 50  0001 C CNN
F 3 "~" H 8150 1400 50  0001 C CNN
	1    8150 1400
	1    0    0    -1  
$EndComp
Connection ~ 7250 2000
Wire Wire Line
	7550 1000 7700 1000
Connection ~ 7700 1000
Wire Wire Line
	7700 1000 8150 1000
Connection ~ 8150 1000
Wire Wire Line
	8150 1000 8650 1000
Wire Wire Line
	7250 2000 7700 2000
Wire Wire Line
	7700 1000 7700 1250
Wire Wire Line
	8150 1000 8150 1250
Wire Wire Line
	8150 1550 8150 2000
Connection ~ 8150 2000
Wire Wire Line
	8150 2000 8650 2000
Wire Wire Line
	7700 1550 7700 2000
Connection ~ 7700 2000
Wire Wire Line
	7700 2000 8150 2000
$Comp
L Device:LED D4
U 1 1 5FDF7228
P 8650 3000
F 0 "D4" V 8689 2883 50  0000 R CNN
F 1 "LED" V 8598 2883 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 8650 3000 50  0001 C CNN
F 3 "~" H 8650 3000 50  0001 C CNN
	1    8650 3000
	0    -1   -1   0   
$EndComp
Connection ~ 9100 3250
$Comp
L Device:LED D5
U 1 1 5FE0AC7E
P 8650 5150
F 0 "D5" V 8689 5033 50  0000 R CNN
F 1 "LED" V 8598 5033 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 8650 5150 50  0001 C CNN
F 3 "~" H 8650 5150 50  0001 C CNN
	1    8650 5150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 3250 9100 3250
Wire Wire Line
	8650 4900 8650 5000
Wire Wire Line
	8650 5300 8650 5600
Wire Wire Line
	8650 5600 9100 5600
Connection ~ 9100 5600
$Comp
L Device:R R14
U 1 1 5FE371E1
P 8900 2550
F 0 "R14" V 8693 2550 50  0000 C CNN
F 1 "4K7" V 8784 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8830 2550 50  0001 C CNN
F 3 "~" H 8900 2550 50  0001 C CNN
	1    8900 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 2550 9100 2550
Connection ~ 9100 2550
Wire Wire Line
	8750 2550 8650 2550
Wire Wire Line
	8650 2550 8650 2850
Wire Wire Line
	8650 3150 8650 3250
$Comp
L Device:R R15
U 1 1 5FE61588
P 8900 4900
F 0 "R15" V 8693 4900 50  0000 C CNN
F 1 "4K7" V 8784 4900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8830 4900 50  0001 C CNN
F 3 "~" H 8900 4900 50  0001 C CNN
	1    8900 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 4900 9100 4900
Connection ~ 9100 4900
Wire Wire Line
	8650 4900 8750 4900
$Comp
L Regulator_Linear:LM317_3PinPackage U1
U 1 1 5FEA1668
P 2000 2750
F 0 "U1" H 2000 2992 50  0000 C CNN
F 1 "LM317" H 2000 2901 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 2000 3000 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 2000 2750 50  0001 C CNN
	1    2000 2750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D3
U 1 1 5FEA6685
P 2000 2400
F 0 "D3" H 2000 2616 50  0000 C CNN
F 1 "1N4007" H 2000 2525 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2000 2225 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2000 2400 50  0001 C CNN
	1    2000 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2400 1550 2400
Wire Wire Line
	1550 2400 1550 2750
Wire Wire Line
	1550 2750 1700 2750
Wire Wire Line
	2150 2400 2450 2400
Wire Wire Line
	2450 2400 2450 2750
Wire Wire Line
	2450 2750 2300 2750
$Comp
L Device:R R4
U 1 1 5FEB80D1
P 2000 3300
F 0 "R4" H 2070 3346 50  0000 L CNN
F 1 "470" H 2070 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1930 3300 50  0001 C CNN
F 3 "~" H 2000 3300 50  0001 C CNN
	1    2000 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5FEB9A8A
P 2350 3100
F 0 "R5" V 2143 3100 50  0000 C CNN
F 1 "220" V 2234 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2280 3100 50  0001 C CNN
F 3 "~" H 2350 3100 50  0001 C CNN
	1    2350 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 3150 2000 3100
Wire Wire Line
	2200 3100 2000 3100
Connection ~ 2000 3100
Wire Wire Line
	2000 3100 2000 3050
Wire Wire Line
	2500 3100 2650 3100
Wire Wire Line
	2650 3100 2650 2750
Wire Wire Line
	2650 2750 2450 2750
Connection ~ 2450 2750
$Comp
L Device:CP C1
U 1 1 5FED5196
P 600 3150
F 0 "C1" H 718 3196 50  0000 L CNN
F 1 "1000uF" H 718 3105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D12.5mm_P5.00mm" H 638 3000 50  0001 C CNN
F 3 "~" H 600 3150 50  0001 C CNN
	1    600  3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5FEEC503
P 1100 3150
F 0 "C4" H 1215 3196 50  0000 L CNN
F 1 "100nF" H 1215 3105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1138 3000 50  0001 C CNN
F 3 "~" H 1100 3150 50  0001 C CNN
	1    1100 3150
	1    0    0    -1  
$EndComp
Connection ~ 1550 2750
$Comp
L Device:C C6
U 1 1 5FF3121A
P 1550 3150
F 0 "C6" H 1665 3196 50  0000 L CNN
F 1 "100nF*" H 1665 3105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1588 3000 50  0001 C CNN
F 3 "~" H 1550 3150 50  0001 C CNN
	1    1550 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 3000 1100 2750
Connection ~ 1100 2750
Wire Wire Line
	1100 2750 1550 2750
Wire Wire Line
	1550 3000 1550 2750
Wire Wire Line
	1550 3300 1550 3600
Wire Wire Line
	1550 3600 2000 3600
Wire Wire Line
	2000 3600 2000 3450
Wire Wire Line
	1550 3600 1100 3600
Connection ~ 1550 3600
Wire Wire Line
	1100 3300 1100 3600
Connection ~ 1100 3600
$Comp
L power:+12V #PWR02
U 1 1 5FF7BCF3
P 1100 2550
F 0 "#PWR02" H 1100 2400 50  0001 C CNN
F 1 "+12V" H 1115 2723 50  0000 C CNN
F 2 "" H 1100 2550 50  0001 C CNN
F 3 "" H 1100 2550 50  0001 C CNN
	1    1100 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 2550 1100 2750
$Comp
L Device:C C12
U 1 1 5FF88F44
P 2800 3200
F 0 "C12" H 2915 3246 50  0000 L CNN
F 1 "100nF*" H 2915 3155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2838 3050 50  0001 C CNN
F 3 "~" H 2800 3200 50  0001 C CNN
	1    2800 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C15
U 1 1 5FF89512
P 3750 3200
F 0 "C15" H 3868 3246 50  0000 L CNN
F 1 "1000uF" H 3868 3155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D12.5mm_P5.00mm" H 3788 3050 50  0001 C CNN
F 3 "~" H 3750 3200 50  0001 C CNN
	1    3750 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5FF8B600
P 3300 3200
F 0 "C13" H 3415 3246 50  0000 L CNN
F 1 "100nF" H 3415 3155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3338 3050 50  0001 C CNN
F 3 "~" H 3300 3200 50  0001 C CNN
	1    3300 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3600 2800 3600
Wire Wire Line
	3300 3600 3300 3350
Connection ~ 2000 3600
Wire Wire Line
	2800 3350 2800 3600
Connection ~ 2800 3600
Wire Wire Line
	2800 3600 3300 3600
Wire Wire Line
	3300 3600 3750 3600
Wire Wire Line
	3750 3600 3750 3350
Connection ~ 3300 3600
Wire Wire Line
	2650 2750 2800 2750
Wire Wire Line
	3750 2750 3750 3050
Connection ~ 2650 2750
Wire Wire Line
	3300 3050 3300 2750
Connection ~ 3300 2750
Wire Wire Line
	3300 2750 3750 2750
Wire Wire Line
	2800 3050 2800 2750
Connection ~ 2800 2750
Wire Wire Line
	2800 2750 3300 2750
$Comp
L power:+4V #PWR011
U 1 1 5FFD6305
P 3300 2550
F 0 "#PWR011" H 3300 2400 50  0001 C CNN
F 1 "+4V" H 3315 2723 50  0000 C CNN
F 2 "" H 3300 2550 50  0001 C CNN
F 3 "" H 3300 2550 50  0001 C CNN
	1    3300 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2550 3300 2750
$Comp
L Connector:TestPoint TP2
U 1 1 5FFE45C9
P 2800 2550
F 0 "TP2" H 2858 2668 50  0000 L CNN
F 1 "+4V" H 2858 2577 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.5mm" H 3000 2550 50  0001 C CNN
F 3 "~" H 3000 2550 50  0001 C CNN
	1    2800 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2550 2800 2750
Wire Wire Line
	600  3600 600  3300
Wire Wire Line
	600  3600 1100 3600
Wire Wire Line
	600  3000 600  2750
Wire Wire Line
	600  2750 1100 2750
$Comp
L MCU_ST_STM32F1:STM32F100C8Tx U2
U 1 1 6002E720
P 3000 5850
F 0 "U2" H 3000 6800 50  0000 C CNN
F 1 "STM32F100C8Tx" H 3000 6650 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 2400 4450 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00251732.pdf" H 3000 5850 50  0001 C CNN
	1    3000 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 60059B0C
P 2000 3750
F 0 "#PWR07" H 2000 3500 50  0001 C CNN
F 1 "GND" H 2005 3577 50  0000 C CNN
F 2 "" H 2000 3750 50  0001 C CNN
F 3 "" H 2000 3750 50  0001 C CNN
	1    2000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3750 2000 3600
$Comp
L power:GND #PWR09
U 1 1 60076B1A
P 2950 7550
F 0 "#PWR09" H 2950 7300 50  0001 C CNN
F 1 "GND" H 2955 7377 50  0000 C CNN
F 2 "" H 2950 7550 50  0001 C CNN
F 3 "" H 2950 7550 50  0001 C CNN
	1    2950 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 7350 2800 7500
Wire Wire Line
	2800 7500 2900 7500
Wire Wire Line
	3100 7500 3100 7350
Wire Wire Line
	3000 7350 3000 7500
Connection ~ 3000 7500
Wire Wire Line
	3000 7500 3100 7500
Wire Wire Line
	2900 7350 2900 7500
Connection ~ 2900 7500
Wire Wire Line
	2900 7500 2950 7500
Wire Wire Line
	2950 7550 2950 7500
Connection ~ 2950 7500
Wire Wire Line
	2950 7500 3000 7500
Wire Wire Line
	2800 4350 2800 4200
Wire Wire Line
	2800 4200 2900 4200
Wire Wire Line
	3200 4200 3200 4350
Wire Wire Line
	3100 4350 3100 4200
Connection ~ 3100 4200
Wire Wire Line
	3100 4200 3200 4200
Wire Wire Line
	3000 4350 3000 4200
Connection ~ 3000 4200
Wire Wire Line
	3000 4200 3100 4200
Wire Wire Line
	2900 4350 2900 4200
Connection ~ 2900 4200
Wire Wire Line
	2900 4200 3000 4200
$Comp
L power:+3V3 #PWR010
U 1 1 600ECD6E
P 3000 3900
F 0 "#PWR010" H 3000 3750 50  0001 C CNN
F 1 "+3V3" H 3015 4073 50  0000 C CNN
F 2 "" H 3000 3900 50  0001 C CNN
F 3 "" H 3000 3900 50  0001 C CNN
	1    3000 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 60100D5B
P 4050 4400
F 0 "C17" H 4165 4446 50  0000 L CNN
F 1 "100nF" H 4165 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4088 4250 50  0001 C CNN
F 3 "~" H 4050 4400 50  0001 C CNN
	1    4050 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 601083F3
P 4500 4400
F 0 "C19" H 4615 4446 50  0000 L CNN
F 1 "100nF" H 4615 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4538 4250 50  0001 C CNN
F 3 "~" H 4500 4400 50  0001 C CNN
	1    4500 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C23
U 1 1 60108CCD
P 4950 4400
F 0 "C23" H 5065 4446 50  0000 L CNN
F 1 "100nF" H 5065 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4988 4250 50  0001 C CNN
F 3 "~" H 4950 4400 50  0001 C CNN
	1    4950 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C25
U 1 1 6010B1AC
P 5400 4400
F 0 "C25" H 5515 4446 50  0000 L CNN
F 1 "100nF" H 5515 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5438 4250 50  0001 C CNN
F 3 "~" H 5400 4400 50  0001 C CNN
	1    5400 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 6010B63C
P 5850 4400
F 0 "C27" H 5965 4446 50  0000 L CNN
F 1 "10nF" H 5965 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5888 4250 50  0001 C CNN
F 3 "~" H 5850 4400 50  0001 C CNN
	1    5850 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C29
U 1 1 6010BB23
P 6300 4400
F 0 "C29" H 6415 4446 50  0000 L CNN
F 1 "1nF" H 6415 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6338 4250 50  0001 C CNN
F 3 "~" H 6300 4400 50  0001 C CNN
	1    6300 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C14
U 1 1 60124BD1
P 3700 4400
F 0 "C14" H 3818 4446 50  0000 L CNN
F 1 "1uF" H 3818 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3738 4250 50  0001 C CNN
F 3 "~" H 3700 4400 50  0001 C CNN
	1    3700 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4200 3700 4200
Wire Wire Line
	6300 4200 6300 4250
Connection ~ 3200 4200
Wire Wire Line
	5850 4250 5850 4200
Connection ~ 5850 4200
Wire Wire Line
	5850 4200 6300 4200
Wire Wire Line
	5400 4250 5400 4200
Connection ~ 5400 4200
Wire Wire Line
	5400 4200 5850 4200
Wire Wire Line
	4950 4250 4950 4200
Wire Wire Line
	4950 4200 5400 4200
Wire Wire Line
	4500 4250 4500 4200
Wire Wire Line
	4050 4250 4050 4200
Connection ~ 4050 4200
Wire Wire Line
	4050 4200 4500 4200
Wire Wire Line
	3700 4250 3700 4200
Connection ~ 3700 4200
Wire Wire Line
	3700 4200 4050 4200
Wire Wire Line
	3700 4550 3700 4600
Wire Wire Line
	6300 4600 6300 4550
Wire Wire Line
	5850 4550 5850 4600
Connection ~ 5850 4600
Wire Wire Line
	5850 4600 6300 4600
Wire Wire Line
	5400 4550 5400 4600
Connection ~ 5400 4600
Wire Wire Line
	5400 4600 5850 4600
Wire Wire Line
	4950 4550 4950 4600
Connection ~ 4950 4600
Wire Wire Line
	4950 4600 5400 4600
Wire Wire Line
	3700 4600 4050 4600
Wire Wire Line
	4500 4550 4500 4600
Wire Wire Line
	4050 4550 4050 4600
Connection ~ 4050 4600
Wire Wire Line
	4050 4600 4500 4600
$Comp
L power:GND #PWR016
U 1 1 60286C9A
P 4750 4700
F 0 "#PWR016" H 4750 4450 50  0001 C CNN
F 1 "GND" H 4755 4527 50  0000 C CNN
F 2 "" H 4750 4700 50  0001 C CNN
F 3 "" H 4750 4700 50  0001 C CNN
	1    4750 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4700 4750 4600
Wire Wire Line
	4750 4600 4950 4600
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 602BD7A8
P 3000 4050
F 0 "FB1" H 3100 4096 50  0000 L CNN
F 1 "MI0805K400R-10" H 3100 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2930 4050 50  0001 C CNN
F 3 "~" H 3000 4050 50  0001 C CNN
	1    3000 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4150 3000 4200
Wire Wire Line
	3000 3900 3000 3950
$Comp
L Isolator:CNY17-2 U4
U 1 1 6031921C
P 5350 2850
F 0 "U4" H 5350 3175 50  0000 C CNN
F 1 "CNY17-2" H 5350 3084 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 5350 2850 50  0001 L CNN
F 3 "http://www.vishay.com/docs/83606/cny17.pdf" H 5350 2850 50  0001 L CNN
	1    5350 2850
	1    0    0    -1  
$EndComp
$Comp
L Isolator:CNY17-2 U5
U 1 1 6031A36A
P 5350 3500
F 0 "U5" H 5350 3825 50  0000 C CNN
F 1 "CNY17-2" H 5350 3734 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 5350 3500 50  0001 L CNN
F 3 "http://www.vishay.com/docs/83606/cny17.pdf" H 5350 3500 50  0001 L CNN
	1    5350 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 60342EF3
P 4750 2750
F 0 "R7" V 4543 2750 50  0000 C CNN
F 1 "1K" V 4634 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4680 2750 50  0001 C CNN
F 3 "~" H 4750 2750 50  0001 C CNN
	1    4750 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 60344718
P 4750 3400
F 0 "R8" V 4543 3400 50  0000 C CNN
F 1 "1K" V 4634 3400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4680 3400 50  0001 C CNN
F 3 "~" H 4750 3400 50  0001 C CNN
	1    4750 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 2750 5050 2750
Wire Wire Line
	4900 3400 5050 3400
Wire Wire Line
	4450 2750 4600 2750
Wire Wire Line
	4450 3400 4600 3400
Wire Wire Line
	4450 2850 4900 2850
Wire Wire Line
	4900 2850 4900 2950
Wire Wire Line
	4900 2950 5050 2950
Wire Wire Line
	4450 3500 4900 3500
Wire Wire Line
	4900 3500 4900 3600
Wire Wire Line
	4900 3600 5050 3600
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 603A4F30
P 4250 3500
F 0 "J3" H 4168 3175 50  0000 C CNN
F 1 "IN2" H 4168 3266 50  0000 C CNN
F 2 "TerminalBlock_MetzConnect:TerminalBlock_MetzConnect_Type059_RT06302HBWC_1x02_P3.50mm_Horizontal" H 4250 3500 50  0001 C CNN
F 3 "~" H 4250 3500 50  0001 C CNN
	1    4250 3500
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 603A00F0
P 4250 2850
F 0 "J2" H 4168 2525 50  0000 C CNN
F 1 "IN1" H 4168 2616 50  0000 C CNN
F 2 "TerminalBlock_MetzConnect:TerminalBlock_MetzConnect_Type059_RT06302HBWC_1x02_P3.50mm_Horizontal" H 4250 2850 50  0001 C CNN
F 3 "~" H 4250 2850 50  0001 C CNN
	1    4250 2850
	-1   0    0    1   
$EndComp
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 6044ECBC
P 4700 3050
F 0 "JP1" H 4700 2900 50  0000 C CNN
F 1 "GND_INT" H 4700 3000 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 4700 3050 50  0001 C CNN
F 3 "~" H 4700 3050 50  0001 C CNN
	1    4700 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 3050 4900 2950
Connection ~ 4900 2950
$Comp
L power:GND #PWR013
U 1 1 604902D5
P 4450 3050
F 0 "#PWR013" H 4450 2800 50  0001 C CNN
F 1 "GND" V 4455 2922 50  0000 R CNN
F 2 "" H 4450 3050 50  0001 C CNN
F 3 "" H 4450 3050 50  0001 C CNN
	1    4450 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 3050 4500 3050
$Comp
L Jumper:Jumper_2_Open JP2
U 1 1 604C3DE7
P 4700 3700
F 0 "JP2" H 4700 3550 50  0000 C CNN
F 1 "GND_INT" H 4700 3650 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 4700 3700 50  0001 C CNN
F 3 "~" H 4700 3700 50  0001 C CNN
	1    4700 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 3700 4900 3600
Connection ~ 4900 3600
$Comp
L power:GND #PWR014
U 1 1 604DAFF8
P 4450 3700
F 0 "#PWR014" H 4450 3450 50  0001 C CNN
F 1 "GND" V 4455 3572 50  0000 R CNN
F 2 "" H 4450 3700 50  0001 C CNN
F 3 "" H 4450 3700 50  0001 C CNN
	1    4450 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 3700 4500 3700
$Comp
L power:GND #PWR024
U 1 1 605177A7
P 5750 3050
F 0 "#PWR024" H 5750 2800 50  0001 C CNN
F 1 "GND" H 5755 2877 50  0000 C CNN
F 2 "" H 5750 3050 50  0001 C CNN
F 3 "" H 5750 3050 50  0001 C CNN
	1    5750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2950 5750 2950
Wire Wire Line
	5750 2950 5750 3050
$Comp
L power:GND #PWR025
U 1 1 6052F461
P 5750 3700
F 0 "#PWR025" H 5750 3450 50  0001 C CNN
F 1 "GND" H 5755 3527 50  0000 C CNN
F 2 "" H 5750 3700 50  0001 C CNN
F 3 "" H 5750 3700 50  0001 C CNN
	1    5750 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3600 5750 3600
Wire Wire Line
	5750 3600 5750 3700
$Comp
L Device:R R9
U 1 1 6054EE26
P 6100 2850
F 0 "R9" V 5893 2850 50  0000 C CNN
F 1 "1K" V 5984 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6030 2850 50  0001 C CNN
F 3 "~" H 6100 2850 50  0001 C CNN
	1    6100 2850
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 60566D43
P 6100 3500
F 0 "R10" V 5893 3500 50  0000 C CNN
F 1 "1K" V 5984 3500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6030 3500 50  0001 C CNN
F 3 "~" H 6100 3500 50  0001 C CNN
	1    6100 3500
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR031
U 1 1 605B195A
P 6350 2750
F 0 "#PWR031" H 6350 2600 50  0001 C CNN
F 1 "+3V3" H 6365 2923 50  0000 C CNN
F 2 "" H 6350 2750 50  0001 C CNN
F 3 "" H 6350 2750 50  0001 C CNN
	1    6350 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2850 6350 2850
Wire Wire Line
	6350 2850 6350 2750
$Comp
L power:+3V3 #PWR032
U 1 1 605CB0D4
P 6350 3400
F 0 "#PWR032" H 6350 3250 50  0001 C CNN
F 1 "+3V3" H 6365 3573 50  0000 C CNN
F 2 "" H 6350 3400 50  0001 C CNN
F 3 "" H 6350 3400 50  0001 C CNN
	1    6350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3500 6350 3500
Wire Wire Line
	6350 3500 6350 3400
Wire Wire Line
	5650 2850 5850 2850
Wire Wire Line
	5650 3500 5850 3500
Text GLabel 6000 3000 2    50   Input ~ 0
IN1
Wire Wire Line
	6000 3000 5850 3000
Wire Wire Line
	5850 3000 5850 2850
Connection ~ 5850 2850
Wire Wire Line
	5850 2850 5950 2850
Text GLabel 6000 3650 2    50   Input ~ 0
IN2
Wire Wire Line
	6000 3650 5850 3650
Wire Wire Line
	5850 3650 5850 3500
Connection ~ 5850 3500
Wire Wire Line
	5850 3500 5950 3500
$Comp
L Connector:Screw_Terminal_01x03 J7
U 1 1 6038C064
P 7800 3000
F 0 "J7" H 8050 2950 50  0000 C CNN
F 1 "DS18B20" H 8050 3050 50  0000 C CNN
F 2 "TerminalBlock_MetzConnect:TerminalBlock_MetzConnect_Type059_RT06303HBWC_1x03_P3.50mm_Horizontal" H 7800 3000 50  0001 C CNN
F 3 "~" H 7800 3000 50  0001 C CNN
	1    7800 3000
	1    0    0    1   
$EndComp
$Comp
L Device:C C31
U 1 1 60780877
P 7900 2600
F 0 "C31" V 7648 2600 50  0000 C CNN
F 1 "100nF" V 7739 2600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7938 2450 50  0001 C CNN
F 3 "~" H 7900 2600 50  0001 C CNN
	1    7900 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 2600 8150 2600
$Comp
L Device:R R11
U 1 1 6084A6DF
P 7250 2800
F 0 "R11" H 7180 2754 50  0000 R CNN
F 1 "4K7" H 7180 2845 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7180 2800 50  0001 C CNN
F 3 "~" H 7250 2800 50  0001 C CNN
	1    7250 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	7250 2950 7250 3000
Connection ~ 7250 3000
Wire Wire Line
	7250 3000 7200 3000
Wire Wire Line
	7250 2650 7250 2600
Wire Wire Line
	7250 2600 7500 2600
Wire Wire Line
	7600 2900 7500 2900
Wire Wire Line
	7500 2900 7500 2600
Connection ~ 7500 2600
Wire Wire Line
	7500 2600 7750 2600
Text GLabel 7250 3200 3    50   Input ~ 0
DS18B20
Wire Wire Line
	7250 3000 7600 3000
Wire Wire Line
	7250 3200 7250 3000
$Comp
L power:GND #PWR039
U 1 1 6098E1DC
P 7500 3400
F 0 "#PWR039" H 7500 3150 50  0001 C CNN
F 1 "GND" H 7505 3227 50  0000 C CNN
F 2 "" H 7500 3400 50  0001 C CNN
F 3 "" H 7500 3400 50  0001 C CNN
	1    7500 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR040
U 1 1 6079CA6E
P 8150 2600
F 0 "#PWR040" H 8150 2350 50  0001 C CNN
F 1 "GND" V 8155 2472 50  0000 R CNN
F 2 "" H 8150 2600 50  0001 C CNN
F 3 "" H 8150 2600 50  0001 C CNN
	1    8150 2600
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR036
U 1 1 60746878
P 7100 2500
F 0 "#PWR036" H 7100 2350 50  0001 C CNN
F 1 "+3V3" H 7115 2673 50  0000 C CNN
F 2 "" H 7100 2500 50  0001 C CNN
F 3 "" H 7100 2500 50  0001 C CNN
	1    7100 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2500 7100 2600
Connection ~ 7250 2600
Wire Wire Line
	7250 2600 7100 2600
Connection ~ 7100 2600
Wire Wire Line
	7100 2600 6900 2600
Wire Wire Line
	6900 2600 6900 2700
Wire Wire Line
	6900 3300 6900 3400
$Comp
L power:GND #PWR035
U 1 1 60761D72
P 6900 3400
F 0 "#PWR035" H 6900 3150 50  0001 C CNN
F 1 "GND" H 6905 3227 50  0000 C CNN
F 2 "" H 6900 3400 50  0001 C CNN
F 3 "" H 6900 3400 50  0001 C CNN
	1    6900 3400
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:DS18B20 U6
U 1 1 606ABAC2
P 6900 3000
F 0 "U6" H 6670 3046 50  0000 R CNN
F 1 "DS18B20" H 6670 2955 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5900 2750 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS18B20.pdf" H 6750 3250 50  0001 C CNN
	1    6900 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3100 7500 3100
Wire Wire Line
	7500 3100 7500 3400
Text GLabel 1900 6850 0    50   Input ~ 0
SPI_CS
Wire Wire Line
	1900 6850 2300 6850
Text GLabel 1900 6950 0    50   Input ~ 0
SPI_CLK
Text GLabel 1900 7050 0    50   Input ~ 0
SPI_MISO
Text GLabel 1900 7150 0    50   Input ~ 0
SPI_MOSI
Wire Wire Line
	1900 6950 2300 6950
Wire Wire Line
	1900 7050 2300 7050
Wire Wire Line
	1900 7150 2300 7150
Text GLabel 1900 6750 0    50   Input ~ 0
I2C_SDA
Wire Wire Line
	1900 6750 2300 6750
Text GLabel 1900 6650 0    50   Input ~ 0
I2C_SCK
Wire Wire Line
	1900 6650 2300 6650
Text GLabel 4150 6450 2    50   Input ~ 0
DS18B20
Wire Wire Line
	3600 6450 4150 6450
Text GLabel 4150 6550 2    50   Input ~ 0
UART1_TX
Text GLabel 4150 6650 2    50   Input ~ 0
UART1_RX
Wire Wire Line
	3600 6550 4150 6550
Wire Wire Line
	3600 6650 4150 6650
Text GLabel 4150 6750 2    50   Input ~ 0
LCD2WIRE_DATA
Wire Wire Line
	3600 6750 4150 6750
Text GLabel 4150 6850 2    50   Input ~ 0
LCD2WIRE_CLK
Wire Wire Line
	3600 6850 4150 6850
Text GLabel 4150 5850 2    50   Input ~ 0
UART2_TX
Text GLabel 4150 5950 2    50   Input ~ 0
UART2_RX
Wire Wire Line
	3600 5850 4150 5850
Wire Wire Line
	4150 5950 3600 5950
Text GLabel 4150 6050 2    50   Input ~ 0
HW_ADDR1
Text GLabel 4150 6150 2    50   Input ~ 0
HW_ADDR2
Text GLabel 4150 6250 2    50   Input ~ 0
HW_ADDR3
Text GLabel 4150 6350 2    50   Input ~ 0
HW_ADDR4
Wire Wire Line
	3600 6050 4150 6050
Wire Wire Line
	3600 6150 4150 6150
Wire Wire Line
	3600 6250 4150 6250
Wire Wire Line
	3600 6350 4150 6350
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J4
U 1 1 60C6F797
P 5800 5500
F 0 "J4" H 5850 6017 50  0000 C CNN
F 1 "B2B_A" H 5850 5926 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x07_P2.54mm_Vertical" H 5800 5500 50  0001 C CNN
F 3 "~" H 5800 5500 50  0001 C CNN
	1    5800 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J5
U 1 1 60C838EE
P 5800 6550
F 0 "J5" H 5850 7067 50  0000 C CNN
F 1 "B2B_B" H 5850 6976 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x07_P2.54mm_Vertical" H 5800 6550 50  0001 C CNN
F 3 "~" H 5800 6550 50  0001 C CNN
	1    5800 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5150 5550 5200
$Comp
L power:+12V #PWR026
U 1 1 60D1384D
P 6450 5350
F 0 "#PWR026" H 6450 5200 50  0001 C CNN
F 1 "+12V" H 6465 5523 50  0000 C CNN
F 2 "" H 6450 5350 50  0001 C CNN
F 3 "" H 6450 5350 50  0001 C CNN
	1    6450 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5200 6150 5200
Wire Wire Line
	6150 5200 6150 5150
Wire Wire Line
	5400 5300 5400 5250
Wire Wire Line
	6100 5300 6300 5300
Wire Wire Line
	6300 5300 6300 5250
$Comp
L power:+4V #PWR033
U 1 1 60D81225
P 6600 5450
F 0 "#PWR033" H 6600 5300 50  0001 C CNN
F 1 "+4V" H 6615 5623 50  0000 C CNN
F 2 "" H 6600 5450 50  0001 C CNN
F 3 "" H 6600 5450 50  0001 C CNN
	1    6600 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5350 5250 5400
Wire Wire Line
	5250 5400 5600 5400
Wire Wire Line
	6100 5400 6450 5400
Wire Wire Line
	6450 5400 6450 5350
Wire Wire Line
	5100 5450 5100 5500
Wire Wire Line
	5100 5500 5600 5500
Wire Wire Line
	6100 5500 6600 5500
Wire Wire Line
	6600 5500 6600 5450
$Comp
L power:GND #PWR020
U 1 1 60E13E3E
P 5500 5850
F 0 "#PWR020" H 5500 5600 50  0001 C CNN
F 1 "GND" H 5505 5677 50  0000 C CNN
F 2 "" H 5500 5850 50  0001 C CNN
F 3 "" H 5500 5850 50  0001 C CNN
	1    5500 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 60E142C5
P 6200 5850
F 0 "#PWR027" H 6200 5600 50  0001 C CNN
F 1 "GND" H 6205 5677 50  0000 C CNN
F 2 "" H 6200 5850 50  0001 C CNN
F 3 "" H 6200 5850 50  0001 C CNN
	1    6200 5850
	1    0    0    -1  
$EndComp
Text GLabel 5450 6250 0    50   Input ~ 0
UART1_TX
Wire Wire Line
	5600 6250 5450 6250
Text GLabel 6300 6250 2    50   Input ~ 0
UART1_RX
Text GLabel 5450 6450 0    50   Input ~ 0
UART2_TX
$Comp
L power:GND #PWR019
U 1 1 60EF8D99
P 5450 6550
F 0 "#PWR019" H 5450 6300 50  0001 C CNN
F 1 "GND" V 5455 6422 50  0000 R CNN
F 2 "" H 5450 6550 50  0001 C CNN
F 3 "" H 5450 6550 50  0001 C CNN
	1    5450 6550
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 6250 6300 6250
Text GLabel 6300 6450 2    50   Input ~ 0
UART2_RX
Text GLabel 5450 6650 0    50   Input ~ 0
SPI_CS
Text GLabel 6300 6650 2    50   Input ~ 0
SPI_CLK
Text GLabel 5450 6750 0    50   Input ~ 0
SPI_MISO
Text GLabel 6300 6750 2    50   Input ~ 0
SPI_MOSI
Text GLabel 5450 6350 0    50   Input ~ 0
I2C_SCK
Text GLabel 6300 6350 2    50   Input ~ 0
I2C_SDA
Wire Wire Line
	5450 6650 5600 6650
Wire Wire Line
	5450 6750 5600 6750
Wire Wire Line
	6100 6650 6300 6650
Wire Wire Line
	6100 6750 6300 6750
Wire Wire Line
	5450 6550 5600 6550
$Comp
L power:GND #PWR030
U 1 1 61131B98
P 6300 6550
F 0 "#PWR030" H 6300 6300 50  0001 C CNN
F 1 "GND" V 6305 6422 50  0000 R CNN
F 2 "" H 6300 6550 50  0001 C CNN
F 3 "" H 6300 6550 50  0001 C CNN
	1    6300 6550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 6550 6300 6550
Wire Wire Line
	6100 6450 6300 6450
Wire Wire Line
	6100 6350 6300 6350
Wire Wire Line
	5600 6350 5450 6350
Wire Wire Line
	5600 6450 5450 6450
Text GLabel 4150 5650 2    50   Input ~ 0
IO1
Text GLabel 4150 5750 2    50   Input ~ 0
IO2
Wire Wire Line
	3600 5650 4150 5650
Wire Wire Line
	3600 5750 4150 5750
Text GLabel 5450 6850 0    50   Input ~ 0
IO1
Text GLabel 6300 6850 2    50   Input ~ 0
IO2
Wire Wire Line
	5450 6850 5600 6850
Wire Wire Line
	6100 6850 6300 6850
Wire Wire Line
	6100 5800 6200 5800
Wire Wire Line
	6200 5800 6200 5850
Wire Wire Line
	5600 5800 5500 5800
Wire Wire Line
	5500 5800 5500 5850
Text GLabel 5500 5600 0    50   Input ~ 0
HW_ADDR1
Text GLabel 6200 5600 2    50   Input ~ 0
HW_ADDR2
Text GLabel 5500 5700 0    50   Input ~ 0
HW_ADDR3
Text GLabel 6200 5700 2    50   Input ~ 0
HW_ADDR4
Wire Wire Line
	5500 5600 5600 5600
Wire Wire Line
	6100 5700 6200 5700
Text GLabel 1900 6250 0    50   Input ~ 0
IN1
Text GLabel 1900 6350 0    50   Input ~ 0
IN2
Text GLabel 1900 6450 0    50   Input ~ 0
OUT1
Text GLabel 1900 6550 0    50   Input ~ 0
OUT2
Wire Wire Line
	1900 6250 2300 6250
Wire Wire Line
	1900 6350 2300 6350
Wire Wire Line
	1900 6450 2300 6450
Wire Wire Line
	1900 6550 2300 6550
Text GLabel 4150 6950 2    50   Input ~ 0
SWDIO
Text GLabel 4150 7050 2    50   Input ~ 0
SWCLK
Wire Wire Line
	3600 6950 4150 6950
Wire Wire Line
	3600 7050 4150 7050
Text GLabel 1900 4950 0    50   Input ~ 0
OSC_IN
Wire Wire Line
	1900 4950 2300 4950
Text GLabel 1900 5050 0    50   Input ~ 0
OSC_OUT
Wire Wire Line
	1900 5050 2300 5050
$Comp
L Device:R R2
U 1 1 6163E6E1
P 1400 4750
F 0 "R2" V 1193 4750 50  0000 C CNN
F 1 "10K" V 1284 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1330 4750 50  0001 C CNN
F 3 "~" H 1400 4750 50  0001 C CNN
	1    1400 4750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 6166B5E3
P 1100 4750
F 0 "#PWR04" H 1100 4500 50  0001 C CNN
F 1 "GND" V 1105 4622 50  0000 R CNN
F 2 "" H 1100 4750 50  0001 C CNN
F 3 "" H 1100 4750 50  0001 C CNN
	1    1100 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	1100 4750 1250 4750
Text GLabel 1900 4550 0    50   Input ~ 0
RESET
Wire Wire Line
	1550 4750 2300 4750
$Comp
L Device:R R6
U 1 1 61714F2F
P 2350 4200
F 0 "R6" V 2557 4200 50  0000 C CNN
F 1 "10K" V 2466 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2280 4200 50  0001 C CNN
F 3 "~" H 2350 4200 50  0001 C CNN
	1    2350 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 4550 2100 4550
Wire Wire Line
	2500 4200 2800 4200
Connection ~ 2800 4200
Wire Wire Line
	2200 4200 2100 4200
Wire Wire Line
	2100 4200 2100 4550
Connection ~ 2100 4550
Wire Wire Line
	2100 4550 2300 4550
$Comp
L Device:C C7
U 1 1 617C3C9F
P 1650 4200
F 0 "C7" V 1902 4200 50  0000 C CNN
F 1 "100nF" V 1811 4200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1688 4050 50  0001 C CNN
F 3 "~" H 1650 4200 50  0001 C CNN
	1    1650 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 617EF7CD
P 1100 4200
F 0 "#PWR03" H 1100 3950 50  0001 C CNN
F 1 "GND" V 1105 4072 50  0000 R CNN
F 2 "" H 1100 4200 50  0001 C CNN
F 3 "" H 1100 4200 50  0001 C CNN
	1    1100 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	1100 4200 1500 4200
Wire Wire Line
	1800 4200 2100 4200
Connection ~ 2100 4200
Connection ~ 6300 4200
Wire Wire Line
	7600 4300 7450 4300
Wire Wire Line
	7450 4300 7450 4400
Wire Wire Line
	7450 4400 7600 4400
Wire Wire Line
	7450 4400 7450 4600
Wire Wire Line
	7450 4600 7600 4600
Connection ~ 7450 4400
$Comp
L power:GND #PWR038
U 1 1 6190A19A
P 7450 4700
F 0 "#PWR038" H 7450 4450 50  0001 C CNN
F 1 "GND" H 7455 4527 50  0000 C CNN
F 2 "" H 7450 4700 50  0001 C CNN
F 3 "" H 7450 4700 50  0001 C CNN
	1    7450 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4600 7450 4700
Connection ~ 7450 4600
Text GLabel 8250 4200 2    50   Input ~ 0
SWDIO
Wire Wire Line
	8100 4200 8250 4200
Text GLabel 8250 4300 2    50   Input ~ 0
SWCLK
Wire Wire Line
	8100 4300 8250 4300
Text GLabel 8250 4600 2    50   Input ~ 0
RESET
Wire Wire Line
	8100 4600 8150 4600
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J8
U 1 1 6187B111
P 7800 4400
F 0 "J8" H 7850 4817 50  0000 C CNN
F 1 "PROG" H 7850 4726 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical" H 7800 4400 50  0001 C CNN
F 3 "~" H 7800 4400 50  0001 C CNN
	1    7800 4400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Open_Dual SW1
U 1 1 61A11709
P 7650 5300
F 0 "SW1" H 7650 5510 50  0000 C CNN
F 1 "RESET" H 7650 5419 50  0000 C CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 7650 5500 50  0001 C CNN
F 3 "~" H 7650 5500 50  0001 C CNN
	1    7650 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 5300 7350 5300
Wire Wire Line
	7350 5300 7350 5150
Wire Wire Line
	7350 5050 7950 5050
Wire Wire Line
	7950 5050 7950 5300
Wire Wire Line
	7950 5300 7850 5300
Wire Wire Line
	7450 5500 7350 5500
Wire Wire Line
	7350 5500 7350 5600
Wire Wire Line
	7350 5600 7950 5600
Wire Wire Line
	7950 5600 7950 5500
Wire Wire Line
	7950 5500 7850 5500
$Comp
L power:GND #PWR037
U 1 1 61A751AD
P 7200 5200
F 0 "#PWR037" H 7200 4950 50  0001 C CNN
F 1 "GND" H 7205 5027 50  0000 C CNN
F 2 "" H 7200 5200 50  0001 C CNN
F 3 "" H 7200 5200 50  0001 C CNN
	1    7200 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 5200 7200 5150
Wire Wire Line
	7200 5150 7350 5150
Connection ~ 7350 5150
Wire Wire Line
	7350 5150 7350 5050
Wire Wire Line
	7950 5500 8150 5500
Wire Wire Line
	8150 5500 8150 4600
Connection ~ 7950 5500
Connection ~ 8150 4600
Wire Wire Line
	8150 4600 8250 4600
$Comp
L Device:Crystal XTAL1
U 1 1 61B84709
P 1150 5650
F 0 "XTAL1" H 1150 5918 50  0000 C CNN
F 1 "8,000 MHz" H 1150 5827 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_HC49-SD" H 1150 5650 50  0001 C CNN
F 3 "~" H 1150 5650 50  0001 C CNN
	1    1150 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61B8736B
P 1350 5900
F 0 "R1" H 1280 5854 50  0000 R CNN
F 1 "220" H 1280 5945 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1280 5900 50  0001 C CNN
F 3 "~" H 1350 5900 50  0001 C CNN
	1    1350 5900
	-1   0    0    1   
$EndComp
Text GLabel 900  6100 0    50   Input ~ 0
OSC_IN
Text GLabel 900  6200 0    50   Input ~ 0
OSC_OUT
Wire Wire Line
	950  5650 1000 5650
Wire Wire Line
	1300 5650 1350 5650
Wire Wire Line
	1350 5650 1350 5750
Wire Wire Line
	1350 6200 1350 6050
Wire Wire Line
	900  6200 1350 6200
Wire Wire Line
	900  6100 950  6100
Wire Wire Line
	950  6100 950  5650
$Comp
L Device:C C3
U 1 1 61D1F9FC
P 1000 5150
F 0 "C3" H 885 5104 50  0000 R CNN
F 1 "22pF*" H 885 5195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1038 5000 50  0001 C CNN
F 3 "~" H 1000 5150 50  0001 C CNN
	1    1000 5150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C2
U 1 1 61D20629
P 600 5150
F 0 "C2" H 485 5104 50  0000 R CNN
F 1 "22pF" H 485 5195 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 638 5000 50  0001 C CNN
F 3 "~" H 600 5150 50  0001 C CNN
	1    600  5150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C5
U 1 1 61D207CD
P 1500 5450
F 0 "C5" H 1385 5404 50  0000 R CNN
F 1 "22pF" H 1385 5495 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 1538 5300 50  0001 C CNN
F 3 "~" H 1500 5450 50  0001 C CNN
	1    1500 5450
	-1   0    0    1   
$EndComp
$Comp
L Device:C C9
U 1 1 61D20F42
P 1900 5450
F 0 "C9" H 1785 5404 50  0000 R CNN
F 1 "22pF*" H 1785 5495 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1938 5300 50  0001 C CNN
F 3 "~" H 1900 5450 50  0001 C CNN
	1    1900 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 5650 1500 5650
Connection ~ 1350 5650
Wire Wire Line
	1500 5600 1500 5650
Connection ~ 1500 5650
Wire Wire Line
	1900 5650 1900 5600
Wire Wire Line
	1500 5650 1900 5650
Wire Wire Line
	1900 5300 1900 5250
Wire Wire Line
	1900 5250 1500 5250
Wire Wire Line
	1500 5250 1500 5300
Wire Wire Line
	950  5650 750  5650
Wire Wire Line
	750  5650 750  5350
Wire Wire Line
	750  5350 600  5350
Wire Wire Line
	600  5350 600  5300
Connection ~ 950  5650
Wire Wire Line
	750  5350 1000 5350
Wire Wire Line
	1000 5350 1000 5300
Connection ~ 750  5350
Wire Wire Line
	600  5000 600  4950
Wire Wire Line
	600  4950 1000 4950
Wire Wire Line
	1000 4950 1000 5000
$Comp
L power:GND #PWR01
U 1 1 61F0803A
P 1050 4950
F 0 "#PWR01" H 1050 4700 50  0001 C CNN
F 1 "GND" V 1055 4822 50  0000 R CNN
F 2 "" H 1050 4950 50  0001 C CNN
F 3 "" H 1050 4950 50  0001 C CNN
	1    1050 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1000 4950 1050 4950
Connection ~ 1000 4950
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 61F5CDEA
P 5900 7300
F 0 "J6" H 5980 7292 50  0000 L CNN
F 1 "LCD2WIRE" H 5980 7201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5900 7300 50  0001 C CNN
F 3 "~" H 5900 7300 50  0001 C CNN
	1    5900 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 61F62CF5
P 5550 7200
F 0 "#PWR022" H 5550 7050 50  0001 C CNN
F 1 "+5V" V 5565 7328 50  0000 L CNN
F 2 "" H 5550 7200 50  0001 C CNN
F 3 "" H 5550 7200 50  0001 C CNN
	1    5550 7200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5550 7200 5700 7200
$Comp
L power:GND #PWR023
U 1 1 61F9BE2B
P 5550 7300
F 0 "#PWR023" H 5550 7050 50  0001 C CNN
F 1 "GND" V 5555 7172 50  0000 R CNN
F 2 "" H 5550 7300 50  0001 C CNN
F 3 "" H 5550 7300 50  0001 C CNN
	1    5550 7300
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 7300 5700 7300
Text GLabel 5550 7400 0    50   Input ~ 0
LCD2WIRE_DATA
Text GLabel 5550 7500 0    50   Input ~ 0
LCD2WIRE_CLK
Wire Wire Line
	5550 7400 5700 7400
Wire Wire Line
	5550 7500 5700 7500
$Comp
L power:GND #PWR06
U 1 1 61DF4F41
P 1950 5250
F 0 "#PWR06" H 1950 5000 50  0001 C CNN
F 1 "GND" V 1955 5122 50  0000 R CNN
F 2 "" H 1950 5250 50  0001 C CNN
F 3 "" H 1950 5250 50  0001 C CNN
	1    1950 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 5250 1950 5250
Connection ~ 1900 5250
Wire Wire Line
	5550 5200 5600 5200
Wire Wire Line
	5600 5300 5400 5300
$Comp
L power:+5V #PWR0101
U 1 1 62317CE3
P 6300 5250
F 0 "#PWR0101" H 6300 5100 50  0001 C CNN
F 1 "+5V" H 6315 5423 50  0000 C CNN
F 2 "" H 6300 5250 50  0001 C CNN
F 3 "" H 6300 5250 50  0001 C CNN
	1    6300 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0103
U 1 1 6231A324
P 6150 5150
F 0 "#PWR0103" H 6150 5000 50  0001 C CNN
F 1 "+3V3" H 6165 5323 50  0000 C CNN
F 2 "" H 6150 5150 50  0001 C CNN
F 3 "" H 6150 5150 50  0001 C CNN
	1    6150 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0104
U 1 1 6231CD24
P 5250 5350
F 0 "#PWR0104" H 5250 5200 50  0001 C CNN
F 1 "+12V" H 5265 5523 50  0000 C CNN
F 2 "" H 5250 5350 50  0001 C CNN
F 3 "" H 5250 5350 50  0001 C CNN
	1    5250 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+4V #PWR0105
U 1 1 6231F5F9
P 5100 5450
F 0 "#PWR0105" H 5100 5300 50  0001 C CNN
F 1 "+4V" H 5115 5623 50  0000 C CNN
F 2 "" H 5100 5450 50  0001 C CNN
F 3 "" H 5100 5450 50  0001 C CNN
	1    5100 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0102
U 1 1 623471A4
P 5550 5150
F 0 "#PWR0102" H 5550 5000 50  0001 C CNN
F 1 "+3V3" H 5565 5323 50  0000 C CNN
F 2 "" H 5550 5150 50  0001 C CNN
F 3 "" H 5550 5150 50  0001 C CNN
	1    5550 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 62347826
P 5400 5250
F 0 "#PWR0106" H 5400 5100 50  0001 C CNN
F 1 "+5V" H 5415 5423 50  0000 C CNN
F 2 "" H 5400 5250 50  0001 C CNN
F 3 "" H 5400 5250 50  0001 C CNN
	1    5400 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 623580C6
P 10850 1250
F 0 "TP5" H 10908 1368 50  0000 L CNN
F 1 "GND" H 10908 1277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.5mm" H 11050 1250 50  0001 C CNN
F 3 "~" H 11050 1250 50  0001 C CNN
	1    10850 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 6235E98A
P 10850 1350
F 0 "#PWR015" H 10850 1100 50  0001 C CNN
F 1 "GND" H 10855 1177 50  0000 C CNN
F 2 "" H 10850 1350 50  0001 C CNN
F 3 "" H 10850 1350 50  0001 C CNN
	1    10850 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 1250 10850 1350
Wire Wire Line
	4500 4200 4950 4200
Connection ~ 4500 4200
Connection ~ 4950 4200
Wire Wire Line
	4500 4600 4750 4600
Connection ~ 4500 4600
Connection ~ 4750 4600
Wire Wire Line
	6300 4200 7600 4200
Wire Wire Line
	6100 5600 6200 5600
Wire Wire Line
	5500 5700 5600 5700
$EndSCHEMATC

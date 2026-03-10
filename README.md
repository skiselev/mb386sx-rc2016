# Alsea River 386SX Motherboard
An 386SX/486SLC Motherboard based on SARC RC2016 Chipset

## Introduction

The origin of this project is the [M396F motherboard replica by Marco Both](https://github.com/Marco-Both/M396F-Replika). Marco replicated the PCB layout of a certain revision of M396F motherboard. He didn't provide the schematic.

I reverse engineered the schematic based on his PCB layout and made a PCB layout using that schematic similar to the Marco's replica. This was the initial version of this project - [version 1.0](https://github.com/skiselev/mb386sx-rc2016/tree/v1.0).

The subsequent versions contain the following improvements:

* Use Dallas DS12885 RTC/NVRAM (aka CMOS) with a CR2032 battery instead of Motorola MC146818 with a NiCad battery. This reduces the likliehood of motherboard damage due to a leaking battery. A more modern RTC IC also reduces the number of components
* Use SST39SF010A Flash ROM instead of an EPROM or OTP ROM. The Flash ROM is in-circuit programmable, allowing BIOS and BIOS extension upgrades. It has a bigger 128 KiB capacity, all of which is mapped to the CPU memory. The SST39SF010A is a currently manufactured part
* Use PS/2 compatible keyboard controller, VIA VT82C42N or similar. The motherboard implements a dual PS/2 port with both keyboard and mouse signals. A PS/2 keyboard/mouse spliter cable can be used to connect both a keyboard and a mouse. This functionality has not been tested yet
* Use ATX case compatible mounting holes placement. Implement ATX power supply power on circuit. This allows using the motherboard with more modern ATX cases and power supplies
* Use DIP-8 / half-can crystal oscillators for the CPU and FPU clocks. This removes the need for a difficult to get clock synthesizer IC used in the original motherboard, while still allowing changing the CPU and the FPU clock by switching the oscillators
* Implement headers for the CPU. The CPU can be either installed on a [386SX Universal Socket Adapter](https://github.com/skiselev/i386sx-socket), or soldered down on the motherboard

![Alsea River 386SX - Assembled Board](images/Alsea_River-386SX-Assembled_Board.jpg)

## Status

* Board version 2.2 has the fix for the BIOS /OE issue, but it has not been actually built and tested yet
* Board version 2.1 boots up to BIOS, DOS, and Linux, after performing the fix described in the Known Issues section
* The following CPUs have been tested with the board version 2.1:
  * Intel 386SX, part name: NG80386SX33. Installed on a 386SX Universal Socket Adapter, configured for 5V. Runs well at 33 MHz.
  * Texas Instruments 486SLCX2-50, part name: TI486SXLC2-G50-WN. Installed on a 386SX Universal Socket Adapter, configured for 3.3V. Runs well at 25 MHz, 33 MHz, and 40 MHz. Unable to enable clock doubling yet.
  * Texas Instruments 486SLCX2-50, part name: TI486SXLC2-G50-PQ. Installed on a 386SX Universal Socket Adapter, configured for 3.3V. Runs well at 25 MHz, 33 MHz, and 40 MHz. Unable to enable clock doubling yet.
  * Texas Instruments 486SLC/E-33. part name: TX486SLC/E-33PAF. Installed on a 386SX Universal Socket Adapter, configured for 5V. Runs well at 33 MHz. Also works at 40 MHz, although gets quite hot. Stability has not been verified yet with 40 MHz.
* PS/2 mouse tested and works properly with both 2 button and 3 button wheeled mouse using [CuteMouse driver](https://cutemouse.sourceforge.net/).
* AMI BIOS 5.10 and [Award BIOS 4.50](https://github.com/skiselev/mb386sx-rc2016/tree/main/BIOS) from other SARC RC2014 based motherboards tested. The latter provides better configurability using MODBIN.

## Hardware Documentation

### Schematic and PCB Layout

* [Schematic - Version 2.2](KiCad/AT386SX-Schematic-2.2.pdf)
* [PCB Layout - Version 2.2](KiCad/AT386SX-Board-2.2.pdf)

### Bill of Materials

#### Version 2.2

[Alsea River 386SX Motherboard project on Mouser.com](https://www.mouser.com/Tools/Project/Share?AccessID=6eadf3eb2e) - View and order most components except of the CPU, chipset, keyboard controller, SIMM-30 sockets, and the PCB.

Component type     | Reference | Description                                          | Quantity | Possible sources and notes 
------------------ | --------- | ---------------------------------------------------- | -------- | --------------------------
PCB                |           | Alsea River 386SX PCB - Version 2.1                  | 1        | Order from a PCB manufacturer of your choice using provided Gerber or KiCad files
Integrated Circuit | U1        | 386SX CPU, TI486SXLC, Cx486SLC CPU, 100 pin BQFP     | 1        | eBay
Integrated Circuit | U2        | 387SX FPU or compatible, 68 pin PLCC                 | 1        | eBay. Optional
Integrated Circuit | U3        | SARC RC2016A5, 208 pin PQFP                          | 1        | UTsource
Integrated Circuit | U4        | DS12885 RTC, 24 pin DIP                              | 1        | Mouser [700-DS12885](https://www.mouser.com/ProductDetail/700-DS12885)
Integrated Circuit | U5        | VT82C42N keyboard/mouse controller, 40 pin DIP       | 1        | eBay
Integrated Circuit | U6        | SST39SF010A 128 KiB Flash ROM, 32 pin DIP            | 1        | Mouser [804-39SF010A7CPHE](https://www.mouser.com/ProductDetail/804-39SF010A7CPHE)
Integrated Circuit | U7        | 74HC05 inverters with open drain outputs, 14 pin DIP | 1        | Mouser [595-SN74AHC05N](https://www.mouser.com/ProductDetail/595-SN74AHC05N), [595-SN74HC05N](https://www.mouser.com/ProductDetail/595-SN74HC05N), [595-SN74LS06N](https://www.mouser.com/ProductDetail/595-SN74LS06N)
Integrated Circuit | U8        | 74HCT14 inverters with Schmitt trigger inputs, 14 pin DIP | 1   | Mouser [595-SN74AHCT14N](https://www.mouser.com/ProductDetail/595-SN74AHCT14N), [595-SN74HCT14N](https://www.mouser.com/ProductDetail/595-SN74HCT14N)
Integrated Circuit | U9        | 74HCT74 D-flip flops, 14 pin DIP                     | 1        | Mouser [595-SN74AHCT74N](https://www.mouser.com/ProductDetail/595-SN74AHCT74N), [595-SN74HCT74N](https://www.mouser.com/ProductDetail/595-SN74HCT74N), 
Integrated Circuit | U10       | LM7905 -5V voltage regulator, TO-220-3               | 1        | Mouser [863-MC7905CTG](https://www.mouser.com/ProductDetail/863-MC7905CTG), [926-LM7905CT/NOPB](https://www.mouser.com/ProductDetail/926-LM7905CT-NOPB)
Transistor         | Q1        | 2N3904, NPN transistor, TO-92                        | 1        | Mouser [512-2N3904TA](https://www.mouser.com/ProductDetail/512-2N3904TA)
LED                | D1        | 3 mm LED, blue                                       | 1        | Optional. Mouser [604-WP710A10QBD/D](https://www.mouser.com/ProductDetail/604-WP710A10QBD-D), [696-SSL-LX3054USBD](https://www.mouser.com/ProductDetail/696-SSL-LX3054USBD), [749-3BWD-S](https://www.mouser.com/ProductDetail/749-3BWD-S)
LED                | D2        | 3 mm LED, bi-color red/green                         | 1        | Optional. Mouser [604-WP937EGW](https://www.mouser.com/ProductDetail/604-WP937EGW), [696-SSL-LX3054IGW](https://www.mouser.com/ProductDetail/696-SSL-LX3054IGW), [749-3BC](https://www.mouser.com/ProductDetail/749-3BC)
LED Spacer         | D1, D2    | Spacer for 3 mm LEDs, 3mm height                     | 2        | Optional. Mouser [749-ELM-2-3MM](https://www.mouser.com/ProductDetail/749-ELM-2-3MM)
Crystal Oscillator | X1        | 66 MHz (twice desired CPU frequency), 5V, DIP-8      | 1        | Mouser 50 MHz: [520-TCH5000](https://www.mouser.com/ProductDetail/520-TCH5000), [815-ACH-50-EK](https://www.mouser.com/ProductDetail/815-ACH-50-EK), [774-MXO45HS-3C-50.0](https://www.mouser.com/ProductDetail/774-MXO45HS-3C-50.0); 66.6666MHz: [774-MXO45HS2C66.6666](https://www.mouser.com/ProductDetail/774-MXO45HS2C66.6666), [520-TCH6666-X](https://www.mouser.com/ProductDetail/520-TCH6666-X); 80 MHz: [520-ECS-2200B-800](https://www.mouser.com/ProductDetail/520-ECS-2200B-800), [774-MXO45HS-3C-80.0](https://www.mouser.com/ProductDetail/774-MXO45HS-3C-80.0)
Crystal Oscillator | X2        | 66 MHz (twice desired FPU frequency), 5V, DIP-8      | 1        | Optional. See above.
Crystal Resonator  | Y1        | 14.31818 MHz, parallel, HC-49U                       | 1        | Mouser [815-ABL-14.31818B2](https://www.mouser.com/ProductDetail/815-ABL-14.31818B2), [559-FOXS143-20-LF](https://www.mouser.com/ProductDetail/559-FOXS143-20-LF)
Crystal Resonator Insulator | Y1 | Mylar insulator for HC-49U crystal resonators      | 1        | Optional. Mouser [749-CI-192-028-SR](https://www.mouser.com/ProductDetail/749-CI-192-028-SR)
Crystal Resonator  | Y2        | 32768 Hz, watch crystal, 6 pf, D = 2.1 mm, L = 6.2 mm  | 1      | Mouser [815-AB26T32768KHZ6B](https://www.mouser.com/ProductDetail/815-AB26T32768KHZ6B), [520-ECS327-6-13-X](https://www.mouser.com/ProductDetail/520-ECS327-6-13-X), or [628-VT200F-6PF20PPM](https://www.mouser.com/ProductDetail/628-VT200F-6PF20PPM)
IC Socket          | U2        | 68 pin PLCC, through hole                            | 1        | Mouser [737-PLCC-68-AT](https://www.mouser.com/ProductDetail/737-PLCC-68-AT), [517-8468-11B1-RK-TP](https://www.mouser.com/ProductDetail/517-8468-11B1-RK-TP), [575-682444](https://www.mouser.com/ProductDetail/575-682444)
IC Socket          | U4        | 24 pin DIP                                           | 1        | Mouser [737-ICS-624-T](https://www.mouser.com/ProductDetail/737-ICS-624-T), [517-4824-6000-CP](https://www.mouser.com/ProductDetail/517-4824-6000-CP), [571-1-2199298-8](https://www.mouser.com/ProductDetail/571-1-2199298-8)
IC Socket          | U5        | 40 pin DIP                                           | 1        | Mouser [737-ICS-640-T](https://www.mouser.com/ProductDetail/737-ICS-640-T), [517-4840-6000-CP](https://www.mouser.com/ProductDetail/517-4840-6000-CP), [571-1-2199299-5](https://www.mouser.com/ProductDetail/571-1-2199299-5)
IC Socket          | U6        | 32 pin DIP                                           | 1        | Mouser [737-ICS-632-T](https://www.mouser.com/ProductDetail/737-ICS-632-T), [517-4832-6000-CP](https://www.mouser.com/ProductDetail/517-4832-6000-CP), [571-1-2199300-2](https://www.mouser.com/ProductDetail/571-1-2199300-2)
IC Socket          | U7 - U9   | 14 pin DIP                                           | 3        | Mouser [737-ICS-314-T](https://www.mouser.com/ProductDetail/737-ICS-314-T), [517-4814-3000-CP](https://www.mouser.com/ProductDetail/517-4814-3000-CP), [571-1-2199298-3](https://www.mouser.com/ProductDetail/571-1-2199298-3)
Oscillator Socket  | X1, X2    | 4 pin DIP                                            | 2        | Mouser [535-1108800](https://www.mouser.com/ProductDetail/535-1108800)
Battery            | BT1       | CR2032 battery                                       | 1        | Mouser [81-CR2032](https://www.mouser.com/ProductDetail/81-CR2032), [658-CR2032](https://www.mouser.com/ProductDetail/658-CR2032), [614-CR2032-200](https://www.mouser.com/ProductDetail/614-CR2032-200)
Battery Socket     | BT1       | CR2032 battery socket, through hole                  | 1        | Mouser [122-2420-GR](https://www.mouser.com/ProductDetail/122-2420-GR), [122-2620-GR](https://www.mouser.com/ProductDetail/122-2620-GR)
Connector          | J1 - J4   | SIMM 30 socket, 30 pin                               | 4        | eBay
Connector          | J5 - J10  | ISA card edge connector, 98 pin                      | 6        | Mouser [587-395-098-520-350](https://www.mouser.com/ProductDetail/587-395-098-520-350)
Connector          | J11       | PS/2 Keyboard/Mouse connector, Mini-DIN 6 pin        | 1        | Mouser [806-KMDGX-6S-BS](https://www.mouser.com/ProductDetail/806-KMDGX-6S-BS)
Connector          | J12       | ATX power connector, 20 pin                          | 1        | Mouser [538-46015-2006](https://www.mouser.com/ProductDetail/538-46015-2006)
Connector          | J13       | 2x8 pin header, 2.54 mm (0.1") pitch, through hole   | 1        | Mouser [737-PH2-16-UA](https://www.mouser.com/ProductDetail/737-PH2-16-UA)
Connector          | J14 - J17 | 2x14 pin socket, 2 mm pitch, through hole            | 4        | Optional. Mouser [538-79107-7062](https://www.mouser.com/ProductDetail/538-79107-7062), [200-SQT11301LD](https://www.mouser.com/ProductDetail/200-SQT11301LD), [200-SQT11301FD](https://www.mouser.com/ProductDetail/200-SQT11301FD)
Connector          | JP1 - JP3 | 2 pin header, 2.54 mm (0.1") pitch, through hole     | 3        | Mouser [737-PH1-02-UA](https://www.mouser.com/ProductDetail/737-PH1-02-UA)
Connector          | JP4 - JP6 | 3 pin header, 2.54 mm (0.1") pitch, through hole     | 3        | Mouser [737-PH1-03-UA](https://www.mouser.com/ProductDetail/737-PH1-03-UA). Some headers are optional, and can be hardwired for the soldered CPU.
Connector          | JP1 - JP6 | Shunt, 2 pin, 2.54 mm (0.1") pitch                   | 4        | Mouser [737-MSA-G](https://www.mouser.com/ProductDetail/737-MSA-G), [806-SX1100-B](https://www.mouser.com/ProductDetail/806-SX1100-B)
Switch             | SW1, SW2  | 6 mm tactile switch, vertical, through hole          | 2        | Optional. Mouser [653-B3F-1000](https://www.mouser.com/ProductDetail/653-B3F-1000)
Capacitor          | C1 - C3   | 30 pF, 50V MLCC, 5.08 mm (0.2") pitch                | 3        | Mouser [594-K300J10C0GF5UH5](https://www.mouser.com/ProductDetail/594-K300J10C0GF5UH5)
Capacitor          | C4 - C7   | 47 pF, 50V MLCC, 5.08 mm (0.2") pitch                | 4        | Mouser [810-FG28C0G1H470JNT6](https://www.mouser.com/ProductDetail/810-FG28C0G1H470JNT6)
Capacitor          | C8        | 100 pF, 50V MLCC, 5.08 mm (0.2") pitch               | 1        | Mouser [810-FG28C0G1H101JNT6](https://www.mouser.com/ProductDetail/810-FG28C0G1H101JNT6)
Capacitor          | C9        | 220 pF, 50V MLCC, 5.08 mm (0.2") pitch               | 1        | Mouser [810-FG28C0G1H221JNT6](https://www.mouser.com/ProductDetail/810-FG28C0G1H221JNT6)
Capacitor          | C10 - C21 | 100 nF, 25V MLCC, 5.08 mm (0.2") pitch               | 12       | Mouser [594-K104K15X7RF53H5](https://www.mouser.com/ProductDetail/594-K104K15X7RF53H5), [810-FG28X7R1H104KNT6](https://www.mouser.com/ProductDetail/810-FG28X7R1H104KNT6)
Capacitor          | C22, C23  | 1 uF, 10V MLCC, 5.08 mm (0.2") pitch                 | 2        | Mouser [810-FG28X5R1H105KRT6](https://www.mouser.com/ProductDetail/810-FG28X5R1H105KRT6)
Capacitor          | C24 - C48 | 10 uF, 25V electrolytic, 5 mm diameter, 2.5 mm pitch | 25       | Mouser [667-EEU-FR1H100](https://www.mouser.com/ProductDetail/667-EEU-FR1H100)
Polyfuse           | F1        | 1.1A, 5.08 mm (0.2") pitch                           | 1        | Mouser [650-RUSBF110-2](https://www.mouser.com/ProductDetail/650-RUSBF110-2)
Ferrite Choke      | L1 - L4   | axial                                                | 4        | Mouser [623-2743001112LF](https://www.mouser.com/ProductDetail/623-2743001112LF)
Resistor           | R1 - R12  | 10 ohm, 0.25 W, axial                                | 12       | Mouser [708-CF14JT10R0](https://www.mouser.com/ProductDetail/708-CF14JT10R0), [603-MFR-25FBF52-10R](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-10R)
Resistor           | R13 - R15 | 22 ohm, 0.25 W, axial                                | 3        | Mouser [708-CF14JT22R0](https://www.mouser.com/ProductDetail/708-CF14JT22R0), [603-MFR-25FBF52-22R](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-22R)
Resistor           | R16, R17  | 56 ohm, 0.25 W, axial                                | 2        | Mouser [708-CF14JT56R0](https://www.mouser.com/ProductDetail/708-CF14JT56R0), [603-MFR-25FBF52-56R](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-56R)
Resistor           | R18 - R21 | 100 ohm, 0.25 W, axial                               | 4        | Mouser [708-CF14JT100R](https://www.mouser.com/ProductDetail/708-CF14JT100R), [603-MFR-25FBF52-100R](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-100R)
Resistor           | R22       | 330 ohm, 0.25 W, axial                               | 1        | Mouser [708-CF14JT330R](https://www.mouser.com/ProductDetail/708-CF14JT330R), [603-MFR-25FBF52-330R](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-330R)
Resistor           | R23 - R29 | 470 ohm, 0.25 W, axial                               | 7        | Mouser [708-CF14JT470R](https://www.mouser.com/ProductDetail/708-CF14JT470R), [603-MFR-25FBF52-470R](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-470R)
Resistor           | R30, R31  | 1 kohm, 0.25 W, axial                                | 2        | Mouser [708-CF14JT1K00](https://www.mouser.com/ProductDetail/708-CF14JT1K00), [603-MFR-25FBF52-1K](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-1K)
Resistor           | R32       | 4.7 kohm, 0.25 W, axial                              | 1        | Mouser [708-CF14JT4K70](https://www.mouser.com/ProductDetail/708-CF14JT4K70), [603-MFR-25FBF52-4K7](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-4K7)
Resistor           | R33 - R38 | 10 kohm, 0.25 W, axial                               | 6        | Mouser [708-CF14JT10K0](https://www.mouser.com/ProductDetail/708-CF14JT10K0), [603-MFR-25FBF52-10K](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-10K)
Resistor           | R39       | 22 kohm, 0.25 W, axial                               | 1        | Mouser [708-CF14JT22K0](https://www.mouser.com/ProductDetail/708-CF14JT22K0), [603-MFR-25FBF52-22K](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-22K)
Resistor           | R40       | 1 Mohm, 0.25 W, axial                                | 1        | Mouser [708-CF14JT1M00](https://www.mouser.com/ProductDetail/708-CF14JT1M00), [603-MFR-25FBF52-1M](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-1M)
Resistor Array     | RN1       | 330 ohm, 8 resistors, bussed, 9 pin SIL              | 1        | Mouser [652-4609X-1LF-330](https://www.mouser.com/ProductDetail/652-4609X-1LF-330), [652-4609X-AP1-331LF](https://www.mouser.com/ProductDetail/652-4609X-AP1-331LF)
Resistor Array     | RN2, RN3  | 4.7 kohm, 5 resistors, bussed, 6 pin SIL             | 2        | Mouser [652-4606X-1LF-4.7K](https://www.mouser.com/ProductDetail/652-4606X-1LF-4.7K), [652-4606X-AP1-472LF](https://www.mouser.com/ProductDetail/652-4606X-AP1-472LF)
Resistor Array     | RN4       | 4.7 kohm, 8 resistors, bussed, 9 pin SIL             | 1        | Mouser [652-4609X-1LF-4.7K](https://www.mouser.com/ProductDetail/652-4609X-1LF-4.7K), [652-4609X-AP1-472LF](https://www.mouser.com/ProductDetail/652-4609X-AP1-472LF)
Resistor Array     | RN5       | 10 kohm, 4 resistors, bussed, 5 pin SIL              | 1        | Mouser [652-4605X-1LF-10K](https://www.mouser.com/ProductDetail/652-4605X-1LF-10K), [652-4605X-AP1-103LF](https://www.mouser.com/ProductDetail/652-4605X-AP1-103LF)

## Software

### BIOS

For the testing purposes I am using BIOSes from other commerical motherboards based on the same SARC RC2014 chipset. [The Retro Web](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds[]=648) has a collection of the BIOSes for this chipset.

#### BIOS Progamming and ROM ICs support.

The is designed for the 128 KiB SST SST39SF010A Flash ROM. This ROM is mapped to the 0xE0000-0xFFFFF (or, with 8086 segments, E000:0000 to F000:FFFF). The upper 64 KiB - 0xF0000-0xFFFFF (F000:0000-F000:FFFF) are typically used for the BIOS ROM. The lower 64 KiB - 0xE0000-0xEFFFF can be used for BIOS extensions. Please take that into the consideration when programming the Flash ROM. Make sure to load the BIOS image to the top 64 KiB of the Flash ROM, starting at the address 0x10000. Other pin compatible 128 KiB Flash ROMs, such as AMD AM29F010A, SST SST29EE010, Atmel AT29C010A can be also used without any changes.

It is also possible to use 256 KiB and 512 KiB Flash ROMs, for example SST39SF020 and SST39SF040. Note that the A17 address line is connected to VCC (logic high/"1") and the address line A18 is connected to the ground (logic low/"0"). Therefore when using these flash ROMs, please program the 64 KiB BIOS image starting at the addres 0x30000 of the Flash ROM.

Finally, the board also should work with 64 KiB EPROMs and OTP ROMs, e.g., 27C512. In this case, install the EPROM to the right side of the socket, that is pin 1 of the EPROM should go to the pin 3 of the socket.

## Changes

* Version 2.3
  * Use non-plated through holes for the plastic posts of SIMM30 sockets
  * Ground the shield of the PS/2 connector
  * Update silkscreen: Add acknowledgements, move references and values of DRAM resistors to make them more visible
  * Update schematic: Update a few pins on the RC2016A symbol

* Version 2.2
  * Fix the Flash ROM /OE issue: Connect Flash ROM /OE to ISA /MEMR
  * Renumber DRAM banks - swap Bank 0 and Bank 1. Rename DRAM signals accordingly
  * Add CPU pin 1 marking on the silkscreen
  * Renumber SIMM and ISA slots, so that the reference numbers increase from the top of the PCB to the bottom
  * Renumber electrolytic capacitors, so that the reference numbers increase from the top of the PCB to the bottom
  * Use 22 kohm resistor for R39
  * Remove load capacitors on the ISA bus signals, that are not populated anyway
  * Add a polyfuse for the PS/2 port

* Version 2.1
  * Renumber the component references according to the values and locations on the PCB
  * Update silkscreen
  * Add signal names on the back silkscreen

* Version 2.0
  * Use ATX power supply connector
  * Add ATX power-on circuit

* Version 1.9
  * Add pin headers for the CPU

* Version 1.8
  * Connect /OE and /WE of the BIOS ROM to allow Flash ROM in-system programming
  * Rotate the PCB into portrait orientation

* Version 1.7
  * Use single front panel connector

* Version 1.6
  * Use a low profile 14.31818 MHz crystal (or an SMD part)
  * Add support for the separate FPU clock
  * Use half can oscillators for the CPU and the FPU clocks
  * Use discrete resistors for DRAM interface
  * Use resistors with 300 mil (7.62 mm) lead spacing
  * Move R23 down closer to JP8

* Version 1.5
  * Add more 10 uF filtering capacitors to the power rails
  * Remove extra capacitors for /IOW and RESET signals (use capacitors between two leftmost ISA slots
  * Use resistor arrays for SA17-SA19 pull-ups

* Version 1.4
  * Increase board depth by 0.1". Move mount holes to ATX compatible locations

* Version 1.3
  * Wire keyboard controller in PS/2 mode. Use PS/2 Mini-Din connector in a PS/2 dualport configuration

* Version 1.2
  * Add support for 128 KiB Flash ROM ICs for BIOS. SST39SF010A or similar.
 
* Version 1.1
  * Use DS12885 RTC with CR2032 coin cell battery

* Version 1.0
  * Reverse engineered schematic of M396F motherboard
  * PCB layout closely based on the original M396F layout with a few minor changes

## Known Issues

* Versions 1.8 - 2.1
  * The board will not boot into the BIOS.
    * Workaround: Cut the trace going to the Flash ROM pin 24. Solder a wire to connect the flash ROM /OE signal, pin 24 to the ISA /MEMR signal, ISA bus pin 89.
    * The issue happens because following the reset, 386SX fetches instructions starting from address 0xFFFFF0 - the last 16 bytes of its 16 MiB address space. But the board uses /SMEMR signal for the Flash ROM /OE, and that signal is only generated when reading the first megabyte of memory. So the BIOS ROM does not get the /OE signal.

* Versions 1.0 - 2.1
  * DRAM bank 0 and bank 1 swapped around. Bank 0 is the one closer to the edge of the board.

## Wishlist

* On-board speaker
* Try using more common values for C1 - C2: 27 pF or 33 pF are more commonly available than 30 pF
* 3.3V CPU support
  * The current plan is to test this using the [386SX Universal Socket Adapter](https://github.com/skiselev/i386sx-socket)
  * Separate VCC plane for the CPU
  * Linear voltage regulator
  * Solder jumpers to bypass the voltage regulator and connect the CPU to 5V
* 4 layer PCB
  * VCC and ground planes
* Consider using SMD components

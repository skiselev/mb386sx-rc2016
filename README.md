# mb386sx-rc2016
SARC 2016 Chipset Based 386SX/486SLC Motherboard

## Introduction

The origin of this project is the [M396F motherboard replica by Marco Both](https://github.com/Marco-Both/M396F-Replika). Marco replicated the PCB layout of a certain revision of M396F motherboard. He didn't provide the schematic.

I reverse engineered the schematic based on his PCB layout and made a PCB layout using that schematic similar to the Marco's replica.

In the future I plan to improve the design, as described in the Wishlist section below

## Hardware Documentation

### Schematic and PCB Layout

* [Schematic - Version 2.1](KiCad/AT386SX-Schematic-2.1.pdf)
* [PCB Layout - Version 2.1](KiCad/AT386SX-Board-2.1.pdf)

### Bill of Materials

#### Version 2.1

[Alsea River 386SX Motherboard project on Mouser.com](https://www.mouser.com/ProjectManager/ProjectDetail.aspx?AccessID=xxxxxxxxxx) - View and order most components except of the CPU, chipset, keyboard controller, SIMM-30 sockets, and the PCB.

Component type     | Reference | Description                                          | Quantity | Possible sources and notes 
------------------ | --------- | ---------------------------------------------------- | -------- | --------------------------
PCB                |           | Alsea River 386SX PCB - Version 2.1                  | 1        | Or order from a PCB manufacturer of your choice using provided Gerber or KiCad files
Integrated Circuit | U1        | 386SX CPU, TI486SXLC, Cx486SLC CPU, 100 pin BQFP     | 1        | eBay
Integrated Circuit | U2        | 387SX FPU or compatible, 68 pin PLCC                 | 1        | eBay. Optional
Integrated Circuit | U3        | SARC RC2016A5, 208 pin PQFP                          | 1        | UTsource
Integrated Circuit | U4        | DS12885 RTC, 24 pin DIP                              | 1        | Mouser
Integrated Circuit | U5        | VT82C42N keyboard/mouse controller, 40 pin DIP       | 1        | eBay
Integrated Circuit | U6        | SST39SF010A 128 KiB Flash ROM, 32 pin DIP            | 1        | Mouser
Integrated Circuit | U7        | 74HC05 inverters with open drain outputs, 14 pin DIP | 1        | Mouser [595-SN74AHC05N](), [595-SN74HC05N](), (possible replacement: Mouser [595-SN74LS06N]()?)
Integrated Circuit | U8        | 74HCT14 inverters with Schmitt trigger inputs, 14 pin DIP | 1   | Mouser [595-SN74AHCT14N](https://www.mouser.com/ProductDetail/595-SN74AHCT14N), [595-SN74HCT14N]()
Integrated Circuit | U9        | 74HCT74 D-flip flops, 14 pin DIP                     | 1        | Mouser [595-SN74AHCT74N](https://www.mouser.com/ProductDetail/595-SN74AHCT74N), [595-SN74HCT74N](), 
Integrated Circuit | U10       | LM7905 -5V voltage regulator, TO-220-3               | 1        | Mouser [863-MC7905CTG](), [926-LM7905CT/NOPB]()
Transistor         | Q1        | 2N3904, NPN transistor, TO-92                        | 1        | Mouser [512-2N3904TA]()
LED                | D1        | 3 mm LED, blue                                       | 1        | Optional. Mouser [604-WP710A10QBD/D](), [696-SSL-LX3054USBD](), [749-3BWD-S]()
LED                | D2        | 3 mm LED, bi-color red/green                         | 1        | Optional. Mouser [604-WP937EGW](), [696-SSL-LX3054IGW](), [749-3BC]()
Crystal Oscillator | X1        | 66 MHz (twice desired CPU frequency), 5V, DIP-8      | 1        | Mouser 50 MHz: [520-TCH5000](), [815-ACH-50-EK](), [774-MXO45HS-3C-50.0](); 66.6666MHz: [774-MXO45HS2C66.6666](), [520-TCH6666-X](); 80 MHz: [520-ECS-2200B-800](), [774-MXO45HS-3C-80.0]
Crystal Oscillator | X2        | 66 MHz (twice desired FPU frequency), 5V, DIP-8      | 1        | Optional. See above.
Crystal Resonator  | Y1        | 14.31818 MHz, parallel, HC-49U                       | 1        | Mouser [815-ABL-14.31818B2](), [FOXSLF/143-20]()
Crystal Resonator  | Y1        | 32768 Hz, tuning fork, ?pf, 2 mm?, radial            | 1        | Mouser [815-AB26T32768KHZ6B](https://www.mouser.com/ProductDetail/815-AB26T32768KHZ6B), [520-ECS327-6-13-X](https://www.mouser.com/ProductDetail/520-ECS327-6-13-X), or [628-VT200F-6PF20PPM](https://www.mouser.com/ProductDetail/628-VT200F-6PF20PPM)
IC Socket          | U2        | 68 pin PLCC, through hole                            | 1        | Mouser [737-PLCC-68-AT](), [517-8468-11B1-RK-TP](), [575-682444]()
IC Socket          | U4        | 24 pin DIP                                           | 1        | Mouser [737-ICS-624-T](), [517-4824-6000-CP](https://www.mouser.com/ProductDetail/517-4824-6000-CP), [571-1-2199298-8]()
IC Socket          | U5        | 40 pin DIP                                           | 1        | Mouser [737-ICS-640-T](), [517-4840-6000-CP](https://www.mouser.com/ProductDetail/517-4840-6000-CP), [571-1-2199299-5]()
IC Socket          | U6        | 32 pin DIP                                           | 1        | Mouser [737-ICS-632-T](), [517-4832-6000-CP](https://www.mouser.com/ProductDetail/517-4832-6000-CP), [571-1-2199300-2]()
IC Socket          | U7 - U9   | 14 pin DIP                                           | 3        | Mouser [737-ICS-314-T](), [517-4814-3000-CP](https://www.mouser.com/ProductDetail/517-4814-3000-CP), [571-1-2199298-3]()
Oscillator Socket  [ X1, X2    | 4 pin DIP                                            | 2        | Mouser [535-1108800]()
Battery            | BT1       | CR2032 battery                                       | 1        | Mouser [81-CR2032](https://www.mouser.com/ProductDetail/81-CR2032), [658-CR2032](https://www.mouser.com/ProductDetail/658-CR2032), or [614-CR2032-200](https://www.mouser.com/ProductDetail/614-CR2032-200)
Battery Socket     | BT1       | CR2032 battery socket, through hole                  | 1        | Mouser [122-2420-GR](https://www.mouser.com/ProductDetail/122-2420-GR), or [122-2620-GR](https://www.mouser.com/ProductDetail/122-2620-GR)
Connector          | J1 - J6   | ISA card edge connector, 98 pin                      | 6        | Mouser [587-395-098-520-350](https://www.mouser.com/ProductDetail/587-395-098-520-350)
Connector          | J7 - J10  | SIMM 30 socket, 30 pin                               | 4        | eBay
Connector          | J11       | PS/2 Keyboard/Mouse connector, Mini-DIN 6 pin        | 1        | Mouser [806-KMDGX-6S-BS](https://www.mouser.com/ProductDetail/806-KMDGX-6S-BS)
Connector          | J12       | ATX power connector, 20 pin                          | 1        | Mouser [538-46015-2006](https://www.mouser.com/ProductDetail/538-46015-2006)
Connector          | J13       | 2x8 pin header, 2.54 mm (0.1") pitch, through hole   | 1        | Mouser [737-PH2-16-UA]()
Connector          | J14 - J17 | 2x14 pin socket, 2 mm pitch, through hole            | 4        | Optional. Mouser [200-SQT11301LD]()
Connector          | JP1 - JP3 | 2 pin header, 2.54 mm (0.1") pitch, through hole     | 3        | Mouser [737-PH2-02-UA]()
Connector          | JP4 - JP6 | 3 pin header, 2.54 mm (0.1") pitch, through hole     | 3        | Mouser [737-PH1-03-UA](). Some headers are optional, and can be hardwired for the soldered CPU.
Connector          | JP1 - JP6 | Shunt, 2 pin, 2.54 mm (0.1") pitch                   | 4        | Mouser [737-MSA-G](), [806-SX1100-B](https://www.mouser.com/ProductDetail/806-SX1100-B)
Switch             | SW1, SW2  | 6 mm tactile switch, vertical, through hole          | 2        | Optional. Mouser [653-B3F-1000](https://www.mouser.com/ProductDetail/653-B3F-1000)
Capacitor          | C1 - C3   | 30 pF, 50V MLCC, 5.08 mm (0.2") pitch                | 3        | Mouser [594-K300J10C0GF5UH5]()
Capacitor          | C4 - C8   | 47 pF, 50V MLCC, 5.08 mm (0.2") pitch                | 5        | Mouser [810-FG28C0G1H470JNT6](https://www.mouser.com/ProductDetail/810-FG28C0G1H470JNT6)
Capacitor          | C9        | 100 pF, 50V MLCC, 5.08 mm (0.2") pitch               | 1        | Mouser [810-FG28C0G1H101JNT6]()
Capacitor          | C10       | 220 pF, 50V MLCC, 5.08 mm (0.2") pitch               | 1        | Mouser [810-FG28C0G1H221JNT6]()
Capacitor          | C11 - C22 | 100 nF, 25V MLCC, 5.08 mm (0.2") pitch               | 12       | Mouser [594-K104K15X7RF53H5](https://www.mouser.com/ProductDetail/594-K104K15X7RF53H5) or [810-FG28X7R1H104KNT6](https://www.mouser.com/ProductDetail/810-FG28X7R1H104KNT6)
Capacitor          | C23, C24  | 1 uF, 10V MLCC, 5.08 mm (0.2") pitch                 | 2        | Mouser [810-FG28X5R1H105KRT0]()
Capacitor          | C25 - C49 | 10 uF, 25V electrolytic, 5 mm diameter, 2.5 mm pitch | 25       | Mouser [667-EEU-FR1E470H]()
Ferrite Choke      | L1 - L4   | axial                                                | 4        | Mouser [623-2743001112LF]()
Resistor           | R1 - R12  | 10 ohm, 0.25 W, axial                                | 12       | Mouser [708-CF14JT10R0]()
Resistor           | R13 - R15 | 22 ohm, 0.25 W, axial                                | 3        | Mouser [708-CF14JT22R0]()
Resistor           | R16, R17  | 56 ohm, 0.25 W, axial                                | 2        | Mouser [708-CF14JT56R0]()
Resistor           | R18 - R21 | 100 ohm, 0.25 W, axial                               | 4        | Mouser [708-CF14JT100R]()
Resistor           | R22       | 330 ohm, 0.25 W, axial                               | 1        | Mouser [708-CF14JT330R]()
Resistor           | R23 - R29 | 470 ohm, 0.25 W, axial                               | 7        | Mouser [708-CF14JT470R](), [603-MFR-25FBF52-470R](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-470R)
Resistor           | R30, R31  | 1 kohm, 0.25 W, axial                                | 2        | Mouser [708-CF14JT1K00](), [603-MFR-25FBF52-1K](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-1K)
Resistor           | R32       | 4.7 kohm, 0.25 W, axial                              | 1        | Mouser [708-CF14JT4K70]()
Resistor           | R33 - R38 | 10 kohm, 0.25 W, axial                               | 6        | Mouser [708-CF14JT10K0](), [603-MFR-25FBF52-10K](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-10K)
Resistor           | R39       | 20 kohm, 0.25 W, axial                               | 1        | Mouser [708-CF14JT20K0]()
Resistor           | R40       | 1 Mohm, 0.25 W, axial                                | 1        | Mouser [708-CF14JT1M00](), [603-MFR-25FBF52-1M](https://www.mouser.com/ProductDetail/603-MFR-25FBF52-1M)
Resistor Array     | RN1       | 330 ohm, 8 resistors, bussed, 9 pin SIL              | 1        | Mouser [652-4609X-1LF-330]() or [652-4609X-AP1-331LF]()
Resistor Array     | RN2, RN3  | 4.7 kohm, 5 resistors, bussed, 6 pin SIL             | 2        | Mouser [652-4606X-1LF-4.7K](https://www.mouser.com/ProductDetail/652-4606X-1LF-4.7K) or [652-4606X-AP1-472LF](https://www.mouser.com/ProductDetail/652-4606X-AP1-472LF)
Resistor Array     | RN4       | 4.7 kohm, 8 resistors, bussed, 9 pin SIL             | 1        | Mouser [652-4609X-1LF-4.7K](https://www.mouser.com/ProductDetail/652-4609X-1LF-4.7K) or [652-4609X-AP1-472LF](https://www.mouser.com/ProductDetail/652-4609X-AP1-472LF)
Resistor Array     | RN5       | 10 kohm, 4 resistors, bussed, 5 pin SIL              | 1        | Mouser [652-4605X-1LF-10K](https://www.mouser.com/ProductDetail/652-4605X-1LF-10K) or [652-4605X-AP1-103LF](https://www.mouser.com/ProductDetail/652-4605X-AP1-103LF)

## Changes

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

## Wishlist

* On-board speaker
* Add a polyfuse on the PS/2 power
* 3.3V CPU support
  * Separate VCC plane for the CPU
  * Linear voltage regulator
  * Solder jumpers to bypass the voltage regulator and connect the CPU to 5V
* Flash ROM
  * Check if BIOS_RD signal is generated for writes.
  * Connect /WR signal to flash ROM (jumper between /WR and VCC?)
* 4 layer PCB
  * VCC and ground planes
* Consider using SMD components
* Various optimizations
  * Remove load capacitors on the ISA bus signals (not populated anyway)
  * Use ferrite bead instead of R25 (other motherboards do that?)

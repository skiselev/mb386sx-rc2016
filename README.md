# mb386sx-rc2016
SARC 2016 Chipset Based 386SX/486SLC Motherboard

## Introduction

The origin of this project is the [M396F motherboard replica by Marco Both](https://github.com/Marco-Both/M396F-Replika). Marco replicated the PCB layout of a certain revision of M396F motherboard. He didn't provide the schematic.

I reverse engineered the schematic based on his PCB layout and made a PCB layout using that schematic similar to the Marco's replica.

In the future I plan to improve the design, as described in the Wishlist section below

## Changes

* Version 1.0
  * Reverse engineered schematic of M396F motherboard
  * PCB layout closely based on the original M396F layout with a few minor changes

* Version 1.1
  * Use DS12885 RTC with CR2032 coin cell battery

* Version 1.2
  * Add support for 128 KiB Flash ROM ICs for BIOS. SST39SF010A or similar.

* Version 1.3
  * Wire keyboard controller in PS/2 mode. Use PS/2 Mini-Din connector in a PS/2 dualport configuration

* Version 1.4
  * Increase board depth by 0.1". Move mount holes to ATX compatible locations

* Version 1.5
  * Add more 10 uF filtering capacitors to the power rails
  * Remove extra capacitors for /IOW and RESET signals (use capacitors between two leftmost ISA slots
  * Use resistor arrays for SA17-SA19 pull-ups

* Version 1.6
  * Use a low profile 14.31818 MHz crystal (or an SMD part)
  * Add support for the separate FPU clock
  * Use half can oscillators for the CPU and the FPU clocks
  * Use discrete resistors for DRAM interface
  * Use resistors with 300 mil (7.62 mm) lead spacing
  * Move R23 down closer to JP8

* Version 1.7
  * Use single front panel connector

* Version 1.8
  * Connect /OE and /WE of the BIOS ROM to allow Flash ROM in-system programming
  * Rotate the PCB into portrait orientation

* Version 1.9
  * Add pin headers for the CPU

* Version 2.0
  * Use ATX power supply connector
  * Add ATX power-on circuit
 
* Version 2.1
  * Renumber the component references according to the values and locations on the PCB
  * Update silkscreen
  * Add signal names on the back silkscreen

## Wishlist

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

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

## Wishlist

* 3.3V CPU support
  * Separate VCC plane for the CPU
  * Linear voltage regulator
  * Solder jumpers to bypass the voltage regulator and connect the CPU to 5V
* Flash ROM
  * Check if BIOS_RD signal is generated for writes.
  * Connect /WR signal to flash ROM (jumper between /WR and VCC?)
* Use half/full can oscillator for the CPU clock instead of the PLL
  * More readily available part
* Add support for a separate clock for the FPU
  * Jumper to select the clock mode
  * Add half/full can ocillator for the FPU clock
* 4 layer PCB
  * VCC and ground planes
* Consider using SMD components
* Various optimizations
  * Remove load capacitors on the ISA bus signals (not populated anyway)
  * Use ferrite bead instead of R25 (other motherboards do that?)
  * Move R23 down closer to JP8
  * Use a low profile 14.31818 MHz crystal (or an SMD part)
  * Modern front panel connector pinout

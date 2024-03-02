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

## Wishlist

* ATX compatible mount holes
  * Make the board a bit longer to accommodate holes on the front side of the board
* 3.3V CPU support
  * Separate VCC plane for the CPU
  * Linear voltage regulator
  * Solder jumpers to bypass the voltage regulator and connect the CPU to 5V
* DS12885 RTC
  * Simplify RTC schematic. Remove CD4069, battery switchover circuit, battery header
  * Use CR2032 coin cell instead of a 3.6V Varta battery
* PS/2 keyboard and mouse support
  * Add Mini-Din PS/2 connectors (or replace keyboard full DIN with Mini-Din)?
  * Configure 8242 KBC in PS/2 mode
* Use SST39SF010A Flash ROM instead of the 27C512 EPROM
  * Connect /WR signal to flash ROM (jumper between /WR and VCC?)
* Use half/full can ocillator for the CPU clock instead of the PLL
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
  * Use otherwise unused resistors in resistor arrays, e.g. 330 ohm for LEDs
  * Modern front panel connector pinout

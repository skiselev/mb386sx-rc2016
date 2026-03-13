# SARC RC2016 Chipset

This documentation is a result of a reverse engineering of an M386F motherboard and observing the chipset configuration registers settings set by AMI and AWARD BIOSes from RC2016-based motherboards.

## Chipset Configuration Registers

The SARC RC2016 configuation registers are accessed by writing the configuration register index to the I/O port 0x22 and then writing or reading the data from the I/O port 0x23

Register Index | Register Bits | Function                                                                   | Default Settings and Notes
---------------|---------------|----------------------------------------------------------------------------|------------------------------------------------------------------------------------------------
0x80           | Bits 7-5      | Unknown                                                                    | Read as 000 on both AMI 5.20 and Award 4.50 BIOSes
0x80           | Bit 4         | Current turbo switch state: 0 = on, 1 = off                                | Appears to be read-only, reflecting the current state of the turbo switch. Also see 0x90, bit 6
0x80           | Bit 3         | FPU status: 0 = no FPU, 1 = FPU installed                                  | Appears to be read-only, set by chipset depending on whether the FPU is installed or not
0x80           | Bits 2-1      | Unknown                                                                    | Read as 000 on both AMI 5.20 and Award 4.50 BIOSes
0x80           | Bit 0         | Unknown                                                                    | Read as 1 on both AMI 5.20 and Award 4.50 BIOSes
0x81           | Bit 7         | Unknown                                                                    | Set to 0 by both AMI 5.20 and Award 4.50 BIOSes
0x81           | Bit 6         | Number of DRAM banks: 0 = 1 bank, 1 = 2 banks                              | Set by the BIOS depending on the number of DRAM banks installed
0x81           | Bits 5-4      | DRAM bank (SIMM) size: 00 = 256 KiB, 10 = 1 MiB, 11 = 4 MiB                | Set by the BIOS depending  on the SIMM size installed
0x81           | Bits 3-1      | Unknown                                                                    | Set to 111 by both AMI 5.20 and Award 4.50 BIOSes
0x81           | Bit 0         | ROM BIOS shadowing control: 0 = disabled, 1 = enabled                      | Set to 1 by BIOS if ROM BIOS shadowing is enabled
0x82           | Bits 7-6      | Unknown                                                                    | Set to 00 by both AMI 5.20 and Award 4.50 BIOSes
0x82           | Bits 5-4      | System BIOS ROM F0000-FFFFF shadowing control: 00 = disabled, 11 = enabled | Set to 11 by both AMI 5.20 and Award 4.50 BIOSes when System BIOS shadowing is enabled
0x82           | Bits 3-0      | Unknown                                                                    | Set to 1111 by both AMI 5.20 and Award 4.50 BIOSes
0x83           | Bits 7,3      | C0000-C3FFF ROM shadowing control: 0xxx0xxx = disabled, 1xxx1xxx = enabled | Set to 1xxx1xxx by both AMI 5.20 and Award 4.50 BIOSes when Video BIOS shadowing is enabled
0x83           | Bits 6,2      | C4000-C7FFF ROM shadowing control: x0xxx0xx = disabled, x1xxx1xx = enabled | Set to x1xxx1xx by both AMI 5.20 and Award 4.50 BIOSes when Video BIOS shadowing is enabled
0x83           | Bits 5,1      | C8000-CBFFF ROM shadowing control: xx0xxx0x = disabled, xx1xxx1x = enabled | Set to xx1xxx1x by both AMI 5.20 and Award 4.50 BIOSes when C8000-CBFFF shadowing is enabled
0x83           | Bits 4,0      | CC000-CFFFF ROM shadowing control: xxx0xxx0 = disabled, xxx1xxx1 = enabled | Set to xxx1xxx1 by both AMI 5.20 and Award 4.50 BIOSes when CC000-CFFFF shadowing is enabled
0x84           | Bits 7,3      | D0000-D3FFF ROM shadowing control: 0xxx0xxx = disabled, 1xxx1xxx = enabled | Set to 1xxx1xxx by both AMI 5.20 and Award 4.50 BIOSes when C0000-C3FFF shadowing is enabled
0x84           | Bits 6,2      | D4000-D7FFF ROM shadowing control: x0xxx0xx = disabled, x1xxx1xx = enabled | Set to x1xxx1xx by both AMI 5.20 and Award 4.50 BIOSes when C4000-C7FFF shadowing is enabled
0x84           | Bits 5,1      | D8000-DBFFF ROM shadowing control: xx0xxx0x = disabled, xx1xxx1x = enabled | Set to xx1xxx1x by both AMI 5.20 and Award 4.50 BIOSes when C8000-CBFFF shadowing is enabled
0x84           | Bits 4,0      | DC000-DFFFF ROM shadowing control: xxx0xxx0 = disabled, xxx1xxx1 = enabled | Set to xxx1xxx1 by both AMI 5.20 and Award 4.50 BIOSes when CC000-CFFFF shadowing is enabled
0x85           | Bits 7,3      | E0000-E3FFF ROM shadowing control: 0xxx0xxx = disabled, 1xxx1xxx = enabled | Set to 1xxx1xxx by both AMI 5.20 and Award 4.50 BIOSes when E0000-E3FFF shadowing is enabled
0x85           | Bits 6,2      | E4000-E7FFF ROM shadowing control: x0xxx0xx = disabled, x1xxx1xx = enabled | Set to x1xxx1xx by both AMI 5.20 and Award 4.50 BIOSes when E4000-E7FFF shadowing is enabled
0x85           | Bits 5,1      | E8000-EBFFF ROM shadowing control: xx0xxx0x = disabled, xx1xxx1x = enabled | Set to xx1xxx1x by both AMI 5.20 and Award 4.50 BIOSes when E8000-EBFFF shadowing is enabled
0x85           | Bits 4,0      | EC000-EFFFF ROM shadowing control: xxx0xxx0 = disabled, xxx1xxx1 = enabled | Set to xxx1xxx1 by both AMI 5.20 and Award 4.50 BIOSes when EC000-EFFFF shadowing is enabled
0x86           | Bits 7,6      | DRAM refresh burst: 00 = 1, 01 = 2, 10 = 3, 11 = 4                         | Set by the BIOS according to the DRAM refresh burst / rate configruation setting
0x86           | Bits 5,4      | DRAM refresh rate: 00 = 1, 01 = 2, 10 = 4, 11 = 8                          | Set by the BIOS according to the DRAM refresh burst / rate configruation setting
0x86           | Bits 3,2      | RAS to CAS width: 01 = CLK2 * 2, 00 = CLK2 * 4                             | Set to 00 by AMI 5.20 BIOS; Set by Award 4.50 BIOS according to "DRAM RAS TO CAS width" setting
0x86           | Bits 1,0      | DRAM RAS precharge: 01 = CLK2 * 6, 10 = CLK2 * 4                           | Set by the BIOS according to the DRAM RAS precharge configuration setting
0x87           | Bit 7         | IO channel refresh: 0 = enabled, 1 = disabled                              | Set by the BIOS according to the IO channel refresh configuration setting
0x87           | Bit 6         | ATBUS stepping: 0 = enabled, 1 = disabled                                  | Set by the BIOS according to the ATBUS stepping configuration setting
0x87           | Bit 5         | Turbo control: 0 = turbo off, 1 = turbo on                                 | Set by AWARD BIOS according to the "Boot Up System Speed" configuration setting. Can be changed using Ctrl-Alt-Plus/Minus. (1)
0x87           | Bit 4         | Turbo LED control: 0 = LED on, 1 = LED off                                 | Set by AWARD BIOS according to the "Boot Up System Speed" configuration setting. Can be changed using Ctrl-Alt-Plus/Minus. (1)
0x87           | Bits 3-2      | Unknown                                                                    | Set to 01 by both AMI 5.20 and Award 4.50 BIOSes
0x87           | Bit 1         | Fast A20 Gate: 0 = enabled, A20 is 0, 1 = disabled, CPU A20 propagated to memory and ISA bus | Controls internal chipset A20 gate circuit. Does not work properly with Cyrix/TI CPUs that require A20M signal. Use the keyboard contoller instead.
0x87           | Bit 0         | Fast CPU Reset: 0 = no reset, 1 = reset CPU                                | Set to 0 after a reset.
0x88           | Bits 7-0      | Unknown                                                                    | AWARD BIOS sets to 00000100 (0x04) when 256 KiB SIMMs with parity are installed. Forcing register to 0x04 with other SIMMs doesn't seem to do anything.
0x88 - 0x8F    | Bits 7-0      | Unknown or not implemented                                                 | Read as 00000000 with both AMI 5.20 and Award 4.50 BIOSes
0x90           | Bit 7         | Unknown                                                                    | Set to 0 by AMI 5.20 BIOS; set to 1 by Award 4.50 BIOS
0x90           | Bit 6         | Current turbo switch state: 0 = off, 1 = on                                | Appears to be read-only, reflecting the current state of the turbo switch. Also see 0x80, bit 4
0x90           | Bit 5         | Unknown                                                                    | Set 0 to by both AMI 5.20 and Award 4.50 BIOSes
0x90           | Bit 4         | Number of wait states: 0 = 1 wait state, 1 = 0 wait states                 | Set by the BIOS according to the wait states configuration setting
0x90           | Bit 3         | RAS to CAS width: 0 = CLK2 * 4, 1 = CLK2 * 6                               | Set by AMI 5.20 BIOS according to the RAS to CAS width setting. Award 5.20 BIOS sets to 0 for 25 and 33 MHz CPUs and to 1 for 40 MHz CPUs

1. Some Award BIOS calls set these bits to the current BIOS turbo setting regardless of the turbo switch or modifications to the configuration register

### Chipset Auto Settings - Award 4.50 BIOS

Setting            | Auto-16MHZ | Auto-20MHZ | Auto-25MHZ | Auto-33MHZ | Auto-40MHZ | Auto-50MHZ | AUTO-50DX2 | AUTO-66DX2
-------------------|------------|------------|------------|------------|------------|------------|------------|-----------
Register 0x86      | 11110110   | 11110110   | 11110110   | 11110010   | 11100010   | N/A        | N/A        | N/A
Register 0x87      | 00XXXXXX   | 00XXXXXX   | 00XXXXXX   | 00XXXXXX   | 00XXXXXX   | N/A        | N/A        | N/A
DRAM refresh burst | 4          | 4          | 4          | 4          | 4          | N/A        | N/A        | N/A
DRAM refresh rate  | 8          | 8          | 8          | 8          | 4          | N/A        | N/A        | N/A
RAS to CAS width   | CLK2 * 2   | CLK2 * 2   | CLK2 * 2   | CLK2 * 4   | CLK2 * 4   | N/A        | N/A        | N/A
DRAM RAS precharge | CLK2 * 4   | CLK2 * 4   | CLK2 * 4   | CLK2 * 4   | CLK2 * 4   | N/A        | N/A        | N/A

### DRAM Refresh Timing

SARC RC2016 uses 14.31818 MHz / 12 / 18 = 66.2878704 kHz as the DRAM refresh frequency.

(To check: Is the divider of 18 configurable using the PIT channel 1?)

* The DRAM refresh rate setting - chipset configuration register 0x86, bits 5,4 set the divider for this refresh frequency.
  * Refresh rate of 1 (register 0x86, bits 5,4 = '00') setting results in 66.2878704 kHz refresh frequency or approximately 15 us refresh period.
  * Refresh rate of 8 (register 0x86, bits 5,4 = '11') setting results in 66.2878704 / 8 = 8.2859838 kHz refresh frequency or approximately 120 us refresh period.
  * The slower refresh rate slighly improves system performance. Ideally, the DRAM/SIMM datasheet should be consulted to determine the correct refresh rates/periods.
* The DRAM refresh burst setting: chipset configuration register 0x86, bits 7,6 set the number of refresh cycles (burst) for each refresh period. 

### ISA Bus Timing

The SARC RC2016 uses 14.31818 MHz / 2 = 7.15909 MHz as ISA clock. That is the frequency BCLK signal is running at.

* 8-bit I/O: /IOR and /IOW timing: 4.5 clock cycles. Signals activated on the falling clock BCLK edge. Singals deactivated on the rising BCLK clock egde.
* 16-bit I/O: /IOR and /IOW timing: 1.5 clock cycles. Signals activated on the falling clock BCLK edge. Singals deactivated on the rising BCLK clock egde.
* Memory: /MEMR, /MEMW, /SMEMR, and /SMEMW timing: 2 clock cycles. Signals activated on the falling? clock BCLK edge. Singals deactivated on the falling? BCLK clock egde.

IO channel refresh setting - chipset configuration register 0x87, bit 7: when set to 1, enables generating refresh cycles on ISA bus by activating /REFRESH signal and suspending other transactions. When set 0 disables ISA refresh cycles, improving system performance.

## Chipset Pinout

### Pins by Function - Chipset, RTC, Keyboard Controller, and BIOS

Pin                                       | Signal Name | Description
------------------------------------------|-------------|------------
13,26,41,65,78,93,117,130,145,169,182,197 | GND         | Ground
12,40,64,92,116,144,168,196               | VCC         | VCC / 5 V Power
1,104,105                                 | NC          | Not connected (1)
7                                         | SPEAKER     | PC speaker, output
8                                         | RESET_SW    | Reset switch, input
9                                         | TURBO_LED   | Turbo LED, output
10                                        | PULLUP      | 4.7k pull-up, input (2)
11                                        | TURBO_SW    | Turbo switch, input
14                                        | X1          | 14.31818 MHz oscillator, input
15                                        | X2          | 14.31818 MHz oscillator, output
141                                       | KBC_IRQ1    | IRQ1 from keyboard controller, input
142                                       | BIOS_CS     | Active high CS for BIOS?, output (3)
143                                       | POWER_GOOD  | Power good from power supply, input
149                                       | RTC_DS      | DS signal to RTC, output
150                                       | RTC_AS      | AS signal to RTC, output
151                                       | RTC_RW      | RW signal to RTC, output
152                                       | /KBC_CS     | /CS to keyboard controller, output
153                                       | /GATE_A20   | /GATE_A20 from keyboard, input
154                                       | KBC_CLK     | Clock to keyboard controller, output
155                                       | /KBC_RC     | Reset from keyboard controller, input
156                                       | /BIOS_CS    | /CS to BIOS ROM (E0000-FFFFF), output
159                                       | /RTC_IRQ8   | /IRQ8 from RTC, input

1. Pins 1, 104, and 105 are not connected. They seem to be pulled high by the chipset during normal operation.
2. Needs to be pulled up with 4.7k - 10k. System will not POST without it. System hangs if this pin is grounded.
3. Pin 142 appears to be active when /BIOS_CS, pin 156 is also active, but it gets active a bit (one ISA clock cycle?!) earlier than /BIOS_CS.

### Pins by Function - CPU and FPU Interface

Pin             | Signal Name | Description
----------------|-------------|------------
42-63,74        | A32-A1      | CPU address bus, input
37              | FPU_PEREQ   | FPU PEREQ, output
38              | FPU_BUSY    | FPU BUSY, output
39              | FPU_ERROR   | FPU ERROR, input
66              | INTR        | CPU INTR, output
67              | NMI         | CPU NMI, output
68              | CPU_PEREQ   | CPU PEREQ, output
69              | CPU_BUSY    | CPU BUSY, output
70              | CPU_RESET   | CPU RESET, output
71              | W/R         | CPU and FPU W/R, input
72              | D/C         | CPU D/C, input
73              | M/IO        | CPU and FPU M/IO, input
75              | /BHE        | CPU /BHE, input
76              | /BLE        | CPU /BLE, input
77              | /ADS        | CPU and FPU /ADS, input
79              | CLK2        | CPU and FPU CLK2, input
80              | /READY      | CPU and FPU /READY, output
81              | HOLD        | CPU HOLD, output
82              | HLDA        | CPU HLDA, input
83-90,94-101    | D0-D15      | CPU data bus, bi-dir
91              | FPU_RESET   | FPU RESET, output

### Pins by Function - DRAM Interface

Pin             | Signal Name | Description
----------------|-------------|------------
102             | /RAS01      | DRAM /RAS, banks 0,1, output
103             | /RAS23      | DRAM /RAS, banks 2,3, output
106-109         | /CAS0-/CAS3 | DRAM /CAS0-/CAS3, output
110             | /MWE        | DRAM write enable, output
111-115,118-123 | MA0-MA10    | DRAM address bus, output
160             | DP_LO       | DRAM parity, low byte, bi-dir
161             | DP_HI       | DRAM parity, high byte, bi-dir

### Pins by Function - ISA Bus

Pin                  | Signal Name                      | Description
---------------------|----------------------------------|------------
2                    | AEN                              | ISA AEN, output
3                    | TC                               | ISA TC, output
4                    | OSC                              | ISA OSC clock 14.31818 MHz, output
5                    | BCLK                             | ISA bus clock, output
6                    | /REFRESH                         | ISA bus refresh, output
16,18,20,22,24,27,39 | /DACK7-/DACK5,/DACK3-/DACK0      | ISA DMA acknowledge, output
17,19,21,23,25,28,30 | DRQ7-DRQ5,DRQ3-DRQ0              | ISA DMA request, input
31                   | /0WS                             | ISA /0WS, input
32                   | MASTER                           | ISA MASTER, input
33                   | IO_CH_RDY                        | ISA IO_CH_RDY, input
34                   | IOCS16                           | ISA IOCS16, input
35                   | IO_CH_CHK                        | ISA IO_CH_CHK, input
36                   | MEMCS16                          | ISA MEMCS16, input
124-129,131-140      | SD0-SD16                         | ISA SD0-SD0 data bus, bi-dir
157                  | /RESET                           | Reset to ISA and peripherals, output
158                  | ALE                              | ISA ALE, output
162-167,170          | LA23-LA17                        | ISA LA23-LA17 unlatched address, output or bi-dir? 
171-181,183-188      | SA16-SA0                         | ISA SA16-SA0 latched address, output or bi-dir?
189                  | /SBHE                            | ISA /SBHE, output
190                  | /IOR                             | ISA I/O read, output
191                  | /IOW                             | ISA I/O write, output
192                  | /MEMR                            | ISA memory read, output
193                  | /MEMW                            | ISA memory write, output
194                  | /SMEMR                           | ISA memory read, low 1 MiB, output
195                  | /SMEMW                           | ISA memory write, low 1 MiB, output
198-208              | IRQ15,IRQ14,IRQ12-IRQ9,IRQ7-IRQ3 | ISA interrupt request, input

# SARC RC2016 Chipset

This documentation is a result of a reverse engineering of an M386F motherboard and observing the chipset configuration registers settings set by AMI and AWARD BIOSes from RC2016-based motherboards.

## Chipset Configuration Registers

The SARC RC2016 configuation registers are accessed by writing the configuration register index to the I/O port 0x22 and then writing or reading the data from the I/O port 0x23

Register Index | Register Bits | Function                                                                   | Default Settings
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
0x82           | Bits 5-4      | System BIOS ROM F000F-FFFFF shadowing control: 00 = disabled, 11 = enabled | Set to 11 by both AMI 5.20 and Award 4.50 BIOSes when System BIOS shadowing is enabled
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
0x87           | Bit 5         | Turbo control: 0 = turbo off, 1 = turbo on                                 | Set by AWARD BIOS according to the "Boot Up System Speed" configuration setting. Can be changed using Ctrl-Alt-Plus/Minus.
0x87           | Bit 4         | Turbo LED control: 0 = LED on, 1 = LED off                                 | Set by AWARD BIOS according to the "Boot Up System Speed" configuration setting. Can be changed using Ctrl-Alt-Plus/Minus.
0x87           | Bits 3-0      | Unknown                                                                    | Set to 0100 by both AMI 5.20 and Award 4.50 BIOSes
0x88           | Bits 7-0      | Unknown                                                                    | AWARD BIOS sets to 00000100 (0x04) when 256 KiB SIMMs with parity are installed. Forcing register to 0x04 with other SIMMs doesn't seem to do anything.
0x88 - 0x8F    | Bits 7-0      | Unknown or not implemented                                                 | Read as 00000000 with both AMI 5.20 and Award 4.50 BIOSes
0x90           | Bit 7         | Unknown                                                                    | Set to 0 by AMI 5.20 BIOS; set to 1 by Award 4.50 BIOS
0x90           | Bit 6         | Current turbo switch state: 0 = off, 1 = on                                | Appears to be read-only, reflecting the current state of the turbo switch. Also see 0x80, bit 4
0x90           | Bit 5         | Unknown                                                                    | Set 0 to by both AMI 5.20 and Award 4.50 BIOSes
0x90           | Bit 4         | Number of wait states: 0 = 1 wait state, 1 = 0 wait states                 | Set by the BIOS according to the wait states configuration setting
0x90           | Bit 3         | RAS to CAS width: 0 = CLK2 * 4, 1 = CLK2 * 6                               | Set by AMI 5.20 BIOS according to the RAS to CAS width setting. Award 5.20 BIOS sets to 0 for 25 and 33 MHz CPUs and to 1 for 40 MHz CPUs

* Some BIOS calls, seem to return the setting to the BIOS configuration setting regardless of the Turbo Switch or modifications to the configuration register

## Chipset Auto Settings - Award 4.50 BIOS

Setting            | Auto-16MHZ | Auto-20MHZ | Auto-25MHZ | Auto-33MHZ | Auto-40MHZ | Auto-50MHZ | AUTO-50DX2 | AUTO-66DX2
-------------------|------------|------------|------------|------------|------------|------------|------------|-----------
Register 0x86      | 11110110   | 11110110   | 11110110   | 11110010   | 11100010   | N/A        | N/A        | N/A
Register 0x87      | 00XXXXXX   | 00XXXXXX   | 00XXXXXX   | 00XXXXXX   | 00XXXXXX   | N/A        | N/A        | N/A
DRAM refresh burst | 4          | 4          | 4          | 4          | 4          | N/A        | N/A        | N/A
DRAM refresh rate  | 8          | 8          | 8          | 8          | 4          | N/A        | N/A        | N/A
RAS to CAS width   | CLK2 * 2   | CLK2 * 2   | CLK2 * 2   | CLK2 * 4   | CLK2 * 4   | N/A        | N/A        | N/A
DRAM RAS precharge | CLK2 * 4   | CLK2 * 4   | CLK2 * 4   | CLK2 * 4   | CLK2 * 4   | N/A        | N/A        | N/A

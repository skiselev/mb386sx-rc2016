# Cyrix Cx486SLC, Texas Instruments Tx486SLC, and TI486SXLC CPUs

## Processor Configuration Registers

The Cyrix and TI 486SLC/486SXLC configuation registers are accessed by writing the configuration register index to the I/O port 0x22 and then writing or reading the data from the I/O port 0x23

Register Index | Register Name | Register Bits | Function                                                                   | Default Settings - AMI | Default Settings - Award
---------------|---------------|---------------|----------------------------------------------------------------------------|------------------------|-----------------------------------------------------------------------
0xC0           | CCR0          | Bit 7         | SUSPEND: 0 = float SUSPA#, 1 = enable SUSP# input and SUSPA# output pins   | 0                      | 0
0xC0           | CCR0          | Bit 6         | (Cx486SLC, Tx486SLC) CO: 0 = 2-way set associative, 1 = direct-mapped      | 0                      | 0
0xC0           | CCR0          | Bit 6         | (TI486SXLC) CKD, clock doubling: 0 = disable, 1 = enable                   | 0                      | 0
0xC0           | CCR0          | Bit 5         | BARB, flush internal cache on HOLD: 0 = disable, 1 = enable                | 1 (enabled)            | 0 (disabled)
0xC0           | CCR0          | Bit 4         | FLUSH, enable FLUSH# pin: 0 = disable, 1 = enable                          | 0 (disabled)           | 1 (enabled)
0xC0           | CCR0          | Bit 3         | KEN, enable KEN# pin: 0 = disable, 1 = enable                              | 0 (disabled)           | 0 (disabled)
0xC0           | CCR0          | Bit 2         | A20M, enable A20M# pin: 0 = disable, 1 = enabled                           | 1 (enabled)            | 1 (enabled)
0xC0           | CCR0          | Bit 1         | NC1: Cache control for 640 KiB to 1 MiB region: 0 = cached, 1 = not cached | 0 (cached)             | 0 (cached)
0xC0           | CCR0          | Bit 0         | NC0: Cache control for 64 KiB at each 1 MiB boundary: 0 = cached, 1 = not cached | 0 (cached)       | 0 (cached)
0xC1           | CCR1          | Bits 7-1      | (Cx486SLC, Tx486SLC) Reserved                                              | 0000000                | 0000000
0xC1           | CCR1          | Bit 0         | (Cx486SLC, Tx486SLC) RPL: 0 = float RPLSET and RPLVAL# output pins, 1 = enable RPLSET and RPLVAL# output pins | 0 (float) | 0 (float)
0xC1           | CCR1          | Bit 7         | (TI486SXLC) SM4, accces region 4 control: 0 = non-cacheable, SMI input ignored, 1 = non-cacheable SMM memory space  | 0 | 0
0xC1           | CCR1          | Bit 6         | (TI486SXLC) WP3, access region 3 control: 0 = non-cacheable, 1 = write protected and cacheable | 0   | 0
0xC1           | CCR1          | Bit 5         | (TI486SXLC) WP2, access region 2 control: 0 = non-cacheable, 1 = write protected and cacheable | 0   | 0
0xC1           | CCR1          | Bit 4         | (TI486SXLC) WP1, access region 1 control: 0 = non-cacheable, 1 = write protected and cacheable | 0   | 0
0xC1           | CCR1          | Bit 3         | (TI486SXLC) MMAC, main memory access: 0 = no effect, 1 = all noncode-segment prefixed data reads and writes which occur within an SMI service routine (or when SMAC=1) access main memory instead of SMM memory space | 0 | 0
0xC1           | CCR1          | Bit 2         | (TI486SXLC) SMAC, system management memory accessL 0 = no effect, 1 = noncode-segment prefixed data reads or writes to addresses within the SMM memory space cause external bus cycles to be issued with SMADS# active, SMI# ignored | 0 | 0
0xC1           | CCR1          | Bit 1         | (TI486SXLC) SMI, enable SMM pins: 0 = ignore SMI#, float SMADS#, 1 = enable SMI# and #SMADS# | 0    | 0
0xC1           | CCR1          | Bit 0         | (TI486SXLC) Reserved                                                       | 0                      | 0
0xC2           | Reserved      | Bits 7-0      | Reserved, read as 0xC2                                                     | 0xC2                   | 0xC2
0xC3           | Reserved      | Bits 7-0      | Reserved, read as 0xC3                                                     | 0xC3                   | 0xC3
0xC4           | NCR1/ARR1     | Bits 7-0      | Non-cacheable region 1, address bits A31 - A24. N/A for 386SX-compatible CPUs | 000000000 (0x00)    | 00000000 (0x00)
0xC5           | NCR1/ARR1     | Bits 7-8      | Non-cacheable region 1, address bits A23 - A16.                            | 00001010 (0x0A)        | 00001010 (0x0A)
0xC6           | NCR1/ARR1     | Bits 7-4      | Non-cacheable region 1, address bits A15 - A12.                            | 0000 (0x0)             | 0000 (0x0)
0xC6           | NCR1/ARR1     | Bits 3-0      | Non-cacheable region 1, block size (see table below)                       | 0110 (0x6 - 128 KiB)   | 0110 (0x6 - 128 KiB)
0xC7           | NCR2/ARR2     | Bits 7-0      | Non-cacheable region 2, address bits A31 - A24. N/A for 386SX-compatible CPUs | 000000000           | 00000000
0xC8           | NCR2/ARR2     | Bits 7-8      | Non-cacheable region 2, address bits A23 - A16.                            | 00001100 (0x0C)        | 00001100 (0x0C)
0xC9           | NCR2/ARR2     | Bits 7-4      | Non-cacheable region 2, address bits A15 - A12.                            | 0000 (0x0)             | 0000 (0x0)
0xC9           | NCR2/ARR2     | Bits 3-0      | Non-cacheable region 2, block size (see table below)                       | 0111 (0x7 - 256 KiB)   | 0111 (0x7 - 256 KiB)
0xCA           | NCR3/ARR3     | Bits 7-0      | Non-cacheable region 3, address bits A31 - A24. N/A for 386SX-compatible CPUs | 000000000 (0x00)    | 00000000 (0x00)
0xCB           | NCR3/ARR3     | Bits 7-8      | Non-cacheable region 3, address bits A23 - A16.                            | 11111010 (0xFA)        | 00000000 (0x00)
0xCC           | NCR3/ARR3     | Bits 7-4      | Non-cacheable region 3, address bits A15 - A12.                            | 0000 (0x0)             | 0000 (0x0)
0xCC           | NCR3/ARR3     | Bits 3-0      | Non-cacheable region 3, block size (see table below)                       | 0110 (0x6 - 128 KiB)   | 0000 (0x0 - disabled)
0xCD           | NCR4/ARR4     | Bits 7-0      | Non-cacheable region 4, address bits A31 - A24. N/A for 386SX-compatible CPUs | 000000000 (0x00)    | 00000000 (0x00)
0xCE           | NCR4/ARR4     | Bits 7-8      | Non-cacheable region 4, address bits A23 - A16.                            | 11111100 (0xFC)        | 00000000 (0x00)
0xCF           | NCR4/ARR4     | Bits 7-4      | Non-cacheable region 4, address bits A15 - A12.                            | 0000 (0x0)             | 0000 (0x0)
0xCF           | NCR4/ARR4     | Bits 3-0      | Non-cacheable region 4, block size (see table below)                       | 0111 (0x7 - 256 KiB)   | 0000 (0x0 - disabled)

#### Non-Cachable Region - Block Sizes

Bits 3-0   | Block Size | Bits 3-0   | Block Size | Bits 3-0   | Block Size | Bits 3-0   | Block Size
-----------|------------|------------|------------|------------|------------|------------|-----------
0000 (0x0) | Disabled   | 0100 (0x4) | 32 KiB     | 1000 (0x8) | 512 KiB    | 1100 (0xC) | 8 MiB
0001 (0x1) | 4 KiB      | 0101 (0x5) | 64 KiB     | 1001 (0x9) | 1 MiB      | 1101 (0xD) | 16 MiB
0010 (0x2) | 8 KiB      | 0110 (0x6) | 128 KiB    | 1010 (0xA) | 2 MiB      | 1110 (0xE) | 32 MiB
0011 (0x3) | 16 KiB     | 0111 (0x7) | 256 KiB    | 1011 (0xB) | 4 MiB      | 1111 (0xF) | 4 GiB

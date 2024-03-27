// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 4  - ap_continue (Read/Write/SC)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of type_r
//        bit 31~0 - type_r[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of in1
//        bit 31~0 - in1[31:0] (Read/Write)
// 0x1c : Data signal of in1
//        bit 31~0 - in1[63:32] (Read/Write)
// 0x20 : reserved
// 0x24 : Data signal of in2
//        bit 31~0 - in2[31:0] (Read/Write)
// 0x28 : Data signal of in2
//        bit 31~0 - in2[63:32] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of out_r
//        bit 31~0 - out_r[31:0] (Read/Write)
// 0x34 : Data signal of out_r
//        bit 31~0 - out_r[63:32] (Read/Write)
// 0x38 : reserved
// 0x3c : Data signal of size
//        bit 31~0 - size[31:0] (Read/Write)
// 0x40 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XKRNL_SCORING_CONTROL_ADDR_AP_CTRL     0x00
#define XKRNL_SCORING_CONTROL_ADDR_GIE         0x04
#define XKRNL_SCORING_CONTROL_ADDR_IER         0x08
#define XKRNL_SCORING_CONTROL_ADDR_ISR         0x0c
#define XKRNL_SCORING_CONTROL_ADDR_TYPE_R_DATA 0x10
#define XKRNL_SCORING_CONTROL_BITS_TYPE_R_DATA 32
#define XKRNL_SCORING_CONTROL_ADDR_IN1_DATA    0x18
#define XKRNL_SCORING_CONTROL_BITS_IN1_DATA    64
#define XKRNL_SCORING_CONTROL_ADDR_IN2_DATA    0x24
#define XKRNL_SCORING_CONTROL_BITS_IN2_DATA    64
#define XKRNL_SCORING_CONTROL_ADDR_OUT_R_DATA  0x30
#define XKRNL_SCORING_CONTROL_BITS_OUT_R_DATA  64
#define XKRNL_SCORING_CONTROL_ADDR_SIZE_DATA   0x3c
#define XKRNL_SCORING_CONTROL_BITS_SIZE_DATA   32


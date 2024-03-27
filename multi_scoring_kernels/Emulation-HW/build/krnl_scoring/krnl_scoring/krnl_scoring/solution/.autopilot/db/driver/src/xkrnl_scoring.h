// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XKRNL_SCORING_H
#define XKRNL_SCORING_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xkrnl_scoring_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XKrnl_scoring_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XKrnl_scoring;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XKrnl_scoring_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XKrnl_scoring_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XKrnl_scoring_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XKrnl_scoring_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XKrnl_scoring_Initialize(XKrnl_scoring *InstancePtr, u16 DeviceId);
XKrnl_scoring_Config* XKrnl_scoring_LookupConfig(u16 DeviceId);
int XKrnl_scoring_CfgInitialize(XKrnl_scoring *InstancePtr, XKrnl_scoring_Config *ConfigPtr);
#else
int XKrnl_scoring_Initialize(XKrnl_scoring *InstancePtr, const char* InstanceName);
int XKrnl_scoring_Release(XKrnl_scoring *InstancePtr);
#endif

void XKrnl_scoring_Start(XKrnl_scoring *InstancePtr);
u32 XKrnl_scoring_IsDone(XKrnl_scoring *InstancePtr);
u32 XKrnl_scoring_IsIdle(XKrnl_scoring *InstancePtr);
u32 XKrnl_scoring_IsReady(XKrnl_scoring *InstancePtr);
void XKrnl_scoring_Continue(XKrnl_scoring *InstancePtr);
void XKrnl_scoring_EnableAutoRestart(XKrnl_scoring *InstancePtr);
void XKrnl_scoring_DisableAutoRestart(XKrnl_scoring *InstancePtr);

void XKrnl_scoring_Set_type_r(XKrnl_scoring *InstancePtr, u32 Data);
u32 XKrnl_scoring_Get_type_r(XKrnl_scoring *InstancePtr);
void XKrnl_scoring_Set_in1(XKrnl_scoring *InstancePtr, u64 Data);
u64 XKrnl_scoring_Get_in1(XKrnl_scoring *InstancePtr);
void XKrnl_scoring_Set_in2(XKrnl_scoring *InstancePtr, u64 Data);
u64 XKrnl_scoring_Get_in2(XKrnl_scoring *InstancePtr);
void XKrnl_scoring_Set_out_r(XKrnl_scoring *InstancePtr, u64 Data);
u64 XKrnl_scoring_Get_out_r(XKrnl_scoring *InstancePtr);
void XKrnl_scoring_Set_size(XKrnl_scoring *InstancePtr, u32 Data);
u32 XKrnl_scoring_Get_size(XKrnl_scoring *InstancePtr);

void XKrnl_scoring_InterruptGlobalEnable(XKrnl_scoring *InstancePtr);
void XKrnl_scoring_InterruptGlobalDisable(XKrnl_scoring *InstancePtr);
void XKrnl_scoring_InterruptEnable(XKrnl_scoring *InstancePtr, u32 Mask);
void XKrnl_scoring_InterruptDisable(XKrnl_scoring *InstancePtr, u32 Mask);
void XKrnl_scoring_InterruptClear(XKrnl_scoring *InstancePtr, u32 Mask);
u32 XKrnl_scoring_InterruptGetEnabled(XKrnl_scoring *InstancePtr);
u32 XKrnl_scoring_InterruptGetStatus(XKrnl_scoring *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

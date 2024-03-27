// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xkrnl_scoring.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XKrnl_scoring_CfgInitialize(XKrnl_scoring *InstancePtr, XKrnl_scoring_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XKrnl_scoring_Start(XKrnl_scoring *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XKrnl_scoring_IsDone(XKrnl_scoring *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XKrnl_scoring_IsIdle(XKrnl_scoring *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XKrnl_scoring_IsReady(XKrnl_scoring *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XKrnl_scoring_Continue(XKrnl_scoring *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XKrnl_scoring_EnableAutoRestart(XKrnl_scoring *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XKrnl_scoring_DisableAutoRestart(XKrnl_scoring *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_AP_CTRL, 0);
}

void XKrnl_scoring_Set_type_r(XKrnl_scoring *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_TYPE_R_DATA, Data);
}

u32 XKrnl_scoring_Get_type_r(XKrnl_scoring *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_TYPE_R_DATA);
    return Data;
}

void XKrnl_scoring_Set_in1(XKrnl_scoring *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IN1_DATA, (u32)(Data));
    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IN1_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_scoring_Get_in1(XKrnl_scoring *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IN1_DATA);
    Data += (u64)XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IN1_DATA + 4) << 32;
    return Data;
}

void XKrnl_scoring_Set_in2(XKrnl_scoring *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IN2_DATA, (u32)(Data));
    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IN2_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_scoring_Get_in2(XKrnl_scoring *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IN2_DATA);
    Data += (u64)XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IN2_DATA + 4) << 32;
    return Data;
}

void XKrnl_scoring_Set_out_r(XKrnl_scoring *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_OUT_R_DATA, (u32)(Data));
    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_OUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_scoring_Get_out_r(XKrnl_scoring *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_OUT_R_DATA);
    Data += (u64)XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_OUT_R_DATA + 4) << 32;
    return Data;
}

void XKrnl_scoring_Set_size(XKrnl_scoring *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_SIZE_DATA, Data);
}

u32 XKrnl_scoring_Get_size(XKrnl_scoring *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_SIZE_DATA);
    return Data;
}

void XKrnl_scoring_InterruptGlobalEnable(XKrnl_scoring *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_GIE, 1);
}

void XKrnl_scoring_InterruptGlobalDisable(XKrnl_scoring *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_GIE, 0);
}

void XKrnl_scoring_InterruptEnable(XKrnl_scoring *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IER);
    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IER, Register | Mask);
}

void XKrnl_scoring_InterruptDisable(XKrnl_scoring *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IER);
    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IER, Register & (~Mask));
}

void XKrnl_scoring_InterruptClear(XKrnl_scoring *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_scoring_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_ISR, Mask);
}

u32 XKrnl_scoring_InterruptGetEnabled(XKrnl_scoring *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_IER);
}

u32 XKrnl_scoring_InterruptGetStatus(XKrnl_scoring *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_scoring_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SCORING_CONTROL_ADDR_ISR);
}


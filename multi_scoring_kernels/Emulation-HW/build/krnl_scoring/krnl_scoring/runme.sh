#!/bin/sh

# 
# v++(TM)
# runme.sh: a v++-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/tools/Xilinx/Vitis_HLS/2022.2/bin:/tools/Xilinx/Vitis/2022.2/bin:/tools/Xilinx/Vitis/2022.2/bin:/tools/Xilinx/Vitis/2022.2/bin
else
  PATH=/tools/Xilinx/Vitis_HLS/2022.2/bin:/tools/Xilinx/Vitis/2022.2/bin:/tools/Xilinx/Vitis/2022.2/bin:/tools/Xilinx/Vitis/2022.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/cnic/wz/workspace/multi_scoring_kernels/Emulation-HW/build/krnl_scoring/krnl_scoring'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vitis_hls -f krnl_scoring.tcl -messageDb vitis_hls.pb

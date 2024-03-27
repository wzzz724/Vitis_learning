set moduleName scoring_cosine_Pipeline_VITIS_LOOP_24_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 1
set StallSigGenFlag 1
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {scoring_cosine_Pipeline_VITIS_LOOP_24_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ size int 32 regular  }
	{ norm2_out float 32 regular {pointer 1}  }
	{ norm1_out float 32 regular {pointer 1}  }
	{ dot_product_out float 32 regular {pointer 1}  }
	{ in1_stream int 32 regular {fifo 0 volatile } {global 0}  }
	{ in2_stream int 32 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "norm2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "norm1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dot_product_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "in1_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "in2_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 35
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ size sc_in sc_lv 32 signal 0 } 
	{ norm2_out sc_out sc_lv 32 signal 1 } 
	{ norm2_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ norm1_out sc_out sc_lv 32 signal 2 } 
	{ norm1_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ dot_product_out sc_out sc_lv 32 signal 3 } 
	{ dot_product_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ in1_stream_dout sc_in sc_lv 32 signal 4 } 
	{ in1_stream_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ in1_stream_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ in1_stream_empty_n sc_in sc_logic 1 signal 4 } 
	{ in1_stream_read sc_out sc_logic 1 signal 4 } 
	{ in2_stream_dout sc_in sc_lv 32 signal 5 } 
	{ in2_stream_num_data_valid sc_in sc_lv 2 signal 5 } 
	{ in2_stream_fifo_cap sc_in sc_lv 2 signal 5 } 
	{ in2_stream_empty_n sc_in sc_logic 1 signal 5 } 
	{ in2_stream_read sc_out sc_logic 1 signal 5 } 
	{ ap_ext_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_str_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_int_blocking_n sc_out sc_logic 1 signal -1 } 
	{ grp_fu_58_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_58_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_58_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_58_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_141_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_141_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_141_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_141_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_141_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "size", "role": "default" }} , 
 	{ "name": "norm2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "norm2_out", "role": "default" }} , 
 	{ "name": "norm2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "norm2_out", "role": "ap_vld" }} , 
 	{ "name": "norm1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "norm1_out", "role": "default" }} , 
 	{ "name": "norm1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "norm1_out", "role": "ap_vld" }} , 
 	{ "name": "dot_product_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dot_product_out", "role": "default" }} , 
 	{ "name": "dot_product_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dot_product_out", "role": "ap_vld" }} , 
 	{ "name": "in1_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in1_stream", "role": "dout" }} , 
 	{ "name": "in1_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in1_stream", "role": "num_data_valid" }} , 
 	{ "name": "in1_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in1_stream", "role": "fifo_cap" }} , 
 	{ "name": "in1_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in1_stream", "role": "empty_n" }} , 
 	{ "name": "in1_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in1_stream", "role": "read" }} , 
 	{ "name": "in2_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in2_stream", "role": "dout" }} , 
 	{ "name": "in2_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in2_stream", "role": "num_data_valid" }} , 
 	{ "name": "in2_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in2_stream", "role": "fifo_cap" }} , 
 	{ "name": "in2_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in2_stream", "role": "empty_n" }} , 
 	{ "name": "in2_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in2_stream", "role": "read" }} , 
 	{ "name": "ap_ext_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_ext_blocking_n", "role": "default" }} , 
 	{ "name": "ap_str_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_str_blocking_n", "role": "default" }} , 
 	{ "name": "ap_int_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_int_blocking_n", "role": "default" }} , 
 	{ "name": "grp_fu_58_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_58_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_58_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_58_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_58_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_58_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_58_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_58_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_141_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_141_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_141_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_141_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_141_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_141_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_141_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_141_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_141_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_141_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "scoring_cosine_Pipeline_VITIS_LOOP_24_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "size", "Type" : "None", "Direction" : "I"},
			{"Name" : "norm2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "norm1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dot_product_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "in1_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in2_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in2_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_24_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	scoring_cosine_Pipeline_VITIS_LOOP_24_1 {
		size {Type I LastRead 0 FirstWrite -1}
		norm2_out {Type O LastRead -1 FirstWrite 8}
		norm1_out {Type O LastRead -1 FirstWrite 8}
		dot_product_out {Type O LastRead -1 FirstWrite 8}
		in1_stream {Type I LastRead 1 FirstWrite -1}
		in2_stream {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	size { ap_none {  { size in_data 0 32 } } }
	norm2_out { ap_vld {  { norm2_out out_data 1 32 }  { norm2_out_ap_vld out_vld 1 1 } } }
	norm1_out { ap_vld {  { norm1_out out_data 1 32 }  { norm1_out_ap_vld out_vld 1 1 } } }
	dot_product_out { ap_vld {  { dot_product_out out_data 1 32 }  { dot_product_out_ap_vld out_vld 1 1 } } }
	in1_stream { ap_fifo {  { in1_stream_dout fifo_port_we 0 32 }  { in1_stream_num_data_valid fifo_status_num_data_valid 0 2 }  { in1_stream_fifo_cap fifo_update 0 2 }  { in1_stream_empty_n fifo_status 0 1 }  { in1_stream_read fifo_data 1 1 } } }
	in2_stream { ap_fifo {  { in2_stream_dout fifo_port_we 0 32 }  { in2_stream_num_data_valid fifo_status_num_data_valid 0 2 }  { in2_stream_fifo_cap fifo_update 0 2 }  { in2_stream_empty_n fifo_status 0 1 }  { in2_stream_read fifo_data 1 1 } } }
}

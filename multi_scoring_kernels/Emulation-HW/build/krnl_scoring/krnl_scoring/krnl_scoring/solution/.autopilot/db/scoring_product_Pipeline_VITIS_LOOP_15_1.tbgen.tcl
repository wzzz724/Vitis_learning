set moduleName scoring_product_Pipeline_VITIS_LOOP_15_1
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
set C_modelName {scoring_product_Pipeline_VITIS_LOOP_15_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ result_load float 32 regular  }
	{ size int 31 regular  }
	{ add5_i_out float 32 regular {pointer 1}  }
	{ in1_stream int 32 regular {fifo 0 volatile } {global 0}  }
	{ in2_stream int 32 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "result_load", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "size", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "add5_i_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "in1_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "in2_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ result_load sc_in sc_lv 32 signal 0 } 
	{ size sc_in sc_lv 31 signal 1 } 
	{ add5_i_out sc_out sc_lv 32 signal 2 } 
	{ add5_i_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ in1_stream_dout sc_in sc_lv 32 signal 3 } 
	{ in1_stream_num_data_valid sc_in sc_lv 2 signal 3 } 
	{ in1_stream_fifo_cap sc_in sc_lv 2 signal 3 } 
	{ in1_stream_empty_n sc_in sc_logic 1 signal 3 } 
	{ in1_stream_read sc_out sc_logic 1 signal 3 } 
	{ in2_stream_dout sc_in sc_lv 32 signal 4 } 
	{ in2_stream_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ in2_stream_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ in2_stream_empty_n sc_in sc_logic 1 signal 4 } 
	{ in2_stream_read sc_out sc_logic 1 signal 4 } 
	{ ap_ext_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_str_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_int_blocking_n sc_out sc_logic 1 signal -1 } 
	{ grp_fu_90_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_90_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_90_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_90_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_90_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_94_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_94_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_94_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_94_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "result_load", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result_load", "role": "default" }} , 
 	{ "name": "size", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "size", "role": "default" }} , 
 	{ "name": "add5_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "add5_i_out", "role": "default" }} , 
 	{ "name": "add5_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "add5_i_out", "role": "ap_vld" }} , 
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
 	{ "name": "grp_fu_90_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_90_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_90_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_90_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_90_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_90_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_90_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_90_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_90_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_90_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_94_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_94_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_94_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_94_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_94_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_94_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_94_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_94_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "scoring_product_Pipeline_VITIS_LOOP_15_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "15", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "result_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "size", "Type" : "None", "Direction" : "I"},
			{"Name" : "add5_i_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "in1_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in2_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in2_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_15_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage6", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage6_subdone", "QuitState" : "ap_ST_fsm_pp0_stage6", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage6_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	scoring_product_Pipeline_VITIS_LOOP_15_1 {
		result_load {Type I LastRead 0 FirstWrite -1}
		size {Type I LastRead 0 FirstWrite -1}
		add5_i_out {Type O LastRead -1 FirstWrite 6}
		in1_stream {Type I LastRead 1 FirstWrite -1}
		in2_stream {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "15", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "15", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	result_load { ap_none {  { result_load in_data 0 32 } } }
	size { ap_none {  { size in_data 0 31 } } }
	add5_i_out { ap_vld {  { add5_i_out out_data 1 32 }  { add5_i_out_ap_vld out_vld 1 1 } } }
	in1_stream { ap_fifo {  { in1_stream_dout fifo_port_we 0 32 }  { in1_stream_num_data_valid fifo_status_num_data_valid 0 2 }  { in1_stream_fifo_cap fifo_update 0 2 }  { in1_stream_empty_n fifo_status 0 1 }  { in1_stream_read fifo_data 1 1 } } }
	in2_stream { ap_fifo {  { in2_stream_dout fifo_port_we 0 32 }  { in2_stream_num_data_valid fifo_status_num_data_valid 0 2 }  { in2_stream_fifo_cap fifo_update 0 2 }  { in2_stream_empty_n fifo_status 0 1 }  { in2_stream_read fifo_data 1 1 } } }
}

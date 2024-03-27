set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME krnl_scoring_entry_proc}
  {SRCNAME load_input_Pipeline_mem_rd MODELNAME load_input_Pipeline_mem_rd RTLNAME krnl_scoring_load_input_Pipeline_mem_rd
    SUBMODULES {
      {MODELNAME krnl_scoring_flow_control_loop_pipe_sequential_init RTLNAME krnl_scoring_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME krnl_scoring_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME load_input MODELNAME load_input RTLNAME krnl_scoring_load_input}
  {SRCNAME load_input.1_Pipeline_mem_rd MODELNAME load_input_1_Pipeline_mem_rd RTLNAME krnl_scoring_load_input_1_Pipeline_mem_rd}
  {SRCNAME load_input.1 MODELNAME load_input_1 RTLNAME krnl_scoring_load_input_1}
  {SRCNAME scoring_euclidean MODELNAME scoring_euclidean RTLNAME krnl_scoring_scoring_euclidean
    SUBMODULES {
      {MODELNAME krnl_scoring_faddfsub_32ns_32ns_32_7_full_dsp_1 RTLNAME krnl_scoring_faddfsub_32ns_32ns_32_7_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME krnl_scoring_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME krnl_scoring_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME krnl_scoring_fsqrt_32ns_32ns_32_12_no_dsp_1 RTLNAME krnl_scoring_fsqrt_32ns_32ns_32_12_no_dsp_1 BINDTYPE op TYPE fsqrt IMPL fabric LATENCY 11 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME scoring_cosine_Pipeline_VITIS_LOOP_24_1 MODELNAME scoring_cosine_Pipeline_VITIS_LOOP_24_1 RTLNAME krnl_scoring_scoring_cosine_Pipeline_VITIS_LOOP_24_1}
  {SRCNAME scoring_cosine MODELNAME scoring_cosine RTLNAME krnl_scoring_scoring_cosine
    SUBMODULES {
      {MODELNAME krnl_scoring_fdiv_32ns_32ns_32_12_no_dsp_1 RTLNAME krnl_scoring_fdiv_32ns_32ns_32_12_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 11 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME scoring_product_Pipeline_VITIS_LOOP_15_1 MODELNAME scoring_product_Pipeline_VITIS_LOOP_15_1 RTLNAME krnl_scoring_scoring_product_Pipeline_VITIS_LOOP_15_1}
  {SRCNAME scoring_product MODELNAME scoring_product RTLNAME krnl_scoring_scoring_product}
  {SRCNAME Block_entry17_proc MODELNAME Block_entry17_proc RTLNAME krnl_scoring_Block_entry17_proc
    SUBMODULES {
      {MODELNAME krnl_scoring_fadd_32ns_32ns_32_7_full_dsp_1 RTLNAME krnl_scoring_fadd_32ns_32ns_32_7_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 6 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME krnl_scoring MODELNAME krnl_scoring RTLNAME krnl_scoring IS_TOP 1
    SUBMODULES {
      {MODELNAME krnl_scoring_fifo_w32_d3_S RTLNAME krnl_scoring_fifo_w32_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME type_r_c_U}
      {MODELNAME krnl_scoring_fifo_w64_d3_S RTLNAME krnl_scoring_fifo_w64_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME out_r_c_U}
      {MODELNAME krnl_scoring_fifo_w32_d2_S RTLNAME krnl_scoring_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME size_c_U}
      {MODELNAME krnl_scoring_fifo_w32_d2_S RTLNAME krnl_scoring_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME in1_stream_U}
      {MODELNAME krnl_scoring_fifo_w32_d2_S RTLNAME krnl_scoring_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME in2_stream_U}
      {MODELNAME krnl_scoring_start_for_Block_entry17_proc_U0 RTLNAME krnl_scoring_start_for_Block_entry17_proc_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Block_entry17_proc_U0_U}
      {MODELNAME krnl_scoring_gmem0_m_axi RTLNAME krnl_scoring_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME krnl_scoring_gmem1_m_axi RTLNAME krnl_scoring_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME krnl_scoring_control_s_axi RTLNAME krnl_scoring_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}

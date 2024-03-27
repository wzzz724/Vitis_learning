-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity krnl_scoring_scoring_cosine is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    size : IN STD_LOGIC_VECTOR (31 downto 0);
    in1_stream_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    in1_stream_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    in1_stream_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    in1_stream_empty_n : IN STD_LOGIC;
    in1_stream_read : OUT STD_LOGIC;
    in2_stream_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    in2_stream_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    in2_stream_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    in2_stream_empty_n : IN STD_LOGIC;
    in2_stream_read : OUT STD_LOGIC;
    result : OUT STD_LOGIC_VECTOR (31 downto 0);
    result_ap_vld : OUT STD_LOGIC;
    ap_ext_blocking_n : OUT STD_LOGIC;
    ap_str_blocking_n : OUT STD_LOGIC;
    ap_int_blocking_n : OUT STD_LOGIC;
    grp_fu_186_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_186_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_186_p_opcode : OUT STD_LOGIC_VECTOR (1 downto 0);
    grp_fu_186_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_186_p_ce : OUT STD_LOGIC;
    grp_fu_190_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_190_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_190_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_190_p_ce : OUT STD_LOGIC );
end;


architecture behav of krnl_scoring_scoring_cosine is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000001000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000010000000000000000000";
    constant ap_ST_fsm_state21 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000100000000000000000000";
    constant ap_ST_fsm_state22 : STD_LOGIC_VECTOR (30 downto 0) := "0000000001000000000000000000000";
    constant ap_ST_fsm_state23 : STD_LOGIC_VECTOR (30 downto 0) := "0000000010000000000000000000000";
    constant ap_ST_fsm_state24 : STD_LOGIC_VECTOR (30 downto 0) := "0000000100000000000000000000000";
    constant ap_ST_fsm_state25 : STD_LOGIC_VECTOR (30 downto 0) := "0000001000000000000000000000000";
    constant ap_ST_fsm_state26 : STD_LOGIC_VECTOR (30 downto 0) := "0000010000000000000000000000000";
    constant ap_ST_fsm_state27 : STD_LOGIC_VECTOR (30 downto 0) := "0000100000000000000000000000000";
    constant ap_ST_fsm_state28 : STD_LOGIC_VECTOR (30 downto 0) := "0001000000000000000000000000000";
    constant ap_ST_fsm_state29 : STD_LOGIC_VECTOR (30 downto 0) := "0010000000000000000000000000000";
    constant ap_ST_fsm_state30 : STD_LOGIC_VECTOR (30 downto 0) := "0100000000000000000000000000000";
    constant ap_ST_fsm_state31 : STD_LOGIC_VECTOR (30 downto 0) := "1000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_12 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010010";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal grp_fu_66_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_i_reg_123 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state15 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state15 : signal is "none";
    signal grp_fu_71_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_i_reg_128 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul8_i_reg_133 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state19 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state19 : signal is "none";
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_idle : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ready : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out_ap_vld : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out_ap_vld : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out_ap_vld : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in1_stream_read : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in2_stream_read : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ext_blocking_n : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_str_blocking_n : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_int_blocking_n : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_ce : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_opcode : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_ce : STD_LOGIC;
    signal grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_fu_62_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state31 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state31 : signal is "none";
    signal ap_CS_fsm_state20 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state20 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_fu_58_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_58_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state16 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state16 : signal is "none";
    signal grp_fu_58_ce : STD_LOGIC;
    signal grp_fu_141_ce : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ST_fsm_state14_blk : STD_LOGIC;
    signal ap_ST_fsm_state15_blk : STD_LOGIC;
    signal ap_ST_fsm_state16_blk : STD_LOGIC;
    signal ap_ST_fsm_state17_blk : STD_LOGIC;
    signal ap_ST_fsm_state18_blk : STD_LOGIC;
    signal ap_ST_fsm_state19_blk : STD_LOGIC;
    signal ap_ST_fsm_state20_blk : STD_LOGIC;
    signal ap_ST_fsm_state21_blk : STD_LOGIC;
    signal ap_ST_fsm_state22_blk : STD_LOGIC;
    signal ap_ST_fsm_state23_blk : STD_LOGIC;
    signal ap_ST_fsm_state24_blk : STD_LOGIC;
    signal ap_ST_fsm_state25_blk : STD_LOGIC;
    signal ap_ST_fsm_state26_blk : STD_LOGIC;
    signal ap_ST_fsm_state27_blk : STD_LOGIC;
    signal ap_ST_fsm_state28_blk : STD_LOGIC;
    signal ap_ST_fsm_state29_blk : STD_LOGIC;
    signal ap_ST_fsm_state30_blk : STD_LOGIC;
    signal ap_ST_fsm_state31_blk : STD_LOGIC;
    signal ap_ext_blocking_sub_n : STD_LOGIC;
    signal ap_wait_0 : STD_LOGIC;
    signal ap_sub_ext_blocking_0 : STD_LOGIC;
    signal ap_str_blocking_sub_n : STD_LOGIC;
    signal ap_sub_str_blocking_0 : STD_LOGIC;
    signal ap_int_blocking_sub_n : STD_LOGIC;
    signal ap_sub_int_blocking_0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component krnl_scoring_scoring_cosine_Pipeline_VITIS_LOOP_24_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        size : IN STD_LOGIC_VECTOR (31 downto 0);
        norm2_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        norm2_out_ap_vld : OUT STD_LOGIC;
        norm1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        norm1_out_ap_vld : OUT STD_LOGIC;
        dot_product_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        dot_product_out_ap_vld : OUT STD_LOGIC;
        in1_stream_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        in1_stream_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        in1_stream_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        in1_stream_empty_n : IN STD_LOGIC;
        in1_stream_read : OUT STD_LOGIC;
        in2_stream_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        in2_stream_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        in2_stream_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        in2_stream_empty_n : IN STD_LOGIC;
        in2_stream_read : OUT STD_LOGIC;
        ap_ext_blocking_n : OUT STD_LOGIC;
        ap_str_blocking_n : OUT STD_LOGIC;
        ap_int_blocking_n : OUT STD_LOGIC;
        grp_fu_58_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_58_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_58_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_58_p_ce : OUT STD_LOGIC;
        grp_fu_141_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_141_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_141_p_opcode : OUT STD_LOGIC_VECTOR (1 downto 0);
        grp_fu_141_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_141_p_ce : OUT STD_LOGIC );
    end component;


    component krnl_scoring_fmul_32ns_32ns_32_4_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component krnl_scoring_fdiv_32ns_32ns_32_12_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component krnl_scoring_fsqrt_32ns_32ns_32_12_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component krnl_scoring_fadd_32ns_32ns_32_7_full_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46 : component krnl_scoring_scoring_cosine_Pipeline_VITIS_LOOP_24_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start,
        ap_done => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done,
        ap_idle => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_idle,
        ap_ready => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ready,
        size => size,
        norm2_out => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out,
        norm2_out_ap_vld => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out_ap_vld,
        norm1_out => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out,
        norm1_out_ap_vld => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out_ap_vld,
        dot_product_out => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out,
        dot_product_out_ap_vld => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out_ap_vld,
        in1_stream_dout => in1_stream_dout,
        in1_stream_num_data_valid => ap_const_lv2_0,
        in1_stream_fifo_cap => ap_const_lv2_0,
        in1_stream_empty_n => in1_stream_empty_n,
        in1_stream_read => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in1_stream_read,
        in2_stream_dout => in2_stream_dout,
        in2_stream_num_data_valid => ap_const_lv2_0,
        in2_stream_fifo_cap => ap_const_lv2_0,
        in2_stream_empty_n => in2_stream_empty_n,
        in2_stream_read => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in2_stream_read,
        ap_ext_blocking_n => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ext_blocking_n,
        ap_str_blocking_n => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_str_blocking_n,
        ap_int_blocking_n => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_int_blocking_n,
        grp_fu_58_p_din0 => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din0,
        grp_fu_58_p_din1 => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din1,
        grp_fu_58_p_dout0 => grp_fu_190_p_dout0,
        grp_fu_58_p_ce => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_ce,
        grp_fu_141_p_din0 => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din0,
        grp_fu_141_p_din1 => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din1,
        grp_fu_141_p_opcode => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_opcode,
        grp_fu_141_p_dout0 => grp_fu_186_p_dout0,
        grp_fu_141_p_ce => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_ce);

    fdiv_32ns_32ns_32_12_no_dsp_1_U41 : component krnl_scoring_fdiv_32ns_32ns_32_12_no_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 12,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out,
        din1 => mul8_i_reg_133,
        ce => ap_const_logic_1,
        dout => grp_fu_62_p2);

    fsqrt_32ns_32ns_32_12_no_dsp_1_U42 : component krnl_scoring_fsqrt_32ns_32ns_32_12_no_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 12,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => ap_const_lv32_0,
        din1 => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out,
        ce => ap_const_logic_1,
        dout => grp_fu_66_p2);

    fsqrt_32ns_32ns_32_12_no_dsp_1_U43 : component krnl_scoring_fsqrt_32ns_32ns_32_12_no_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 12,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => ap_const_lv32_0,
        din1 => grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out,
        ce => ap_const_logic_1,
        dout => grp_fu_71_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ready = ap_const_logic_1)) then 
                    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state19)) then
                mul8_i_reg_133 <= grp_fu_190_p_dout0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state15)) then
                tmp_1_i_reg_128 <= grp_fu_71_p2;
                tmp_i_reg_123 <= grp_fu_66_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if (((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                ap_NS_fsm <= ap_ST_fsm_state18;
            when ap_ST_fsm_state18 => 
                ap_NS_fsm <= ap_ST_fsm_state19;
            when ap_ST_fsm_state19 => 
                ap_NS_fsm <= ap_ST_fsm_state20;
            when ap_ST_fsm_state20 => 
                ap_NS_fsm <= ap_ST_fsm_state21;
            when ap_ST_fsm_state21 => 
                ap_NS_fsm <= ap_ST_fsm_state22;
            when ap_ST_fsm_state22 => 
                ap_NS_fsm <= ap_ST_fsm_state23;
            when ap_ST_fsm_state23 => 
                ap_NS_fsm <= ap_ST_fsm_state24;
            when ap_ST_fsm_state24 => 
                ap_NS_fsm <= ap_ST_fsm_state25;
            when ap_ST_fsm_state25 => 
                ap_NS_fsm <= ap_ST_fsm_state26;
            when ap_ST_fsm_state26 => 
                ap_NS_fsm <= ap_ST_fsm_state27;
            when ap_ST_fsm_state27 => 
                ap_NS_fsm <= ap_ST_fsm_state28;
            when ap_ST_fsm_state28 => 
                ap_NS_fsm <= ap_ST_fsm_state29;
            when ap_ST_fsm_state29 => 
                ap_NS_fsm <= ap_ST_fsm_state30;
            when ap_ST_fsm_state30 => 
                ap_NS_fsm <= ap_ST_fsm_state31;
            when ap_ST_fsm_state31 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state15 <= ap_CS_fsm(14);
    ap_CS_fsm_state16 <= ap_CS_fsm(15);
    ap_CS_fsm_state19 <= ap_CS_fsm(18);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state20 <= ap_CS_fsm(19);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state31 <= ap_CS_fsm(30);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;
    ap_ST_fsm_state11_blk <= ap_const_logic_0;
    ap_ST_fsm_state12_blk <= ap_const_logic_0;
    ap_ST_fsm_state13_blk <= ap_const_logic_0;
    ap_ST_fsm_state14_blk <= ap_const_logic_0;
    ap_ST_fsm_state15_blk <= ap_const_logic_0;
    ap_ST_fsm_state16_blk <= ap_const_logic_0;
    ap_ST_fsm_state17_blk <= ap_const_logic_0;
    ap_ST_fsm_state18_blk <= ap_const_logic_0;
    ap_ST_fsm_state19_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state20_blk <= ap_const_logic_0;
    ap_ST_fsm_state21_blk <= ap_const_logic_0;
    ap_ST_fsm_state22_blk <= ap_const_logic_0;
    ap_ST_fsm_state23_blk <= ap_const_logic_0;
    ap_ST_fsm_state24_blk <= ap_const_logic_0;
    ap_ST_fsm_state25_blk <= ap_const_logic_0;
    ap_ST_fsm_state26_blk <= ap_const_logic_0;
    ap_ST_fsm_state27_blk <= ap_const_logic_0;
    ap_ST_fsm_state28_blk <= ap_const_logic_0;
    ap_ST_fsm_state29_blk <= ap_const_logic_0;
    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state30_blk <= ap_const_logic_0;
    ap_ST_fsm_state31_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done)
    begin
        if ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state31)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state31) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_ext_blocking_n <= (ap_ext_blocking_sub_n and ap_const_logic_1);

    ap_ext_blocking_sub_n_assign_proc : process(ap_wait_0, ap_sub_ext_blocking_0)
    begin
        if (((ap_wait_0 and ap_sub_ext_blocking_0) = ap_const_logic_1)) then 
            ap_ext_blocking_sub_n <= ap_const_logic_0;
        else 
            ap_ext_blocking_sub_n <= ap_const_logic_1;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_int_blocking_n <= (ap_int_blocking_sub_n and ap_const_logic_1);

    ap_int_blocking_sub_n_assign_proc : process(ap_wait_0, ap_sub_int_blocking_0)
    begin
        if (((ap_wait_0 and ap_sub_int_blocking_0) = ap_const_logic_1)) then 
            ap_int_blocking_sub_n <= ap_const_logic_0;
        else 
            ap_int_blocking_sub_n <= ap_const_logic_1;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state31)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state31)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_str_blocking_n <= (ap_str_blocking_sub_n and ap_const_logic_1);

    ap_str_blocking_sub_n_assign_proc : process(ap_wait_0, ap_sub_str_blocking_0)
    begin
        if (((ap_wait_0 and ap_sub_str_blocking_0) = ap_const_logic_1)) then 
            ap_str_blocking_sub_n <= ap_const_logic_0;
        else 
            ap_str_blocking_sub_n <= ap_const_logic_1;
        end if; 
    end process;


    ap_sub_ext_blocking_0_assign_proc : process(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ext_blocking_n)
    begin
        if ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ext_blocking_n = ap_const_logic_0)) then 
            ap_sub_ext_blocking_0 <= ap_const_logic_1;
        else 
            ap_sub_ext_blocking_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sub_int_blocking_0_assign_proc : process(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_int_blocking_n)
    begin
        if ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_int_blocking_n = ap_const_logic_0)) then 
            ap_sub_int_blocking_0 <= ap_const_logic_1;
        else 
            ap_sub_int_blocking_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sub_str_blocking_0_assign_proc : process(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_str_blocking_n)
    begin
        if ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_str_blocking_n = ap_const_logic_0)) then 
            ap_sub_str_blocking_0 <= ap_const_logic_1;
        else 
            ap_sub_str_blocking_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_wait_0_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_fsm_state3 = ap_CS_fsm)) then 
            ap_wait_0 <= ap_const_logic_1;
        else 
            ap_wait_0 <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_141_ce_assign_proc : process(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_ce, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_141_ce <= grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_ce;
        else 
            grp_fu_141_ce <= ap_const_logic_1;
        end if; 
    end process;

    grp_fu_186_p_ce <= grp_fu_141_ce;
    grp_fu_186_p_din0 <= grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din0;
    grp_fu_186_p_din1 <= grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din1;
    grp_fu_186_p_opcode <= ap_const_lv2_0;
    grp_fu_190_p_ce <= grp_fu_58_ce;
    grp_fu_190_p_din0 <= grp_fu_58_p0;
    grp_fu_190_p_din1 <= grp_fu_58_p1;

    grp_fu_58_ce_assign_proc : process(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_ce, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_58_ce <= grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_ce;
        else 
            grp_fu_58_ce <= ap_const_logic_1;
        end if; 
    end process;


    grp_fu_58_p0_assign_proc : process(tmp_i_reg_123, grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din0, ap_CS_fsm_state3, ap_CS_fsm_state16)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_58_p0 <= grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
            grp_fu_58_p0 <= tmp_i_reg_123;
        else 
            grp_fu_58_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_58_p1_assign_proc : process(tmp_1_i_reg_128, grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din1, ap_CS_fsm_state3, ap_CS_fsm_state16)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_58_p1 <= grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
            grp_fu_58_p1 <= tmp_1_i_reg_128;
        else 
            grp_fu_58_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start <= grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg;

    in1_stream_read_assign_proc : process(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in1_stream_read, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            in1_stream_read <= grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in1_stream_read;
        else 
            in1_stream_read <= ap_const_logic_0;
        end if; 
    end process;


    in2_stream_read_assign_proc : process(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in2_stream_read, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            in2_stream_read <= grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in2_stream_read;
        else 
            in2_stream_read <= ap_const_logic_0;
        end if; 
    end process;

    result <= grp_fu_62_p2;

    result_ap_vld_assign_proc : process(ap_CS_fsm_state31)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state31)) then 
            result_ap_vld <= ap_const_logic_1;
        else 
            result_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

end behav;
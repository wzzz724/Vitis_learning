// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module krnl_scoring_scoring_cosine (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        size,
        in1_stream_dout,
        in1_stream_num_data_valid,
        in1_stream_fifo_cap,
        in1_stream_empty_n,
        in1_stream_read,
        in2_stream_dout,
        in2_stream_num_data_valid,
        in2_stream_fifo_cap,
        in2_stream_empty_n,
        in2_stream_read,
        result,
        result_ap_vld,
        ap_ext_blocking_n,
        ap_str_blocking_n,
        ap_int_blocking_n,
        grp_fu_186_p_din0,
        grp_fu_186_p_din1,
        grp_fu_186_p_opcode,
        grp_fu_186_p_dout0,
        grp_fu_186_p_ce,
        grp_fu_190_p_din0,
        grp_fu_190_p_din1,
        grp_fu_190_p_dout0,
        grp_fu_190_p_ce
);

parameter    ap_ST_fsm_state1 = 31'd1;
parameter    ap_ST_fsm_state2 = 31'd2;
parameter    ap_ST_fsm_state3 = 31'd4;
parameter    ap_ST_fsm_state4 = 31'd8;
parameter    ap_ST_fsm_state5 = 31'd16;
parameter    ap_ST_fsm_state6 = 31'd32;
parameter    ap_ST_fsm_state7 = 31'd64;
parameter    ap_ST_fsm_state8 = 31'd128;
parameter    ap_ST_fsm_state9 = 31'd256;
parameter    ap_ST_fsm_state10 = 31'd512;
parameter    ap_ST_fsm_state11 = 31'd1024;
parameter    ap_ST_fsm_state12 = 31'd2048;
parameter    ap_ST_fsm_state13 = 31'd4096;
parameter    ap_ST_fsm_state14 = 31'd8192;
parameter    ap_ST_fsm_state15 = 31'd16384;
parameter    ap_ST_fsm_state16 = 31'd32768;
parameter    ap_ST_fsm_state17 = 31'd65536;
parameter    ap_ST_fsm_state18 = 31'd131072;
parameter    ap_ST_fsm_state19 = 31'd262144;
parameter    ap_ST_fsm_state20 = 31'd524288;
parameter    ap_ST_fsm_state21 = 31'd1048576;
parameter    ap_ST_fsm_state22 = 31'd2097152;
parameter    ap_ST_fsm_state23 = 31'd4194304;
parameter    ap_ST_fsm_state24 = 31'd8388608;
parameter    ap_ST_fsm_state25 = 31'd16777216;
parameter    ap_ST_fsm_state26 = 31'd33554432;
parameter    ap_ST_fsm_state27 = 31'd67108864;
parameter    ap_ST_fsm_state28 = 31'd134217728;
parameter    ap_ST_fsm_state29 = 31'd268435456;
parameter    ap_ST_fsm_state30 = 31'd536870912;
parameter    ap_ST_fsm_state31 = 31'd1073741824;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] size;
input  [31:0] in1_stream_dout;
input  [1:0] in1_stream_num_data_valid;
input  [1:0] in1_stream_fifo_cap;
input   in1_stream_empty_n;
output   in1_stream_read;
input  [31:0] in2_stream_dout;
input  [1:0] in2_stream_num_data_valid;
input  [1:0] in2_stream_fifo_cap;
input   in2_stream_empty_n;
output   in2_stream_read;
output  [31:0] result;
output   result_ap_vld;
output   ap_ext_blocking_n;
output   ap_str_blocking_n;
output   ap_int_blocking_n;
output  [31:0] grp_fu_186_p_din0;
output  [31:0] grp_fu_186_p_din1;
output  [1:0] grp_fu_186_p_opcode;
input  [31:0] grp_fu_186_p_dout0;
output   grp_fu_186_p_ce;
output  [31:0] grp_fu_190_p_din0;
output  [31:0] grp_fu_190_p_din1;
input  [31:0] grp_fu_190_p_dout0;
output   grp_fu_190_p_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in1_stream_read;
reg in2_stream_read;
reg result_ap_vld;

(* fsm_encoding = "none" *) reg   [30:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [31:0] grp_fu_66_p2;
reg   [31:0] tmp_i_reg_123;
wire    ap_CS_fsm_state15;
wire   [31:0] grp_fu_71_p2;
reg   [31:0] tmp_1_i_reg_128;
reg   [31:0] mul8_i_reg_133;
wire    ap_CS_fsm_state19;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_idle;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ready;
wire   [31:0] grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out_ap_vld;
wire   [31:0] grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out_ap_vld;
wire   [31:0] grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out_ap_vld;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in1_stream_read;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in2_stream_read;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ext_blocking_n;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_str_blocking_n;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_int_blocking_n;
wire   [31:0] grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din0;
wire   [31:0] grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din1;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_ce;
wire   [31:0] grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din0;
wire   [31:0] grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din1;
wire   [1:0] grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_opcode;
wire    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_ce;
reg    grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire   [31:0] grp_fu_62_p2;
wire    ap_CS_fsm_state31;
wire    ap_CS_fsm_state20;
wire    ap_CS_fsm_state4;
reg   [31:0] grp_fu_58_p0;
reg   [31:0] grp_fu_58_p1;
wire    ap_CS_fsm_state16;
reg    grp_fu_58_ce;
reg    grp_fu_141_ce;
reg   [30:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
wire    ap_ST_fsm_state20_blk;
wire    ap_ST_fsm_state21_blk;
wire    ap_ST_fsm_state22_blk;
wire    ap_ST_fsm_state23_blk;
wire    ap_ST_fsm_state24_blk;
wire    ap_ST_fsm_state25_blk;
wire    ap_ST_fsm_state26_blk;
wire    ap_ST_fsm_state27_blk;
wire    ap_ST_fsm_state28_blk;
wire    ap_ST_fsm_state29_blk;
wire    ap_ST_fsm_state30_blk;
wire    ap_ST_fsm_state31_blk;
reg    ap_ext_blocking_sub_n;
reg    ap_wait_0;
reg    ap_sub_ext_blocking_0;
reg    ap_str_blocking_sub_n;
reg    ap_sub_str_blocking_0;
reg    ap_int_blocking_sub_n;
reg    ap_sub_int_blocking_0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 31'd1;
#0 grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg = 1'b0;
end

krnl_scoring_scoring_cosine_Pipeline_VITIS_LOOP_24_1 grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start),
    .ap_done(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done),
    .ap_idle(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_idle),
    .ap_ready(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ready),
    .size(size),
    .norm2_out(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out),
    .norm2_out_ap_vld(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out_ap_vld),
    .norm1_out(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out),
    .norm1_out_ap_vld(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out_ap_vld),
    .dot_product_out(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out),
    .dot_product_out_ap_vld(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out_ap_vld),
    .in1_stream_dout(in1_stream_dout),
    .in1_stream_num_data_valid(2'd0),
    .in1_stream_fifo_cap(2'd0),
    .in1_stream_empty_n(in1_stream_empty_n),
    .in1_stream_read(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in1_stream_read),
    .in2_stream_dout(in2_stream_dout),
    .in2_stream_num_data_valid(2'd0),
    .in2_stream_fifo_cap(2'd0),
    .in2_stream_empty_n(in2_stream_empty_n),
    .in2_stream_read(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in2_stream_read),
    .ap_ext_blocking_n(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ext_blocking_n),
    .ap_str_blocking_n(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_str_blocking_n),
    .ap_int_blocking_n(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_int_blocking_n),
    .grp_fu_58_p_din0(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din0),
    .grp_fu_58_p_din1(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din1),
    .grp_fu_58_p_dout0(grp_fu_190_p_dout0),
    .grp_fu_58_p_ce(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_ce),
    .grp_fu_141_p_din0(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din0),
    .grp_fu_141_p_din1(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din1),
    .grp_fu_141_p_opcode(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_opcode),
    .grp_fu_141_p_dout0(grp_fu_186_p_dout0),
    .grp_fu_141_p_ce(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_ce)
);

krnl_scoring_fdiv_32ns_32ns_32_12_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 12 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fdiv_32ns_32ns_32_12_no_dsp_1_U41(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_dot_product_out),
    .din1(mul8_i_reg_133),
    .ce(1'b1),
    .dout(grp_fu_62_p2)
);

krnl_scoring_fsqrt_32ns_32ns_32_12_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 12 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fsqrt_32ns_32ns_32_12_no_dsp_1_U42(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(32'd0),
    .din1(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm1_out),
    .ce(1'b1),
    .dout(grp_fu_66_p2)
);

krnl_scoring_fsqrt_32ns_32ns_32_12_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 12 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fsqrt_32ns_32ns_32_12_no_dsp_1_U43(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(32'd0),
    .din1(grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_norm2_out),
    .ce(1'b1),
    .dout(grp_fu_71_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg <= 1'b1;
        end else if ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ready == 1'b1)) begin
            grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
        mul8_i_reg_133 <= grp_fu_190_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state15)) begin
        tmp_1_i_reg_128 <= grp_fu_71_p2;
        tmp_i_reg_123 <= grp_fu_66_p2;
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state20_blk = 1'b0;

assign ap_ST_fsm_state21_blk = 1'b0;

assign ap_ST_fsm_state22_blk = 1'b0;

assign ap_ST_fsm_state23_blk = 1'b0;

assign ap_ST_fsm_state24_blk = 1'b0;

assign ap_ST_fsm_state25_blk = 1'b0;

assign ap_ST_fsm_state26_blk = 1'b0;

assign ap_ST_fsm_state27_blk = 1'b0;

assign ap_ST_fsm_state28_blk = 1'b0;

assign ap_ST_fsm_state29_blk = 1'b0;

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state30_blk = 1'b0;

assign ap_ST_fsm_state31_blk = 1'b0;

always @ (*) begin
    if ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state31) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_wait_0 & ap_sub_ext_blocking_0) == 1'b1)) begin
        ap_ext_blocking_sub_n = 1'b0;
    end else begin
        ap_ext_blocking_sub_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_wait_0 & ap_sub_int_blocking_0) == 1'b1)) begin
        ap_int_blocking_sub_n = 1'b0;
    end else begin
        ap_int_blocking_sub_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state31)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_wait_0 & ap_sub_str_blocking_0) == 1'b1)) begin
        ap_str_blocking_sub_n = 1'b0;
    end else begin
        ap_str_blocking_sub_n = 1'b1;
    end
end

always @ (*) begin
    if ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_ext_blocking_n == 1'b0)) begin
        ap_sub_ext_blocking_0 = 1'b1;
    end else begin
        ap_sub_ext_blocking_0 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_int_blocking_n == 1'b0)) begin
        ap_sub_int_blocking_0 = 1'b1;
    end else begin
        ap_sub_int_blocking_0 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_str_blocking_n == 1'b0)) begin
        ap_sub_str_blocking_0 = 1'b1;
    end else begin
        ap_sub_str_blocking_0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_ST_fsm_state3 == ap_CS_fsm)) begin
        ap_wait_0 = 1'b1;
    end else begin
        ap_wait_0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_141_ce = grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_ce;
    end else begin
        grp_fu_141_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_58_ce = grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_ce;
    end else begin
        grp_fu_58_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_58_p0 = grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din0;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        grp_fu_58_p0 = tmp_i_reg_123;
    end else begin
        grp_fu_58_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_58_p1 = grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_58_p_din1;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        grp_fu_58_p1 = tmp_1_i_reg_128;
    end else begin
        grp_fu_58_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        in1_stream_read = grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in1_stream_read;
    end else begin
        in1_stream_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        in2_stream_read = grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_in2_stream_read;
    end else begin
        in2_stream_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state31)) begin
        result_ap_vld = 1'b1;
    end else begin
        result_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state30;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state31 = ap_CS_fsm[32'd30];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_ext_blocking_n = (ap_ext_blocking_sub_n & 1'b1);

assign ap_int_blocking_n = (ap_int_blocking_sub_n & 1'b1);

assign ap_str_blocking_n = (ap_str_blocking_sub_n & 1'b1);

assign grp_fu_186_p_ce = grp_fu_141_ce;

assign grp_fu_186_p_din0 = grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din0;

assign grp_fu_186_p_din1 = grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_grp_fu_141_p_din1;

assign grp_fu_186_p_opcode = 2'd0;

assign grp_fu_190_p_ce = grp_fu_58_ce;

assign grp_fu_190_p_din0 = grp_fu_58_p0;

assign grp_fu_190_p_din1 = grp_fu_58_p1;

assign grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start = grp_scoring_cosine_Pipeline_VITIS_LOOP_24_1_fu_46_ap_start_reg;

assign result = grp_fu_62_p2;

endmodule //krnl_scoring_scoring_cosine

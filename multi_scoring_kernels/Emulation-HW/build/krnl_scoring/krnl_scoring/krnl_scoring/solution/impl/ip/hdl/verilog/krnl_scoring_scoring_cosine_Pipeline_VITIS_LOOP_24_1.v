// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module krnl_scoring_scoring_cosine_Pipeline_VITIS_LOOP_24_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        size,
        norm2_out,
        norm2_out_ap_vld,
        norm1_out,
        norm1_out_ap_vld,
        dot_product_out,
        dot_product_out_ap_vld,
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
        ap_ext_blocking_n,
        ap_str_blocking_n,
        ap_int_blocking_n,
        grp_fu_58_p_din0,
        grp_fu_58_p_din1,
        grp_fu_58_p_dout0,
        grp_fu_58_p_ce,
        grp_fu_141_p_din0,
        grp_fu_141_p_din1,
        grp_fu_141_p_opcode,
        grp_fu_141_p_dout0,
        grp_fu_141_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 7'd1;
parameter    ap_ST_fsm_pp0_stage1 = 7'd2;
parameter    ap_ST_fsm_pp0_stage2 = 7'd4;
parameter    ap_ST_fsm_pp0_stage3 = 7'd8;
parameter    ap_ST_fsm_pp0_stage4 = 7'd16;
parameter    ap_ST_fsm_pp0_stage5 = 7'd32;
parameter    ap_ST_fsm_pp0_stage6 = 7'd64;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] size;
output  [31:0] norm2_out;
output   norm2_out_ap_vld;
output  [31:0] norm1_out;
output   norm1_out_ap_vld;
output  [31:0] dot_product_out;
output   dot_product_out_ap_vld;
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
output   ap_ext_blocking_n;
output   ap_str_blocking_n;
output   ap_int_blocking_n;
output  [31:0] grp_fu_58_p_din0;
output  [31:0] grp_fu_58_p_din1;
input  [31:0] grp_fu_58_p_dout0;
output   grp_fu_58_p_ce;
output  [31:0] grp_fu_141_p_din0;
output  [31:0] grp_fu_141_p_din1;
output  [1:0] grp_fu_141_p_opcode;
input  [31:0] grp_fu_141_p_dout0;
output   grp_fu_141_p_ce;

reg ap_idle;
reg norm2_out_ap_vld;
reg norm1_out_ap_vld;
reg dot_product_out_ap_vld;
reg in1_stream_read;
reg in2_stream_read;

(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage6;
wire    ap_block_state7_pp0_stage6_iter0;
wire    ap_block_state14_pp0_stage6_iter1;
wire    ap_block_pp0_stage6_subdone;
reg   [0:0] icmp_ln24_reg_232;
reg    ap_condition_exit_pp0_iter0_stage6;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    in1_stream_blk_n;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1;
reg    in2_stream_blk_n;
reg   [31:0] reg_107;
wire    ap_CS_fsm_pp0_stage5;
wire    ap_block_state6_pp0_stage5_iter0;
wire    ap_block_state13_pp0_stage5_iter1;
wire    ap_block_pp0_stage5_11001;
wire    ap_block_pp0_stage6_11001;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state8_pp0_stage0_iter1;
wire    ap_block_state15_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln24_fu_138_p2;
reg   [0:0] icmp_ln24_reg_232_pp0_iter1_reg;
wire   [30:0] i_3_fu_144_p2;
reg   [30:0] i_3_reg_236;
reg   [31:0] in1_stream_read_reg_241;
reg    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state9_pp0_stage1_iter1;
wire    ap_block_state16_pp0_stage1_iter2;
reg    ap_block_pp0_stage1_11001;
reg   [31:0] in2_stream_read_reg_246;
wire   [31:0] ele1_fu_154_p1;
reg   [31:0] ele1_reg_251;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_state10_pp0_stage2_iter1;
wire    ap_block_pp0_stage2_11001;
wire   [31:0] ele2_fu_158_p1;
reg   [31:0] ele2_reg_257;
reg   [31:0] mul_i_reg_263;
reg   [31:0] mul2_i_reg_273;
reg   [31:0] mul4_i_reg_283;
reg    ap_enable_reg_pp0_iter0_reg;
reg    ap_block_pp0_stage1_subdone;
reg   [31:0] dot_product_fu_44;
reg   [31:0] ap_sig_allocacmp_dot_product_load;
wire    ap_block_pp0_stage6;
wire    ap_loop_init;
reg   [31:0] norm1_fu_48;
reg   [31:0] ap_sig_allocacmp_norm1_load;
wire    ap_block_pp0_stage0;
reg   [31:0] norm2_fu_52;
reg   [31:0] ap_sig_allocacmp_norm2_load;
reg   [30:0] i_fu_56;
reg   [30:0] ap_sig_allocacmp_i_load;
reg    ap_block_pp0_stage1_01001;
reg   [31:0] grp_fu_99_p0;
reg   [31:0] grp_fu_99_p1;
reg   [31:0] grp_fu_103_p0;
reg   [31:0] grp_fu_103_p1;
wire    ap_block_pp0_stage2;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_pp0_stage3;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_pp0_stage4;
wire   [31:0] i_cast_fu_134_p1;
reg    grp_fu_99_ce;
wire    ap_block_state4_pp0_stage3_iter0;
wire    ap_block_state11_pp0_stage3_iter1;
wire    ap_block_pp0_stage3_11001;
wire    ap_block_state5_pp0_stage4_iter0;
wire    ap_block_state12_pp0_stage4_iter1;
wire    ap_block_pp0_stage4_11001;
reg    grp_fu_103_ce;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_condition_exit_pp0_iter1_stage1;
reg    ap_idle_pp0_0to0;
reg   [6:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to2;
reg    ap_done_pending_pp0;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_pp0_stage3_subdone;
wire    ap_block_pp0_stage4_subdone;
wire    ap_block_pp0_stage5_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_block_pp0_stage6_00001;
wire    ap_block_pp0_stage0_00001;
reg    ap_block_pp0_stage1_00001;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

krnl_scoring_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage6),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage6)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage6_subdone) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage6_subdone) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to0 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter1_stage1))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage6_11001) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dot_product_fu_44 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage6_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
        dot_product_fu_44 <= reg_107;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_fu_56 <= 31'd0;
    end else if (((icmp_ln24_reg_232 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        i_fu_56 <= i_3_reg_236;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            norm1_fu_48 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            norm1_fu_48 <= reg_107;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        norm2_fu_52 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        norm2_fu_52 <= reg_107;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln24_reg_232 == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ele1_reg_251 <= ele1_fu_154_p1;
        ele2_reg_257 <= ele2_fu_158_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_3_reg_236 <= i_3_fu_144_p2;
        icmp_ln24_reg_232 <= icmp_ln24_fu_138_p2;
        icmp_ln24_reg_232_pp0_iter1_reg <= icmp_ln24_reg_232;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln24_reg_232 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        in1_stream_read_reg_241 <= in1_stream_dout;
        in2_stream_read_reg_246 <= in2_stream_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln24_reg_232 == 1'd1) & (1'b0 == ap_block_pp0_stage6_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
        mul2_i_reg_273 <= grp_fu_58_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mul4_i_reg_283 <= grp_fu_58_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln24_reg_232 == 1'd1) & (1'b0 == ap_block_pp0_stage5_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        mul_i_reg_263 <= grp_fu_58_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage6_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6)) | ((1'b0 == ap_block_pp0_stage5_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5)))) begin
        reg_107 <= grp_fu_141_p_dout0;
    end
end

always @ (*) begin
    if (((icmp_ln24_reg_232 == 1'd0) & (1'b0 == ap_block_pp0_stage6_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
        ap_condition_exit_pp0_iter0_stage6 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage6 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln24_reg_232_pp0_iter1_reg == 1'd0))) begin
        ap_condition_exit_pp0_iter1_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (~((ap_loop_exit_ready == 1'b0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b0))) begin
        ap_done_pending_pp0 = 1'b1;
    end else begin
        ap_done_pending_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to2 = 1'b1;
    end else begin
        ap_idle_pp0_1to2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage6_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage6) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
        ap_sig_allocacmp_dot_product_load = reg_107;
    end else begin
        ap_sig_allocacmp_dot_product_load = dot_product_fu_44;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_load = 31'd0;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_56;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_norm1_load = reg_107;
    end else begin
        ap_sig_allocacmp_norm1_load = norm1_fu_48;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_sig_allocacmp_norm2_load = reg_107;
    end else begin
        ap_sig_allocacmp_norm2_load = norm2_fu_52;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln24_reg_232_pp0_iter1_reg == 1'd0))) begin
        dot_product_out_ap_vld = 1'b1;
    end else begin
        dot_product_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage4_11001) & (1'b1 == ap_CS_fsm_pp0_stage4)) | ((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage6_11001) & (1'b1 == ap_CS_fsm_pp0_stage6)) | ((1'b0 == ap_block_pp0_stage5_11001) & (1'b1 == ap_CS_fsm_pp0_stage5)))) begin
        grp_fu_103_ce = 1'b1;
    end else begin
        grp_fu_103_ce = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage4) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            grp_fu_103_p0 = ele2_reg_257;
        end else if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            grp_fu_103_p0 = ele1_reg_251;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            grp_fu_103_p0 = ele1_fu_154_p1;
        end else begin
            grp_fu_103_p0 = 'bx;
        end
    end else begin
        grp_fu_103_p0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage4) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            grp_fu_103_p1 = ele2_reg_257;
        end else if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            grp_fu_103_p1 = ele1_reg_251;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            grp_fu_103_p1 = ele2_fu_158_p1;
        end else begin
            grp_fu_103_p1 = 'bx;
        end
    end else begin
        grp_fu_103_p1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage4_11001) & (1'b1 == ap_CS_fsm_pp0_stage4)) | ((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage6_11001) & (1'b1 == ap_CS_fsm_pp0_stage6)) | ((1'b0 == ap_block_pp0_stage5_11001) & (1'b1 == ap_CS_fsm_pp0_stage5)))) begin
        grp_fu_99_ce = 1'b1;
    end else begin
        grp_fu_99_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        grp_fu_99_p0 = ap_sig_allocacmp_norm2_load;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_99_p0 = ap_sig_allocacmp_norm1_load;
    end else if (((1'b0 == ap_block_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
        grp_fu_99_p0 = ap_sig_allocacmp_dot_product_load;
    end else begin
        grp_fu_99_p0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        grp_fu_99_p1 = mul4_i_reg_283;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_99_p1 = mul2_i_reg_273;
    end else if (((1'b0 == ap_block_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
        grp_fu_99_p1 = mul_i_reg_263;
    end else begin
        grp_fu_99_p1 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln24_reg_232 == 1'd1) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        in1_stream_blk_n = in1_stream_empty_n;
    end else begin
        in1_stream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln24_reg_232 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        in1_stream_read = 1'b1;
    end else begin
        in1_stream_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln24_reg_232 == 1'd1) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        in2_stream_blk_n = in2_stream_empty_n;
    end else begin
        in2_stream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln24_reg_232 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        in2_stream_read = 1'b1;
    end else begin
        in2_stream_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln24_reg_232_pp0_iter1_reg == 1'd0))) begin
        norm1_out_ap_vld = 1'b1;
    end else begin
        norm1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln24_reg_232_pp0_iter1_reg == 1'd0))) begin
        norm2_out_ap_vld = 1'b1;
    end else begin
        norm2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_done_pending_pp0 == 1'b0) & (ap_idle_pp0_1to2 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if (((ap_idle_pp0_0to0 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter1_stage1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((1'b0 == ap_block_pp0_stage4_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        ap_ST_fsm_pp0_stage5 : begin
            if ((1'b0 == ap_block_pp0_stage5_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end
        end
        ap_ST_fsm_pp0_stage6 : begin
            if ((1'b0 == ap_block_pp0_stage6_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_pp0_stage5 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_pp0_stage6 = ap_CS_fsm[32'd6];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_00001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((in2_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1)) | ((in1_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1))));
end

always @ (*) begin
    ap_block_pp0_stage1_01001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((in2_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1)) | ((in1_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1))));
end

always @ (*) begin
    ap_block_pp0_stage1_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((in2_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1)) | ((in1_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1))));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((in2_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1)) | ((in1_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1))));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage4_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage5_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage6_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = (((in2_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1)) | ((in1_stream_empty_n == 1'b0) & (icmp_ln24_reg_232 == 1'd1)));
end

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage6_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_ext_blocking_n = (1'b1 & 1'b1);

assign ap_int_blocking_n = (1'b1 & 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage6;

assign ap_str_blocking_n = (1'b1 & 1'b1);

assign dot_product_out = dot_product_fu_44;

assign ele1_fu_154_p1 = in1_stream_read_reg_241;

assign ele2_fu_158_p1 = in2_stream_read_reg_246;

assign grp_fu_141_p_ce = grp_fu_99_ce;

assign grp_fu_141_p_din0 = grp_fu_99_p0;

assign grp_fu_141_p_din1 = grp_fu_99_p1;

assign grp_fu_141_p_opcode = 2'd0;

assign grp_fu_58_p_ce = grp_fu_103_ce;

assign grp_fu_58_p_din0 = grp_fu_103_p0;

assign grp_fu_58_p_din1 = grp_fu_103_p1;

assign i_3_fu_144_p2 = (ap_sig_allocacmp_i_load + 31'd1);

assign i_cast_fu_134_p1 = ap_sig_allocacmp_i_load;

assign icmp_ln24_fu_138_p2 = (($signed(i_cast_fu_134_p1) < $signed(size)) ? 1'b1 : 1'b0);

assign norm1_out = norm1_fu_48;

assign norm2_out = norm2_fu_52;

endmodule //krnl_scoring_scoring_cosine_Pipeline_VITIS_LOOP_24_1
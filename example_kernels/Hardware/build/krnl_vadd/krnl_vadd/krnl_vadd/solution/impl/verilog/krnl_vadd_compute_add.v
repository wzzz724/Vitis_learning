// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module krnl_vadd_compute_add (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        size_dout,
        size_num_data_valid,
        size_fifo_cap,
        size_empty_n,
        size_read,
        size_c_din,
        size_c_num_data_valid,
        size_c_fifo_cap,
        size_c_full_n,
        size_c_write,
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
        out_stream_din,
        out_stream_num_data_valid,
        out_stream_fifo_cap,
        out_stream_full_n,
        out_stream_write
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] size_dout;
input  [1:0] size_num_data_valid;
input  [1:0] size_fifo_cap;
input   size_empty_n;
output   size_read;
output  [31:0] size_c_din;
input  [1:0] size_c_num_data_valid;
input  [1:0] size_c_fifo_cap;
input   size_c_full_n;
output   size_c_write;
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
output  [31:0] out_stream_din;
input  [1:0] out_stream_num_data_valid;
input  [1:0] out_stream_fifo_cap;
input   out_stream_full_n;
output   out_stream_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg size_read;
reg size_c_write;
reg in1_stream_read;
reg in2_stream_read;
reg out_stream_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    size_blk_n;
reg    size_c_blk_n;
reg   [31:0] size_read_reg_63;
wire    grp_compute_add_Pipeline_execute_fu_52_ap_start;
wire    grp_compute_add_Pipeline_execute_fu_52_ap_done;
wire    grp_compute_add_Pipeline_execute_fu_52_ap_idle;
wire    grp_compute_add_Pipeline_execute_fu_52_ap_ready;
wire    grp_compute_add_Pipeline_execute_fu_52_in1_stream_read;
wire    grp_compute_add_Pipeline_execute_fu_52_in2_stream_read;
wire   [31:0] grp_compute_add_Pipeline_execute_fu_52_out_stream_din;
wire    grp_compute_add_Pipeline_execute_fu_52_out_stream_write;
reg    grp_compute_add_Pipeline_execute_fu_52_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
reg    ap_block_state1;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 grp_compute_add_Pipeline_execute_fu_52_ap_start_reg = 1'b0;
end

krnl_vadd_compute_add_Pipeline_execute grp_compute_add_Pipeline_execute_fu_52(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_compute_add_Pipeline_execute_fu_52_ap_start),
    .ap_done(grp_compute_add_Pipeline_execute_fu_52_ap_done),
    .ap_idle(grp_compute_add_Pipeline_execute_fu_52_ap_idle),
    .ap_ready(grp_compute_add_Pipeline_execute_fu_52_ap_ready),
    .in1_stream_dout(in1_stream_dout),
    .in1_stream_num_data_valid(2'd0),
    .in1_stream_fifo_cap(2'd0),
    .in1_stream_empty_n(in1_stream_empty_n),
    .in1_stream_read(grp_compute_add_Pipeline_execute_fu_52_in1_stream_read),
    .in2_stream_dout(in2_stream_dout),
    .in2_stream_num_data_valid(2'd0),
    .in2_stream_fifo_cap(2'd0),
    .in2_stream_empty_n(in2_stream_empty_n),
    .in2_stream_read(grp_compute_add_Pipeline_execute_fu_52_in2_stream_read),
    .out_stream_din(grp_compute_add_Pipeline_execute_fu_52_out_stream_din),
    .out_stream_num_data_valid(2'd0),
    .out_stream_fifo_cap(2'd0),
    .out_stream_full_n(out_stream_full_n),
    .out_stream_write(grp_compute_add_Pipeline_execute_fu_52_out_stream_write),
    .size_load(size_read_reg_63)
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((grp_compute_add_Pipeline_execute_fu_52_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_compute_add_Pipeline_execute_fu_52_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_compute_add_Pipeline_execute_fu_52_ap_start_reg <= 1'b1;
        end else if ((grp_compute_add_Pipeline_execute_fu_52_ap_ready == 1'b1)) begin
            grp_compute_add_Pipeline_execute_fu_52_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        size_read_reg_63 <= size_dout;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (size_c_full_n == 1'b0) | (size_empty_n == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_compute_add_Pipeline_execute_fu_52_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_compute_add_Pipeline_execute_fu_52_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
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
    if (((grp_compute_add_Pipeline_execute_fu_52_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        in1_stream_read = grp_compute_add_Pipeline_execute_fu_52_in1_stream_read;
    end else begin
        in1_stream_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        in2_stream_read = grp_compute_add_Pipeline_execute_fu_52_in2_stream_read;
    end else begin
        in2_stream_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        out_stream_write = grp_compute_add_Pipeline_execute_fu_52_out_stream_write;
    end else begin
        out_stream_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        size_blk_n = size_empty_n;
    end else begin
        size_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        size_c_blk_n = size_c_full_n;
    end else begin
        size_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (size_c_full_n == 1'b0) | (size_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        size_c_write = 1'b1;
    end else begin
        size_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (size_c_full_n == 1'b0) | (size_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        size_read = 1'b1;
    end else begin
        size_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (size_c_full_n == 1'b0) | (size_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_compute_add_Pipeline_execute_fu_52_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (size_c_full_n == 1'b0) | (size_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_compute_add_Pipeline_execute_fu_52_ap_start = grp_compute_add_Pipeline_execute_fu_52_ap_start_reg;

assign out_stream_din = grp_compute_add_Pipeline_execute_fu_52_out_stream_din;

assign size_c_din = size_dout;

endmodule //krnl_vadd_compute_add

// Copyright (C) 2019  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"
// CREATED		"Fri Jun 05 21:49:45 2020"

module sprite_block(
	reset,
	clk_50MHz,
	motion,
	hsync,
	vsync,
	rgb_out
);


input wire	reset;
input wire	clk_50MHz;
input wire	[2:0] motion;
output wire	hsync;
output wire	vsync;
output wire	[11:0] rgb_out;

wire	clk_25MHz;
wire	[9:0] col;
wire	[9:0] row;
wire	[9:0] sprite_col;
wire	[9:0] sprite_row;
wire	[11:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[0:11] SYNTHESIZED_WIRE_3;
wire	[11:0] SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_3 = 0;




disp_driver	b2v_inst(
	.clk(clk_25MHz),
	.reset(reset),
	.rgb_in(SYNTHESIZED_WIRE_0),
	.hsync(hsync),
	.vsync(vsync),
	.col(col),
	.rgb_out(rgb_out),
	.row(row));


sprite_controller	b2v_inst2(
	.clk(clk_50MHz),
	.reset(reset),
	.col(col),
	.motion(motion),
	.row(row),
	.disp(SYNTHESIZED_WIRE_2),
	.sprite_col(sprite_col),
	.sprite_row(sprite_row));
	defparam	b2v_inst2.HEIGHT = 16;
	defparam	b2v_inst2.HLIM = 640;
	defparam	b2v_inst2.MOV_INC = 16;
	defparam	b2v_inst2.N = 10;
	defparam	b2v_inst2.VLIM = 480;
	defparam	b2v_inst2.WIDTH = 16;


link_sprite	b2v_inst3(
	.clock(clk_50MHz),
	.address(SYNTHESIZED_WIRE_1),
	.q(SYNTHESIZED_WIRE_4));


address_converter	b2v_inst4(
	.col(sprite_col),
	.row(sprite_row),
	.address(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst4.M = 8;
	defparam	b2v_inst4.N = 10;
	defparam	b2v_inst4.WIDTH = 16;


disp_mux	b2v_inst5(
	.s(SYNTHESIZED_WIRE_2),
	.d0(SYNTHESIZED_WIRE_3),
	.d1(SYNTHESIZED_WIRE_4),
	.out(SYNTHESIZED_WIRE_0));


clockmod	b2v_inst6(
	.clk(clk_50MHz),
	.reset(reset),
	.out(clk_25MHz));



endmodule

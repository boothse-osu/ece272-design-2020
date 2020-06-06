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
// CREATED		"Fri Jun 05 23:35:49 2020"

module designproj(
	irwave,
	ps2_data,
	motion_select,
	num_select,
	reset,
	int_clk,
	nes_data,
	disp_select,
	hsync,
	vsync,
	nes_clock,
	nes_latch,
	rgb_out
);


input wire	irwave;
input wire	ps2_data;
input wire	motion_select;
input wire	num_select;
input wire	reset;
input wire	int_clk;
input wire	nes_data;
input wire	[3:0] disp_select;
output wire	hsync;
output wire	vsync;
output wire	nes_clock;
output wire	nes_latch;
output wire	[11:0] rgb_out;

wire	clk_16kHz;
wire	clk_2kHz;
wire	clk_50MHz;
wire	[2:0] SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[2:0] SYNTHESIZED_WIRE_3;
wire	[2:0] SYNTHESIZED_WIRE_4;





sprite_block	b2v_inst(
	.clk_50MHz(clk_50MHz),
	.reset(reset),
	.motion(SYNTHESIZED_WIRE_0),
	.hsync(hsync),
	.vsync(vsync),
	.rgb_out(rgb_out));


ps2driver	b2v_inst2(
	.16KHz_ps2key_clk(clk_16kHz),
	.ps2_data(ps2_data),
	.50MHz_clk(clk_50MHz),
	.motion(SYNTHESIZED_WIRE_3),
	.numbers(SYNTHESIZED_WIRE_2));


vcrdriver	b2v_inst3(
	.2KHz_vcr_clk(clk_2kHz),
	.irwave(irwave),
	.numbers(SYNTHESIZED_WIRE_1));


multiplexer	b2v_inst4(
	.select(num_select),
	.data_0(SYNTHESIZED_WIRE_1),
	.data_1(SYNTHESIZED_WIRE_2)
	);
	defparam	b2v_inst4.N = 4;


multiplexer	b2v_inst5(
	.select(motion_select),
	.data_0(SYNTHESIZED_WIRE_3),
	.data_1(SYNTHESIZED_WIRE_4),
	.result(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst5.N = 3;


nes_block	b2v_inst6(
	.clk_50MHz(clk_50MHz),
	.reset(reset),
	.data(nes_data),
	.clock(nes_clock),
	.latch(nes_latch),
	.motion(SYNTHESIZED_WIRE_4));


ClockDivider	b2v_inst7(
	.clock_50MHz(clk_50MHz),
	.reset_n(reset),
	
	
	
	
	
	
	.clock_16KHz(clk_16kHz),
	
	
	.clock_2KHz(clk_2kHz)
	
	
	
	
	
	
	
	
	
	
	);

assign	clk_50MHz = int_clk;

endmodule

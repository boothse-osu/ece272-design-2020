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
// CREATED		"Fri Jun 05 21:49:59 2020"

module nes_block(
	clk_50MHz,
	reset,
	data,
	clock,
	latch,
	motion
);


input wire	clk_50MHz;
input wire	reset;
input wire	data;
output wire	clock;
output wire	latch;
output wire	[2:0] motion;

wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[2:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





nes_motion	b2v_inst(
	.data(SYNTHESIZED_WIRE_0),
	.motion(SYNTHESIZED_WIRE_1));


nes_clk	b2v_inst2(
	.clk(clk_50MHz),
	.reset(reset),
	.clk_out(SYNTHESIZED_WIRE_2));


pulse_on_change	b2v_inst3(
	.clk(clk_50MHz),
	.in(SYNTHESIZED_WIRE_1),
	.out(motion));
	defparam	b2v_inst3.N = 3;


nes_reader	b2v_inst4(
	.clk(SYNTHESIZED_WIRE_2),
	.data(data),
	.reset(reset),
	.clock(clock),
	.latch(latch),
	.out(SYNTHESIZED_WIRE_0));


endmodule

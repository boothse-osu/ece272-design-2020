// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Wed Jun 03 00:03:05 2020"

module simulation_testing(
	ps2key_clk,
	sin,
	clk,
	motion,
	numbers
);


input wire	ps2key_clk;
input wire	sin;
input wire	clk;
output wire	[2:0] motion;
output wire	[4:0] numbers;

wire	manual_reset;
wire	[10:0] q;
wire	reset;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[2:0] SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_2 = 1;




shiftreg	b2v_inst(
	.clk(ps2key_clk),
	.reset(manual_reset),
	.load(SYNTHESIZED_WIRE_0),
	.sin(sin),
	
	.sout(reset),
	.q(q));
	defparam	b2v_inst.N = 11;


synchronizer	b2v_inst1(
	.clk(clk),
	.d(reset),
	.q(SYNTHESIZED_WIRE_1));


ps2key_numbers	b2v_inst10(
	.q(q),
	.numbers(numbers));
	defparam	b2v_inst10.N = 11;

assign	manual_reset = reset | sin;



shiftreg	b2v_inst5(
	.clk(clk),
	.reset(SYNTHESIZED_WIRE_1),
	.load(SYNTHESIZED_WIRE_2),
	
	.d(SYNTHESIZED_WIRE_3),
	
	.q(motion));
	defparam	b2v_inst5.N = 3;



ps2key_sprite	b2v_inst8(
	.q(q),
	.directions(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst8.N = 11;


endmodule

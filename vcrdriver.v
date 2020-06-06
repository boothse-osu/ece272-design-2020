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
// CREATED		"Thu Jun 04 05:27:34 2020"

module vcr_test(
	irwave,
	clk,
	numbers
);


input wire	irwave;
input wire	clk;
output wire	[3:0] numbers;

wire	[33:0] q;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_1 = 0;




vcr	b2v_inst(
	.q(q[32:0]),
	.numbers(numbers));
	defparam	b2v_inst.N = 33;



shiftreg	b2v_inst2(
	.clk(irwave),
	.reset(SYNTHESIZED_WIRE_0),
	.load(SYNTHESIZED_WIRE_1),
	.sin(SYNTHESIZED_WIRE_2),
	
	.sout(SYNTHESIZED_WIRE_0),
	.q(q));
	defparam	b2v_inst2.N = 34;


irwave	b2v_inst3(
	.clk(clk),
	.irwave(irwave),
	
	.sin(SYNTHESIZED_WIRE_2));


endmodule

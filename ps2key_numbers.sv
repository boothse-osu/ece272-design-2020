module ps2key_numbers#(parameter N = 11)
(input logic [N-1:0]q, output logic [3:0]numbers);

always_comb
	case(q)
	//start, reversed ps2code, parity, stop
	//1
	11'b00110100001: numbers = 4'b0001;
	//2
	11'b00111100011: numbers = 4'b0010;
	//3
	11'b00110010001: numbers = 4'b0011;
	//4
	11'b01010010001: numbers = 4'b0100;
	//5
	11'b00111010011: numbers = 4'b0101;
	//6
	11'b00110110011: numbers = 4'b0110;
	//7
	11'b01011110001: numbers = 4'b0111;
	//8
	11'b00111110001: numbers = 4'b1000;
	//9
	11'b00110001001: numbers = 4'b1001;
	//0
	11'b01010001001: numbers = 4'b0000;
	default: numbers = 4'b1111;

	endcase

endmodule

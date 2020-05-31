module ps2key#(parameter N = 11)
(input logic [N-1:0]q, 
output logic [4:0]numbers, output logic [2:0]directions);


always_comb
	case(q)
	//start, reversed ps2code, parity, stop
	//1
	11'b00011100001: numbers = 5'b00001;
	//2
	11'b00111100011: numbers = 5'b00010;
	//3
	11'b00110010001: numbers = 5'b00011;
	//4
	11'b01010010001: numbers = 5'b00100;
	//5
	11'b00111010011: numbers = 5'b00101;
	//6
	11'b00110110011: numbers = 5'b00110;
	//7
	11'b01011110001: numbers = 5'b00111;
	//8
	11'b00111110001: numbers = 5'b01000;
	//9
	11'b00110001001: numbers = 5'b01001;
	//0
	11'b01010001001: numbers = 5'b00000;
	default: numbers = 5'b11111;

	//start, reversed ps2code, parity, stop
	//w
	11'b01010100001: directions = 3'b001;
	//a
	11'b00011100001: directions = 3'b100;
	//s
	11'b01101100011: directions = 3'b011;
	//d
	11'b01100010001: directions = 3'b010;
	default: directions = 3'b111;
	endcase

endmodule

module ps2key_sprite#(parameter N = 11)
(input logic [N-1:0]q, output logic [2:0]directions);

always_comb	
	case(q)
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

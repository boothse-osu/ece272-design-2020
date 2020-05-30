module vcr#(parameter N = 17)
(input logic [N-1:0]q, input logic sout,
 output logic [3:0]numbers, output logic [2:0]directions);
 
always_comb
	case(q)
	//numbers
	//1
	
	//2
	
	//3
	
	//4
	
	//5
	
	//6
	
	//7
	
	//8
	
	//9
	
	//0
	default: numbers = 4'b1111;
	
	//directions
	
	//ch_up
	
	//ch_down
	
	//vol_left
	
	//vol_right
	default: directions = 3'b111;
	endcase
		
endmodule

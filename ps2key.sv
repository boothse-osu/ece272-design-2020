module ps2key#(parameter N = 11)
(input logic [N-1:0]q, input logic sout, 
output logic [3:0]numbers, output logic [2:0]directions);

always_comb
	case(q)
	//start, reversed ps2code, parity, stop
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
	default: numbers = 8'b1111
	
	

endmodule

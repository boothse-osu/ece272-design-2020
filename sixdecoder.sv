module sixdecoder (input logic [3:0] b1, b2, b3, b4, b5, b6, 
						 input logic [2:0] s,
                  output logic [3:0] bout);

	always_comb
		case (s)
			0: bout = b1;
			1: bout = b2;
			2: bout = b3;
			3: bout = b4;
			4: bout = b5;
			5: bout = b6;
			default: bout = b1;
		endcase
	
endmodule
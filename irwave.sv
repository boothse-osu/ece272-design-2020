module irwave (input logic clk, input logic irwave, 
output logic sin);

//clk should be around 20 times slower than ir frequency: about 2kHz. 
//The purpose of clk is time how long each pulse of the irwave is.
logic [4:0]n1 = 0;

//timing, assuming clk freq ~ 2 KHz. 
//0 = 0.5 ms / 1 = 1.7 ms / 0 (start) = 4.4 ms

always_ff@(posedge clk)
begin
	if(irwave == 1)
	n1 <= n1+1;
	else if (irwave == 0)
		begin
		if(n1 != 0)
			begin
			if(n1 < 3) sin <= 0; 
			else if(n1 >= 3 & n1 < 7) sin <= 1;
			else if(n1 >= 7) sin <= 0;
			n1 <= 0;
			end
		end		
end

endmodule

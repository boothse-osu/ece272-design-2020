module irwave (input logic clk, input logic irwave, input logic reset, 
output logic sin);

//clk should be around 20 times slower than ir frequency: about 2kHz. 
logic n1;

assign n1 = 0;

always_ff@(posedge clk)
begin
	n1 <= n1+1;
	if(n1 
end

if
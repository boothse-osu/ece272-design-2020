module multiplexer#(parameter N = 4)
(input logic [N-1:0]data_0, input logic [N-1:0]data_1, 
input logic select, output logic [N-1:0]result);


always
	begin
	if(select == 0)
		result = data_0;
	else if(select == 1)
		result = data_1;
	end
endmodule


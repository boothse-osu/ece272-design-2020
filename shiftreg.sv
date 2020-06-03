module shiftreg#(parameter N = 11)
                (input  logic clk, reset, load, sin,
                 input  logic [N-1:0]d,kk
                 output logic [N-1:0]q,
                 output logic sout);


always_ff@(posedge clk)
if(reset) 
begin
	if(N == 33)
	q<= 33'b1_1111_1111_1111_1111_1111_1111_1111_1111;
	else
	q<= 11'b11111111111;
end

        else if(load) q <=d;
        else q <= {q[N-2:0], sin};
    end

    assign sout = q[N-1];

endmodule 


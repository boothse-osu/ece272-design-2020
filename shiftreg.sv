module shiftreg#(parameter N = 11)
(input logic clk,
input logic reset, load,
input logic sin,
input logic [N-1:0]d,
output logic [N-1:0]q,
output logic sout);

always_ff@(posedge clk, posedge reset)
begin
if(reset) q<=1;
else if(load) q <=d;
else q <= {q[N-2:0], sin};
end

assign sout = q[N-1];
endmodule 


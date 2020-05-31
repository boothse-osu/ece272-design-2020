module pulse_gen #(parameter N = 8)
                  (input  logic [N-1:0] in,
                   input  logic clk, trig,
                   output logic [N-1:0] out);

    logic n;
    
    always_ff @(posedge clk) begin
        n <= trig;
        if (~trig & n) out = in;
        else out = 0;
    end
        
endmodule
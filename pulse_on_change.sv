module pulse_on_change #(parameter N = 8)
                        (input  logic [N-1:0] in,
                         input  logic clk,
                         output logic [N-1:0] out);

    logic [N-1:0] n;
    
    // if input has changed, pulse output with input
    always_ff @(posedge clk) begin
        n <= in;
        if (in != n) out <= in;
        else out <= 0;
    end
endmodule
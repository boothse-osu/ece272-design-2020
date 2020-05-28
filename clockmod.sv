module clockmod (input  logic clk, reset,
                 output logic out);
                 
    logic d;
    
    always_ff @(posedge clk, negedge reset) begin
        if (!reset) d <= 0;
        else d <= !d;
        out <= d;
    end
endmodule
            
        
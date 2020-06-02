module nes_reader (input  logic clk, data, reset,
                   output logic clock, latch,
                   output logic [7:0] out);
    
    // suggested clock of around 80kHz
    
    logic [3:0] n;
    logic [7:0] q;
    
    always_ff @(posedge clk) 
        // reset state
        if (!reset) begin
            n <= 8;
            latch <= 0;
            clock <= 0;
            q <= 0;
            out <= 0;
        end
        // if end of data, latch for next set
        else if (n == 8) begin
            n <= 0;
            out <= q;
            q <= 0;
            latch <= 1;
            clock <= 0;
        end
        // reset latch after 1 high cycle
        else if (latch == 1) latch <= 0;
        // reset clock after 1 high cycle
        else if (clock == 1) clock <= 0;
        // read data and set clock high
        // move to next bit
        else begin
            clock <= 1;
            n <= n + 1;
            q[n] <= data;
        end
endmodule
            
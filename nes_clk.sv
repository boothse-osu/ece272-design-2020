module nes_clk (input  logic clk, reset,
                output logic clk_out);

    // input clock should be 50MHz
    // outputs 83kHz
    // 50M/2(83k) ~= 302
    
    logic [8:0] count;

    always_ff @(posedge clk, negedge reset) begin
        if (!reset) begin
            clk_out <= 0;
            count <= 0;
        end
        else if (count == 301) begin
            clk_out <= ~clk_out;
            count <= 0;
        end
        else count <= count + 1;
    end
endmodule
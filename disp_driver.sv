module disp_driver (input  logic clk, reset,
                    input  logic [11:0] rgb_in,
                    output logic hsync, vsync,
                    output logic [11:0] rgb_out,
                    output logic [9:0] row, col);
    
    // internal variables for timing
    logic [9:0] hcount, vcount;
    
    always_ff @(posedge clk, negedge reset) begin
        if (!reset) hcount <= 0;
        // if end of row, move to start of next row
        else if (hcount == 799) begin
            hcount <= 0;
            vcount <= vcount + 1;
        end
        else hcount <= hcount + 1;
        
        // if end of screen, move back to start
        if (!reset) vcount <= 0;
		else if (vcount == 524 & hcount == 799) vcount <= 0;
    end
    
    always_comb begin
        // pull low in sync region
        if (hcount < 96) hsync = 0;
        else hsync = 1;
        
        // pull low in sync region
        if (vcount < 2) vsync = 0;
        else vsync = 1;
        
        // if in display region, move rgb input to ouput and give current display pixel
        if (hcount > 143 & hcount < 784 & vcount > 34 & vcount < 515) begin 
            rgb_out = rgb_in;
            row = vcount - 35;
            col = hcount - 144;
        end
        else begin
            rgb_out = 0;
            row = 0;
            col = 0;
        end
    end
endmodule
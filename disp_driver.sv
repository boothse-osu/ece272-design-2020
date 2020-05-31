module disp_driver (input  logic clk, reset,
                    input  logic [11:0] rgb_in,
                    output logic hsync, vsync,
                    output logic [11:0] rgb_out,
                    output logic [9:0] row, col);

    logic [9:0] hcount, vcount;

    always_ff @(posedge clk, negedge reset) begin
        if (!reset) hcount <= 0;
        else if (hcount == 799) begin
            hcount <= 0;
            vcount <= vcount + 1;
        end
        else hcount <= hcount + 1;
        
        if (!reset) vcount <= 0;
		  else if (vcount == 524) vcount <= 0;
    end
    
    always_comb begin
        if (hcount < 96) hsync = 0;
        else hsync = 1;
        
        if (vcount < 2) vsync = 0;
        else vsync = 1;
        
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
module disp_driver (input  logic clk, reset,
                    output logic hsync, vsync, hdisp, vdisp);
               
    logic [9:0] hcount;
    logic [9:0] vcount;

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
        
        if (hcount > 143 & hcount < 784) hdisp <= 1;
        else hdisp <= 0;
        
        if (vcount > 34 & vcount < 515) vdisp <= 1;
        else vdisp <= 0;
    end
endmodule
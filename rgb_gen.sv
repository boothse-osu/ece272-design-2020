module rgb_gen (input  logic [3:0] r, g, b,
                input  logic hdisp, vdisp,
                output logic [3:0] rout, gout, bout);

    logic disp;
    assign disp = hdisp & vdisp;
    
    always_comb
        if (disp) begin
            rout = r;
            gout = g;
            bout = b;
        end
        else begin
            rout = 4'b0;
            gout = 4'b0;
            bout = 4'b0;
        end
endmodule
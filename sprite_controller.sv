module sprite_controller #(parameter N = 10, WIDTH = 16, HEIGHT = 16, 
                                     MOV_INC = 4, HLIM = 640, VLIM = 480)
                          (input  logic [N-1:0] row, col,
                           input  logic [2:0] motion,
                           input  logic clk, reset,
                           output logic disp,
                           output logic [N-1:0] sprite_row, sprite_col);

    logic [N-1:0] start_row, start_col;
    
    always_ff @(posedge clk) begin
        case (motion)
            3'b001  : start_row <= start_row - MOV_INC;
            3'b010  : start_col <= start_col + MOV_INC;
            3'b011  : start_row <= start_row + MOV_INC;
            3'b100  : start_col <= start_col - MOV_INC;
            default : ;
        endcase
        if (!reset | $signed(start_row) < 0) start_row <= 0;
        else if (start_row > (VLIM - HEIGHT - 1)) start_row <= (VLIM - HEIGHT - 1);
        if (!reset | $signed(start_col) < 0) start_col <= 0;
        else if (start_col > (HLIM - WIDTH - 1)) start_col <= (HLIM - WIDTH - 1);
    end
    
    always_comb 
        if (row >= start_row & row < (start_row + HEIGHT) 
            & col >= start_col & col < (start_col + WIDTH))
            disp = 1;
        else disp = 0;
    
    assign sprite_row = (row - start_row) % HEIGHT;
    assign sprite_col = (col - start_col) % WIDTH;
    
endmodule
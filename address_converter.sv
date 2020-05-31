module address_converter #(parameter N = 10, M = 8, WIDTH = 16)
                          (input  logic [N-1:0] row, col,
                           output logic [M-1:0] address);
    
    assign address = (row * WIDTH) + col;
endmodule
module nes_motion (input  logic [7:0] data,
                   output logic [2:0] motion);

    always_comb
        if      (data[4]) motion = 3'b001; // up
        else if (data[7]) motion = 3'b010; // right
        else if (data[5]) motion = 3'b011; // down
        else if (data[6]) motion = 3'b100; // left
        else              motion = 3'b000; // none
endmodule
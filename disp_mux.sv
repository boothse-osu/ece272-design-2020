module disp_mux (input  logic [11:0] d0, d1,
                 input  logic s,
                 output logic [11:0] out);

    assign out = s ? d1 : d0;
endmodule
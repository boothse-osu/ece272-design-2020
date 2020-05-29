module comparator_m #(parameter N = 8, M = 0)
                   (input  logic [N-1:0] a,
                    output logic eq, neq, lt, lte, gt, gte);
                    
    assign eq  = (a == M);
    assign neq = (a != M);
    assign lt  = (a < M);
    assign lte = (a <= M);
    assign gt  = (a > M);
    assign gte = (a >= M);
endmodule
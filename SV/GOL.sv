module GOL(clk, start, reset, nextstate);
    input logic start, reset;
    logic [63:0] seed;
    output logic [63:0] nextstate;

    logic state;
    input logic clk;
    logic [63:0]grid, regin, regout;

    assign seed=64'h0412_6424_0034_3C28;

    FSM a(clk, start, reset, state);
    mux b(state, seed, nextstate, grid);
    datapath c(grid, regin);

    

    always @(negedge clk)begin
        regout<=regin;
    end

    assign nextstate=regout;

endmodule
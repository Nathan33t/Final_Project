module FSM(clk, start, reset, out_state);
    input logic  clk;
    input logic  reset;
    input logic 	start;

   output logic out_state;
   //output logic state;


   

     typedef enum logic {S0,S1} statetype;
     //statetype state, next_state;
     logic state, next_state;

always_ff @(posedge clk) begin
     if (reset==1'b1) state <= S0;
     else state <= next_state;
     //state <= next_state;
   end

// next state logic
   always_comb begin
     case (state)
        S0: begin
          out_state=0;
          //next_state = S1;
          next_state=1'b1;
          
            
            end
        S1: begin
            out_state= 1;
            next_state = 1'b1;
            
            end
        default: begin
          out_state = 1;
          next_state = 1'b1;
        end
      
     endcase
   end
endmodule

module mux(out_state, seed, state, grid);
  input logic out_state;
  input logic [63:0]state;
  input logic [63:0]seed;

  output logic [63:0]grid;


  assign grid = out_state?state:seed;
endmodule

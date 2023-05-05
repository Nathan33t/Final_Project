module stimulus ();

logic clk, reset, start;
//logic [63:0]seed;
logic [63:0] next_state;
logic [31:0] vectornum;
logic [31:0] errors;
logic [63:0] foo;

integer 	 handle3;
integer 	 desc3;
//assign foo =64'h0412_6424_0034_3C28;

//device under test
GOL dut(clk, start, reset, next_state);

//clock
initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end


initial begin
    handle3=$fopen("GOL.out");
    vectornum= 0;
    errors= 0;
    desc3=handle3;
    //#500 $finish;
   end


always 
     begin
	#5 $display("%b\n %b\n %b\n %b\n %b\n %b\n %b\n %b\n",
		     next_state[63:56],next_state[55:48],next_state[47:40],
               next_state[39:32],next_state[31:24],next_state[23:16],
               next_state[15:8],next_state[7:0]);
     // #5 $display (foo);
     end 

initial 
     begin      	
     #10 reset = 1'b1;
     #20 reset = 1'b0;

     end

endmodule
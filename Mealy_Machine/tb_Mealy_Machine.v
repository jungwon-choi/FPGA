`timescale 1ns/1ps

module tb_Mealy_Machine;

reg t_clk;
reg t_rst;
reg t_in;
wire t_out;

Mealy_Machine t_Mealy_Machine
(
	.clk(t_clk),
	.rst(t_rst),
	.in(t_in),
	.out(t_out)
);

initial
begin
	t_clk = 1'b1;
	t_rst = 1'b1;
	t_in = 1'b0;
	// ST : S0, NST : S0
end

always
begin
	#5 t_clk = ~t_clk;
end

initial
begin
	#10 t_in = 1'b1; t_rst = 1'b0;  // ST : S0, NST : S1
	#10 t_in = 1'b0; t_rst = 1'b0;  // ST : S1, NST : S2
	#10 t_in = 1'b0; t_rst = 1'b0;  // ST : S2, NST : S0 Between
	#10 t_in = 1'b1; t_rst = 1'b0;  // ST : S0, NST : S1 Glitch
	
	#10 t_in = 1'b1; t_rst = 1'b1;  // ST : S0, NST : S1 RESET! S0
	#10 t_in = 1'b0; t_rst = 1'b0;  // ST : S1, NST : S2  	
	#10 t_in = 1'b1; t_rst = 1'b0;  // ST : S2, NST : S1 Z = 1	
	#5  t_in = 1'b0; t_rst = 1'b0;  // ST : S2, NST : S0 Z = 0 By in
	#5  t_in = 1'b0; t_rst = 1'b0;  // ST : S0, NST : S0  
	#5  t_in = 1'b1; t_rst = 1'b0;  // ST : S0, NST : S1 By in
	#5  t_in = 1'b1; t_rst = 1'b0;  // ST : S1, NST : S1
	
	#10 t_in = 1'b0; t_rst = 1'b0;	// ST : S1, NST : S2
	#10 t_in = 1'b1; t_rst = 1'b0;  // ST : S2, NST : S1 Z = 1
	#10 t_in = 1'b1; t_rst = 1'b0;	// ST : S1, NST : S1 
	#10 t_in = 1'b0; t_rst = 1'b1;	// ST : S0, NST : S0 RESET! S0
	#5  t_in = 1'b1; t_rst = 1'b0;  // ST : S0, NST : S1 By in
	#5  t_in = 1'b1; t_rst = 1'b0;  // ST : S1, NST : S1
	#10 t_in = 1'b0; t_rst = 1'b0;  // ST : S1, NST : S2
	#10 t_in = 1'b1; t_rst = 1'b0;  // ST : S2, NST : S1 Z = 1	
end
//@(posdege clk)
endmodule
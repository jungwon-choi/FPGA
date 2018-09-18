module tb_fullAdder;

wire sum_t;
wire c_out_t;
reg a_t;
reg b_t;
reg c_in_t;

fullAdder fullAdder_tb	// easy to name wanna use in modelsim
(
	.sum(sum_t),
	.c_out(c_out_t),
	.a(a_t),
	.b(b_t),
	.c_in(c_in_t)
);

initial
begin
		a_t = 1'd0; b_t = 1'd0; c_in_t = 1'd0;
	#5	a_t = 1'd0; b_t = 1'd0; c_in_t = 1'd1;
	#5	a_t = 1'd0; b_t = 1'd1; c_in_t = 1'd0;
	#5	a_t = 1'd0; b_t = 1'd1; c_in_t = 1'd1;
	#5	a_t = 1'd1; b_t = 1'd0; c_in_t = 1'd0;
	#5	a_t = 1'd1; b_t = 1'd0; c_in_t = 1'd1;
	#5	a_t = 1'd1; b_t = 1'd1; c_in_t = 1'd0;
	#5	a_t = 1'd1; b_t = 1'd1; c_in_t = 1'd1;
	#5	a_t = 1'd0; b_t = 1'd0; c_in_t = 1'd0;
end
	
endmodule 
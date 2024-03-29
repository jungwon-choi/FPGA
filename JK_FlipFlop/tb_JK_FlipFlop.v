module tb_JK_FlipFlop;

reg t_clk;
reg t_J;
reg t_K;
wire t_Q;
wire t_Qbar;

JK_FlipFlop t_JK_FlipFlop
(
	.clk(t_clk),
	.J(t_J),
	.K(t_K),
	.Q(t_Q),
	.Qbar(t_Qbar)
);

initial
begin	
	t_clk = 1'b1; // 클럭신호 초기화
	t_J = 1'b1;
	t_K = 1'b0;
end

always	// t = 0 일 때부터 주기가 10ns인 클럭신호 발생
begin
	#5 t_clk = ~t_clk;
end

always // t = 0 일 때부터 5ns마다 입력 신호 변화
begin
	#20 t_J = 1'b0; t_K = 1'b0;
	#20 t_J = 1'b0; t_K = 1'b1;
	#20 t_J = 1'b1; t_K = 1'b0;
	#20 t_J = 1'b1; t_K = 1'b1;
	#20 t_J = 1'b0; t_K = 1'b0;
end

endmodule
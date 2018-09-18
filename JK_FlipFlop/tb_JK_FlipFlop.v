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
	t_clk = 1'b1; // Ŭ����ȣ �ʱ�ȭ
	t_J = 1'b1;
	t_K = 1'b0;
end

always	// t = 0 �� ������ �ֱⰡ 10ns�� Ŭ����ȣ �߻�
begin
	#5 t_clk = ~t_clk;
end

always // t = 0 �� ������ 5ns���� �Է� ��ȣ ��ȭ
begin
	#20 t_J = 1'b0; t_K = 1'b0;
	#20 t_J = 1'b0; t_K = 1'b1;
	#20 t_J = 1'b1; t_K = 1'b0;
	#20 t_J = 1'b1; t_K = 1'b1;
	#20 t_J = 1'b0; t_K = 1'b0;
end

endmodule
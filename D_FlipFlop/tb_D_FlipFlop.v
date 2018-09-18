module tb_D_FlipFlop;

reg t_clk;
reg t_rst;
reg t_D;
wire t_Q;
wire t_Qbar;

D_FlipFlop t_D_FlipFlop
(
	.clk(t_clk),
	.rst(t_rst),
	.D(t_D),
	.Q(t_Q),
	.Qbar(t_Qbar)
);	

initial
begin	
	t_clk = 1'b1; // Ŭ����ȣ �ʱ�ȭ
	t_D = 1'b0;
	t_rst = 1'b0;
end

always	// t = 0 �� ������ �ֱⰡ 10ns�� Ŭ����ȣ �߻�
begin
	#5 t_clk = ~t_clk;
end

always // t = 0 �� ������ 5ns���� �Է� ��ȣ ��ȭ
begin
	#10 t_D = 1'b1; 
	#10 t_D = 1'b0;
	#10 t_D = 1'b1;
	#5  t_rst = 1'b1;
	#5  t_D = 1'b0; 
	#10 t_D = 1'b0; 
	#10 t_D = 1'b1;
	#5  t_rst = 1'b0;
	#5  t_D = 1'b0; 
	#10 t_D = 1'b1; 
	#10 t_D = 1'b0;
end

endmodule
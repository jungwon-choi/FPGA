module Output_Multiplexer
(
	input [15:0] ALU_result,
	input op_mode,
	
	output [15:0] Write_data,
	output [15:0] display_data
);

assign Write_data = (op_mode == 1'b0)? ALU_result : 16'd0;
assign display_data = (op_mode == 1'b1)? ALU_result : 16'd0;

endmodule 
module Traffic_Light_Controller
(
	input clk,
	input rst,
	input farm_sensor_X,
	output reg [1:0] hwy_TL,
	output reg [1:0] fwy_TL
);

parameter [1:0] S0 = 2'b00,
				S1 = 2'b01,
				S2 = 2'b10,
				S3 = 2'b11;
				
parameter [1:0] RED    = 2'b00,
				YELLOW = 2'b01,
				GREEN  = 2'b10;

reg [1:0] state, nxt_state;


initial
begin
hwy_TL = GREEN;
fwy_TL = RED;
end



always @(posedge clk or posedge rst)
begin 
	if(rst) state <= S0;
	else 	state <= nxt_state;
end

always @(state or farm_sensor_X)
begin
	
	case(state)
	
	S0 : 
	begin 
		hwy_TL <= GREEN;
		fwy_TL <= RED;
		if(farm_sensor_X) nxt_state <= S1;
		else nxt_state <= S0;
	end
	
	S1:
	begin 
		hwy_TL <= YELLOW;
		fwy_TL <= RED;
		nxt_state <= S2;
	end

	S2:
	begin 
		hwy_TL <= RED;
		fwy_TL <= GREEN;
		if(farm_sensor_X) nxt_state <= S2;
		else nxt_state <= S3;
	end
	
	S3:
	begin 
		hwy_TL <= RED;
		fwy_TL <= YELLOW;
		nxt_state <= S0;
	end
	
	default :
	begin
		hwy_TL <= GREEN;
		fwy_TL <= RED;
		nxt_state <= S0;
	end

	endcase
end

endmodule	

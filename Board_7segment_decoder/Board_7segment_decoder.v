module Board_7segment_decoder
(
//input [13:0] sw,
input [9:0] sw,
output [6:0] segment_1000,
output [6:0] segment_100,
output [6:0] segment_10,
output [6:0] segment_1
);

wire [3:0] digit_1000;
wire [3:0] digit_100;
wire [3:0] digit_10;
wire [3:0] digit_1;

wire [9:0] mod_1000;
wire [6:0] mod_100;
wire [3:0] mod_10;


assign digit_1000 = sw/10'd1000;
assign mod_1000 = sw - (digit_1000*10'd1000);

assign digit_100 = mod_1000 / 7'd100;
assign mod_100 = mod_1000 - (digit_100*7'd100);

assign digit_10 = mod_100/4'd10;
assign mod_10 = mod_100 - (digit_10*4'd10);


assign digit_1 = mod_10;

bcd_7segment bcd_7segment_1000(digit_1000, segment_1000);
bcd_7segment bcd_7segment_100(digit_100, segment_100);
bcd_7segment bcd_7segment_10(digit_10, segment_10);
bcd_7segment bcd_7segment_1(digit_1, segment_1);

endmodule

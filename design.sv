左邊
// Code your testbench here
// or browse Examples
module decoder_3_8_tb;
reg E_tb;
reg clka, clkb;
reg [2:0] In_tb;
wire [7:0] Out_tb;
wire clka_out, clkb_out;
decoder_3_8 decoder_1(.E(E_tb), .In(In_tb), .Out(Out_tb));
clkgen clkgen_1(.clka(clka), .clkb(clkb), .clka_out(clka_out), .clkb_out(clkb_out));
initial begin
clka = 1'b0; clkb = 1'b0;
end
always begin
#10 clka = ~clka;
end
always begin
#20 clkb = ~clkb;
end
initial begin
#0 E_tb = 0; In_tb = 3'b000;
#10 E_tb = 1; In_tb = 3'b000;
#10 E_tb = 1; In_tb = 3'b001;
#10 E_tb = 1; In_tb = 3'b010;
#10 E_tb = 1; In_tb = 3'b011;
#10 E_tb = 1; In_tb = 3'b100;
#10 E_tb = 1; In_tb = 3'b101;
#10 E_tb = 1; In_tb = 3'b110;
#10 E_tb = 1; In_tb = 3'b111;
#10 $finish;
end
initial begin
$dumpfile("decoder.vcd");
$dumpvars(0, decoder_1);
$dumpvars(0, clkgen_1);
end
endmodule
右邊
// Code your design here
module decoder_2_4(E , In , Out);
input E;
input [1:0] In;
output [3:0] Out;
wire [3:0] Out;
assign Out = E ? 1'b1 << In : 4'h0;
endmodule
module decoder_3_8(E , In , Out);
input E;
input [2:0] In;
output [7:0] Out;
wire E1 , G1 , G2;
not u1(E1 , In[2]);
and a1(G1 , E , In[2]);
and a2(G2 , E , E1);
decoder_2_4 block1(G1 , In[1 : 0] , Out[7 : 4]);
decoder_2_4 block2(G2 , In[1 : 0] , Out[3 : 0]);
endmodule
module clkgen(clka, clkb, clka_out, clkb_out);
input clka, clkb;
output clka_out, clkb_out;
reg clka_out, clkb_out;
always @(clka) begin
clka_out = clka;
end
always @(clkb) begin
clkb_out = clkb;
end
endmodule
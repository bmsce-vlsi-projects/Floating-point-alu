`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2021 21:52:14
// Design Name: 
// Module Name: ripple_carry_24_bit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ripple_carry_24_bit_tb;
wire [23:0] sum;//output
wire cout;//output
reg [23:0] a,b;//input
reg cin;//input
 
ripple_carry_24_bit uut(
.a(a),
.b(b),
.cin(cin),
.sum(sum),
.cout(cout));
 
initial begin
$display($time, " << Starting the Simulation >>");
     a=0; b=0; cin=0;
#100 a= 24'b000000000000000000011111; b=24'b00000000000000000001100; cin=1'b0;
#10 a= 24'b000000000000000000011111; b=24'b00000000000000000001100; cin=1'b0;
#10 a= 24'b000000001100011000011111; b=24'b00000000000000110001100; cin=1'b1;
#10 a= 24'b000000001111111111111111; b=24'b00000000000000000000000; cin=1'b1;
end
 
initial
$monitor("time= ", $time, "A=%b,B=&b,Cin=%b:Sum= %b,Cout=%cout",a,b,cin,sum,cout);
endmodule

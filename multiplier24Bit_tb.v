`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2021 21:53:08
// Design Name: 
// Module Name: multiplier24Bit_tb
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


module multiplier24Bit_tb();
reg [31:0] a,b;
wire Exception,Overflow,Underflow;
wire [31:0] result;
Multiplier24Bit inst1(.a_operand(a),.b_operand(b),.Exception(Exception),.Overflow(Overflow),.Underflow(Underflow),.result(result));

initial begin
$display($time, " << Starting the Simulation >>");
a=0; b=0;
#10 a= 32'b01000000101100110011001100110011; b=32'b01000000010000000000000000000000;//5.6*3
//#10 a= 32'b01000010100101000000000000000000; b=32'b11000100101000010010000000000000;//74*-1289
//#10 a= 32'b11000101101011111100110101100111; b=32'b01000011000010100000000000000000;//-5625.6753* 
//#10 a= 32'b01000001001000000000000000000000; b=32'b01000001110010000000000000000000;//10*25
//#10 a= 32'b11000010001101000000000000000000; b=32'b11000000101100100010010011011101;//-45*-5.567
#10 a= 32'b01000000000100000000000000000000; b=32'b01000000111100000000000000000000;//2.25*7.5
#10 $finish;
end


 initial
$monitor("time= ", $time, "A=%b,B=%b,result= %b",a,b,result);
endmodule

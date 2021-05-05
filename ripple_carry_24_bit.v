`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2021 20:16:41
// Design Name: 
// Module Name: ripple_carry_24_bit
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


module ripple_carry_24_bit(a, b, cin,sum, cout);
input [23:0] a,b;
input cin;
output [23:0] sum;
output cout;
wire c1,c2,c3,c4,c5;
 
ripple_carry_4_bit rca1 (
.a(a[3:0]),
.b(b[3:0]),
.cin(cin), 
.sum(sum[3:0]),
.cout(c1));
 
ripple_carry_4_bit rca2(
.a(a[7:4]),
.b(b[7:4]),
.cin(c1),
.sum(sum[7:4]),
.cout(c2));
 
ripple_carry_4_bit rca3(
.a(a[11:8]),
.b(b[11:8]),
.cin(c2),
.sum(sum[11:8]),
.cout(c3));
 
ripple_carry_4_bit rca4(
.a(a[15:12]),
.b(b[15:12]),
.cin(c3),
.sum(sum[15:12]),
.cout(c4));

ripple_carry_4_bit rca5(
.a(a[19:15]),
.b(b[19:15]),
.cin(c4),
.sum(sum[19:15]),
.cout(c5));

ripple_carry_4_bit rca6(
.a(a[23:19]),
.b(b[23:19]),
.cin(c5),
.sum(sum[23:19]),
.cout(cout));
endmodule
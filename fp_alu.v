`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2021 11:07:28
// Design Name: 
// Module Name: fp_alu
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


module fp_alu(
    input [15:0] a_short,            // inputs for short float operations 1 =sign 4 bits exponent 11 bits mant
    input [15:0] b_short,
    input [31:0] a_single,           // inputs for single float operations
    input [31:0] b_single,
    input [63:0] a_double,           // inputs for double float operations
    input [63:0] b_double,
    input [1:0] md,                  // mode enable that defines type of float operations to be performed 00=short float operations 01=single float operations 10=double float operations 11=posit unum float operations
    input [1:0] fpf,                 // functions to be performed 00=sum 01=difference 10= multiplication 11=division
    input reset,
    input clk,
    output reg [15:0] res_short,    // output for short float operations
    output reg [31:0] res_single,   // output for single float operations
    output reg [64:0] res_double    // output for double float operations
    );
    reg [3:0] e1,e2,e;
    always@(posedge clk,reset)
    if(reset)
    begin
    res_short<=16'b0000000000000000;
    res_single<=32'b00000000000000000000000000000000;
    res_double<=64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if(md==0)
    begin
    e1={a_short[3:0]};
    e2={b_short[3:0]};
    e=e1-e2;
    if(e==0)
    begin
    case({a_short[0],b_short[0]})
    2'b00 : res_short[15:5]=a_short[15:5]+b_short[15:5];
    2'b01 : res_short[15:5]=a_short[15:5]-b_short[15:5];
    2'b10 : res_short[15:5]=-a_short[15:5]+b_short[15:5];
    2'b11 : res_short[15:5]=-a_short[15:5]-b_short[15:5];
    endcase
    else if (e<0)
   
    end
    
    end
        
   
    
endmodule

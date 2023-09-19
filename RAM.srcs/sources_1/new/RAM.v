`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2022 06:18:34 PM
// Design Name: 
// Module Name: RAM
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


module RAM(Data, Address, WE, Clk, Out);
    input [3:0] Data;
    input [3:0] Address;
    input WE;
    input Clk;
    output [3:0] Out;
    
    reg [3:0] Mem [15:0];
    
    always @ (posedge Clk)
    begin
    if(WE)
      Mem[Address] <= Data;
    end
    
    assign Out = Mem[Address];
      
endmodule

module F1(W, X, Y, Z, F1);
    input W, X, Y, Z;
    output F1;  
    assign F1 = (W | X) & (~Y) & Z;  
endmodule

module half_adder(a, b, Out, Cout);
input a, b;
output Out, Cout;
assign Out = a ^ b;
assign Cout = a & b;
endmodule

module full_adder(Cin, a, b, Out, Cout);
input Cin, a, b;
output Out, Cout;
assign Out = (Cin ^ a) ^ b;
assign Cout = (Cin & (a ^ b)) | (a & b);
endmodule

module Twobit_Adder(a, b, Out, Cout);
input [1:0] a;
input [1:0] b;
output [1:0] Out;
output Cout;

wire C1;

half_adder add1 (a[0], b[0], Out[0], C1);
full_adder add2 (C1, a[1], b[1], Out[1], Cout);

endmodule

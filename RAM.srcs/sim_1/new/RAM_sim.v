`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2022 06:43:13 PM
// Design Name: 
// Module Name: RAM_sim
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


module RAM_sim();
  wire [3:0] Data_t;
  reg [3:0] Address_t;
  reg WE_t;
  reg Clk_t;
  wire [3:0] Out_t;
  
  //load RAM
  RAM ramUUT(
    .Data(Data_t), .Address(Address_t), .WE(WE_t), .Clk(Clk_t), .Out(Out_t)
    );
    
  //load F1
  F1 f1UUT(
    .W(Address_t[3]), .X(Address_t[2]), .Y(Address_t[1]), .Z(Address_t[0]), .F1(Data_t[0])
    );
    
  //load 2 bit Adder
  Twobit_Adder adderUUT(
    .a(Address_t[1:0]), .b(Address_t[3:2]), .Out(Data_t[2:1]), .Cout(Data_t[3])
    );
    
  initial begin
    Address_t [3:0] = 4'b0000;
    WE_t = 1'b0;
    Clk_t = 1'b0;
  end
  
  always #5 Clk_t = ~Clk_t;
  always #10 WE_t = ~WE_t;
  always #20 Address_t[0] = ~Address_t[0];
  always #40 Address_t[1] = ~Address_t[1];
  always #80 Address_t[2] = ~Address_t[2];
  always #160 Address_t[3] = ~Address_t[3];
  
endmodule

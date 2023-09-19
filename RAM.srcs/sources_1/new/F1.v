`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2022 06:22:46 PM
// Design Name: 
// Module Name: F1
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


module F1(
    input W,
    input X,
    input Y,
    input Z,
    output F1
    );
    
    assign F1 = (W | X) & (~Y) & Z;
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 09:26:14 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    output we,
    output reset,
    output ldac,
    output [15:0] to_daq
    );
    
    
    clk_divider clkd(
    .clk(clk),
    .new_clk(new_clk)
    );
    
    to_oscar toc(
    .we(we),         
    .reset(reset),   
    .ldac(ldac),     
    .to_daq(to_daq), 
    .new_clk(new_clk)
    
    );
endmodule

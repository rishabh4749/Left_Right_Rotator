`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 13:31:19
// Design Name: 
// Module Name: L_R_Rotator
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


module LRRotator(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q
    );
    integer i;
    reg temp;
    always @ (posedge clk) begin
    if(load)
    q<=data;
    else if(ena==1) begin
    temp=q[0];
    for(i=0;i<99;i=i+1) begin
    q[i]=q[i+1];
    end
    q[99]=temp;
    end
    else if(ena==2) begin
    temp=q[99];
    for(i=99;i>0;i=i-1) begin
    q[i]=q[i-1];
    end
    q[0]=temp;
    end
    end
endmodule

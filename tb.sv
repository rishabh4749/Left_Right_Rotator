`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 13:41:30
// Design Name: 
// Module Name: tb
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


module tb(

    );
    reg clk;
    reg load;
    reg [1:0] ena;
    reg [99:0] data;
    wire [99:0] q;
    always #5 clk=~clk;
    LRRotator dut(.clk(clk),.load(load),.ena(ena),.data(data),.q(q));
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("time=%t data=%b q=%b ena=%b load=%b",$time,data,q,ena,load);
    clk<=0;
    #4;
    data<=888888888;
    ena<=0;
    load<=1;
    #10;
    ena<=1;
    load<=0;
    #10;
    ena<=0;
    load<=1;
    #40 $finish;
    end
endmodule

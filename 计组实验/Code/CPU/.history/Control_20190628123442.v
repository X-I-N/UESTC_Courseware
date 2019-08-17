`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:14 06/15/2019 
// Design Name: 
// Module Name:    Control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Control(
    input [5:0] op,
	 output RegDst, RegWrite, ALUSrc,
	 output MemWrite, MemtoReg,
	 output Branch,Jump,
	 output [2:0] ALU_op,R_type
	 );
	wire i_Rt = ~|op;
	wire i_lw = op[5] & ~op[3];
	wire i_sw = op[5] & op[3];
	wire i_beq = op[2] & ~op[1];
	wire i_lui = op[3] & op[2];
	wire i_jump = op[1] & ~op[0];
	
	assign RegDst = i_Rt;
	assign RegWrite = i_Rt | i_lw | i_lui;
	assign ALUSrc = i_lw | i_sw | i_lui;
	assign MemWrite = i_sw;
	assign MemtoReg = i_lw;
	assign Branch = i_beq;
	assign Jump = i_jump;
	
	assign ALU_op[2] = i_beq | i_lui;
	assign ALU_op[1] = i_ori | i_lui;
	assign ALU_op[0] = 0;
	assign R_type = i_Rt;

endmodule

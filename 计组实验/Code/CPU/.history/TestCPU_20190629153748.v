`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:35:22 06/23/2019
// Design Name:   MIPS_CPU
// Module Name:   D:/Codes/Verilog/CPU/TestCPU.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS_CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module TestCPU;

	// Inputs
	reg [31:0] Instruction;
	reg Reset;
	reg Clock;
	reg [31:0] DataToWd;

	// Outputs
	wire [31:0] ALU_result;
	wire [31:0] Ext_Imm;
	wire [31:0] addr;
	wire [31:0] Out2,Out1;
	wire MemWrite;
	wire MemtoReg;



	// Instantiate the Unit Under Test (UUT)
	MIPS_CPU uut (
		.Instruction(Instruction), 
		.Reset(Reset), 
		.Clock(Clock), 
		.DataToWd(DataToWd), 
		.ALU_result(ALU_result), 
		.Ext_Imm(Ext_Imm), 
		.addr(addr), 
		.Out2(Out2), 
		.Out1(Out1),
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg)
	);

	wire [31:0] inst;	
	INST_ROM	ROM(addr,inst);
	
	initial begin
		Reset = 1;
		Clock = 0;
		//由于这个时候CPU还未接入RAM，故这里将DataToWd初始化为0;
		DataToWd = 0;
		#200;
      Reset = 0;  
		end
	
	always begin 
		#100;
		Instruction = inst;	
		Clock = ~Clock;
	end
      
endmodule


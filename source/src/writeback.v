/* (c) Krishna Subramanian <https://github.com/mongrelgem>
 * (c) cMIPS - a Complete 32bit 5-stage Pipelined MIPS Processor <https://github.com/mongrelgem/cMIPS>
 * Report Bugs and Issues : <https://github.com/mongrelgem/cMIPS/issues>
*/
`timescale 1ns / 1ps
// Company: 
// Engineer: 
// 
// Create Date: 2017/01/11 17:23:08
// Design Name: 
// Module Name: writeback
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
module writeback(
input wire [1:0]        ctr_wb,
input wire [31:0]       mem_out,
input wire [31:0]       ALU_out,
output wire [31:0]      write_data,
output wire             regwrite_flag
    );
    
    wire memtoReg_flag;
    assign memtoReg_flag = ctr_wb[0];
    assign regwrite_flag = ctr_wb[1];
    
    assign write_data = (memtoReg_flag) ? mem_out : ALU_out;
  
endmodule

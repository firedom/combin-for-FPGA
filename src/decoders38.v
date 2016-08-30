// ************************Declaration*************************************** //
// File name: decoders38.v                                                    //
// Author: firedom                                                            //
// Date: 2016-08-30 22:14                                                     //
// Version Number: 1.0                                                        //
// Abstract:                                                                  //
// dedocder38 for verilog.                                                    //
//                                                                            //
// Reference:                                                                 //
// http://www.ti.com/lit/ds/symlink/sn74ls138.pdf                             //
// https://en.wikibooks.org/wiki/VHDL_for_FPGA_Design/Decoder                 //
//                                                                            //
// Modification history:(including time, version, author and abstract)        //
// 2016-08-30 22:14 version 1.0                                               //
// ************************Declaration*************************************** //

module decoders38(in, out, en);
	input [0:2]in;
	input [0:2]en;
	output [0:7]out;
	wire andGate;
	
	and
	andGateEnable(andGate, en[0], ~en[1], ~en[2]);
	
	nand 
	nandGate0(out[0], ~in[2], ~in[1], ~in[0], andGate),
	nandGate1(out[1], ~in[2], ~in[1], in[0], andGate),
	nandGate2(out[2], ~in[2], in[1], ~in[0], andGate),
	nandGate3(out[3], ~in[2], in[1], in[0], andGate),
	nandGate4(out[4], in[2], ~in[1], ~in[0], andGate),
	nandGate5(out[5], in[2], ~in[1], in[0], andGate),
	nandGate6(out[6], in[2], in[1], ~in[0], andGate),
	nandGate7(out[7], in[2], in[1], in[0], andGate);
endmodule

// ************************Declaration*************************************** //
// File name: decoders38.v                                                    //
// Author: firedom                                                            //
// Date: 2016-08-30 22:14                                                     //
// Version Number: 1.0                                                        //
//                                                                            //  
// Abstract:                                                                  //
// dedocder38 for verilog.                                                    //
// [0:2]in is 3-port select input.                                            //
// [0:7]out is 7-port select output.                                          //
// [0:2]en is enable port.                                                    //
// Send 3'b100 to enable port and send 3'bxxx(000~111 3-bit binary code)      //
// to select input can be accessed by the corresponding select output.        //
//                                                                            //  
// Reference:                                                                 //
// http://www.ti.com/lit/ds/symlink/sn74ls138.pdf                             //
// https://en.wikibooks.org/wiki/VHDL_for_FPGA_Design/Decoder                 //
//                                                                            //
// Modification history:(including time, version, author and abstract)        //
// 2016-08-30 22:14 version 1.0                                               //
// 2016-08-31 10:23 change wire name.                                         //
// ************************Declaration*************************************** //

module decoders38(in, out, en);
	input [0:2]in;
	input [0:2]en;
	output [0:7]out;
	wire enableWire;
	
	and
	andGateEnable(enableWire, en[0], ~en[1], ~en[2]);
	
	nand 
	nandGate0(out[0], ~in[2], ~in[1], ~in[0], enableWire),
	nandGate1(out[1], ~in[2], ~in[1], in[0], enableWire),
	nandGate2(out[2], ~in[2], in[1], ~in[0], enableWire),
	nandGate3(out[3], ~in[2], in[1], in[0], enableWire),
	nandGate4(out[4], in[2], ~in[1], ~in[0], enableWire),
	nandGate5(out[5], in[2], ~in[1], in[0], enableWire),
	nandGate6(out[6], in[2], in[1], ~in[0], enableWire),
	nandGate7(out[7], in[2], in[1], in[0], enableWire);
endmodule

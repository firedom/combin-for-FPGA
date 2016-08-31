// ************************Declaration*************************************** //
// File name: priorityEncoders83.v                                            //
// Author: firedom                                                            //
// Date: 2016-08-31 10:55                                                     //
// Version Number: 0.2                                                        //
//                                                                            //
// Abstract:                                                                  //
// 8 LINE TO 3 LINE PRIORITY ENCODERS for verilog.                            //
// [0:7]in:  7-port select input.                                             //
// ei: enable port.                                                           //
// [0:3]out: 3-port select output.                                            //
// gs: output port, check work state.                                         //
// eo: output port, check work state.                                         //
//                                                                            //
// Reference:                                                                 //
// http://www.ti.com/lit/ds/symlink/sn74148.pdf                               //
//                                                                            //
// Modification history:(including time, version, author and abstract)        //
// 2016-08-31 10:55  version 0.1                                              //
// 2016-08-31 21:50  version 0.2 dev.board has broken, not unit test.         //
// ************************Declaration*************************************** // 
module priorityEncoders83(in, ei, out, gs, eo);
	input [0:7]in;
	input ei;
	output [0:3]out;
	output gs;
	output eo;

	nand
	nandGate0(eo, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], ~ei), // do not use ;
    nandGate1(gs, eo, ~ei);	
	
	and
	andGate0(and0out, ~in[1], in[2], in[4], in[6], ~ei),
	andGate1(and1out, ~in[3], in[4], in[6], ~ei),
	andGate2(and2out, ~in[5], in[6], ~ei),
	andGate3(and3out, ~in[7], ~ei),
	andGate4(and4out, ~in[2], in[4], in[5], ~ei),
	andGate5(and5out, ~in[3], in[4], in[5], ~ei),
	andGate6(and6out, ~in[6], ~ei),
	andGate7(and7out, ~in[7], ~ei),
	andGate8(and8out, ~in[4], ~ei),
	andGate9(and9out, ~in[5], ~ei),
	andGate10(and10out, ~in[6], ~ei),
	andGate11(and11out, ~in[7], ~ei);
	
	nor
	norGate0(out[0], and0out, and1out, and2out, and3out),
	norGate1(out[1], and4out, and5out, and6out, and7out),
	norGate2(out[2], and8out, and9out, and10out, and11out);
	endmodule
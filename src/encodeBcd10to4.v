// ************************Declaration*************************************** //
// File name: encodeBcd10to4.v                                                //
// Author: firedom                                                            //
//                                                                            //
// Abstract:                                                                  //
// encoding 10-line Decimal 4-line BCD for verilog.                           //
// [0:8]in:  9-port select input.                                             //
// [0:3]out: 4-port select output.                                            //
//                                                                            //
// Reference:                                                                 //
// http://www.ti.com/lit/ds/symlink/sn74148.pdf                               //
//                                                                            //
// Modification history:(including time, version, author and abstract)        //
// 2016-08-31 10:55  version 0.1                                              //
// 2016-08-31 21:50  version 0.2 dev.board has broken, not unit test.         //
// ************************Declaration*************************************** // 

module encodeBcd10to4(in, out);
	input [0:8]in;
	output [0:3]out;
	wire and0out, and1out, and2out, and3out, and4out, and5out, and6out, and7out, and8out, and9out, and10out, and11out, and12out, nor0out;
	
	and
	andGate0(and0out, ~in[0], in[1], in[3], in[5], nor0out),
	andGate1(and1out, ~in[2], in[3], in[5], nor0out),
	andGate2(and2out, ~in[4], in[5], nor0out),
	andGate3(and3out, ~in[6], nor0out),
	andGate4(and4out, ~in[8]),
	andGate5(and5out, ~in[1], in[3], in[4], nor0out),
	andGate6(and6out, ~in[2], in[3], in[4], nor0out),
	andGate7(and7out, ~in[5], nor0out),
	andGate8(and8out, ~in[6], nor0out),
	andGate9(and9out, ~in[3], nor0out),
	andGate10(and10out, ~in[4], nor0out),
	andGate11(and11out, ~in[5], nor0out),
	andGate12(and12out, ~in[6], nor0out);
	
	nor
	norGate0(nor0out, ~in[7], ~in[8]),
	norGate1(out[0], and0out, and1out, and2out, and3out, and4out),
	norGate2(out[1], and5out, and6out, and7out, and8out),
	norGate3(out[2], and9out, and10out, and11out, and12out);
	
	assign out[3] = nor0out;
	
	endmodule
module top_chip(CLK,resetn,WriteData,bufferData_in,vector_x,vector_y);
  input CLK;
  input resetn;
  input [87:0] WriteData;
  input [31:0]bufferData_in;
  //16.4.25 removed output [12:0]me_out;
  output [3:0]vector_x;
  output [3:0]vector_y;
  
  wire net_CLK;
  wire net_resetn;
  wire [87:0] net_WriteData;
  wire [31:0]net_bufferData_in;
  //wire [12:0]net_me_out;
  wire [3:0]net_vector_x;
  wire [3:0]net_vector_y;
  
  PIW PIW_CLK (.PAD(CLK), .C(net_CLK));
  PIW PIW_resetn (.PAD(resetn), .C(net_resetn));
  PIW PIW_WriteData0 (.PAD(WriteData[0]), .C(net_WriteData[0]));
  PIW PIW_WriteData1 (.PAD(WriteData[1]), .C(net_WriteData[1]));
  PIW PIW_WriteData2 (.PAD(WriteData[2]), .C(net_WriteData[2]));
  PIW PIW_WriteData3 (.PAD(WriteData[3]), .C(net_WriteData[3]));
  PIW PIW_WriteData4 (.PAD(WriteData[4]), .C(net_WriteData[4]));
  PIW PIW_WriteData5 (.PAD(WriteData[5]), .C(net_WriteData[5]));
  PIW PIW_WriteData6 (.PAD(WriteData[6]), .C(net_WriteData[6]));
  PIW PIW_WriteData7 (.PAD(WriteData[7]), .C(net_WriteData[7]));
  PIW PIW_WriteData8 (.PAD(WriteData[8]), .C(net_WriteData[8]));
  PIW PIW_WriteData9 (.PAD(WriteData[9]), .C(net_WriteData[9]));
  PIW PIW_WriteData10 (.PAD(WriteData[10]), .C(net_WriteData[10]));
  PIW PIW_WriteData11 (.PAD(WriteData[11]), .C(net_WriteData[11]));
  PIW PIW_WriteData12 (.PAD(WriteData[12]), .C(net_WriteData[12]));
  PIW PIW_WriteData13 (.PAD(WriteData[13]), .C(net_WriteData[13]));
  PIW PIW_WriteData14 (.PAD(WriteData[14]), .C(net_WriteData[14]));
  PIW PIW_WriteData15 (.PAD(WriteData[15]), .C(net_WriteData[15]));
  PIW PIW_WriteData16 (.PAD(WriteData[16]), .C(net_WriteData[16]));
  PIW PIW_WriteData17 (.PAD(WriteData[17]), .C(net_WriteData[17]));
  PIW PIW_WriteData18 (.PAD(WriteData[18]), .C(net_WriteData[18]));
  PIW PIW_WriteData19 (.PAD(WriteData[19]), .C(net_WriteData[19]));
  PIW PIW_WriteData20 (.PAD(WriteData[20]), .C(net_WriteData[20]));
  PIW PIW_WriteData21 (.PAD(WriteData[21]), .C(net_WriteData[21]));
  PIW PIW_WriteData22 (.PAD(WriteData[22]), .C(net_WriteData[22]));
  PIW PIW_WriteData23 (.PAD(WriteData[23]), .C(net_WriteData[23]));
  PIW PIW_WriteData24 (.PAD(WriteData[24]), .C(net_WriteData[24]));
  PIW PIW_WriteData25 (.PAD(WriteData[25]), .C(net_WriteData[25]));
  PIW PIW_WriteData26 (.PAD(WriteData[26]), .C(net_WriteData[26]));
  PIW PIW_WriteData27 (.PAD(WriteData[27]), .C(net_WriteData[27]));
  PIW PIW_WriteData28 (.PAD(WriteData[28]), .C(net_WriteData[28]));
  PIW PIW_WriteData29 (.PAD(WriteData[29]), .C(net_WriteData[29]));
  PIW PIW_WriteData30 (.PAD(WriteData[30]), .C(net_WriteData[30]));
  PIW PIW_WriteData31 (.PAD(WriteData[31]), .C(net_WriteData[31]));
  PIW PIW_WriteData32 (.PAD(WriteData[32]), .C(net_WriteData[32]));
  PIW PIW_WriteData33 (.PAD(WriteData[33]), .C(net_WriteData[33]));
  PIW PIW_WriteData34 (.PAD(WriteData[34]), .C(net_WriteData[34]));
  PIW PIW_WriteData35 (.PAD(WriteData[35]), .C(net_WriteData[35]));
  PIW PIW_WriteData36 (.PAD(WriteData[36]), .C(net_WriteData[36]));
  PIW PIW_WriteData37 (.PAD(WriteData[37]), .C(net_WriteData[37]));
  PIW PIW_WriteData38 (.PAD(WriteData[38]), .C(net_WriteData[38]));
  PIW PIW_WriteData39 (.PAD(WriteData[39]), .C(net_WriteData[39]));
  PIW PIW_WriteData40 (.PAD(WriteData[40]), .C(net_WriteData[40]));
  PIW PIW_WriteData41 (.PAD(WriteData[41]), .C(net_WriteData[41]));
  PIW PIW_WriteData42 (.PAD(WriteData[42]), .C(net_WriteData[42]));
  PIW PIW_WriteData43 (.PAD(WriteData[43]), .C(net_WriteData[43]));
  PIW PIW_WriteData44 (.PAD(WriteData[44]), .C(net_WriteData[44]));
  PIW PIW_WriteData45 (.PAD(WriteData[45]), .C(net_WriteData[45]));
  PIW PIW_WriteData46 (.PAD(WriteData[46]), .C(net_WriteData[46]));
  PIW PIW_WriteData47 (.PAD(WriteData[47]), .C(net_WriteData[47]));
  PIW PIW_WriteData48 (.PAD(WriteData[48]), .C(net_WriteData[48]));
  PIW PIW_WriteData49 (.PAD(WriteData[49]), .C(net_WriteData[49]));
  PIW PIW_WriteData50 (.PAD(WriteData[50]), .C(net_WriteData[50]));
  PIW PIW_WriteData51 (.PAD(WriteData[51]), .C(net_WriteData[51]));
  PIW PIW_WriteData52 (.PAD(WriteData[52]), .C(net_WriteData[52]));
  PIW PIW_WriteData53 (.PAD(WriteData[53]), .C(net_WriteData[53]));
  PIW PIW_WriteData54 (.PAD(WriteData[54]), .C(net_WriteData[54]));
  PIW PIW_WriteData55 (.PAD(WriteData[55]), .C(net_WriteData[55]));
  PIW PIW_WriteData56 (.PAD(WriteData[56]), .C(net_WriteData[56]));
  PIW PIW_WriteData57 (.PAD(WriteData[57]), .C(net_WriteData[57]));
  PIW PIW_WriteData58 (.PAD(WriteData[58]), .C(net_WriteData[58]));
  PIW PIW_WriteData59 (.PAD(WriteData[59]), .C(net_WriteData[59]));
  PIW PIW_WriteData60 (.PAD(WriteData[60]), .C(net_WriteData[60]));
  PIW PIW_WriteData61 (.PAD(WriteData[61]), .C(net_WriteData[61]));
  PIW PIW_WriteData62 (.PAD(WriteData[62]), .C(net_WriteData[62]));
  PIW PIW_WriteData63 (.PAD(WriteData[63]), .C(net_WriteData[63]));
  PIW PIW_WriteData64 (.PAD(WriteData[64]), .C(net_WriteData[64]));
  PIW PIW_WriteData65 (.PAD(WriteData[65]), .C(net_WriteData[65]));
  PIW PIW_WriteData66 (.PAD(WriteData[66]), .C(net_WriteData[66]));
  PIW PIW_WriteData67 (.PAD(WriteData[67]), .C(net_WriteData[67]));
  PIW PIW_WriteData68 (.PAD(WriteData[68]), .C(net_WriteData[68]));
  PIW PIW_WriteData69 (.PAD(WriteData[69]), .C(net_WriteData[69]));
  PIW PIW_WriteData70 (.PAD(WriteData[70]), .C(net_WriteData[70]));
  PIW PIW_WriteData71 (.PAD(WriteData[71]), .C(net_WriteData[71]));
  PIW PIW_WriteData72 (.PAD(WriteData[72]), .C(net_WriteData[72]));
  PIW PIW_WriteData73 (.PAD(WriteData[73]), .C(net_WriteData[73]));
  PIW PIW_WriteData74 (.PAD(WriteData[74]), .C(net_WriteData[74]));
  PIW PIW_WriteData75 (.PAD(WriteData[75]), .C(net_WriteData[75]));
  PIW PIW_WriteData76 (.PAD(WriteData[76]), .C(net_WriteData[76]));
  PIW PIW_WriteData77 (.PAD(WriteData[77]), .C(net_WriteData[77]));
  PIW PIW_WriteData78 (.PAD(WriteData[78]), .C(net_WriteData[78]));
  PIW PIW_WriteData79 (.PAD(WriteData[79]), .C(net_WriteData[79]));
  PIW PIW_WriteData80 (.PAD(WriteData[80]), .C(net_WriteData[80]));
  PIW PIW_WriteData81 (.PAD(WriteData[81]), .C(net_WriteData[81]));
  PIW PIW_WriteData82 (.PAD(WriteData[82]), .C(net_WriteData[82]));
  PIW PIW_WriteData83 (.PAD(WriteData[83]), .C(net_WriteData[83]));
  PIW PIW_WriteData84 (.PAD(WriteData[84]), .C(net_WriteData[84]));
  PIW PIW_WriteData85 (.PAD(WriteData[85]), .C(net_WriteData[85]));
  PIW PIW_WriteData86 (.PAD(WriteData[86]), .C(net_WriteData[86]));
  PIW PIW_WriteData87 (.PAD(WriteData[87]), .C(net_WriteData[87]));
  
  PIW PIW_bufferData_in0 (.PAD(bufferData_in[0]), .C(net_bufferData_in[0]));
  PIW PIW_bufferData_in1 (.PAD(bufferData_in[1]), .C(net_bufferData_in[1]));
  PIW PIW_bufferData_in2 (.PAD(bufferData_in[2]), .C(net_bufferData_in[2]));
  PIW PIW_bufferData_in3 (.PAD(bufferData_in[3]), .C(net_bufferData_in[3]));
  PIW PIW_bufferData_in4 (.PAD(bufferData_in[4]), .C(net_bufferData_in[4]));
  PIW PIW_bufferData_in5 (.PAD(bufferData_in[5]), .C(net_bufferData_in[5]));
  PIW PIW_bufferData_in6 (.PAD(bufferData_in[6]), .C(net_bufferData_in[6]));
  PIW PIW_bufferData_in7 (.PAD(bufferData_in[7]), .C(net_bufferData_in[7]));
  PIW PIW_bufferData_in8 (.PAD(bufferData_in[8]), .C(net_bufferData_in[8]));
  PIW PIW_bufferData_in9 (.PAD(bufferData_in[9]), .C(net_bufferData_in[9]));
  PIW PIW_bufferData_in10 (.PAD(bufferData_in[10]), .C(net_bufferData_in[10]));
  PIW PIW_bufferData_in11 (.PAD(bufferData_in[11]), .C(net_bufferData_in[11]));
  PIW PIW_bufferData_in12 (.PAD(bufferData_in[12]), .C(net_bufferData_in[12]));
  PIW PIW_bufferData_in13 (.PAD(bufferData_in[13]), .C(net_bufferData_in[13]));
  PIW PIW_bufferData_in14 (.PAD(bufferData_in[14]), .C(net_bufferData_in[14]));
  PIW PIW_bufferData_in15 (.PAD(bufferData_in[15]), .C(net_bufferData_in[15]));
  PIW PIW_bufferData_in16 (.PAD(bufferData_in[16]), .C(net_bufferData_in[16]));
  PIW PIW_bufferData_in17 (.PAD(bufferData_in[17]), .C(net_bufferData_in[17]));
  PIW PIW_bufferData_in18 (.PAD(bufferData_in[18]), .C(net_bufferData_in[18]));
  PIW PIW_bufferData_in19 (.PAD(bufferData_in[19]), .C(net_bufferData_in[19]));
  PIW PIW_bufferData_in20 (.PAD(bufferData_in[20]), .C(net_bufferData_in[20]));
  PIW PIW_bufferData_in21 (.PAD(bufferData_in[21]), .C(net_bufferData_in[21]));
  PIW PIW_bufferData_in22 (.PAD(bufferData_in[22]), .C(net_bufferData_in[22]));
  PIW PIW_bufferData_in23 (.PAD(bufferData_in[23]), .C(net_bufferData_in[23]));
  PIW PIW_bufferData_in24 (.PAD(bufferData_in[24]), .C(net_bufferData_in[24]));
  PIW PIW_bufferData_in25 (.PAD(bufferData_in[25]), .C(net_bufferData_in[25]));
  PIW PIW_bufferData_in26 (.PAD(bufferData_in[26]), .C(net_bufferData_in[26]));
  PIW PIW_bufferData_in27 (.PAD(bufferData_in[27]), .C(net_bufferData_in[27]));
  PIW PIW_bufferData_in28 (.PAD(bufferData_in[28]), .C(net_bufferData_in[28]));
  PIW PIW_bufferData_in29 (.PAD(bufferData_in[29]), .C(net_bufferData_in[29]));
  PIW PIW_bufferData_in30 (.PAD(bufferData_in[30]), .C(net_bufferData_in[30]));
  PIW PIW_bufferData_in31 (.PAD(bufferData_in[31]), .C(net_bufferData_in[31]));
  
  /*PO8W PO8W_me_out0 ( .I(net_me_out[0]), .PAD(me_out[0]) );
  PO8W PO8W_me_out1 ( .I(net_me_out[1]), .PAD(me_out[1]) );
  PO8W PO8W_me_out2 ( .I(net_me_out[2]), .PAD(me_out[2]) );
  PO8W PO8W_me_out3 ( .I(net_me_out[3]), .PAD(me_out[3]) );
  PO8W PO8W_me_out4 ( .I(net_me_out[4]), .PAD(me_out[4]) );
  PO8W PO8W_me_out5 ( .I(net_me_out[5]), .PAD(me_out[5]) );
  PO8W PO8W_me_out6 ( .I(net_me_out[6]), .PAD(me_out[6]) );
  PO8W PO8W_me_out7 ( .I(net_me_out[7]), .PAD(me_out[7]) );
  PO8W PO8W_me_out8 ( .I(net_me_out[8]), .PAD(me_out[8]) );
  PO8W PO8W_me_out9 ( .I(net_me_out[9]), .PAD(me_out[9]) );
  PO8W PO8W_me_out10 ( .I(net_me_out[10]), .PAD(me_out[10]) );
  PO8W PO8W_me_out11 ( .I(net_me_out[11]), .PAD(me_out[11]) );
  PO8W PO8W_me_out12 ( .I(net_me_out[12]), .PAD(me_out[12]) );*/
  
  PO8W PO8W_vector_x0 (.I(net_vector_x[0]), .PAD(vector_x[0]));
  PO8W PO8W_vector_x1 (.I(net_vector_x[1]), .PAD(vector_x[1]));
  PO8W PO8W_vector_x2 (.I(net_vector_x[2]), .PAD(vector_x[2]));
  PO8W PO8W_vector_x3 (.I(net_vector_x[3]), .PAD(vector_x[3]));
  
  PO8W PO8W_vector_y0 (.I(net_vector_y[0]), .PAD(vector_y[0]));
  PO8W PO8W_vector_y1 (.I(net_vector_y[1]), .PAD(vector_y[1]));
  PO8W PO8W_vector_y2 (.I(net_vector_y[2]), .PAD(vector_y[2]));
  PO8W PO8W_vector_y3 (.I(net_vector_y[3]), .PAD(vector_y[3]));
  
  top top_chip(
               .CLK(net_CLK),
               .resetn(net_resetn),
               .WriteData(net_WriteData),
               .bufferData_in(net_bufferData_in),
               //16.4.25 removed .me_out(net_me_out),
			   .vector_x(net_vector_x),
			   .vector_y(net_vector_y)
               );
endmodule


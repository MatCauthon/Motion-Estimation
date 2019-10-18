module top(CLK,resetn,WriteData,bufferData_in,vector_x,vector_y);
  input CLK;
  input resetn;
  input [87:0] WriteData;
  input [31:0]bufferData_in;
  //16.4.25 removed output [12:0]me_out;
  output [3:0]vector_x;
  output [3:0]vector_y;
  
  wire CLK;
  wire resetn;
  wire [31:0]bufferData_in;
  wire [87:0] WriteData;
  
  //16.4.25 removed reg [12:0]me_out;
  //16.4.25 removed reg [3:0]vector_x;
  //16.4.25 removed reg [3:0]vector_y;
  
  //-----------------------------------------------------------//
  
  //CTR output
  wire broadcast;
  wire memRead;
  wire memWrite;
  wire refresh;
  wire compare_work;
  wire compare_refresh;
  wire [5:0]sr_addressRead;
  wire [5:0]sr_addressWrite;
  
  //SR_MEM output
  wire [87:0] ReadData;
  
  //currentBuffer output
  wire [31:0]BufferData_out0;
  wire [31:0]BufferData_out1;
  wire [31:0]BufferData_out2;
  wire [31:0]BufferData_out3;
  
  //MAD output
  wire [20:0]Res1;
  wire [20:0]Res2;
  wire [20:0]Res3;
  wire [20:0]Res4;
  wire [20:0]Res5;
  wire [20:0]Res6;
  wire [20:0]Res7;
  wire [20:0]Res8;
  
  //compare output
  wire [7:0]compare_out;
  
  //*******missing
  
  
  //-----------------------------------------------------------//
  //SR_MEM input
  wire MemRead;
  wire MemWrite;
  
  //MAD1 input
  wire [31:0]Cur_b1_0;
  wire [31:0]Cur_b1_1;
  wire [31:0]Cur_b1_2;
  wire [31:0]Cur_b1_3;
  wire [87:0]Can_b1;
  wire [5:0]sr_addressRead1;
  
  //MAD2 input
  wire [31:0]Cur_b2_0;
  wire [31:0]Cur_b2_1;
  wire [31:0]Cur_b2_2;
  wire [31:0]Cur_b2_3;
  wire [87:0]Can_b2;
  wire [5:0]sr_addressRead2;
  
  //MAD3 input
  wire [31:0]Cur_b3_0;
  wire [31:0]Cur_b3_1;
  wire [31:0]Cur_b3_2;
  wire [31:0]Cur_b3_3;
  wire [87:0]Can_b3;
  wire [5:0]sr_addressRead3;
  
  //MAD4 input
  wire [31:0]Cur_b4_0;
  wire [31:0]Cur_b4_1;
  wire [31:0]Cur_b4_2;
  wire [31:0]Cur_b4_3;
  wire [87:0]Can_b4;
  wire [5:0]sr_addressRead4;
  
  //MAD5 input
  wire [31:0]Cur_b5_0;
  wire [31:0]Cur_b5_1;
  wire [31:0]Cur_b5_2;
  wire [31:0]Cur_b5_3;
  wire [87:0]Can_b5;
  wire [5:0]sr_addressRead5;
  
  //MAD6 input
  wire [31:0]Cur_b6_0;
  wire [31:0]Cur_b6_1;
  wire [31:0]Cur_b6_2;
  wire [31:0]Cur_b6_3;
  wire [87:0]Can_b6;
  wire [5:0]sr_addressRead6;
  
  //MAD7 input
  wire [31:0]Cur_b7_0;
  wire [31:0]Cur_b7_1;
  wire [31:0]Cur_b7_2;
  wire [31:0]Cur_b7_3;
  wire [87:0]Can_b7;
  wire [5:0]sr_addressRead7;
  
  //MAD8 input
  wire [31:0]Cur_b8_0;
  wire [31:0]Cur_b8_1;
  wire [31:0]Cur_b8_2;
  wire [31:0]Cur_b8_3;
  wire [87:0]Can_b8;
  wire [5:0]sr_addressRead8;
  
  //compare input
  wire [20:0]mad1;
  wire [20:0]mad2;
  wire [20:0]mad3;
  wire [20:0]mad4;
  wire [20:0]mad5;
  wire [20:0]mad6;
  wire [20:0]mad7;
  wire [20:0]mad8;
  
  
  
  
  //-----------------------------------------------------------//
  
  assign MemRead = memRead;
  assign MemWrite = memWrite;
  
  assign Can_b1 = ReadData;
  assign Cur_b1_0 = BufferData_out0;
  assign Cur_b1_1 = BufferData_out1;
  assign Cur_b1_2 = BufferData_out2;
  assign Cur_b1_3 = BufferData_out3;
  
  assign Can_b2 = ReadData;
  assign Cur_b2_0 = BufferData_out0;
  assign Cur_b2_1 = BufferData_out1;
  assign Cur_b2_2 = BufferData_out2;
  assign Cur_b2_3 = BufferData_out3;
  
  assign Can_b3 = ReadData;
  assign Cur_b3_0 = BufferData_out0;
  assign Cur_b3_1 = BufferData_out1;
  assign Cur_b3_2 = BufferData_out2;
  assign Cur_b3_3 = BufferData_out3;
  
  assign Can_b4 = ReadData;
  assign Cur_b4_0 = BufferData_out0;
  assign Cur_b4_1 = BufferData_out1;
  assign Cur_b4_2 = BufferData_out2;
  assign Cur_b4_3 = BufferData_out3;
  
  assign Can_b5 = ReadData;
  assign Cur_b5_0 = BufferData_out0;
  assign Cur_b5_1 = BufferData_out1;
  assign Cur_b5_2 = BufferData_out2;
  assign Cur_b5_3 = BufferData_out3;
  
  assign Can_b6 = ReadData;
  assign Cur_b6_0 = BufferData_out0;
  assign Cur_b6_1 = BufferData_out1;
  assign Cur_b6_2 = BufferData_out2;
  assign Cur_b6_3 = BufferData_out3;
  
  assign Can_b7 = ReadData;
  assign Cur_b7_0 = BufferData_out0;
  assign Cur_b7_1 = BufferData_out1;
  assign Cur_b7_2 = BufferData_out2;
  assign Cur_b7_3 = BufferData_out3;
  
  assign Can_b8 = ReadData;
  assign Cur_b8_0 = BufferData_out0;
  assign Cur_b8_1 = BufferData_out1;
  assign Cur_b8_2 = BufferData_out2;
  assign Cur_b8_3 = BufferData_out3;
  
  assign sr_addressRead1 = sr_addressRead;
  assign sr_addressRead2 = sr_addressRead;
  assign sr_addressRead3 = sr_addressRead;
  assign sr_addressRead4 = sr_addressRead;
  assign sr_addressRead5 = sr_addressRead;
  assign sr_addressRead6 = sr_addressRead;
  assign sr_addressRead7 = sr_addressRead;
  assign sr_addressRead8 = sr_addressRead;
  
  assign mad1 = Res1;
  assign mad2 = Res2;
  assign mad3 = Res3;
  assign mad4 = Res4;
  assign mad5 = Res5;
  assign mad6 = Res6;
  assign mad7 = Res7;
  assign mad8 = Res8;
  //-----------------------------------------------------------//
  
  /*always @(posedge CLK)
  begin
    //16.4.25 removed me_out <= compare_out[20:8];
    vector_x <= 7-compare_out[3:0];
    vector_y <= compare_out[7:4] -8;
  end*/
  
  //assign vector_x = compare_out[3:0];
  //assign vector_y = compare_out[7:4];
  
  //-----------------------------------------------------------//
  
  CTR CONTROL(
             .clk(CLK),
             .resetn(resetn),
             .refresh(refresh),
             .broadcast(broadcast),
             .compare_work(compare_work),
             .compare_refresh(compare_refresh),
             .memRead(memRead),
             .memWrite(memWrite),
             .sr_addressRead(sr_addressRead),
             .sr_addressWrite(sr_addressWrite));
   
   SR_MEMORY Memory(
                .clk(CLK),
                .memRead(MemRead),
                .memWrite(MemWrite),
                .sr_addressRead(sr_addressRead),
                .sr_addressWrite(sr_addressWrite),
                .writeData(WriteData),
                .readData(ReadData));
    
   currentBuffer CurrentBuffer(
                              .resetn(resetn),
                              .refresh(refresh),
                              .clk(CLK),
                              .broadcast(broadcast),
                              .bufferData_in(bufferData_in),
                              .BufferData_out0(BufferData_out0),
                              .BufferData_out1(BufferData_out1),
                              .BufferData_out2(BufferData_out2),
                              .BufferData_out3(BufferData_out3));
   
   compare COMP(
               .clk(CLK),
               .resetn(resetn),
               .compare_work(compare_work),
               .compare_refresh(compare_refresh),
               .mad_1(mad1),
               .mad_2(mad2),
               .mad_3(mad3),
               .mad_4(mad4),
               .mad_5(mad5),
               .mad_6(mad6),
               .mad_7(mad7),
               .mad_8(mad8),
               .vector_x(vector_x),
			   .vector_y(vector_y));
    
    
    MAD1 Mad_1(
             .clk(CLK),
             .res(Res1),
             .cur_b0(Cur_b1_0),
             .cur_b1(Cur_b1_1),
             .cur_b2(Cur_b1_2),
             .cur_b3(Cur_b1_3),
             .can_b(Can_b1),
             .sr_addressRead(sr_addressRead1));
    
    MAD2 Mad_2(
             .clk(CLK),
             .res(Res2),
             .cur_b0(Cur_b2_0),
             .cur_b1(Cur_b2_1),
             .cur_b2(Cur_b2_2),
             .cur_b3(Cur_b2_3),
             .can_b(Can_b2),
             .sr_addressRead(sr_addressRead2));
    
    MAD3 Mad_3(
             .clk(CLK),
             .res(Res3),
             .cur_b0(Cur_b3_0),
             .cur_b1(Cur_b3_1),
             .cur_b2(Cur_b3_2),
             .cur_b3(Cur_b3_3),
             .can_b(Can_b3),
             .sr_addressRead(sr_addressRead3));
    
    MAD4 Mad_4(
             .clk(CLK),
             .res(Res4),
             .cur_b0(Cur_b4_0),
             .cur_b1(Cur_b4_1),
             .cur_b2(Cur_b4_2),
             .cur_b3(Cur_b4_3),
             .can_b(Can_b4),
             .sr_addressRead(sr_addressRead4));
    
    MAD5 Mad_5(
             .clk(CLK),
             .res(Res5),
             .cur_b0(Cur_b5_0),
             .cur_b1(Cur_b5_1),
             .cur_b2(Cur_b5_2),
             .cur_b3(Cur_b5_3),
             .can_b(Can_b5),
             .sr_addressRead(sr_addressRead5));
    
    MAD6 Mad_6(
             .clk(CLK),
             .res(Res6),
             .cur_b0(Cur_b6_0),
             .cur_b1(Cur_b6_1),
             .cur_b2(Cur_b6_2),
             .cur_b3(Cur_b6_3),
             .can_b(Can_b6),
             .sr_addressRead(sr_addressRead6));
    
    MAD7 Mad_7(
             .clk(CLK),
             .res(Res7),
             .cur_b0(Cur_b7_0),
             .cur_b1(Cur_b7_1),
             .cur_b2(Cur_b7_2),
             .cur_b3(Cur_b7_3),
             .can_b(Can_b7),
             .sr_addressRead(sr_addressRead7));
    
    MAD8 Mad_8(
             .clk(CLK),
             .res(Res8),
             .cur_b0(Cur_b8_0),
             .cur_b1(Cur_b8_1),
             .cur_b2(Cur_b8_2),
             .cur_b3(Cur_b8_3),
             .can_b(Can_b8),
             .sr_addressRead(sr_addressRead8));
    
    
endmodule

    
             
  

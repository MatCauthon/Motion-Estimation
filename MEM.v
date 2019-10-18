module SR_MEMORY(clk, memRead, memWrite, sr_addressRead, sr_addressWrite, writeData, readData);
  input clk;
  input memRead;
  input memWrite;
  input [5:0] sr_addressRead;
  input [5:0] sr_addressWrite;
  input [87:0] writeData;
  output [87:0] readData;
  
  reg[87:0] readDataout;
  reg[87:0] readData;
  reg[87:0] memFile[37:0];
  
   
  always @(memRead or sr_addressRead)
  begin
    if(memRead)
      readDataout = memFile[(sr_addressRead[4:0]+ 19*sr_addressRead[5])];
  end
  
  always @(posedge clk)
  begin
    readData <= readDataout;
    if(memWrite == 1'b1)
      memFile[(sr_addressWrite[4:0]+ 19*sr_addressWrite[5])] <= writeData;
  end
endmodule

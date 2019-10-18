module currentBuffer(bufferData_in, BufferData_out0, BufferData_out1, BufferData_out2, BufferData_out3, clk, broadcast, resetn,refresh);
  input resetn;
  input refresh;
  input [31:0]bufferData_in;
  input clk;
  input broadcast;
  
  output [31:0]BufferData_out0;
  output [31:0]BufferData_out1;
  output [31:0]BufferData_out2;
  output [31:0]BufferData_out3;
  
  reg [31:0]BufferData_out0;
  reg [31:0]BufferData_out1;
  reg [31:0]BufferData_out2;
  reg [31:0]BufferData_out3;
  
  reg [31:0]buffer_file[3:0];
  
  always @(posedge clk)
  begin
    if(!resetn)
      begin
        buffer_file[0] <= 0;
        buffer_file[1] <= 0;
        buffer_file[2] <= 0;
        buffer_file[3] <= 0;
      end
    else if(refresh)
      begin
        buffer_file[0] <= ((buffer_file[0]>>8) + {bufferData_in[7:0],24'b0});
        buffer_file[1] <= ((buffer_file[1]>>8) + {bufferData_in[15:8],24'b0});
        buffer_file[2] <= ((buffer_file[2]>>8) + {bufferData_in[23:16],24'b0});
        buffer_file[3] <= ((buffer_file[3]>>8) + {bufferData_in[31:24],24'b0}); 
      end
    else if(broadcast)
      begin
        BufferData_out0 <= buffer_file[0];
        BufferData_out1 <= buffer_file[1];
        BufferData_out2 <= buffer_file[2];
        BufferData_out3 <= buffer_file[3];
      end
    else
      begin
        BufferData_out0 <= -1;
        BufferData_out1 <= -1;
        BufferData_out2 <= -1;
        BufferData_out3 <= -1;
      end
  end
  
endmodule


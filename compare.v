module compare(compare_work,compare_refresh,resetn,clk,mad_1,mad_2,mad_3,mad_4,mad_5,mad_6,mad_7,mad_8,vector_x,vector_y);
  input resetn;
  input compare_work;
  input clk;
  input [20:0]mad_1;
  input [20:0]mad_2;
  input [20:0]mad_3;
  input [20:0]mad_4;
  input [20:0]mad_5;
  input [20:0]mad_6;
  input [20:0]mad_7;
  input [20:0]mad_8;
  input compare_refresh;
 // output [19:0]comparefile;
  // output [20:0] compare_out;
  output [3:0]vector_x;
  output [3:0]vector_y;
  
  reg [20:0]mad_12_larger;
  reg [20:0]mad_34_larger;
  reg [20:0]mad_56_larger;
  reg [20:0]mad_78_larger;
  reg [20:0]mad_1234_larger;
  reg [20:0]mad_5678_larger;
  
 // reg [12:0]mad_out;
  reg [20:0]mad;
 // reg [7:0]address;
  reg [20:0]comparefile;
  //reg [7:0] compare_out;
  reg [3:0]vector_x;
  reg [3:0]vector_y;
  
  always @(posedge clk )
  begin
    if(compare_work)
      begin
	    mad_12_larger <= (mad_1[20:8] < mad_2[20:8]) ? mad_1 : mad_2;
	    mad_34_larger <= (mad_3[20:8] < mad_4[20:8]) ? mad_3 : mad_4;
	    mad_56_larger <= (mad_5[20:8] < mad_6[20:8]) ? mad_5 : mad_6;
	    mad_78_larger <= (mad_7[20:8] < mad_8[20:8]) ? mad_7 : mad_8;
      end
    else
      begin
        mad_12_larger <= 21'b111111111111111111111;
        mad_34_larger <= 21'b111111111111111111111;
        mad_56_larger <= 21'b111111111111111111111;
        mad_78_larger <= 21'b111111111111111111111;
      end
    
    mad_1234_larger <= (mad_12_larger[20:8] < mad_34_larger[20:8]) ? mad_12_larger : mad_34_larger;
	  mad_5678_larger <= (mad_56_larger[20:8] < mad_78_larger[20:8]) ? mad_56_larger : mad_78_larger;
		mad <= (mad_1234_larger[20:8] < mad_5678_larger[20:8]) ? mad_1234_larger : mad_5678_larger;
		
		
    if (!resetn || compare_refresh)
        comparefile <= 21'b111111111111111111111;
      
    else if(comparefile >mad && resetn)
          //out <= comparefile-mad;
          comparefile<=mad; 
             
    else
      comparefile<=comparefile;
	  
	/*if(compare_refresh)
	begin
	  vector_x <= 7-comparefile[3:0];
      vector_y <= comparefile[7:4] -8;
      //compare_out[20:8]=comparefile[20:8];
	end*/

  end
  
  always@(compare_refresh)
  begin
    if(compare_refresh)
	begin
	  vector_x = 7-comparefile[3:0];
      vector_y = comparefile[7:4] -8;
      //compare_out[20:8]=comparefile[20:8];
	end  
  end
    
    
  
endmodule

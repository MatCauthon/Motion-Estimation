module MAD6 (cur_b0,cur_b1,cur_b2,cur_b3,can_b,clk,res,sr_addressRead);//add sr_addressRead[5:0],comapre_out[20:0] 
  input[31:0] cur_b0;
  input[31:0] cur_b1;
  input[31:0] cur_b2;
  input[31:0] cur_b3;
  input[87:0] can_b;
  input clk;
  input[5:0] sr_addressRead;
  output [20:0]res;
  
  reg[20:0] res;
  
  reg[31:0] mad0;
  reg[31:0] mad1;
  reg[31:0] mad2;
  reg[31:0] mad3;
  
  reg [7:0] res_00;
  reg [7:0] res_01;
  reg [7:0] res_02;
  reg [7:0] res_03;
  reg [7:0] res_04;
  reg [7:0] res_05;
  reg [7:0] res_06;
  reg [7:0] res_07;
  reg [7:0] res_08;
  reg [7:0] res_09;
  reg [7:0] res_010;
  reg [7:0] res_011;
  reg [7:0] res_012;
  reg [7:0] res_013;
  reg [7:0] res_014;
  reg [7:0] res_015;
  
  reg[9:0]res_10;
  reg[9:0]res_11;
  reg[9:0]res_12;
  reg[9:0]res_13;
  reg[9:0]res_14;
  
  reg[9:0]res_15;
  reg[9:0]res_16;
  reg[9:0]res_17;
  
  reg[10:0]res_20;
  reg[10:0]res_21;
  reg[10:0]res_22;
  reg[10:0]res_23;
  
  reg[11:0]res_30;
  reg[11:0]res_31;
  reg[11:0]res_4;
  
  reg[7:0]address;
  always@(posedge clk)
    begin
      mad0<=mad0>>8;
      mad1<=mad1>>8;
      mad2<=mad2>>8;
      mad3<=mad3>>8;
      
      {mad0[31:24],mad1[31:24],mad2[31:24],mad3[31:24]}<=can_b[47:16];
      
      
      res_00<=(cur_b0[31:24]<mad0[31:24])?(mad0[31:24]-cur_b0[31:24]):(cur_b0[31:24]-mad0[31:24]);
      res_01<=(cur_b0[23:16]<mad0[23:16])?(mad0[23:16]-cur_b0[23:16]):(cur_b0[23:16]-mad0[23:16]);
      res_02<=(cur_b0[15:8]<mad0[15:8])?(mad0[15:8]-cur_b0[15:8]):(cur_b0[15:8]-mad0[15:8]);
      res_03<=(cur_b0[7:0]<mad0[7:0])?(mad0[7:0]-cur_b0[7:0]):(cur_b0[7:0]-mad0[7:0]);
      res_04<=(cur_b1[31:24]<mad1[31:24])?(mad1[31:24]-cur_b1[31:24]):(cur_b1[31:24]-mad1[31:24]);
      res_05<=(cur_b1[23:16]<mad1[23:16])?(mad1[23:16]-cur_b1[23:16]):(cur_b1[23:16]-mad1[23:16]);
      res_06<=(cur_b1[15:8]<mad1[15:8])?(mad1[15:8]-cur_b1[15:8]):(cur_b1[15:8]-mad1[15:8]);
      res_07<=(cur_b1[7:0]<mad1[7:0])?(mad1[7:0]-cur_b1[7:0]):(cur_b1[7:0]-mad1[7:0]);
      res_08<=(cur_b2[31:24]<mad2[31:24])?(mad2[31:24]-cur_b2[31:24]):(cur_b2[31:24]-mad2[31:24]);
      res_09<=(cur_b2[23:16]<mad2[23:16])?(mad2[23:16]-cur_b2[23:16]):(cur_b2[23:16]-mad2[23:16]);
      res_010<=(cur_b2[15:8]<mad2[15:8])?(mad2[15:8]-cur_b2[15:8]):(cur_b2[15:8]-mad2[15:8]);
      res_011<=(cur_b2[7:0]<mad2[7:0])?(mad2[7:0]-cur_b2[7:0]):(cur_b2[7:0]-mad2[7:0]);
      res_012<=(cur_b3[31:24]<mad3[31:24])?(mad3[31:24]-cur_b3[31:24]):(cur_b3[31:24]-mad3[31:24]);
      res_013<=(cur_b3[23:16]<mad3[23:16])?(mad3[23:16]-cur_b3[23:16]):(cur_b3[23:16]-mad3[23:16]);
      res_014<=(cur_b3[15:8]<mad3[15:8])?(mad3[15:8]-cur_b3[15:8]):(cur_b3[15:8]-mad3[15:8]);
      res_015<=(cur_b3[7:0]<mad3[7:0])?(mad3[7:0]-cur_b3[7:0]):(cur_b3[7:0]-mad3[7:0]);
      
      res_10<=res_00+res_01;
      res_11<=res_02+res_03;
      res_12<=res_04+res_05;
      res_13<=res_06+res_07;
      res_14<=res_08+res_09;
      res_15<=res_010+res_011;
      res_16<=res_012+res_013;
      res_17<=res_014+res_015;
      
      res_20<=res_10+res_11;
      res_21<=res_12+res_13;
      res_22<=res_14+res_15;
      res_23<=res_16+res_17;
      
      res_30<=res_20+res_21;
      res_31<=res_22+res_23;
      
      res_4<=res_30+res_31;
      
      address[7:4]<=(sr_addressRead[4:0] <= 6) ? (sr_addressRead[5]*8+13) : (sr_addressRead[5]*8+5);
      address[3:0]<=(address[3:0]== 9)? 10:((sr_addressRead[4:0] >= 9)? (sr_addressRead[4:0]-9) : (sr_addressRead[4:0] + 11));
      res<={res_4,address};
      

    end
/*
  always@(mad0 or mad1 or mad2 or mad3)
  begin
      if(cur_b0[31:24]<mad0[31:24])
        res_00=mad0[31:24]-cur_b0[31:24];
      else
        res_00=cur_b0[31:24]-mad0[31:24];
        
      if(cur_b0[23:16]<mad0[23:16])
        res_01=mad0[23:16]-cur_b0[23:16];
      else
        res_01=cur_b0[23:16]-mad0[23:16];
        
      if(cur_b0[15:8]<mad0[15:8])
        res_02=mad0[15:8]-cur_b0[15:8];
      else
        res_02=cur_b0[15:8]-mad0[15:8];
        
      if(cur_b0[7:0]<mad0[7:0])
        res_03=mad0[7:0]-cur_b0[7:0];
      else
        res_03=cur_b0[7:0]-mad0[7:0];
        
      if(cur_b1[31:24]<mad1[31:24])
        res_04=mad1[31:24]-cur_b1[31:24];
      else
        res_04=cur_b1[31:24]-mad1[31:24];
        
      if(cur_b1[23:16]<mad1[23:16])
        res_05=mad1[23:16]-cur_b1[23:16];
      else
        res_05=cur_b1[23:16]-mad1[23:16];
        
      if(cur_b1[15:8]<mad1[15:8])
        res_06=mad1[15:8]-cur_b1[15:8];
      else
        res_06=cur_b1[15:8]-mad1[15:8];
        
        
      if(cur_b1[7:0]<mad1[7:0])
        res_07=mad1[7:0]-cur_b1[7:0];
      else
        res_07=cur_b1[7:0]-mad1[7:0];
        
        
      if(cur_b2[31:24]<mad2[31:24])
        res_08=mad2[31:24]-cur_b2[31:24];
      else
        res_08=cur_b2[31:24]-mad2[31:24];
        
          
      if(cur_b2[23:16]<mad2[23:16])
        res_09=mad2[23:16]-cur_b2[23:16];
      else
        res_09=cur_b2[23:16]-mad2[23:16];
          
      if(cur_b2[15:8]<mad2[15:8])
        res_010=mad2[15:8]-cur_b2[15:8];
      else
        res_010=cur_b2[15:8]-mad2[15:8];
          
      if(cur_b2[7:0]<mad2[7:0])
        res_011=mad2[7:0]-cur_b2[7:0];
      else
        res_011=cur_b2[7:0]-mad2[7:0];
          
      if(cur_b3[31:24]<mad3[31:24])
        res_012=mad3[31:24]-cur_b3[31:24];
      else
        res_012=cur_b3[31:24]-mad3[31:24];
          
      if(cur_b3[23:16]<mad3[23:16])
        res_013=mad3[23:16]-cur_b3[23:16];
      else
        res_013=cur_b3[23:16]-mad3[23:16];
          
      if(cur_b3[15:8]<mad3[15:8])
        res_014=mad3[15:8]-cur_b3[15:8];
      else
        res_014=cur_b3[15:8]-mad3[15:8];
          
      if(cur_b3[7:0]<mad3[7:0])
        res_015=mad3[7:0]-cur_b3[7:0];
      else
        res_015=cur_b3[7:0]-mad3[7:0];
    
      res_10=res_00+res_01;
      res_11=res_02+res_03;
      res_12=res_04+res_05;
      res_13=res_06+res_07;
      res_14=res_08+res_09;
      res_15=res_010+res_011;
      res_16=res_012+res_013;
      res_17=res_014+res_015;
      
      res_20=res_10+res_01;
      res_21=res_12+res_03;
      res_22=res_14+res_05;
      res_23=res_16+res_07;
      
      res_30=res_20+res_21;
      res_31=res_22+res_23;
      
      res_4=res_30+res_31;
      
      address[7:4]=sr_addressRead[5]*8+5;
      address[3:0]=(sr_addressRead[4:0]-3);
      res={res_4,address};
      
      //res={res,sr_addressRead};
  end
  */
   
  
endmodule



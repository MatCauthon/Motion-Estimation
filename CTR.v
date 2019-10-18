module CTR(resetn,clk,broadcast,memRead,memWrite,refresh,sr_addressRead,sr_addressWrite,compare_work,compare_refresh);
  input clk;
  input resetn;
  
  output broadcast;
  output compare_work;
  output compare_refresh;
  output memRead;
  output memWrite;
  output refresh;
  output [5:0]sr_addressRead;
  output [5:0]sr_addressWrite;
  
  reg broadcast;
  reg compare_work;
  reg compare_refresh;
  reg memRead;
  reg memWrite;
  reg refresh;
  reg [5:0]sr_addressRead;
  reg [5:0]sr_addressWrite;
  
  reg[6:0]counter;
  reg[2:0]state;
  reg[2:0]next_state;
 // reg flag;
  
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  
  always @(posedge clk or negedge resetn)
  begin
    if(!resetn)
      begin
        state <= 3'b000;
        counter <= -1;
      end
    else
      begin
        state <= next_state;
        case({next_state,state})
          6'b010001 : counter <= 0;
          6'b011100 : if (counter <=37)
                        counter <= counter + 1;
                      else
                        counter <= 0;
          default : counter <= counter + 1;
        endcase
         
      end
  end
  
  always @(counter or state)
  begin
    case(state)
      3'b000: if(!resetn)
                begin
                  broadcast = 1'b0;
                  compare_work = 1'b0;
                  memRead = 1'b0;
                  memWrite = 1'b0;
                  refresh = 1'b0;
                  compare_refresh = 1'b0;
                  sr_addressWrite = 6'b000000;
                  sr_addressRead = 6'b100000;
                  next_state = S0;
                 // flag = 1'b0;
                end
              else
                begin
                  next_state = S1;
                  sr_addressWrite = sr_addressWrite-1;
                  sr_addressRead = sr_addressRead-1;
                end
      3'b001: if(counter <= 18)
                begin
                  broadcast = 1'b0;
                  compare_work = 1'b0;
                  memRead = 1'b1;
                  memWrite = 1'b1;
                  refresh = 1'b0;
                  compare_refresh = 1'b0;
                  sr_addressWrite = sr_addressWrite+1;
                  sr_addressRead = sr_addressRead+1;
                  next_state = S1;
                end
              else
                begin
                  sr_addressWrite = sr_addressWrite+1;
                  sr_addressRead = sr_addressRead+1;
                  next_state = S2;
                end
      3'b010: if(counter <= 9)
                begin
                  if(counter <= 3)
                    begin
                      compare_work = 1'b0;
                      compare_refresh = 1'b0;
                      broadcast = 1'b0;
                      refresh = 1'b1;
                      memRead = 1'b1;
                      memWrite = 1'b1;
                      if(counter == 0)
                        begin
                          sr_addressWrite = sr_addressWrite+14;
                          sr_addressRead = sr_addressRead+14;
                        end
                      else
                        begin
                          sr_addressWrite = sr_addressWrite+1;
                          sr_addressRead = sr_addressRead+1;
                        end
                        
                    end
                  else
                    begin
                      broadcast = 1'b1;
                      refresh = 1'b0;
                      memRead = 1'b1;
                      memWrite = 1'b1;
                      compare_work = 1'b0;
                      compare_refresh = 1'b0;
                      sr_addressWrite = sr_addressWrite+1;
                      sr_addressRead = sr_addressRead+1;
                    end
                  next_state = S2;
                end
              else
                begin
                  sr_addressWrite = sr_addressWrite+1;
                  sr_addressRead = sr_addressRead+1;
                  //flag = 1'b1;
                  next_state = S4;
                end  
                
      3'b011: if(counter <= 3)
                begin
                  compare_work = 1'b1;
                  compare_refresh = 1'b0;
                  broadcast = 1'b0;
                  refresh = 1'b1;
                  memRead = 1'b1;
                  memWrite = 1'b1;
                  if(counter == 0)
                    begin
                      //sr_addressWrite = sr_addressWrite;
                      //sr_addressRead = sr_addressRead;
                      //memRead = 1'b0;
                      //memWrite = 1'b0;
                      sr_addressWrite = sr_addressWrite+14;
                      sr_addressRead = sr_addressRead+14;
                    end
                  else
                    begin
                      //sr_addressWrite = sr_addressWrite+1;
                      //sr_addressRead = sr_addressRead+1;
                      //memRead = 1'b1;
                      //memWrite = 1'b1;
                      sr_addressWrite = sr_addressWrite+1;
                      sr_addressRead = sr_addressRead+1;
                    end
                  if (counter != 3)
                    next_state = S3;
                  else
                    next_state = S4;
                end
              else if (counter <= 23 && counter > 3)
                begin
                  compare_work = 1'b1;
                  compare_refresh = 1'b0;
                  broadcast = 1'b0;
                  refresh = 1'b0;
                  memRead = 1'b1;
                  memWrite = 1'b1;
                  if(counter == 20)
                    begin
                      //sr_addressWrite = sr_addressWrite;
                      //sr_addressRead = sr_addressRead;
                      //memRead = 1'b0;
                      //memWrite = 1'b0;
                      sr_addressWrite = sr_addressWrite+14;
                      sr_addressRead = sr_addressRead+14;
                    end
                  else
                    begin
                      //sr_addressWrite = sr_addressWrite+1;
                      //sr_addressRead = sr_addressRead+1;
                      //memRead = 1'b1;
                      //memWrite = 1'b1;
                      sr_addressWrite = sr_addressWrite+1;
                      sr_addressRead = sr_addressRead+1;
                    end
                  if (counter != 23)
                    next_state = S3;
                  else
                    next_state = S4;
                end
      3'b100: if(counter <= 19 || (counter >= 23 && counter <= 39))
                begin
                  broadcast = 1'b1;
                  refresh = 1'b0;
                  if(counter != 39 && counter != 19)
                    begin
                   //if(flag)
                        //begin
                          /*if((counter>=9 && counter <= 29))
                            begin
                              compare_work = 1'b1;
                              compare_refresh = 1'b0;
                              //if(counter >= 13)
                                //flag = 0;
                            end
                          else
                            begin
                              compare_refresh = 1'b1;
                              compare_work = 1'b0;
                            end
                        end
                      else 
                        begin*/
                          if((counter>=11 && counter <= 26) || (counter >= 31)||(counter <= 6))
                            begin
                              compare_work = 1'b1;
                              compare_refresh = 1'b0;
                            end
                          else
                            begin
                              if(counter >= 27 ||(counter <= 9))
                                begin
                                  compare_work = 1'b0;
                                  compare_refresh = 1'b0;
                                end
                              else
                                begin
                                  compare_work = 1'b0;
                                  compare_refresh = 1'b1;
                                end
                                
                            end
                        
                      memRead = 1'b1;
                      memWrite = 1'b1;
                      sr_addressWrite = sr_addressWrite+1;
                      sr_addressRead = sr_addressRead+1;
                    end
                  else
                    begin
                      compare_work = 1'b1;
                      compare_refresh = 1'b0;
                      memRead = 1'b1;    //renewed
                      memWrite = 1'b1;
                      sr_addressWrite = sr_addressWrite;
                      sr_addressRead = sr_addressRead;
                    end
                  if(counter <= 18 || (counter >= 23 && counter <= 38))
                    next_state = S4;
                  else if(counter == 19)
                    next_state = S3;
                  else if(counter == 39)
                      next_state = S3;
              end
              
              else
                next_state = S3;
    endcase
  end
  
endmodule

                  
      

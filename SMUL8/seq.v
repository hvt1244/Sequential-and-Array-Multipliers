// Code your design here
`timescale 1ns/10ps
module seq_adder (clock,start,valid,mlier,mcand,prodt_end,reset);
  input clock,start,reset;
  output valid;
  parameter n=8;
  input [n-1:0] mlier,mcand;
  output [2*n:0] prodt_end;
  reg [2*n:0] prodt_end;
  wire [2*n:0] temp;
  reg [1:0] states;
  reg [n-1:0] a,b;
  reg [n-1:0] register;
  reg c_out,add,shift,valid;
  integer count;
  parameter s0=0,s1=1,s3=3,s2=2;
  wire [n-1:0] wsum,sumt;
  wire wcout;
  assign sumt=prodt_end[2*n-1:n];
  bit8 Ad8 (wsum,wcout,sumt[n-1:0],a,1'b0);
  assign temp=prodt_end;
  always @(posedge clock)
    begin
      if(reset==1 || start==0)
        begin
                 states<=s0;
                   a<={(n){1'b0}};
                   b<={(n){1'b0}};
                 count<=0;
          prodt_end[2*n:0]<={(2*n+1){1'b0}};
          valid<=0;
        end
      else
        begin
          case (states)

            
            s0: begin
              if (!valid)
                begin
              	prodt_end[2*n:n]<={(n+1){1'b0}};
               	a<=mcand;
               	b<=mlier;
              	count<=n;
              	prodt_end[n-1:0]<=mlier;
              	//temp<={{(n){1'b0}},mlier};
                end
              if (mlier[0])
                begin
                states<=s2;
                add<=1;
                  shift<=1;
                  end
              else
                begin
                states<=s2;                
                add<=0;
                  shift<=1;
            end
            end
            /*
            s1:begin
              if (add==1)
                  begin
                    temp[2*n:n] <= {wcout,wsum};
                    temp[n-1:0]<= prodt_end[n-1:0];
                    //bit32 B32 (register,c_out,prodt_end[2*n-1:n],a,1'b0);
                  end
              else
                temp<=prodt_end;
            states<=s2;
            end
            */
              
              s2:begin
                if(add==1)
                  begin
                prodt_end[2*n-1:n-1]<= {wcout,wsum};
                prodt_end[n-2:0]<=temp[n-1:1];
                  end
                else
                  begin
                	prodt_end<={1'b0,temp[2*n:1]};    
                  end
                
                    count<=count-1; 
                
                if (count==1)
                  begin
                  states <= s3;                    
                  valid <=1;
                  end
                else
                  begin

                    if (temp[1])
                    begin
                      states<=s2;
                      add<=1;
                      shift<=1;
                    end
                    else
                      begin
                        states<=s2;
                        add<=0;
                        shift<=1;
                      end
                  end
                
              end
            s3: begin
              if ((a == mcand) && (b==mlier) )
                begin
                  states<=s3;
                  valid<=1;
                end
              else
                begin
                  states<=s0;
                  valid<=0;
                end
            end
                  
              
            //default: states<=s0;
          endcase
        end
          
            
       end
endmodule 
/*
module adder8(s,co,a,b,ci);
  input [7:0] a,b;
  output [7:0] s;
  input ci;
  output co;
  assign {co,s}=a+b+ci;
endmodule

*/         
module bit32(a32,b32,sum32,c_out32,c_in32);
  input [31:0] a32,b32;
  input c_in32;
  output [31:0] sum32;
  output c_out32;
  wire [31:0] sum32;
  wire [15:0] s321,s322,s323,s324;
  wire c_out3200,c_out3201,c_out3210,c_out3211;
  wire c_outimm32;
  wire c_out32;
  
  bit16 A321 (s321,c_out3200,a32[15:0],b32[15:0],1'b0);  
  bit16 A322 (s322,c_out3201,a32[15:0],b32[15:0],1'b1);
  bit16 A323 (s323,c_out3210,a32[31:16],b32[31:16],1'b0);
  bit16 A324 (s324,c_out3211,a32[31:16],b32[31:16],1'b1);
  
  assign {c_outimm32, sum32[15:0]} = (~c_in32) ? {c_out3200,s321} : {c_out3201,s322}; 
  assign {c_out32, sum32[31:16]} = (~c_outimm32) ? {c_out3210,s323} : {c_out3211,s324}; 


endmodule

module bit16(sum16,c_out16,a16,b16,c_in16);
  input [15:0] a16,b16;
  input c_in16;
  output [15:0] sum16;
  output c_out16;
  wire [15:0] sum16;
  wire [7:0] s161,s162,s163,s164;
  wire c_out1600,c_out1601,c_out1610,c_out1611;
  wire c_outimm16;
  
  bit8 A161 (s161,c_out1600,a16[7:0],b16[7:0],1'b0);  
  bit8 A162 (s162,c_out1601,a16[7:0],b16[7:0],1'b1);
  bit8 A163 (s163,c_out1610,a16[15:8],b16[15:8],1'b0);
  bit8 A164 (s164,c_out1611,a16[15:8],b16[15:8],1'b1);
  
  assign {c_outimm16, sum16[7:0]} = (~c_in16) ? {c_out1600,s161} : {c_out1601,s162}; 
  assign {c_out16, sum16[15:8]} = (~c_outimm16) ? {c_out1610,s163} : {c_out1611,s164}; 


endmodule

module bit8(sum8,c_out8,a8,b8,c_in8);
  input [7:0] a8,b8;
  input c_in8;
  output [7:0] sum8;
  output c_out8;
  wire [7:0] sum8;
  wire [3:0] s81,s82,s83,s84;
  wire c_out800,c_out801,c_out810,c_out811;
  wire c_outimm8;
  wire c_out8;
  
  bit4 A81 (s81,c_out800,a8[3:0],b8[3:0],1'b0);  
  bit4 A82 (s82,c_out801,a8[3:0],b8[3:0],1'b1);
  bit4 A83 (s83,c_out810,a8[7:4],b8[7:4],1'b0);
  bit4 A84 (s84,c_out811,a8[7:4],b8[7:4],1'b1);
  
  assign {c_outimm8, sum8[3:0]} = (~c_in8) ? {c_out800,s81} : {c_out801,s82}; 
  assign {c_out8, sum8[7:4]} = (~c_outimm8) ? {c_out810,s83} : {c_out811,s84}; 


endmodule


module bit4(sum4,c_out4,a4,b4,c_in4);
  input [3:0] a4,b4;
  input c_in4;
  output [3:0] sum4;
  output c_out4;
  wire [3:0] sum4;
  wire [1:0] s41,s42,s43,s44;
  wire c_out400,c_out401,c_out410,c_out411;
  wire c_outimm4;
  wire c_out4;
  
  bit2 A41 (s41,c_out400,a4[1:0],b4[1:0],1'b0);  
  bit2 A42 (s42,c_out401,a4[1:0],b4[1:0],1'b1);
  bit2 A43 (s43,c_out410,a4[3:2],b4[3:2],1'b0);
  bit2 A44 (s44,c_out411,a4[3:2],b4[3:2],1'b1);
  
  assign {c_outimm4, sum4[1:0]} = (~c_in4) ? {c_out400,s41} : {c_out401,s42}; 
  assign {c_out4, sum4[3:2]} = (~c_outimm4) ? {c_out410,s43} : {c_out411,s44}; 


endmodule
  

module bit2(sum2,c_out2,a2,b2,c_in2);
  input [1:0] a2,b2;
  input c_in2;
  output [1:0] sum2;
  output c_out2;
  wire [1:0] sum2;
  wire s1,s2,s3,s4;
  wire c_out00,c_out01,c_out10,c_out11;
  wire c_outimm;
  wire c_out2;
  
  Add_full A1 (s1,c_out00,a2[0],b2[0],1'b0);  
  Add_full A2 (s2,c_out01,a2[0],b2[0],1'b1);
  Add_full A3 (s3,c_out10,a2[1],b2[1],1'b0);
  Add_full A4 (s4,c_out11,a2[1],b2[1],1'b1);
  
  assign {c_outimm, sum2[0]} = (~c_in2) ? {c_out00,s1} : {c_out01,s2}; 
  assign {c_out2, sum2[1]} = (~c_outimm) ? {c_out10,s3} : {c_out11,s4}; 


endmodule




module Add_full (sum, c_out, a, b, c_in);
  output sum, c_out;
  input a, b, c_in;
  wire w1, w2, w3;
  Add_half M1 (w1, w2, a, b);
  Add_half M2 (sum, w3, w1, c_in);
  or M3 (c_out, w2, w3);
endmodule

module Add_half (sum, c_out, a, b);
  output sum, c_out;
  input a, b;
  xor M1 (sum, a, b);
  and M2 (c_out, a, b);
endmodule


  
  
  
  
  
  

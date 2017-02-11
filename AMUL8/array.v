// Code your design here
`timescale 1ns/10ps


module array_bin (mlier,mcand,prodt,start,reset,valid,clock);
  
  parameter n=8;
  input [7:0] mlier,mcand;
  output [15:0] prodt;
  input start,reset,clock;
  output valid;
  
  reg [15:0] prodt;
  reg valid;
  
  wire [7:0] p0,p1,p2,p3,p4,p5,p6,p7,p8;
  
  wire [15:0] s1,s2,s3,s4,s5,s6,s7;

  
  wire [15:0] w1,w2,w3,w4,w5,w6,w7,w8;


  wire [7:0] c_out;

  
  always @(posedge clock)
    begin
      if(reset==1)
        begin
          prodt<=0;
          valid<=0;
        end
      else
        begin
          prodt<=s7;
         valid<=1;
        end
    end

  

  
  assign p0 = mcand & {n{mlier[0]}};
  assign p1 = mcand & {n{mlier[1]}};
  assign p2 = mcand & {n{mlier[2]}};
  assign p3 = mcand & {n{mlier[3]}};
  assign p4 = mcand & {n{mlier[4]}};
  assign p5 = mcand & {n{mlier[5]}};
  assign p6 = mcand & {n{mlier[6]}};
  assign p7 = mcand & {n{mlier[7]}};


  
  

  assign w1 = {{8{1'b0}},p0};
  assign w2 = {{7{1'b0}},p1,{1{1'b0}}};
  assign w3 = {{6{1'b0}},p2,{2{1'b0}}};
  assign w4 = {{5{1'b0}},p3,{3{1'b0}}};
  assign w5 = {{4{1'b0}},p4,{4{1'b0}}};
  assign w6 = {{3{1'b0}},p5,{5{1'b0}}};
  assign w7 = {{2{1'b0}},p6,{6{1'b0}}};
  assign w8 = {{1{1'b0}},p7,{7{1'b0}}};


  
  
  bit16 A0 (w1,w2,s1,c_out[0],1'b0);
  
  bit16 A1 (w3,w4,s2,c_out[1],1'b0);

  bit16 A2 (w5,w6,s3,c_out[2],1'b0);

    
  bit16 A3 (w7,w8,s4,c_out[3],1'b0);

 
  bit16 A4 (s1,s2,s5,c_out[4],1'b0);
  
  
  bit16 A5 (s3,s4,s6,c_out[5],1'b0);

    
  bit16 A6 (s5,s6,s7,c_out[6],1'b0);

  

  
 

  
  
endmodule


module bit16(a16,b16,sum16,c_out16,c_in16);
  input [15:0] a16,b16;
  input c_in16;
  output [15:0] sum16;
  output c_out16;
  wire [15:0] sum16;

	 
		wire c1;
  bit8 A161(sum16[7:0],c1,a16[7:0],b16[7:0],c_in16);
  bit8 A162(sum16[15:8],c_out16,a16[15:8],b16[15:8],c1);



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


  
  
  
  
  
  
  

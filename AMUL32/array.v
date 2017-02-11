// Code your design here
`timescale 1ns/10ps


module array_bin (mlier,mcand,prodt,start,reset,valid,clock);
  
  parameter n=32;
  input [31:0] mlier,mcand;
  output [63:0] prodt;
  input start,reset,clock;
  output valid;
  //wire [63:0] result;
  
  reg [63:0] prodt;
  reg valid;
  
  wire [31:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32;
  
wire [63:0] s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31;

  
  wire [63:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25, w26,w27,w28,w29,w30,w31,w32;


    wire [31:0] c_out;

  
 	always @(posedge clock)
    begin
      if(reset==1)
        begin
          prodt<=0;
          valid<=0;
        end
      else
        begin
          prodt<=s31;
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
  assign p8 = mcand & {n{mlier[8]}};
  assign p9 = mcand & {n{mlier[9]}};
  assign p10 = mcand & {n{mlier[10]}};
  assign p11 = mcand & {n{mlier[11]}};
  assign p12 = mcand & {n{mlier[12]}};
  assign p13 = mcand & {n{mlier[13]}};
  assign p14 = mcand & {n{mlier[14]}};
  assign p15 = mcand & {n{mlier[15]}};
  assign p16 = mcand & {n{mlier[16]}};
  assign p17 = mcand & {n{mlier[17]}};
  assign p18 = mcand & {n{mlier[18]}};
  assign p19 = mcand & {n{mlier[19]}};
  assign p20 = mcand & {n{mlier[20]}};
  assign p21 = mcand & {n{mlier[21]}};
  assign p22 = mcand & {n{mlier[22]}};
  assign p23 = mcand & {n{mlier[23]}};
  assign p24 = mcand & {n{mlier[24]}};
  assign p25 = mcand & {n{mlier[25]}};
  assign p26 = mcand & {n{mlier[26]}};
  assign p27 = mcand & {n{mlier[27]}};
  assign p28 = mcand & {n{mlier[28]}};
  assign p29 = mcand & {n{mlier[29]}};
  assign p30 = mcand & {n{mlier[30]}};
  assign p31 = mcand & {n{mlier[31]}};
  
  

  assign w1 = {{32{1'b0}},p0};
  assign w2 = {{31{1'b0}},p1,{1{1'b0}}};
  assign w3 = {{30{1'b0}},p2,{2{1'b0}}};
  assign w4 = {{29{1'b0}},p3,{3{1'b0}}};
  assign w5 = {{28{1'b0}},p4,{4{1'b0}}};
  assign w6 = {{27{1'b0}},p5,{5{1'b0}}};
  assign w7 = {{26{1'b0}},p6,{6{1'b0}}};
  assign w8 = {{25{1'b0}},p7,{7{1'b0}}};
  assign w9 = {{24{1'b0}},p8,{8{1'b0}}};
  assign w10 = {{23{1'b0}},p9,{9{1'b0}}};
  assign w11 = {{22{1'b0}},p10,{10{1'b0}}};
  assign w12 = {{21{1'b0}},p11,{11{1'b0}}};
  assign w13 = {{20{1'b0}},p12,{12{1'b0}}};
  assign w14 = {{19{1'b0}},p13,{13{1'b0}}};
  assign w15 = {{18{1'b0}},p14,{14{1'b0}}};
  assign w16 = {{17{1'b0}},p15,{15{1'b0}}};
  assign w17 = {{16{1'b0}},p16,{16{1'b0}}};
  assign w18 = {{15{1'b0}},p17,{17{1'b0}}};
  assign w19 = {{14{1'b0}},p18,{18{1'b0}}};
  assign w20 = {{13{1'b0}},p19,{19{1'b0}}};
  assign w21 = {{12{1'b0}},p20,{20{1'b0}}};
  assign w22 = {{11{1'b0}},p21,{21{1'b0}}};
  assign w23 = {{10{1'b0}},p22,{22{1'b0}}};
  assign w24 = {{9{1'b0}},p23,{23{1'b0}}};
  assign w25 = {{8{1'b0}},p24,{24{1'b0}}};
  assign w26 = {{7{1'b0}},p25,{25{1'b0}}};
  assign w27 = {{6{1'b0}},p26,{26{1'b0}}};
  assign w28 = {{5{1'b0}},p27,{27{1'b0}}};
  assign w29 = {{4{1'b0}},p28,{28{1'b0}}};
  assign w30 = {{3{1'b0}},p29,{29{1'b0}}};
  assign w31 = {{2{1'b0}},p30,{30{1'b0}}};
  assign w32 = {{1{1'b0}},p31,{31{1'b0}}};

  
  
  bit64 A0 (w1,w2,s1,c_out[0],1'b0);
  
  bit64 A1 (w3,w4,s2,c_out[1],1'b0);

  bit64 A2 (w5,w6,s3,c_out[2],1'b0);

    
  bit64 A3 (w7,w8,s4,c_out[3],1'b0);

 
  bit64 A4 (w9,w10,s5,c_out[4],1'b0);
  
  
  bit64 A5 (w11,w12,s6,c_out[5],1'b0);

    
  bit64 A6 (w13,w14,s7,c_out[6],1'b0);
  
  bit64 A7 (w15,w16,s8,c_out[7],1'b0);

  
  bit64 A8 (w17,w18,s9,c_out[8],1'b0);

    
  bit64 A9 (w19,w20,s10,c_out[9],1'b0);

  
  bit64 A10 (w21,w22,s11,c_out[10],1'b0);

  
  bit64 A11 (w23,w24,s12,c_out[11],1'b0);

  bit64 A12 (w25,w26,s13,c_out[12],1'b0);

    
  bit64 A13 (w27,w28,s14,c_out[13],1'b0);

  bit64 A14 (w29,w30,s15,c_out[14],1'b0);

  bit64 A15 (w32,w31,s16,c_out[15],1'b0);

  
  bit64 A16 (s1,s2,s17,c_out[16],1'b0);

    
  bit64 A17 (s3,s4,s18,c_out[17],1'b0);
 
  
  bit64 A18 (s5,s6,s19,c_out[18],1'b0);

  
  bit64 A19 (s7,s8,s20,c_out[19],1'b0);

  
  bit64 A20 (s9,s10,s21,c_out[20],1'b0);
 
    
  bit64 A21 (s11,s12,s22,c_out[21],1'b0);
   
  
  bit64 A22 (s13,s14,s23,c_out[22],1'b0);

  
  bit64 A23 (s15,s16,s24,c_out[23],1'b0);

  
  bit64 A24 (s17,s18,s25,c_out[24],1'b0);

    
  bit64 A25 (s19,s20,s26,c_out[25],1'b0);

  bit64 A26 (s21,s22,s27,c_out[26],1'b0);

  
  bit64 A27 (s23,s24,s28,c_out[27],1'b0);

  
  bit64 A28 (s25,s26,s29,c_out[28],1'b0);

    
  bit64 A29 (s27,s28,s30,c_out[29],1'b0);
 
  
  bit64 A30 (s29,s30,s31,c_out[30],1'b0);
 
  

  
 

  
  
endmodule

/*
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
*/
module bit64(a64,b64,sum64,c_out64,c_in64);
  input [63:0] a64,b64;
  input c_in64;
  output [63:0] sum64;
  output c_out64;
  wire [63:0] sum64;

	 
		wire c1,c2,c3,c4,c5,c6,c7;
  bit8 A641(sum64[7:0],c1,a64[7:0],b64[7:0],c_in64);
  bit8 A642(sum64[15:8],c2,a64[15:8],b64[15:8],c1);
  bit8 A643(sum64[23:16],c3,a64[23:16],b64[23:16],c2);
  bit8 A644(sum64[31:24],c4,a64[31:24],b64[31:24],c3);
  bit8 A645(sum64[39:32],c5,a64[39:32],b64[39:32],c4);
  bit8 A646(sum64[47:40],c6,a64[47:40],b64[47:40],c5);
  bit8 A647(sum64[55:48],c7,a64[55:48],b64[55:48],c6);
  bit8 A648(sum64[63:56],c_out64,a64[63:56],b64[63:56],c7);

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


  
  
  
  
  
  
  

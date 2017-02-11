
module Add_half_0 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_127 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_0 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_0 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_127 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_126 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_125 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_63 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_126 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_125 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_124 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_123 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_62 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_124 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_123 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_122 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_121 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_61 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_122 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_121 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_0 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n4, n1, n2;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n4), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n4), .Z(c_out2) );
  Add_full_0 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0)
         );
  Add_full_63 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_62 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_61 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n4), .Z(n1) );
  CANR2X1 U4 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n4) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_120 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_119 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_60 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_120 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_119 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_118 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_117 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_59 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_118 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_117 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_116 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_115 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_58 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_116 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_115 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_114 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_113 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_57 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_114 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_113 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_15 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_60 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_59 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_58 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_57 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CAOR2XL U4 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CANR2X1 U5 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U6 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_112 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_111 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_56 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_112 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_111 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_110 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_109 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_55 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_110 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_109 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_108 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_107 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_54 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_108 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_107 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_106 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_105 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_53 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_106 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_105 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_14 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_56 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_55 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_54 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_53 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CANR2X1 U4 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_104 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_103 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_52 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_104 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_103 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_102 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_101 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_51 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_102 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_101 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_100 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_99 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_50 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_100 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_99 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_98 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_97 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_49 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_98 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_97 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_13 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_52 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_51 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_50 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_49 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CAOR2XL U4 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CANR2X1 U5 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U6 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_0 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n2), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n2), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n3), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n3), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n2), .Z(c_out4) );
  bit2_0 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_15 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_14 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_13 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CAOR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n3), .Z(n1) );
  CIVX2 U4 ( .A(n1), .Z(n2) );
  CIVX2 U5 ( .A(c_in4), .Z(n3) );
endmodule


module Add_half_96 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_95 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_48 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_96 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_95 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_94 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_93 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_47 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_94 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_93 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_92 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_91 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_46 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_92 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_91 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_90 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_89 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_45 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_90 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_89 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_12 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_48 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_47 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_46 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_45 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CANR2X1 U4 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_88 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_87 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_44 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_88 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_87 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_86 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_85 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_43 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_86 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_85 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_84 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_83 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_42 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_84 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_83 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_82 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_81 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_41 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_82 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_81 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_11 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_44 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_43 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_42 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_41 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CAOR2XL U4 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CANR2X1 U5 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U6 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_80 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_79 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_40 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_80 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_79 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_78 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_77 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_39 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_78 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_77 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_76 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_75 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_38 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_76 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_75 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_74 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_73 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_37 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_74 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_73 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_10 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_40 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_39 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_38 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_37 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CANR2X1 U4 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_72 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_71 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_36 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_72 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_71 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_70 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_69 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_35 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_70 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_69 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_68 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_67 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_34 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_68 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_67 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_66 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_65 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_33 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_66 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_65 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_9 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_36 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_35 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_34 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_33 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CAOR2XL U4 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CANR2X1 U5 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U6 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_3 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n2), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n2), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n3), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n3), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n1), .C(c_out410), .D(n2), .Z(c_out4) );
  bit2_12 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_11 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_10 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_9 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CAOR2X2 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n3), .Z(n1) );
  CANR2X1 U4 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n3), .Z(n2) );
  CIVX2 U5 ( .A(c_in4), .Z(n3) );
endmodule


module Add_half_64 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_63 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_32 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_64 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_63 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_62 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_61 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_31 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_62 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_61 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_60 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_59 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_30 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_60 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_59 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_58 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_57 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_29 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_58 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_57 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_8 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_32 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_31 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_30 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_29 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CANR2X1 U4 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_56 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_55 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_28 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_56 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_55 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_54 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_53 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_27 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_54 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_53 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_52 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_51 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_26 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_52 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_51 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_50 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_49 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_25 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_50 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_49 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_7 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_28 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_27 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_26 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_25 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CAOR2XL U4 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CANR2X1 U5 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U6 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_48 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_47 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_24 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_48 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_47 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_46 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_45 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_23 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_46 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_45 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_44 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_43 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_22 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_44 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_43 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_42 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_41 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_21 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_42 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_41 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_6 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_24 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_23 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_22 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_21 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_40 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_39 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_20 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_40 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_39 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_38 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_37 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_19 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_38 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_37 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_36 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_35 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_18 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_36 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_35 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_34 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_33 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_17 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_34 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_33 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_5 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_20 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_19 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_18 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_17 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_2 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  bit2_8 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_7 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_6 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_5 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CAOR2XL U4 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  CANR2X1 U5 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U10 ( .A(c_in4), .Z(n2) );
endmodule


module Add_half_32 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_31 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_16 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_32 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_31 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_30 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_29 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_15 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_30 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_29 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_28 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_27 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_14 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_28 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_27 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_26 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_25 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_13 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_26 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_25 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_4 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_16 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_15 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_14 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_13 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CANR2X1 U4 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_24 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_23 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_12 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_24 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_23 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_22 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_21 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_11 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_22 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_21 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_20 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_19 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_10 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_20 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_19 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_18 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_17 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_9 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_18 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_17 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_3 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_12 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_11 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_10 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_9 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1)
         );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CAOR2XL U4 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CANR2X1 U5 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U6 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_16 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_15 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_8 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_16 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_15 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_14 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_13 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_7 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_14 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_13 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_12 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_11 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_6 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_12 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_11 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_10 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_9 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_5 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_10 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_9 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_2 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  Add_full_8 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0)
         );
  Add_full_7 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1)
         );
  Add_full_6 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0)
         );
  Add_full_5 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1)
         );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U4 ( .A(n3), .Z(n1) );
  CIVX2 U5 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_8 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_7 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_4 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_8 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_7 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_6 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_5 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_3 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_6 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_5 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_4 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_3 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_2 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_4 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_3 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module Add_half_2 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_1 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
  Add_half_2 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
endmodule


module bit2_1 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  CAOR2X1 U6 ( .A(s4), .B(n1), .C(s3), .D(n3), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n2), .Z(sum2[0]) );
  Add_full_4 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0)
         );
  Add_full_3 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1)
         );
  Add_full_2 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0)
         );
  Add_full_1 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1)
         );
  CAOR2XL U3 ( .A(c_out11), .B(n1), .C(c_out10), .D(n3), .Z(c_out2) );
  CIVX1 U4 ( .A(n3), .Z(n1) );
  CANR2X1 U5 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n2), .Z(n3) );
  CIVX2 U8 ( .A(c_in2), .Z(n2) );
endmodule


module bit4_1 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  CAOR2X1 U6 ( .A(s44[1]), .B(n1), .C(s43[1]), .D(n3), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n1), .C(s43[0]), .D(n3), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n2), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n2), .Z(sum4[0]) );
  bit2_4 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_3 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_2 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_1 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX1 U3 ( .A(n3), .Z(n1) );
  CAOR2XL U4 ( .A(c_out411), .B(n1), .C(c_out410), .D(n3), .Z(c_out4) );
  CANR2X1 U5 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n2), .Z(n3) );
  CIVX2 U10 ( .A(c_in4), .Z(n2) );
endmodule


module bit8 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n4, n1, n2, n3;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  CAOR2X1 U6 ( .A(s84[3]), .B(n1), .C(s83[3]), .D(n2), .Z(sum8[7]) );
  CAOR2X1 U7 ( .A(s84[2]), .B(n1), .C(s83[2]), .D(n2), .Z(sum8[6]) );
  CAOR2X1 U9 ( .A(s84[0]), .B(n1), .C(s83[0]), .D(n2), .Z(sum8[4]) );
  CAOR2X1 U10 ( .A(s82[3]), .B(c_in8), .C(s81[3]), .D(n3), .Z(sum8[3]) );
  CAOR2X1 U11 ( .A(s82[2]), .B(c_in8), .C(s81[2]), .D(n3), .Z(sum8[2]) );
  CAOR2X1 U12 ( .A(s82[1]), .B(c_in8), .C(s81[1]), .D(n3), .Z(sum8[1]) );
  CAOR2X1 U13 ( .A(s82[0]), .B(c_in8), .C(s81[0]), .D(n3), .Z(sum8[0]) );
  CAOR2X1 U14 ( .A(c_out811), .B(n1), .C(c_out810), .D(n2), .Z(c_out8) );
  bit4_0 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_3 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_2 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_1 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CIVDX1 U3 ( .A(n4), .Z0(n1), .Z1(n2) );
  CANR2X1 U4 ( .A(c_out801), .B(c_in8), .C(c_out800), .D(n3), .Z(n4) );
  CAOR2X1 U5 ( .A(s84[1]), .B(n1), .C(s83[1]), .D(n2), .Z(sum8[5]) );
  CIVX2 U8 ( .A(c_in8), .Z(n3) );
endmodule


module seq_adder_DW01_dec_1 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n2, n6, n7, n8, n9, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n33, n34, n36, n38, n40, n41, n43, n44, n45,
         n47, n48, n50, n51, n53, n54, n57, n60, n61, n62, n63, n64, n67, n70,
         n71, n72, n74, n76, n78, n79, n80, n82, n83, n85, n87, n89, n90, n91,
         n92, n94, n96, n98, n100, n101, n104, n108, n109, n110, n113, n116,
         n117, n119, n122, n125, n126, n129, n133, n134, n135, n138, n141,
         n142, n145, n215;
  assign n2 = A[25];
  assign n6 = A[21];
  assign n7 = A[20];
  assign n8 = A[19];
  assign n9 = A[18];
  assign n16 = A[11];
  assign n17 = A[10];
  assign n18 = A[9];
  assign n19 = A[8];
  assign n20 = A[7];
  assign n21 = A[6];
  assign n22 = A[5];
  assign n23 = A[4];
  assign n24 = A[3];
  assign n25 = A[2];
  assign n26 = A[1];
  assign n34 = A[26];
  assign n41 = A[24];
  assign n48 = A[23];
  assign n51 = A[22];
  assign n72 = A[17];
  assign n76 = A[16];
  assign n83 = A[15];
  assign n87 = A[14];
  assign n92 = A[13];
  assign n96 = A[12];
  assign n145 = A[0];

  COR2X1 U3 ( .A(A[30]), .B(n28), .Z(n27) );
  COR2X1 U5 ( .A(A[29]), .B(n29), .Z(n28) );
  COR2X1 U7 ( .A(A[28]), .B(n30), .Z(n29) );
  COR2X1 U9 ( .A(A[27]), .B(n215), .Z(n30) );
  CAN4X1 U181 ( .A(n91), .B(n82), .C(n110), .D(n101), .Z(n80) );
  CAN4X1 U182 ( .A(n142), .B(n135), .C(n126), .D(n119), .Z(n117) );
  CAN4X1 U183 ( .A(n71), .B(n64), .C(n54), .D(n47), .Z(n45) );
  COR2X1 U184 ( .A(n116), .B(n100), .Z(n98) );
  COR2X1 U185 ( .A(n134), .B(n23), .Z(n129) );
  COR3X2 U186 ( .A(n116), .B(n100), .C(n96), .Z(n94) );
  COR2X1 U187 ( .A(n79), .B(n76), .Z(n74) );
  COR2X1 U188 ( .A(n44), .B(n38), .Z(n36) );
  COR3X2 U189 ( .A(n98), .B(n90), .C(n87), .Z(n85) );
  COR3X2 U190 ( .A(n116), .B(n109), .C(n17), .Z(n104) );
  CND4X1 U191 ( .A(n117), .B(n80), .C(n45), .D(n33), .Z(n215) );
  CNR2X1 U192 ( .A(n98), .B(n90), .Z(n89) );
  CNR2X1 U193 ( .A(n116), .B(n109), .Z(n108) );
  CND2X1 U194 ( .A(n60), .B(n54), .Z(n53) );
  CND2X1 U195 ( .A(n78), .B(n71), .Z(n70) );
  CND2X1 U196 ( .A(n133), .B(n126), .Z(n125) );
  CND2X1 U197 ( .A(n78), .B(n45), .Z(n44) );
  CND2X1 U198 ( .A(n78), .B(n62), .Z(n61) );
  CENX1 U199 ( .A(n116), .B(n19), .Z(SUM[8]) );
  CENX1 U200 ( .A(n125), .B(n21), .Z(SUM[6]) );
  CENX1 U201 ( .A(n129), .B(n22), .Z(SUM[5]) );
  CNR2X1 U202 ( .A(n23), .B(n22), .Z(n126) );
  CNR2X1 U203 ( .A(n7), .B(n6), .Z(n54) );
  CNR2X1 U204 ( .A(n76), .B(n72), .Z(n71) );
  CNR2X1 U205 ( .A(n51), .B(n48), .Z(n47) );
  CNR2X1 U206 ( .A(n145), .B(n26), .Z(n142) );
  CNR2X1 U207 ( .A(n19), .B(n18), .Z(n110) );
  CNR2X1 U208 ( .A(n96), .B(n92), .Z(n91) );
  CNR2X1 U209 ( .A(n21), .B(n20), .Z(n119) );
  CNR2X1 U210 ( .A(n38), .B(n34), .Z(n33) );
  CND2X1 U211 ( .A(n110), .B(n101), .Z(n100) );
  CNR2X1 U212 ( .A(n16), .B(n17), .Z(n101) );
  CND2X1 U213 ( .A(n142), .B(n135), .Z(n134) );
  CNR2X1 U214 ( .A(n24), .B(n25), .Z(n135) );
  CND2X1 U215 ( .A(n71), .B(n64), .Z(n63) );
  CNR2X1 U216 ( .A(n9), .B(n8), .Z(n64) );
  COR2X1 U217 ( .A(n41), .B(n2), .Z(n38) );
  CND2X1 U218 ( .A(n117), .B(n80), .Z(n79) );
  CNR2X1 U219 ( .A(n87), .B(n83), .Z(n82) );
  CEOX1 U220 ( .A(n24), .B(n138), .Z(SUM[3]) );
  CENX1 U221 ( .A(A[30]), .B(n28), .Z(SUM[30]) );
  CENX1 U222 ( .A(A[31]), .B(n27), .Z(SUM[31]) );
  CNR2X1 U223 ( .A(n44), .B(n41), .Z(n40) );
  CNR2X1 U224 ( .A(n53), .B(n51), .Z(n50) );
  CNR2X1 U225 ( .A(n61), .B(n7), .Z(n57) );
  CNR2X1 U226 ( .A(n70), .B(n9), .Z(n67) );
  CNR2X1 U227 ( .A(n116), .B(n19), .Z(n113) );
  CNR2X1 U228 ( .A(n125), .B(n21), .Z(n122) );
  CEOX1 U229 ( .A(n23), .B(n133), .Z(SUM[4]) );
  CENX1 U230 ( .A(n141), .B(n25), .Z(SUM[2]) );
  CENX1 U231 ( .A(n145), .B(n26), .Z(SUM[1]) );
  CEOX1 U232 ( .A(n48), .B(n50), .Z(SUM[23]) );
  CENX1 U233 ( .A(A[29]), .B(n29), .Z(SUM[29]) );
  CENX1 U234 ( .A(A[28]), .B(n30), .Z(SUM[28]) );
  CENX1 U235 ( .A(A[27]), .B(n215), .Z(SUM[27]) );
  CENX1 U236 ( .A(n36), .B(n34), .Z(SUM[26]) );
  CEOX1 U237 ( .A(n2), .B(n40), .Z(SUM[25]) );
  CEOX1 U238 ( .A(n41), .B(n43), .Z(SUM[24]) );
  CENX1 U239 ( .A(n53), .B(n51), .Z(SUM[22]) );
  CEOX1 U240 ( .A(n6), .B(n57), .Z(SUM[21]) );
  CEOX1 U241 ( .A(n7), .B(n60), .Z(SUM[20]) );
  CEOX1 U242 ( .A(n8), .B(n67), .Z(SUM[19]) );
  CENX1 U243 ( .A(n70), .B(n9), .Z(SUM[18]) );
  CENX1 U244 ( .A(n74), .B(n72), .Z(SUM[17]) );
  CEOX1 U245 ( .A(n76), .B(n78), .Z(SUM[16]) );
  CENX1 U246 ( .A(n85), .B(n83), .Z(SUM[15]) );
  CEOX1 U247 ( .A(n87), .B(n89), .Z(SUM[14]) );
  CENX1 U248 ( .A(n94), .B(n92), .Z(SUM[13]) );
  CENX1 U249 ( .A(n98), .B(n96), .Z(SUM[12]) );
  CENX1 U250 ( .A(n104), .B(n16), .Z(SUM[11]) );
  CEOX1 U251 ( .A(n17), .B(n108), .Z(SUM[10]) );
  CEOX1 U252 ( .A(n18), .B(n113), .Z(SUM[9]) );
  CEOX1 U253 ( .A(n20), .B(n122), .Z(SUM[7]) );
  CNR2X1 U254 ( .A(n141), .B(n25), .Z(n138) );
  CIVX2 U255 ( .A(n91), .Z(n90) );
  CIVX2 U256 ( .A(n79), .Z(n78) );
  CIVX2 U257 ( .A(n63), .Z(n62) );
  CIVX2 U258 ( .A(n61), .Z(n60) );
  CIVX2 U259 ( .A(n44), .Z(n43) );
  CIVX2 U260 ( .A(n142), .Z(n141) );
  CIVX2 U261 ( .A(n134), .Z(n133) );
  CIVX2 U262 ( .A(n117), .Z(n116) );
  CIVX2 U263 ( .A(n110), .Z(n109) );
  CIVX2 U264 ( .A(n145), .Z(SUM[0]) );
endmodule


module seq_adder ( clock, start, valid, mlier, mcand, prodt_end, reset );
  input [7:0] mlier;
  input [7:0] mcand;
  output [16:0] prodt_end;
  input clock, start, reset;
  output valid;
  wire   wcout, add, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54,
         N55, N56, N57, N58, N59, N60, N61, n40, n41, n45, n46, n47, n48, n49,
         n51, n52, n53, n54, n55, n56, n57, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n70, n71, n72, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n175, n176, n177,
         n178, n179, n180, n181, n182, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274;
  wire   [7:0] wsum;
  wire   [7:0] a;
  wire   [1:0] states;
  wire   [31:0] count;
  wire   [7:0] b;
  assign prodt_end[16] = 1'b0;

  CAOR1X1 U106 ( .A(prodt_end[0]), .B(n179), .C(n65), .Z(n120) );
  CAOR2X1 U107 ( .A(n252), .B(b[6]), .C(mlier[6]), .D(n253), .Z(n123) );
  CAOR2X1 U108 ( .A(n252), .B(b[5]), .C(mlier[5]), .D(n253), .Z(n124) );
  CAOR2X1 U109 ( .A(n252), .B(b[4]), .C(mlier[4]), .D(n253), .Z(n125) );
  CAOR2X1 U110 ( .A(n252), .B(b[3]), .C(mlier[3]), .D(n253), .Z(n126) );
  CAOR2X1 U111 ( .A(n252), .B(b[2]), .C(mlier[2]), .D(n253), .Z(n127) );
  CAOR2X1 U112 ( .A(n252), .B(b[1]), .C(mlier[1]), .D(n253), .Z(n128) );
  CAOR2X1 U113 ( .A(n252), .B(a[7]), .C(n253), .D(mcand[7]), .Z(n129) );
  CAOR2X1 U114 ( .A(n252), .B(a[6]), .C(n253), .D(mcand[6]), .Z(n130) );
  CNR8X1 U152 ( .A(n82), .B(n83), .C(n84), .D(n85), .E(n86), .F(n87), .G(n88), 
        .H(n89), .Z(n78) );
  CND8X1 U153 ( .A(n90), .B(n91), .C(n92), .D(n93), .E(n94), .F(n95), .G(n96), 
        .H(n97), .Z(n89) );
  CNR8X1 U154 ( .A(count[31]), .B(count[3]), .C(count[4]), .D(count[5]), .E(
        count[6]), .F(count[7]), .G(count[8]), .H(count[9]), .Z(n103) );
  CNR8X1 U155 ( .A(count[24]), .B(count[25]), .C(count[26]), .D(count[27]), 
        .E(count[28]), .F(count[29]), .G(count[2]), .H(count[30]), .Z(n102) );
  CNR8X1 U156 ( .A(count[17]), .B(count[18]), .C(count[19]), .D(count[1]), .E(
        count[20]), .F(count[21]), .G(count[22]), .H(count[23]), .Z(n101) );
  CNR8X1 U157 ( .A(n246), .B(count[10]), .C(count[11]), .D(count[12]), .E(
        count[13]), .F(count[14]), .G(count[15]), .H(count[16]), .Z(n100) );
  bit8 Ad8 ( .sum8(wsum), .c_out8(wcout), .a8(prodt_end[15:8]), .b8(a), 
        .c_in8(1'b0) );
  seq_adder_DW01_dec_1 sub_86 ( .A(count), .SUM({N61, N60, N59, N58, N57, N56, 
        N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, 
        N41, N40, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30}) );
  CFD1QXL \prodt_end_reg[0]  ( .D(n120), .CP(clock), .Q(prodt_end[0]) );
  CFD1QXL \prodt_end_reg[1]  ( .D(n119), .CP(clock), .Q(prodt_end[1]) );
  CFD1QXL add_reg ( .D(n121), .CP(clock), .Q(add) );
  CFD1QXL \prodt_end_reg[6]  ( .D(n114), .CP(clock), .Q(prodt_end[6]) );
  CFD1QXL \prodt_end_reg[5]  ( .D(n115), .CP(clock), .Q(prodt_end[5]) );
  CFD1QXL \prodt_end_reg[4]  ( .D(n116), .CP(clock), .Q(prodt_end[4]) );
  CFD1QXL \prodt_end_reg[3]  ( .D(n117), .CP(clock), .Q(prodt_end[3]) );
  CFD1QXL \prodt_end_reg[2]  ( .D(n118), .CP(clock), .Q(prodt_end[2]) );
  CFD1QXL \prodt_end_reg[7]  ( .D(n113), .CP(clock), .Q(prodt_end[7]) );
  CFD1QXL \b_reg[1]  ( .D(n128), .CP(clock), .Q(b[1]) );
  CFD1QXL \b_reg[2]  ( .D(n127), .CP(clock), .Q(b[2]) );
  CFD1QXL \b_reg[3]  ( .D(n126), .CP(clock), .Q(b[3]) );
  CFD1QXL \b_reg[4]  ( .D(n125), .CP(clock), .Q(b[4]) );
  CFD1QXL \b_reg[5]  ( .D(n124), .CP(clock), .Q(b[5]) );
  CFD1QXL \b_reg[6]  ( .D(n123), .CP(clock), .Q(b[6]) );
  CFD1QXL \count_reg[31]  ( .D(n137), .CP(clock), .Q(count[31]) );
  CFD1QXL \count_reg[30]  ( .D(n138), .CP(clock), .Q(count[30]) );
  CFD1QXL \count_reg[29]  ( .D(n139), .CP(clock), .Q(count[29]) );
  CFD1QXL \count_reg[27]  ( .D(n141), .CP(clock), .Q(count[27]) );
  CFD1QXL \count_reg[28]  ( .D(n140), .CP(clock), .Q(count[28]) );
  CFD1XL \b_reg[0]  ( .D(n171), .CP(clock), .QN(n41) );
  CFD1XL \b_reg[7]  ( .D(n122), .CP(clock), .QN(n40) );
  CFD1QXL \count_reg[26]  ( .D(n142), .CP(clock), .Q(count[26]) );
  CFD1QXL valid_reg ( .D(n170), .CP(clock), .Q(valid) );
  CFD1XL \count_reg[3]  ( .D(n165), .CP(clock), .Q(count[3]) );
  CFD1QXL \count_reg[11]  ( .D(n157), .CP(clock), .Q(count[11]) );
  CFD1QXL \count_reg[25]  ( .D(n143), .CP(clock), .Q(count[25]) );
  CFD1QXL \count_reg[17]  ( .D(n151), .CP(clock), .Q(count[17]) );
  CFD1QXL \count_reg[15]  ( .D(n153), .CP(clock), .Q(count[15]) );
  CFD1QXL \count_reg[13]  ( .D(n155), .CP(clock), .Q(count[13]) );
  CFD1QXL \count_reg[9]  ( .D(n159), .CP(clock), .Q(count[9]) );
  CFD1QXL \count_reg[23]  ( .D(n145), .CP(clock), .Q(count[23]) );
  CFD1QXL \count_reg[19]  ( .D(n149), .CP(clock), .Q(count[19]) );
  CFD1QXL \count_reg[7]  ( .D(n161), .CP(clock), .Q(count[7]) );
  CFD1QXL \count_reg[21]  ( .D(n147), .CP(clock), .Q(count[21]) );
  CFD1QXL \count_reg[1]  ( .D(n167), .CP(clock), .Q(count[1]) );
  CFD1QXL \count_reg[5]  ( .D(n163), .CP(clock), .Q(count[5]) );
  CFD1QXL \count_reg[12]  ( .D(n156), .CP(clock), .Q(count[12]) );
  CFD1QXL \count_reg[16]  ( .D(n152), .CP(clock), .Q(count[16]) );
  CFD1QXL \count_reg[14]  ( .D(n154), .CP(clock), .Q(count[14]) );
  CFD1QXL \count_reg[18]  ( .D(n150), .CP(clock), .Q(count[18]) );
  CFD1QXL \count_reg[22]  ( .D(n146), .CP(clock), .Q(count[22]) );
  CFD1QXL \count_reg[24]  ( .D(n144), .CP(clock), .Q(count[24]) );
  CFD1QXL \count_reg[10]  ( .D(n158), .CP(clock), .Q(count[10]) );
  CFD1QXL \count_reg[20]  ( .D(n148), .CP(clock), .Q(count[20]) );
  CFD1QXL \count_reg[4]  ( .D(n164), .CP(clock), .Q(count[4]) );
  CFD1QXL \count_reg[8]  ( .D(n160), .CP(clock), .Q(count[8]) );
  CFD1QXL \count_reg[6]  ( .D(n162), .CP(clock), .Q(count[6]) );
  CFD1QXL \count_reg[2]  ( .D(n166), .CP(clock), .Q(count[2]) );
  CFD1QXL \states_reg[0]  ( .D(n168), .CP(clock), .Q(states[0]) );
  CFD1QXL \states_reg[1]  ( .D(n255), .CP(clock), .Q(states[1]) );
  CFD1QXL \prodt_end_reg[14]  ( .D(n106), .CP(clock), .Q(prodt_end[14]) );
  CFD1QXL \prodt_end_reg[11]  ( .D(n109), .CP(clock), .Q(prodt_end[11]) );
  CFD1QXL \prodt_end_reg[15]  ( .D(n105), .CP(clock), .Q(prodt_end[15]) );
  CFD1QXL \a_reg[6]  ( .D(n130), .CP(clock), .Q(a[6]) );
  CFD1QXL \a_reg[7]  ( .D(n129), .CP(clock), .Q(a[7]) );
  CFD1QXL \a_reg[5]  ( .D(n131), .CP(clock), .Q(a[5]) );
  CFD1QXL \a_reg[1]  ( .D(n135), .CP(clock), .Q(a[1]) );
  CFD1QXL \a_reg[2]  ( .D(n134), .CP(clock), .Q(a[2]) );
  CFD1QXL \a_reg[3]  ( .D(n133), .CP(clock), .Q(a[3]) );
  CFD1QXL \a_reg[4]  ( .D(n132), .CP(clock), .Q(a[4]) );
  CFD1QXL \prodt_end_reg[13]  ( .D(n107), .CP(clock), .Q(prodt_end[13]) );
  CFD1QXL \prodt_end_reg[12]  ( .D(n108), .CP(clock), .Q(prodt_end[12]) );
  CFD1X1 \prodt_end_reg[8]  ( .D(n112), .CP(clock), .Q(prodt_end[8]), .QN(n175) );
  CFD1XL \count_reg[0]  ( .D(n169), .CP(clock), .Q(count[0]), .QN(n246) );
  CFD1X1 \a_reg[0]  ( .D(n136), .CP(clock), .Q(a[0]) );
  CFD1QXL \prodt_end_reg[10]  ( .D(n110), .CP(clock), .Q(prodt_end[10]) );
  CFD1QXL \prodt_end_reg[9]  ( .D(n111), .CP(clock), .Q(prodt_end[9]) );
  CND3XL U160 ( .A(n176), .B(n177), .C(n178), .Z(n108) );
  CND2X1 U161 ( .A(count[3]), .B(n179), .Z(n249) );
  CAN2X1 U162 ( .A(n251), .B(n180), .Z(n172) );
  COR2X1 U163 ( .A(n186), .B(n263), .Z(n176) );
  CND2X1 U164 ( .A(prodt_end[13]), .B(n46), .Z(n177) );
  CND2X1 U165 ( .A(wsum[5]), .B(n47), .Z(n178) );
  CANR2XL U166 ( .A(prodt_end[10]), .B(n46), .C(wsum[2]), .D(n47), .Z(n53) );
  CEOXL U167 ( .A(mcand[5]), .B(a[5]), .Z(n86) );
  CEOXL U168 ( .A(mcand[2]), .B(a[2]), .Z(n85) );
  CEOXL U169 ( .A(mcand[4]), .B(a[4]), .Z(n87) );
  CEOXL U170 ( .A(mcand[3]), .B(a[3]), .Z(n84) );
  CEOXL U171 ( .A(mcand[0]), .B(a[0]), .Z(n83) );
  CEOXL U172 ( .A(mcand[1]), .B(a[1]), .Z(n82) );
  CAOR2XL U173 ( .A(n252), .B(a[5]), .C(n253), .D(mcand[5]), .Z(n131) );
  CAOR2XL U174 ( .A(n252), .B(a[4]), .C(n253), .D(mcand[4]), .Z(n132) );
  CAOR2XL U175 ( .A(n252), .B(a[3]), .C(n253), .D(mcand[3]), .Z(n133) );
  CAOR2XL U176 ( .A(n252), .B(a[2]), .C(n253), .D(mcand[2]), .Z(n134) );
  CAOR2XL U177 ( .A(n252), .B(a[1]), .C(n253), .D(mcand[1]), .Z(n135) );
  CAOR2XL U178 ( .A(n252), .B(a[0]), .C(n253), .D(mcand[0]), .Z(n136) );
  CANR2XL U179 ( .A(prodt_end[8]), .B(n46), .C(wsum[0]), .D(n47), .Z(n57) );
  CIVX2 U180 ( .A(n172), .Z(n185) );
  CIVX2 U181 ( .A(n71), .Z(n252) );
  CIVX2 U182 ( .A(n179), .Z(n186) );
  CIVX2 U183 ( .A(n72), .Z(n253) );
  CAN2X1 U184 ( .A(n76), .B(n252), .Z(n179) );
  CND3XL U185 ( .A(n180), .B(n68), .C(n186), .Z(n55) );
  CND2IX1 U186 ( .B(n104), .A(n180), .Z(n71) );
  COND3X1 U187 ( .A(n185), .B(n70), .C(n74), .D(n75), .Z(n168) );
  CND4X1 U188 ( .A(n180), .B(n76), .C(n77), .D(n260), .Z(n75) );
  CND2X1 U189 ( .A(n78), .B(n180), .Z(n74) );
  CNR2X1 U190 ( .A(n273), .B(n185), .Z(n47) );
  COND11X1 U191 ( .A(n78), .B(n68), .C(n251), .D(n180), .Z(n79) );
  CND2X1 U192 ( .A(n104), .B(n180), .Z(n72) );
  CNR2X1 U193 ( .A(states[0]), .B(states[1]), .Z(n68) );
  CNR2X1 U194 ( .A(n260), .B(valid), .Z(n104) );
  COND1XL U195 ( .A(n186), .B(n272), .C(n64), .Z(n119) );
  CANR2X1 U196 ( .A(mlier[1]), .B(n256), .C(prodt_end[2]), .D(n172), .Z(n64)
         );
  COND1XL U197 ( .A(n186), .B(n271), .C(n63), .Z(n118) );
  CANR2X1 U198 ( .A(mlier[2]), .B(n256), .C(prodt_end[3]), .D(n172), .Z(n63)
         );
  COND1XL U199 ( .A(n186), .B(n270), .C(n62), .Z(n117) );
  CANR2X1 U200 ( .A(mlier[3]), .B(n256), .C(prodt_end[4]), .D(n172), .Z(n62)
         );
  COND1XL U201 ( .A(n186), .B(n269), .C(n61), .Z(n116) );
  CANR2X1 U202 ( .A(mlier[4]), .B(n256), .C(prodt_end[5]), .D(n172), .Z(n61)
         );
  COND1XL U203 ( .A(n186), .B(n268), .C(n60), .Z(n115) );
  CANR2X1 U204 ( .A(mlier[5]), .B(n256), .C(prodt_end[6]), .D(n172), .Z(n60)
         );
  COND1XL U205 ( .A(n186), .B(n267), .C(n59), .Z(n114) );
  CANR2X1 U206 ( .A(mlier[6]), .B(n256), .C(prodt_end[7]), .D(n172), .Z(n59)
         );
  COND1XL U207 ( .A(n186), .B(n266), .C(n53), .Z(n111) );
  COND1XL U208 ( .A(n186), .B(n265), .C(n52), .Z(n110) );
  CANR2X1 U209 ( .A(prodt_end[11]), .B(n46), .C(wsum[3]), .D(n47), .Z(n52) );
  COND1XL U210 ( .A(n186), .B(n264), .C(n51), .Z(n109) );
  CANR2X1 U211 ( .A(prodt_end[12]), .B(n46), .C(wsum[4]), .D(n47), .Z(n51) );
  COND1XL U212 ( .A(n186), .B(n262), .C(n49), .Z(n107) );
  CANR2X1 U213 ( .A(prodt_end[14]), .B(n46), .C(wsum[6]), .D(n47), .Z(n49) );
  COND1XL U214 ( .A(n186), .B(n261), .C(n48), .Z(n106) );
  CANR2X1 U215 ( .A(prodt_end[15]), .B(n46), .C(wsum[7]), .D(n47), .Z(n48) );
  COND1XL U216 ( .A(n186), .B(n274), .C(n45), .Z(n105) );
  CND2X1 U217 ( .A(wcout), .B(n47), .Z(n45) );
  COND2X1 U218 ( .A(n185), .B(n272), .C(n55), .D(n258), .Z(n65) );
  COND2X1 U219 ( .A(n186), .B(n232), .C(n185), .D(n231), .Z(n160) );
  COND2X1 U220 ( .A(n186), .B(n236), .C(n185), .D(n235), .Z(n162) );
  COND2X1 U221 ( .A(n186), .B(n238), .C(n185), .D(n237), .Z(n163) );
  CNR2IX1 U222 ( .B(start), .A(reset), .Z(n180) );
  COND3X1 U223 ( .A(n55), .B(n257), .C(n56), .D(n57), .Z(n113) );
  CND2X1 U224 ( .A(prodt_end[7]), .B(n179), .Z(n56) );
  COND1XL U225 ( .A(n186), .B(n175), .C(n54), .Z(n112) );
  CANR2X1 U226 ( .A(prodt_end[9]), .B(n46), .C(wsum[1]), .D(n47), .Z(n54) );
  CND3XL U227 ( .A(n55), .B(n250), .C(n249), .Z(n165) );
  CNR2IX1 U228 ( .B(count[30]), .A(n186), .Z(n188) );
  CNR2IX1 U229 ( .B(count[31]), .A(n186), .Z(n248) );
  CNR2X1 U230 ( .A(n185), .B(add), .Z(n46) );
  CND4X1 U231 ( .A(n100), .B(n101), .C(n102), .D(n103), .Z(n70) );
  COND2X1 U232 ( .A(n273), .B(n254), .C(n66), .D(n67), .Z(n121) );
  CANR2X1 U233 ( .A(prodt_end[1]), .B(n251), .C(mlier[0]), .D(n68), .Z(n67) );
  CANR2X1 U234 ( .A(n180), .B(n68), .C(n70), .D(n172), .Z(n66) );
  CND2X1 U235 ( .A(states[0]), .B(states[1]), .Z(n77) );
  CENX1 U236 ( .A(mlier[3]), .B(b[3]), .Z(n93) );
  CENX1 U237 ( .A(mlier[2]), .B(b[2]), .Z(n92) );
  CENX1 U238 ( .A(mlier[6]), .B(b[6]), .Z(n96) );
  CENX1 U239 ( .A(mlier[5]), .B(b[5]), .Z(n95) );
  CENX1 U240 ( .A(mlier[1]), .B(b[1]), .Z(n91) );
  CENX1 U241 ( .A(mlier[4]), .B(b[4]), .Z(n94) );
  CEOX1 U242 ( .A(mlier[7]), .B(n40), .Z(n97) );
  CEOX1 U243 ( .A(mlier[0]), .B(n41), .Z(n90) );
  COND1XL U244 ( .A(n186), .B(n246), .C(n245), .Z(n169) );
  CND2X1 U245 ( .A(N30), .B(n172), .Z(n245) );
  COND1XL U246 ( .A(n186), .B(n240), .C(n239), .Z(n164) );
  COND1XL U247 ( .A(n186), .B(n242), .C(n241), .Z(n166) );
  COND1XL U248 ( .A(n186), .B(n244), .C(n243), .Z(n167) );
  CND2X1 U249 ( .A(N31), .B(n172), .Z(n243) );
  COND1XL U250 ( .A(n80), .B(n259), .C(n81), .Z(n170) );
  COND3X1 U251 ( .A(n78), .B(n251), .C(n80), .D(n180), .Z(n81) );
  COND3X1 U252 ( .A(n76), .B(n70), .C(n77), .D(n180), .Z(n80) );
  COR3X1 U253 ( .A(n181), .B(n77), .C(n182), .Z(n88) );
  CEOX1 U254 ( .A(mcand[6]), .B(a[6]), .Z(n181) );
  CEOX1 U255 ( .A(mcand[7]), .B(a[7]), .Z(n182) );
  CNR2IX1 U256 ( .B(count[23]), .A(n186), .Z(n202) );
  CNR2IX1 U257 ( .B(count[29]), .A(n186), .Z(n190) );
  CNR2IX1 U258 ( .B(count[28]), .A(n186), .Z(n192) );
  CNR2IX1 U259 ( .B(count[27]), .A(n186), .Z(n194) );
  CNR2IX1 U260 ( .B(count[26]), .A(n186), .Z(n196) );
  CNR2IX1 U261 ( .B(count[25]), .A(n186), .Z(n198) );
  CNR2IX1 U262 ( .B(count[24]), .A(n186), .Z(n200) );
  CNR2IX1 U263 ( .B(count[22]), .A(n186), .Z(n204) );
  CNR2IX1 U264 ( .B(count[21]), .A(n186), .Z(n206) );
  CNR2IX1 U265 ( .B(count[20]), .A(n186), .Z(n208) );
  CNR2IX1 U266 ( .B(count[19]), .A(n186), .Z(n210) );
  CNR2IX1 U267 ( .B(count[18]), .A(n186), .Z(n212) );
  CNR2IX1 U268 ( .B(count[17]), .A(n186), .Z(n214) );
  CNR2IX1 U269 ( .B(count[16]), .A(n186), .Z(n216) );
  CNR2IX1 U270 ( .B(count[15]), .A(n186), .Z(n218) );
  CNR2IX1 U271 ( .B(count[14]), .A(n186), .Z(n220) );
  CNR2IX1 U272 ( .B(count[13]), .A(n186), .Z(n222) );
  CNR2IX1 U273 ( .B(count[12]), .A(n186), .Z(n224) );
  CNR2IX1 U274 ( .B(count[11]), .A(n186), .Z(n226) );
  CNR2IX1 U275 ( .B(count[10]), .A(n186), .Z(n228) );
  CNR2IX1 U276 ( .B(count[9]), .A(n186), .Z(n230) );
  CNR2IX1 U277 ( .B(count[7]), .A(n186), .Z(n234) );
  COND2X1 U278 ( .A(n71), .B(n40), .C(n257), .D(n72), .Z(n122) );
  COND2X1 U279 ( .A(n71), .B(n41), .C(n258), .D(n72), .Z(n171) );
  CND2IX1 U280 ( .B(states[0]), .A(states[1]), .Z(n76) );
  CIVX2 U281 ( .A(n76), .Z(n251) );
  CND2IX1 U282 ( .B(n185), .A(N60), .Z(n187) );
  CND2IX1 U283 ( .B(n188), .A(n187), .Z(n138) );
  CND2IX1 U284 ( .B(n185), .A(N59), .Z(n189) );
  CND2IX1 U285 ( .B(n190), .A(n189), .Z(n139) );
  CND2IX1 U286 ( .B(n185), .A(N58), .Z(n191) );
  CND2IX1 U287 ( .B(n192), .A(n191), .Z(n140) );
  CND2IX1 U288 ( .B(n185), .A(N57), .Z(n193) );
  CND2IX1 U289 ( .B(n194), .A(n193), .Z(n141) );
  CND2IX1 U290 ( .B(n185), .A(N56), .Z(n195) );
  CND2IX1 U291 ( .B(n196), .A(n195), .Z(n142) );
  CND2IX1 U292 ( .B(n185), .A(N55), .Z(n197) );
  CND2IX1 U293 ( .B(n198), .A(n197), .Z(n143) );
  CND2IX1 U294 ( .B(n185), .A(N54), .Z(n199) );
  CND2IX1 U295 ( .B(n200), .A(n199), .Z(n144) );
  CND2IX1 U296 ( .B(n185), .A(N53), .Z(n201) );
  CND2IX1 U297 ( .B(n202), .A(n201), .Z(n145) );
  CND2IX1 U298 ( .B(n185), .A(N52), .Z(n203) );
  CND2IX1 U299 ( .B(n204), .A(n203), .Z(n146) );
  CND2IX1 U300 ( .B(n185), .A(N51), .Z(n205) );
  CND2IX1 U301 ( .B(n206), .A(n205), .Z(n147) );
  CND2IX1 U302 ( .B(n185), .A(N50), .Z(n207) );
  CND2IX1 U303 ( .B(n208), .A(n207), .Z(n148) );
  CND2IX1 U304 ( .B(n185), .A(N49), .Z(n209) );
  CND2IX1 U305 ( .B(n210), .A(n209), .Z(n149) );
  CND2IX1 U306 ( .B(n185), .A(N48), .Z(n211) );
  CND2IX1 U307 ( .B(n212), .A(n211), .Z(n150) );
  CND2IX1 U308 ( .B(n185), .A(N47), .Z(n213) );
  CND2IX1 U309 ( .B(n214), .A(n213), .Z(n151) );
  CND2IX1 U310 ( .B(n185), .A(N46), .Z(n215) );
  CND2IX1 U311 ( .B(n216), .A(n215), .Z(n152) );
  CND2IX1 U312 ( .B(n185), .A(N45), .Z(n217) );
  CND2IX1 U313 ( .B(n218), .A(n217), .Z(n153) );
  CND2IX1 U314 ( .B(n185), .A(N44), .Z(n219) );
  CND2IX1 U315 ( .B(n220), .A(n219), .Z(n154) );
  CND2IX1 U316 ( .B(n185), .A(N43), .Z(n221) );
  CND2IX1 U317 ( .B(n222), .A(n221), .Z(n155) );
  CND2IX1 U318 ( .B(n185), .A(N42), .Z(n223) );
  CND2IX1 U319 ( .B(n224), .A(n223), .Z(n156) );
  CND2IX1 U320 ( .B(n185), .A(N41), .Z(n225) );
  CND2IX1 U321 ( .B(n226), .A(n225), .Z(n157) );
  CND2IX1 U322 ( .B(n185), .A(N40), .Z(n227) );
  CND2IX1 U323 ( .B(n228), .A(n227), .Z(n158) );
  CND2IX1 U324 ( .B(n185), .A(N39), .Z(n229) );
  CND2IX1 U325 ( .B(n230), .A(n229), .Z(n159) );
  CIVX2 U326 ( .A(count[8]), .Z(n232) );
  CIVX2 U327 ( .A(N38), .Z(n231) );
  CND2IX1 U328 ( .B(n185), .A(N37), .Z(n233) );
  CND2IX1 U329 ( .B(n234), .A(n233), .Z(n161) );
  CIVX2 U330 ( .A(count[6]), .Z(n236) );
  CIVX2 U331 ( .A(N36), .Z(n235) );
  CIVX2 U332 ( .A(count[5]), .Z(n238) );
  CIVX2 U333 ( .A(N35), .Z(n237) );
  CIVX2 U334 ( .A(count[4]), .Z(n240) );
  CND2IX1 U335 ( .B(n185), .A(N34), .Z(n239) );
  CIVX2 U336 ( .A(count[2]), .Z(n242) );
  CND2IX1 U337 ( .B(n185), .A(N32), .Z(n241) );
  CIVX2 U338 ( .A(count[1]), .Z(n244) );
  CND2IX1 U339 ( .B(n185), .A(N61), .Z(n247) );
  CND2IX1 U340 ( .B(n248), .A(n247), .Z(n137) );
  CND2IX1 U341 ( .B(n185), .A(N33), .Z(n250) );
  CIVX2 U342 ( .A(n66), .Z(n254) );
  CIVX2 U343 ( .A(n79), .Z(n255) );
  CIVX2 U344 ( .A(n55), .Z(n256) );
  CIVX2 U345 ( .A(mlier[7]), .Z(n257) );
  CIVX2 U346 ( .A(mlier[0]), .Z(n258) );
  CIVX2 U347 ( .A(valid), .Z(n259) );
  CIVX2 U348 ( .A(n68), .Z(n260) );
  CIVX2 U349 ( .A(prodt_end[14]), .Z(n261) );
  CIVX2 U350 ( .A(prodt_end[13]), .Z(n262) );
  CIVX2 U351 ( .A(prodt_end[12]), .Z(n263) );
  CIVX2 U352 ( .A(prodt_end[11]), .Z(n264) );
  CIVX2 U353 ( .A(prodt_end[10]), .Z(n265) );
  CIVX2 U354 ( .A(prodt_end[9]), .Z(n266) );
  CIVX2 U355 ( .A(prodt_end[6]), .Z(n267) );
  CIVX2 U356 ( .A(prodt_end[5]), .Z(n268) );
  CIVX2 U357 ( .A(prodt_end[4]), .Z(n269) );
  CIVX2 U358 ( .A(prodt_end[3]), .Z(n270) );
  CIVX2 U359 ( .A(prodt_end[2]), .Z(n271) );
  CIVX2 U360 ( .A(prodt_end[1]), .Z(n272) );
  CIVX2 U361 ( .A(add), .Z(n273) );
  CIVX2 U362 ( .A(prodt_end[15]), .Z(n274) );
endmodule


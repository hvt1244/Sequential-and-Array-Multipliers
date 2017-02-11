
module Add_half_0 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1791 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENXL U2 ( .A(n1), .B(a), .Z(sum) );
  CND2X1 U3 ( .A(b), .B(a), .Z(n2) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_full_0 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_0 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1791 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_1785 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1786 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_893 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1786 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1785 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w2), .Z(n1) );
  CND2IX1 U2 ( .B(w3), .A(n1), .Z(c_out) );
endmodule


module Add_half_1787 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1788 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_894 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1788 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1787 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1789 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2IX2 U1 ( .B(n1), .A(a), .Z(n2) );
  CIVX2 U2 ( .A(b), .Z(n1) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_1790 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENX2 U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_full_895 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1790 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1789 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_0 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_0 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0)
         );
  Add_full_895 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_894 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_893 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2X2 U3 ( .A(n6), .B(n1), .Z(n4) );
  CND2X2 U4 ( .A(n4), .B(c_out11), .Z(n3) );
  CMX2XL U5 ( .A0(s2), .A1(s1), .S(n5), .Z(sum2[0]) );
  CND3X1 U6 ( .A(n6), .B(n1), .C(c_out10), .Z(n2) );
  CND2X2 U7 ( .A(c_out01), .B(c_in2), .Z(n1) );
  CND2X1 U8 ( .A(n1), .B(n6), .Z(n7) );
  CND2X2 U9 ( .A(n2), .B(n3), .Z(c_out2) );
  CMXI2X1 U10 ( .A0(n8), .A1(n9), .S(n7), .Z(sum2[1]) );
  CIVXL U11 ( .A(s4), .Z(n9) );
  CIVX1 U12 ( .A(s3), .Z(n8) );
  CIVX2 U13 ( .A(c_in2), .Z(n5) );
  CND2X2 U14 ( .A(c_out00), .B(n5), .Z(n6) );
endmodule


module Add_half_1761 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1762 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_881 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1762 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1761 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1763 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1764 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_882 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1764 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1763 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1765 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CIVXL U1 ( .A(a), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(n2) );
  CEOXL U3 ( .A(b), .B(n2), .Z(sum) );
  CND2X2 U4 ( .A(a), .B(b), .Z(n3) );
  CIVX2 U5 ( .A(n3), .Z(c_out) );
endmodule


module Add_half_1766 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_883 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1766 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1765 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1767 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CIVXL U1 ( .A(a), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(n2) );
  CEOXL U3 ( .A(b), .B(n2), .Z(sum) );
  CND2X2 U4 ( .A(a), .B(b), .Z(n3) );
  CIVX2 U5 ( .A(n3), .Z(c_out) );
endmodule


module Add_half_1768 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_884 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1768 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1767 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_221 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_884 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_883 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_882 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_881 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n1) );
  CMXI2X1 U4 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n3) );
  CMXI2X1 U5 ( .A0(n4), .A1(n5), .S(n3), .Z(c_out2) );
  CMX2XL U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CMX2XL U7 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(c_out10), .Z(n5) );
  CIVX2 U10 ( .A(c_out11), .Z(n4) );
endmodule


module Add_half_1769 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1770 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_885 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1770 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1769 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1771 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1772 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_886 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1772 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1771 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1773 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1774 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_887 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1774 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1773 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_1775 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CND2X1 U1 ( .A(a), .B(b), .Z(n3) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CIVX1 U3 ( .A(n1), .Z(n2) );
  CEOXL U4 ( .A(n2), .B(b), .Z(sum) );
  CIVX2 U5 ( .A(n3), .Z(c_out) );
endmodule


module Add_half_1776 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_888 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1776 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1775 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_222 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_888 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_887 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_886 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_885 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMX2X1 U4 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CND2X2 U5 ( .A(n3), .B(n4), .Z(c_out2) );
  CND2X1 U6 ( .A(n2), .B(c_out11), .Z(n3) );
  CND2IX2 U7 ( .B(n5), .A(n1), .Z(n4) );
  CMX2XL U8 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U9 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U10 ( .A(c_out10), .Z(n5) );
endmodule


module Add_half_1777 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENX1 U1 ( .A(a), .B(n2), .Z(sum) );
  CIVX1 U2 ( .A(n1), .Z(c_out) );
  CND2X1 U3 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1778 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_889 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1778 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1777 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1779 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1780 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_890 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1780 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1779 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1781 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENXL U2 ( .A(n1), .B(a), .Z(sum) );
  CND2IX2 U3 ( .B(n1), .A(a), .Z(n2) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_1782 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENX2 U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_full_891 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1782 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1781 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1783 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1784 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENX2 U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_full_892 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1784 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1783 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_223 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10;

  Add_full_892 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_891 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_890 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_889 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2X2 U3 ( .A(n5), .B(c_out10), .Z(n2) );
  CND2X1 U4 ( .A(n6), .B(n7), .Z(n8) );
  CND2X2 U5 ( .A(n4), .B(c_out11), .Z(n1) );
  CND2X2 U6 ( .A(n1), .B(n2), .Z(c_out2) );
  CIVX1 U7 ( .A(s3), .Z(n9) );
  CMXI2X1 U8 ( .A0(n9), .A1(n10), .S(n8), .Z(sum2[1]) );
  CMX2X1 U9 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U10 ( .A(c_in2), .Z(n3) );
  CND2X2 U11 ( .A(c_out00), .B(n3), .Z(n7) );
  CND2X2 U12 ( .A(c_out01), .B(c_in2), .Z(n6) );
  CND2X2 U13 ( .A(n7), .B(n6), .Z(n4) );
  CIVX2 U14 ( .A(n4), .Z(n5) );
  CIVX2 U15 ( .A(s4), .Z(n10) );
endmodule


module bit4_0 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_0 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_223 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_222 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_221 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX1 U3 ( .A(s42[0]), .Z(n11) );
  CIVX1 U4 ( .A(s41[0]), .Z(n12) );
  CIVX3 U5 ( .A(n7), .Z(c_out4) );
  CIVX1 U6 ( .A(s43[1]), .Z(n17) );
  CND2X1 U7 ( .A(s41[1]), .B(n1), .Z(n2) );
  CND2X1 U8 ( .A(s42[1]), .B(c_in4), .Z(n3) );
  CND2X1 U9 ( .A(n2), .B(n3), .Z(sum4[1]) );
  CIVX2 U10 ( .A(c_in4), .Z(n1) );
  CIVX2 U11 ( .A(c_out410), .Z(n10) );
  CMXI2X1 U12 ( .A0(n11), .A1(n12), .S(n1), .Z(sum4[0]) );
  CMXI2X1 U13 ( .A0(n18), .A1(n17), .S(n8), .Z(sum4[3]) );
  CAN2X2 U14 ( .A(n13), .B(n14), .Z(n8) );
  CND2IX1 U15 ( .B(c_out411), .A(n9), .Z(n6) );
  CND2IX2 U16 ( .B(n1), .A(c_out401), .Z(n13) );
  CIVXL U17 ( .A(s44[1]), .Z(n18) );
  CND2IX2 U18 ( .B(c_in4), .A(c_out400), .Z(n14) );
  CND2X2 U19 ( .A(n13), .B(n14), .Z(n9) );
  CND2X2 U20 ( .A(n10), .B(n4), .Z(n5) );
  CND2X2 U21 ( .A(n5), .B(n6), .Z(n7) );
  CIVX2 U22 ( .A(n9), .Z(n4) );
  CIVX2 U23 ( .A(s44[0]), .Z(n16) );
  CIVX2 U24 ( .A(s43[0]), .Z(n15) );
  CMXI2X1 U25 ( .A0(n16), .A1(n15), .S(n8), .Z(sum4[2]) );
endmodule


module Add_half_1665 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1666 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_833 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1666 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1665 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1667 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1668 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_834 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1668 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1667 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1669 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1670 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_835 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1670 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1669 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1671 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1672 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_836 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1672 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1671 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_209 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_836 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_835 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_834 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_833 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out10), .Z(n3) );
  CMXI2XL U4 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U10 ( .A(s3), .Z(n6) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module Add_half_1673 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1674 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_837 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1674 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1673 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1675 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1676 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_838 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1676 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1675 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1677 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1678 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CND2X1 U2 ( .A(a), .B(n2), .Z(n3) );
  CND2XL U3 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVX2 U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_839 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1678 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1677 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1679 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1680 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_840 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1680 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1679 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_210 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_840 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_839 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_838 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_837 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
endmodule


module Add_half_1681 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1682 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX8 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_841 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1682 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1681 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1683 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1684 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_842 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1684 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1683 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1685 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2IX1 U1 ( .B(n1), .A(a), .Z(n2) );
  CIVX2 U2 ( .A(b), .Z(n1) );
  CEOXL U3 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_1686 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(a), .Z(n1) );
  CENX1 U2 ( .A(n1), .B(b), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_843 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1686 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1685 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1687 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1688 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(a), .Z(n1) );
  CENX1 U2 ( .A(n1), .B(b), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_844 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1688 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1687 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_211 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12;

  Add_full_844 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_843 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_842 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_841 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVXL U3 ( .A(s2), .Z(n7) );
  CND2X1 U4 ( .A(n2), .B(n3), .Z(c_out2) );
  CND2X1 U5 ( .A(c_out10), .B(n1), .Z(n2) );
  CND2X1 U6 ( .A(n6), .B(c_out11), .Z(n3) );
  CIVX2 U7 ( .A(n6), .Z(n1) );
  CAN2XL U8 ( .A(n9), .B(n10), .Z(n4) );
  CIVX2 U9 ( .A(c_in2), .Z(n5) );
  CND2X2 U10 ( .A(c_out00), .B(n5), .Z(n10) );
  CND2X2 U11 ( .A(c_out01), .B(c_in2), .Z(n9) );
  CND2X2 U12 ( .A(n10), .B(n9), .Z(n6) );
  CIVX2 U13 ( .A(s1), .Z(n8) );
  CMXI2X1 U14 ( .A0(n8), .A1(n7), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U15 ( .A(s4), .Z(n12) );
  CIVX2 U16 ( .A(s3), .Z(n11) );
  CMXI2X1 U17 ( .A0(n12), .A1(n11), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_1689 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1690 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_845 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1690 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1689 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1691 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1692 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_846 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1692 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1691 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1693 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1694 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVDX1 U1 ( .A(a), .Z0(n1), .Z1(n2) );
  CENX1 U2 ( .A(n1), .B(b), .Z(sum) );
  CAN2XL U3 ( .A(n2), .B(b), .Z(c_out) );
endmodule


module Add_full_847 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1694 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1693 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1695 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1696 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_848 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1696 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1695 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_212 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_848 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_847 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_846 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_845 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2X1 U3 ( .A(c_out10), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(c_out2) );
  CND2X1 U5 ( .A(n6), .B(c_out11), .Z(n4) );
  CIVX2 U6 ( .A(n6), .Z(n2) );
  CND2XL U7 ( .A(c_out00), .B(n5), .Z(n1) );
  CND2XL U8 ( .A(n1), .B(n7), .Z(n9) );
  CMX2X1 U9 ( .A0(s3), .A1(s4), .S(n9), .Z(sum2[1]) );
  CMX2X1 U10 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(c_in2), .Z(n5) );
  CND2X2 U12 ( .A(c_out00), .B(n5), .Z(n8) );
  CND2X2 U13 ( .A(c_out01), .B(c_in2), .Z(n7) );
  CND2X2 U14 ( .A(n7), .B(n8), .Z(n6) );
endmodule


module bit4_53 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_212 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_211 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_210 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_209 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CND2X1 U3 ( .A(n4), .B(c_out400), .Z(n2) );
  CMXI2XL U4 ( .A0(n9), .A1(n8), .S(n1), .Z(sum4[2]) );
  CMX2XL U5 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U6 ( .A(c_in4), .Z(n4) );
  CND2X2 U7 ( .A(n2), .B(n3), .Z(n5) );
  CND2X2 U8 ( .A(c_out401), .B(c_in4), .Z(n3) );
  CIVX1 U9 ( .A(c_out411), .Z(n6) );
  CIVX1 U10 ( .A(c_out410), .Z(n7) );
  CMXI2X1 U11 ( .A0(n7), .A1(n6), .S(n5), .Z(c_out4) );
  CMXI2XL U12 ( .A0(n11), .A1(n10), .S(n1), .Z(sum4[3]) );
  CMX2X1 U13 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMX2X1 U14 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U15 ( .A(s43[0]), .Z(n9) );
  CIVX2 U16 ( .A(s44[0]), .Z(n8) );
  CIVX2 U17 ( .A(s43[1]), .Z(n11) );
  CIVX2 U18 ( .A(s44[1]), .Z(n10) );
endmodule


module Add_half_1697 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1698 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_849 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1698 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1697 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1699 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1700 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_850 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1700 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1699 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1701 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1702 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_851 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1702 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1701 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1703 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1704 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_852 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1704 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1703 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_213 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_852 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_851 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_850 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_849 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out10), .Z(n3) );
  CMX2X1 U4 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n6) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U9 ( .A(s1), .Z(n5) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_1705 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1706 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_853 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1706 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1705 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1707 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1708 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_854 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1708 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1707 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1709 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1710 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_855 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1710 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1709 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1711 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENX1 U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1712 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_856 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1712 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1711 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_214 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_856 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_855 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_854 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_853 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n1), .Z(n2) );
  CMX2X1 U4 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U5 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
endmodule


module Add_half_1713 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1714 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_857 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1714 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1713 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1715 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1716 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_858 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1716 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1715 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1717 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1718 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_859 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1718 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1717 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1719 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1720 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_860 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1720 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1719 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_215 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10;

  Add_full_860 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_859 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_858 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_857 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2X1 U3 ( .A(n2), .B(n3), .Z(c_out2) );
  CND2X1 U4 ( .A(n5), .B(c_out11), .Z(n3) );
  CND2X2 U5 ( .A(c_out01), .B(c_in2), .Z(n8) );
  CND2X1 U6 ( .A(c_out10), .B(n1), .Z(n2) );
  CIVX2 U7 ( .A(n5), .Z(n1) );
  CMX2X1 U8 ( .A0(s3), .A1(s4), .S(n10), .Z(sum2[1]) );
  CND2XL U9 ( .A(n8), .B(n9), .Z(n10) );
  CIVX2 U10 ( .A(c_in2), .Z(n4) );
  CND2X2 U11 ( .A(c_out00), .B(n4), .Z(n9) );
  CND2X2 U12 ( .A(n9), .B(n8), .Z(n5) );
  CIVX2 U13 ( .A(s1), .Z(n7) );
  CIVX2 U14 ( .A(s2), .Z(n6) );
  CMXI2X1 U15 ( .A0(n7), .A1(n6), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_1721 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1722 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_861 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1722 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1721 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1723 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1724 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_862 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1724 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1723 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1725 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1726 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_863 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1726 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1725 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1727 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1728 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX3 U1 ( .A(a), .Z(n1) );
  CENX2 U2 ( .A(n1), .B(b), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_864 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1728 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1727 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_216 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10;

  Add_full_864 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_863 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_862 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_861 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(n6), .Z(n1) );
  CND2X2 U4 ( .A(c_out10), .B(n1), .Z(n2) );
  CND2X2 U5 ( .A(c_out11), .B(n6), .Z(n3) );
  CND2X2 U6 ( .A(n2), .B(n3), .Z(c_out2) );
  CAN2XL U7 ( .A(n8), .B(n7), .Z(n4) );
  CMX2X1 U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(c_in2), .Z(n5) );
  CND2X2 U10 ( .A(c_out00), .B(n5), .Z(n8) );
  CND2X2 U11 ( .A(c_out01), .B(c_in2), .Z(n7) );
  CND2X2 U12 ( .A(n7), .B(n8), .Z(n6) );
  CIVX2 U13 ( .A(s4), .Z(n10) );
  CIVX2 U14 ( .A(s3), .Z(n9) );
  CMXI2X1 U15 ( .A0(n10), .A1(n9), .S(n4), .Z(sum2[1]) );
endmodule


module bit4_54 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_216 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_215 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_214 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_213 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMXI2XL U3 ( .A0(n9), .A1(n8), .S(n1), .Z(sum4[2]) );
  CIVX2 U4 ( .A(c_in4), .Z(n2) );
  CMX2XL U5 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CMXI2X1 U6 ( .A0(n3), .A1(n4), .S(n2), .Z(n5) );
  CIVX2 U7 ( .A(c_out400), .Z(n4) );
  CIVX1 U8 ( .A(c_out401), .Z(n3) );
  CIVX1 U9 ( .A(c_out411), .Z(n6) );
  CMXI2XL U10 ( .A0(n11), .A1(n10), .S(n1), .Z(sum4[3]) );
  CMX2X1 U11 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMX2X1 U12 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U13 ( .A(c_out410), .Z(n7) );
  CMXI2X1 U14 ( .A0(n7), .A1(n6), .S(n5), .Z(c_out4) );
  CIVX2 U15 ( .A(s43[0]), .Z(n9) );
  CIVX2 U16 ( .A(s44[0]), .Z(n8) );
  CIVX2 U17 ( .A(s43[1]), .Z(n11) );
  CIVX2 U18 ( .A(s44[1]), .Z(n10) );
endmodule


module Add_half_1729 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1730 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_865 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1730 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1729 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1731 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1732 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_866 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1732 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1731 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1733 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CEOXL U1 ( .A(n3), .B(n1), .Z(sum) );
  CND2IX2 U2 ( .B(n3), .A(a), .Z(n2) );
  CIVXL U3 ( .A(a), .Z(n1) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
  CIVX2 U5 ( .A(b), .Z(n3) );
endmodule


module Add_half_1734 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(b), .Z(n1) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
  CENX2 U3 ( .A(n1), .B(a), .Z(sum) );
endmodule


module Add_full_867 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1734 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1733 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_1735 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENXL U2 ( .A(b), .B(n2), .Z(sum) );
  CND2IX2 U3 ( .B(n1), .A(a), .Z(n3) );
  CIVXL U4 ( .A(a), .Z(n2) );
  CIVX2 U5 ( .A(n3), .Z(c_out) );
endmodule


module Add_half_1736 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   net55202, n1;
  assign c_out = net55202;

  CIVX1 U1 ( .A(b), .Z(n1) );
  CENX2 U2 ( .A(n1), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(net55202) );
endmodule


module Add_full_868 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1736 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1735 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_217 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, net56573, n1, n2,
         n3, n4, n5, n6, n7, n8;

  Add_full_868 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_867 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_866 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_865 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n3) );
  CIVXL U4 ( .A(c_out01), .Z(n1) );
  CIVXL U5 ( .A(n1), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out01), .A1(c_out00), .S(n3), .Z(net56573) );
  CIVXL U7 ( .A(s2), .Z(n6) );
  CMX2XL U8 ( .A0(c_out00), .A1(n2), .S(c_in2), .Z(n4) );
  CMXI2X1 U9 ( .A0(n5), .A1(n6), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U10 ( .A0(n7), .A1(n8), .S(net56573), .Z(c_out2) );
  CIVX2 U11 ( .A(c_out10), .Z(n8) );
  CIVX2 U12 ( .A(c_out11), .Z(n7) );
  CIVXL U13 ( .A(s1), .Z(n5) );
  CMX2XL U14 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_1737 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1738 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_869 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1738 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1737 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1739 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1740 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_870 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1740 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1739 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1741 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CNIVXL U1 ( .A(a), .Z(n1) );
  CEOXL U2 ( .A(b), .B(n1), .Z(sum) );
  CND2X2 U3 ( .A(a), .B(b), .Z(n2) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_1742 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   net55212;
  assign c_out = net55212;

  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(net55212) );
endmodule


module Add_full_871 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1742 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1741 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_1743 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(n1), .Z(c_out) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1744 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(b), .Z(n1) );
  CENX2 U2 ( .A(n1), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_872 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1744 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1743 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_218 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, net60381,
         net60380, n1, n2, n3, n4, n5, n6;

  Add_full_872 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_871 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_870 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_869 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVXL U3 ( .A(c_out01), .Z(n1) );
  CIVXL U4 ( .A(n1), .Z(n2) );
  CMX2XL U5 ( .A0(c_out00), .A1(n2), .S(c_in2), .Z(n3) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n4) );
  CMX2XL U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U8 ( .A0(net60380), .A1(net60381), .S(n4), .Z(c_out2) );
  CIVX2 U9 ( .A(c_out10), .Z(net60381) );
  CIVX2 U10 ( .A(c_out11), .Z(net60380) );
  CMXI2XL U11 ( .A0(n6), .A1(n5), .S(n3), .Z(sum2[1]) );
  CIVX2 U12 ( .A(s3), .Z(n6) );
  CIVX2 U13 ( .A(s4), .Z(n5) );
endmodule


module Add_half_1745 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1746 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_873 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1746 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1745 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1747 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1748 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_874 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1748 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1747 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1749 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2X2 U1 ( .A(a), .B(b), .Z(n2) );
  CIVX2 U2 ( .A(n2), .Z(c_out) );
  CENXL U3 ( .A(n1), .B(a), .Z(sum) );
  CIVX2 U4 ( .A(b), .Z(n1) );
endmodule


module Add_half_1750 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n3, n4, n5, n6;

  CIVX1 U1 ( .A(n4), .Z(n1) );
  CIVX2 U2 ( .A(a), .Z(n4) );
  CAN2XL U3 ( .A(n1), .B(b), .Z(c_out) );
  CND2X2 U4 ( .A(n4), .B(b), .Z(n6) );
  CND2X2 U5 ( .A(n5), .B(n6), .Z(sum) );
  CIVX2 U6 ( .A(b), .Z(n3) );
  CND2X1 U7 ( .A(a), .B(n3), .Z(n5) );
endmodule


module Add_full_875 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1750 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1749 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n1), .B(n2), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n2) );
  CIVX2 U3 ( .A(w3), .Z(n1) );
endmodule


module Add_half_1751 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3;

  CND2X2 U1 ( .A(a), .B(b), .Z(n2) );
  CIVX2 U2 ( .A(n2), .Z(c_out) );
  CENXL U3 ( .A(n3), .B(a), .Z(sum) );
  CIVX2 U4 ( .A(b), .Z(n3) );
endmodule


module Add_half_1752 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CIVX1 U1 ( .A(a), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CND2X1 U3 ( .A(a), .B(n5), .Z(n3) );
  CND2X2 U4 ( .A(n2), .B(b), .Z(n4) );
  CND2X2 U5 ( .A(n3), .B(n4), .Z(sum) );
  CIVX2 U6 ( .A(b), .Z(n5) );
endmodule


module Add_full_876 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1752 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1751 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_219 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, net53868,
         net53869, net57979, net53871, net53874, net53866, net53865, n1, n2,
         n3, n4, n5, n6;

  Add_full_876 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_875 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_874 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_873 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2IX2 U3 ( .B(net53871), .A(n3), .Z(n2) );
  CIVX2 U4 ( .A(net53865), .Z(n3) );
  CND2X2 U5 ( .A(n1), .B(n2), .Z(c_out2) );
  CND2X1 U6 ( .A(net53865), .B(c_out11), .Z(n1) );
  CND2X2 U7 ( .A(net53866), .B(n4), .Z(net53865) );
  CND2X2 U8 ( .A(c_out01), .B(c_in2), .Z(n4) );
  CND2X2 U9 ( .A(c_out00), .B(net53874), .Z(net53866) );
  CND2X1 U10 ( .A(n4), .B(net53866), .Z(net57979) );
  CIVX2 U11 ( .A(c_in2), .Z(net53874) );
  CMXI2X1 U12 ( .A0(net53868), .A1(net53869), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U13 ( .A(c_out10), .Z(net53871) );
  CMXI2X1 U14 ( .A0(n5), .A1(n6), .S(net57979), .Z(sum2[1]) );
  CIVX1 U15 ( .A(s1), .Z(net53868) );
  CIVX1 U16 ( .A(s2), .Z(net53869) );
  CIVX2 U17 ( .A(s4), .Z(n6) );
  CIVX2 U18 ( .A(s3), .Z(n5) );
endmodule


module Add_half_1753 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1754 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_877 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1754 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1753 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1755 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1756 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX2 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_878 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1756 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1755 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1757 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENXL U2 ( .A(a), .B(n1), .Z(sum) );
  CND2IX2 U3 ( .B(n1), .A(a), .Z(n2) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_1758 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(a), .B(n4), .Z(n2) );
  CND2X2 U2 ( .A(n1), .B(b), .Z(n3) );
  CND2X2 U3 ( .A(n2), .B(n3), .Z(sum) );
  CIVX2 U4 ( .A(a), .Z(n1) );
  CIVX2 U5 ( .A(b), .Z(n4) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_879 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1758 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1757 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1759 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1760 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX2 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_880 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1760 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1759 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_220 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10;

  Add_full_880 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_879 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_878 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_877 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n9), .A1(n10), .S(n1), .Z(sum2[1]) );
  CND2X2 U4 ( .A(c_out11), .B(n6), .Z(n4) );
  CND2X2 U5 ( .A(n8), .B(n7), .Z(n1) );
  CND2X1 U6 ( .A(n8), .B(n7), .Z(n6) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
  CND2X2 U8 ( .A(n2), .B(c_out10), .Z(n3) );
  CND2X2 U9 ( .A(n3), .B(n4), .Z(c_out2) );
  CMX2X1 U10 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(c_in2), .Z(n5) );
  CND2X2 U12 ( .A(c_out00), .B(n5), .Z(n8) );
  CND2X2 U13 ( .A(c_out01), .B(c_in2), .Z(n7) );
  CIVX2 U14 ( .A(s4), .Z(n10) );
  CIVX2 U15 ( .A(s3), .Z(n9) );
endmodule


module bit4_55 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, net55266, net53917, net53916,
         net56228, net61046, net56227, net56225, n1, n2, n3, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_220 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_219 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_218 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_217 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX3 U3 ( .A(net56228), .Z(c_out4) );
  CIVXL U4 ( .A(s43[0]), .Z(n4) );
  CAN2X2 U5 ( .A(net53917), .B(net53916), .Z(net55266) );
  CND2IX2 U6 ( .B(n3), .A(c_out401), .Z(net53917) );
  CND2X2 U7 ( .A(net56225), .B(n1), .Z(n2) );
  CND2X2 U8 ( .A(n2), .B(net56227), .Z(net56228) );
  CIVX1 U9 ( .A(c_out410), .Z(n1) );
  CIVX2 U10 ( .A(net61046), .Z(net56225) );
  CND2X2 U11 ( .A(net53917), .B(net53916), .Z(net61046) );
  CND2IX1 U12 ( .B(c_out411), .A(net61046), .Z(net56227) );
  CIVX2 U13 ( .A(c_in4), .Z(n3) );
  CND2IX2 U14 ( .B(c_in4), .A(c_out400), .Z(net53916) );
  CMX2X1 U15 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U16 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMX2X1 U17 ( .A0(s44[1]), .A1(s43[1]), .S(net55266), .Z(sum4[3]) );
  CIVX2 U18 ( .A(s44[0]), .Z(n5) );
  CMXI2X1 U19 ( .A0(n5), .A1(n4), .S(net55266), .Z(sum4[2]) );
endmodule


module bit8_0 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, net66325, net59691, net54105,
         net54104, net54103, net56628, net56627, net54102, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_0 A81 ( .sum4(s81), .c_out4(c_out800), .a4({a8[3], n16, a8[1:0]}), .b4(
        {b8[3], n2, b8[1:0]}), .c_in4(1'b0) );
  bit4_55 A82 ( .sum4(s82), .c_out4(c_out801), .a4({a8[3], n14, a8[1:0]}), 
        .b4(b8[3:0]), .c_in4(1'b1) );
  bit4_54 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_53 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CIVX8 U3 ( .A(b8[2]), .Z(n1) );
  CIVX8 U4 ( .A(n1), .Z(n2) );
  CIVX2 U5 ( .A(n9), .Z(sum8[5]) );
  CND2X1 U6 ( .A(n7), .B(n8), .Z(n9) );
  CND2IX1 U7 ( .B(s84[2]), .A(n37), .Z(n11) );
  CND2IX1 U8 ( .B(s84[1]), .A(n37), .Z(n8) );
  COR2X1 U9 ( .A(n37), .B(s83[2]), .Z(n12) );
  CND3XL U10 ( .A(n34), .B(n36), .C(n35), .Z(n7) );
  CND2X1 U11 ( .A(c_out801), .B(n30), .Z(n31) );
  CAN2X1 U12 ( .A(s83[0]), .B(c_in8), .Z(n3) );
  CND2X1 U13 ( .A(n4), .B(c_out811), .Z(net56627) );
  CIVX2 U14 ( .A(c_in8), .Z(net66325) );
  CIVX2 U15 ( .A(n38), .Z(n10) );
  CIVX1 U16 ( .A(n37), .Z(n38) );
  CND2X2 U17 ( .A(s81[3]), .B(net66325), .Z(n17) );
  CNR2IX2 U18 ( .B(c_in8), .A(n5), .Z(n4) );
  CIVX2 U19 ( .A(c_out801), .Z(n5) );
  CAN2X2 U20 ( .A(net56627), .B(net56628), .Z(net54102) );
  CND2X4 U21 ( .A(net54102), .B(net54103), .Z(c_out8) );
  CND2XL U22 ( .A(c_out810), .B(n6), .Z(net56628) );
  CNR2IX1 U23 ( .B(c_in8), .A(c_out801), .Z(n6) );
  COR2X1 U24 ( .A(c_out800), .B(c_out810), .Z(net54105) );
  CND2IX1 U25 ( .B(c_out811), .A(net59691), .Z(net54104) );
  CND3X2 U26 ( .A(net54104), .B(net54105), .C(net66325), .Z(net54103) );
  CNIVX1 U27 ( .A(c_out800), .Z(net59691) );
  CMX2X2 U28 ( .A0(s82[1]), .A1(s81[1]), .S(net66325), .Z(sum8[1]) );
  CIVX2 U29 ( .A(n28), .Z(n20) );
  CND2X1 U30 ( .A(s83[3]), .B(n38), .Z(n23) );
  CIVX8 U31 ( .A(a8[2]), .Z(n15) );
  CND2IX2 U32 ( .B(net66325), .A(s82[2]), .Z(n26) );
  CND2X4 U33 ( .A(n11), .B(n12), .Z(n13) );
  CIVX8 U34 ( .A(n13), .Z(sum8[6]) );
  CND2X4 U35 ( .A(n22), .B(n23), .Z(sum8[7]) );
  CIVX8 U36 ( .A(n15), .Z(n14) );
  CIVX8 U37 ( .A(n15), .Z(n16) );
  CND2X2 U38 ( .A(n36), .B(n35), .Z(n37) );
  CND2X2 U39 ( .A(s82[3]), .B(c_in8), .Z(n18) );
  CND2XL U40 ( .A(c_out800), .B(n29), .Z(n19) );
  CND2IX2 U41 ( .B(c_in8), .A(s81[2]), .Z(n27) );
  CND2IX2 U42 ( .B(net66325), .A(s82[0]), .Z(n24) );
  CND2X1 U43 ( .A(c_out800), .B(net66325), .Z(n36) );
  CND2IX2 U44 ( .B(c_in8), .A(s81[0]), .Z(n25) );
  CND2X1 U45 ( .A(net66325), .B(s83[0]), .Z(n21) );
  CND2X1 U46 ( .A(c_out801), .B(c_in8), .Z(n35) );
  CNR2X2 U47 ( .A(c_out800), .B(n21), .Z(n28) );
  CND2X4 U48 ( .A(n27), .B(n26), .Z(sum8[2]) );
  CND2X4 U49 ( .A(n17), .B(n18), .Z(sum8[3]) );
  CAN2X2 U50 ( .A(n20), .B(n19), .Z(n33) );
  CAN2XL U51 ( .A(net66325), .B(s84[0]), .Z(n29) );
  CND2X1 U52 ( .A(s84[3]), .B(n10), .Z(n22) );
  CND2X1 U53 ( .A(s84[0]), .B(c_in8), .Z(n30) );
  COND1X1 U54 ( .A(n3), .B(c_out801), .C(n31), .Z(n32) );
  CND2X4 U55 ( .A(n33), .B(n32), .Z(sum8[4]) );
  CND2X4 U56 ( .A(n25), .B(n24), .Z(sum8[0]) );
  CIVX2 U57 ( .A(s83[1]), .Z(n34) );
endmodule


module Add_half_1537 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1538 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_769 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1538 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1537 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1539 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1540 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_770 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1540 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1539 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1541 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1542 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_771 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1542 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1541 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1543 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1544 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_772 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1544 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1543 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_193 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_772 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_771 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_770 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_769 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1545 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1546 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_773 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1546 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1545 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1547 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1548 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_774 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1548 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1547 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1549 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1550 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_775 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1550 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1549 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1551 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1552 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_776 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1552 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1551 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_194 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_776 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_775 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_774 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_773 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1553 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1554 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_777 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1554 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1553 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1555 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1556 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_778 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1556 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1555 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1557 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1558 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_779 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1558 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1557 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1559 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1560 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_780 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1560 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1559 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_195 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_780 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_779 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_778 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_777 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1561 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1562 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_781 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1562 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1561 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1563 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1564 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_782 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1564 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1563 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1565 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1566 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_783 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1566 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1565 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1567 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1568 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_784 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1568 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1567 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_196 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_784 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_783 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_782 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_781 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_49 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_196 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_195 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_194 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_193 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module Add_half_1569 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1570 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_785 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1570 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1569 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1571 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1572 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_786 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1572 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1571 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1573 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1574 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_787 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1574 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1573 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1575 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1576 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_788 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1576 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1575 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_197 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_788 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_787 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_786 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_785 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1577 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1578 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_789 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1578 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1577 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1579 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1580 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_790 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1580 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1579 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1581 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1582 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_791 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1582 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1581 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1583 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1584 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_792 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1584 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1583 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_198 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_792 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_791 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_790 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_789 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1585 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1586 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_793 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1586 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1585 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1587 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1588 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_794 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1588 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1587 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1589 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1590 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_795 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1590 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1589 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1591 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1592 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_796 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1592 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1591 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_199 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_796 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_795 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_794 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_793 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1593 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1594 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_797 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1594 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1593 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1595 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1596 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_798 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1596 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1595 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1597 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1598 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_799 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1598 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1597 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1599 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1600 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_800 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1600 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1599 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_200 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_800 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_799 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_798 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_797 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_50 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_200 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_199 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_198 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_197 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module Add_half_1601 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1602 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_801 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1602 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1601 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1603 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1604 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_802 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1604 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1603 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1605 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1606 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_803 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1606 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1605 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1607 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1608 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_804 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1608 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1607 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_201 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_804 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_803 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_802 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_801 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1609 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1610 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_805 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1610 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1609 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1611 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1612 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_806 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1612 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1611 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1613 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1614 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_807 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1614 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1613 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1615 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1616 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_808 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1616 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1615 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_202 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_808 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_807 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_806 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_805 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1617 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1618 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_809 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1618 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1617 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1619 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1620 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_810 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1620 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1619 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1621 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(b), .Z(n2) );
  CENX1 U4 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1622 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_811 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1622 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1621 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1623 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CIVX1 U2 ( .A(n1), .Z(c_out) );
  CND2X1 U3 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1624 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_812 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1624 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1623 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_203 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_812 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_811 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_810 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_809 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U4 ( .A(c_out10), .Z(n3) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n4) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_1625 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1626 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_813 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1626 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1625 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1627 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1628 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_814 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1628 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1627 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1629 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CIVX1 U2 ( .A(n1), .Z(c_out) );
  CND2X1 U3 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1630 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_815 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1630 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1629 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1631 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CIVX1 U2 ( .A(n1), .Z(c_out) );
  CND2X1 U3 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1632 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_816 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1632 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1631 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_204 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_816 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_815 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_814 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_813 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2XL U3 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U10 ( .A(s3), .Z(n6) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module bit4_51 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_204 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_203 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_202 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_201 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2XL U3 ( .A0(s43[0]), .A1(s44[0]), .S(n4), .Z(sum4[2]) );
  CMX2XL U4 ( .A0(s43[1]), .A1(s44[1]), .S(n4), .Z(sum4[3]) );
  CMX2X1 U5 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMX2X1 U6 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U7 ( .A(c_out410), .Z(n3) );
  CIVX2 U8 ( .A(c_out411), .Z(n2) );
  CMXI2X1 U9 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U10 ( .A(n1), .Z(n4) );
  CMXI2X1 U11 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out4) );
endmodule


module Add_half_1633 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1634 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_817 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1634 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1633 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1635 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1636 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_818 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1636 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1635 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1637 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1638 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_819 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1638 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1637 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1639 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1640 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_820 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1640 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1639 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_205 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_820 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_819 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_818 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_817 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1641 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1642 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_821 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1642 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1641 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1643 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1644 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_822 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1644 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1643 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1645 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1646 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_823 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1646 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1645 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1647 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1648 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_824 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1648 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1647 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_206 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_824 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_823 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_822 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_821 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1649 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1650 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_825 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1650 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1649 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1651 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1652 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_826 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1652 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1651 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1653 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1654 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_827 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1654 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1653 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1655 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1656 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_828 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1656 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1655 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_207 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_828 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_827 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_826 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_825 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVX2 U4 ( .A(c_out10), .Z(n3) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n6) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U9 ( .A(s1), .Z(n5) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_1657 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1658 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_829 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1658 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1657 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1659 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1660 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_830 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1660 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1659 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1661 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
  CENX1 U4 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1662 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_831 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1662 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1661 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1663 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1664 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_832 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1664 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1663 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_208 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_832 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_831 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_830 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_829 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2XL U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module bit4_52 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_208 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_207 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_206 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_205 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2X1 U3 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U4 ( .A(c_out410), .Z(n3) );
  CIVX2 U5 ( .A(c_out411), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n8) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n8), .Z(c_out4) );
  CIVX2 U9 ( .A(s41[1]), .Z(n5) );
  CIVX2 U10 ( .A(s42[1]), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U12 ( .A(s43[0]), .Z(n7) );
  CIVX2 U13 ( .A(s44[0]), .Z(n6) );
  CMXI2X1 U14 ( .A0(n7), .A1(n6), .S(n8), .Z(sum4[2]) );
  CIVX2 U15 ( .A(s43[1]), .Z(n10) );
  CIVX2 U16 ( .A(s44[1]), .Z(n9) );
  CMXI2X1 U17 ( .A0(n10), .A1(n9), .S(n8), .Z(sum4[3]) );
endmodule


module bit8_13 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, net53487, net53496, net54399,
         net54398, net55630, net55629, net56302, net55734, net55732, net53509,
         n21, net53505, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;
  assign sum8[0] = net54399;

  bit4_52 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_51 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_50 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_49 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CNIVXL U3 ( .A(c_out801), .Z(n1) );
  CMXI2X4 U4 ( .A0(n4), .A1(n5), .S(c_in8), .Z(sum8[1]) );
  CMXI2X1 U5 ( .A0(n19), .A1(n20), .S(net55629), .Z(sum8[6]) );
  CIVX4 U6 ( .A(net55734), .Z(sum8[2]) );
  CIVX1 U7 ( .A(net53487), .Z(net55629) );
  CIVX2 U8 ( .A(net55629), .Z(net55630) );
  CND2IX2 U9 ( .B(n3), .A(c_in8), .Z(n2) );
  CIVX2 U10 ( .A(s82[0]), .Z(n3) );
  COND1X2 U11 ( .A(net53505), .B(c_in8), .C(n2), .Z(n21) );
  CIVX4 U12 ( .A(n21), .Z(net54398) );
  CIVX1 U13 ( .A(s81[0]), .Z(net53505) );
  CND2X1 U14 ( .A(net55630), .B(s83[1]), .Z(n8) );
  CIVX2 U15 ( .A(s82[1]), .Z(n5) );
  CIVX2 U16 ( .A(s81[1]), .Z(n4) );
  CND2X2 U17 ( .A(n6), .B(net55732), .Z(net55734) );
  CND2IX1 U18 ( .B(s81[2]), .A(net53509), .Z(net55732) );
  CIVX1 U19 ( .A(c_in8), .Z(net53509) );
  CANR2X1 U20 ( .A(c_out800), .B(net53509), .C(n1), .D(c_in8), .Z(net53487) );
  CND2IXL U21 ( .B(s82[2]), .A(c_in8), .Z(n6) );
  CND2X1 U22 ( .A(s84[1]), .B(net55629), .Z(n7) );
  CIVXL U23 ( .A(net55629), .Z(net56302) );
  CNR2IX1 U24 ( .B(s83[0]), .A(c_out801), .Z(n16) );
  CND2X4 U25 ( .A(n8), .B(n7), .Z(sum8[5]) );
  CIVX8 U26 ( .A(net54398), .Z(net54399) );
  CMX2X1 U27 ( .A0(s84[3]), .A1(s83[3]), .S(net56302), .Z(sum8[7]) );
  CND2IXL U28 ( .B(c_in8), .A(n15), .Z(n18) );
  COND4CXL U29 ( .A(s84[0]), .B(c_out801), .C(n16), .D(c_in8), .Z(n17) );
  CMXI2X2 U30 ( .A0(n12), .A1(n11), .S(c_in8), .Z(sum8[3]) );
  CMXI2XL U31 ( .A0(n10), .A1(n9), .S(net56302), .Z(c_out8) );
  CIVX2 U32 ( .A(c_out811), .Z(n10) );
  CIVX2 U33 ( .A(c_out810), .Z(n9) );
  CIVX2 U34 ( .A(s81[3]), .Z(n12) );
  CIVX2 U35 ( .A(s82[3]), .Z(n11) );
  CIVX2 U36 ( .A(c_out800), .Z(net53496) );
  CIVX2 U37 ( .A(s84[0]), .Z(n14) );
  CIVX2 U38 ( .A(s83[0]), .Z(n13) );
  COND2X1 U39 ( .A(net53496), .B(n14), .C(c_out800), .D(n13), .Z(n15) );
  CND2X2 U40 ( .A(n17), .B(n18), .Z(sum8[4]) );
  CIVX2 U41 ( .A(s84[2]), .Z(n20) );
  CIVX2 U42 ( .A(s83[2]), .Z(n19) );
endmodule


module bit16_0 ( a16, b16, sum16, c_out16, c_in16 );
  input [15:0] a16;
  input [15:0] b16;
  output [15:0] sum16;
  input c_in16;
  output c_out16;
  wire   c1;

  bit8_0 A161 ( .sum8(sum16[7:0]), .c_out8(c1), .a8(a16[7:0]), .b8(b16[7:0]), 
        .c_in8(c_in16) );
  bit8_13 A162 ( .sum8(sum16[15:8]), .c_out8(c_out16), .a8(a16[15:8]), .b8(
        b16[15:8]), .c_in8(c1) );
endmodule


module Add_half_1 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_2 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_1 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_2 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_3 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_4 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_2 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_4 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_3 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_5 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_6 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_3 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_6 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_5 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_7 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_8 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_4 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_8 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_7 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_1 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_4 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0)
         );
  Add_full_3 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1)
         );
  Add_full_2 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0)
         );
  Add_full_1 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1)
         );
  CIVX1 U3 ( .A(s4), .Z(n5) );
  CANR2XL U4 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n1) );
  CANR2X2 U5 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n3) );
  CMX2XL U6 ( .A0(c_out11), .A1(c_out10), .S(n1), .Z(c_out2) );
  CMX2X1 U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX1 U8 ( .A(s3), .Z(n4) );
  CIVX2 U9 ( .A(c_in2), .Z(n2) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(n3), .Z(sum2[1]) );
endmodule


module Add_half_9 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_10 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_5 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_10 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_9 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_11 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n1) );
  CENX1 U3 ( .A(a), .B(n1), .Z(sum) );
endmodule


module Add_half_12 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CIVX1 U3 ( .A(b), .Z(n2) );
  CND2X1 U4 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U5 ( .A(a), .B(n2), .Z(n3) );
  CAN2XL U6 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_6 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_12 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_11 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_13 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_14 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(b), .Z(n2) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CND2X1 U5 ( .A(n1), .B(b), .Z(n4) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_7 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_14 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_13 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_15 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_16 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(b), .Z(n2) );
  CND2XL U2 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U3 ( .A(n4), .B(n3), .Z(sum) );
  CND2XL U4 ( .A(a), .B(n2), .Z(n3) );
  CIVXL U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_8 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_16 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_15 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_2 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_8 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0)
         );
  Add_full_7 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1)
         );
  Add_full_6 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0)
         );
  Add_full_5 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1)
         );
  CND2X2 U3 ( .A(n3), .B(n4), .Z(sum2[1]) );
  CND2X2 U4 ( .A(s4), .B(n2), .Z(n3) );
  CANR2X1 U5 ( .A(c_out00), .B(n6), .C(c_in2), .D(c_out01), .Z(n1) );
  CANR2X2 U6 ( .A(c_out00), .B(n6), .C(c_in2), .D(c_out01), .Z(n9) );
  CND2X1 U7 ( .A(s3), .B(n1), .Z(n4) );
  CIVX2 U8 ( .A(n9), .Z(n2) );
  CIVXL U9 ( .A(s2), .Z(n7) );
  CANR2XL U10 ( .A(n6), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n5) );
  CMX2XL U11 ( .A0(c_out11), .A1(c_out10), .S(n5), .Z(c_out2) );
  CIVX2 U12 ( .A(c_in2), .Z(n6) );
  CIVX2 U13 ( .A(s1), .Z(n8) );
  CMXI2X1 U14 ( .A0(n8), .A1(n7), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_17 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_18 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_9 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_18 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_17 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_19 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_20 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_10 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_20 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_19 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_21 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_22 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_11 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_22 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_21 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_23 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_24 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_12 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_24 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_23 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_3 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_12 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_11 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_10 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_9 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1)
         );
  CIVX2 U3 ( .A(c_in2), .Z(n2) );
  CMXI2X1 U4 ( .A0(n4), .A1(n5), .S(n1), .Z(c_out2) );
  CMXI2X1 U5 ( .A0(c_out01), .A1(c_out00), .S(n2), .Z(n1) );
  CMX2XL U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n3) );
  CMX2X1 U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U8 ( .A(c_out10), .Z(n5) );
  CIVX2 U9 ( .A(c_out11), .Z(n4) );
  CIVX2 U10 ( .A(s3), .Z(n7) );
  CIVX2 U11 ( .A(s4), .Z(n6) );
  CMXI2X1 U12 ( .A0(n7), .A1(n6), .S(n3), .Z(sum2[1]) );
endmodule


module Add_half_25 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_26 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CENX1 U2 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_13 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_26 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_25 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_27 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_28 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  CIVDX1 U1 ( .A(b), .Z0(n1), .Z1(n2) );
  CIVX1 U2 ( .A(a), .Z(n3) );
  CND2XL U3 ( .A(a), .B(n1), .Z(n4) );
  CND2X1 U4 ( .A(n3), .B(n2), .Z(n5) );
  CND2X1 U5 ( .A(n4), .B(n5), .Z(sum) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_14 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_28 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_27 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_29 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CNIVXL U1 ( .A(a), .Z(n1) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n2) );
  CIVX2 U3 ( .A(n2), .Z(c_out) );
  CEOXL U4 ( .A(b), .B(n1), .Z(sum) );
endmodule


module Add_half_30 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   net55347;
  assign c_out = net55347;

  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(net55347) );
endmodule


module Add_full_15 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_30 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_29 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n1), .B(n2), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n2) );
  CIVX2 U3 ( .A(w3), .Z(n1) );
endmodule


module Add_half_31 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CNIVXL U1 ( .A(a), .Z(n1) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n2) );
  CEOXL U3 ( .A(b), .B(n1), .Z(sum) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_32 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5, n6;

  CNR2XL U1 ( .A(n4), .B(n2), .Z(c_out) );
  CIVX1 U2 ( .A(a), .Z(n4) );
  CIVX1 U3 ( .A(b), .Z(n2) );
  CIVX2 U4 ( .A(b), .Z(n3) );
  CND2X1 U5 ( .A(n4), .B(b), .Z(n5) );
  CND2X1 U6 ( .A(a), .B(n3), .Z(n6) );
  CND2X2 U7 ( .A(n5), .B(n6), .Z(sum) );
endmodule


module Add_full_16 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_32 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_31 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_4 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, net48352,
         net48353, net48354, net48356, net48355, n1, n2, n3, n4;

  Add_full_16 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_15 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_14 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_13 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX2 U3 ( .A(c_out00), .Z(n3) );
  CIVX2 U4 ( .A(c_in2), .Z(n1) );
  CMXI2X1 U5 ( .A0(n4), .A1(n3), .S(n1), .Z(n2) );
  CMXI2X1 U6 ( .A0(net48355), .A1(net48356), .S(n2), .Z(c_out2) );
  CIVX2 U7 ( .A(c_out01), .Z(n4) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(net48352) );
  CMXI2X1 U9 ( .A0(net48353), .A1(net48354), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U10 ( .A(c_out11), .Z(net48356) );
  CIVX2 U11 ( .A(c_out10), .Z(net48355) );
  CMX2X1 U12 ( .A0(s4), .A1(s3), .S(net48352), .Z(sum2[1]) );
  CIVX2 U13 ( .A(s1), .Z(net48353) );
  CIVX2 U14 ( .A(s2), .Z(net48354) );
endmodule


module bit4_1 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, net57357, net48364, net48363,
         n1, n2, n3, n4, n5, n6;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_4 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_3 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_2 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_1 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(n4), .D(c_out400), .Z(n1) );
  CANR2XL U4 ( .A(c_out401), .B(c_in4), .C(n4), .D(c_out400), .Z(n2) );
  CANR2X1 U5 ( .A(c_out401), .B(c_in4), .C(n4), .D(c_out400), .Z(n3) );
  CMX2X1 U6 ( .A0(s44[1]), .A1(s43[1]), .S(n1), .Z(sum4[3]) );
  CDLY1XL U7 ( .A(n2), .Z(net57357) );
  CMXI2XL U8 ( .A0(net48363), .A1(net48364), .S(n3), .Z(sum4[2]) );
  CIVX2 U9 ( .A(c_in4), .Z(n4) );
  CMX2X1 U10 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U11 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVXL U12 ( .A(s43[0]), .Z(net48364) );
  CIVX2 U13 ( .A(s44[0]), .Z(net48363) );
  CMXI2XL U14 ( .A0(n6), .A1(n5), .S(net57357), .Z(c_out4) );
  CIVX2 U15 ( .A(c_out411), .Z(n6) );
  CIVX2 U16 ( .A(c_out410), .Z(n5) );
endmodule


module Add_half_33 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_34 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_17 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_34 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_33 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_35 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CENX1 U1 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n1) );
endmodule


module Add_half_36 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_18 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_36 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_35 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_37 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_38 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(b), .Z(n2) );
  CND2XL U2 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_19 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_38 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_37 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_39 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_40 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_20 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_40 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_39 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_5 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_20 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_19 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_18 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_17 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CMXI2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n5) );
  CANR2XL U4 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n1) );
  CMX2XL U5 ( .A0(c_out11), .A1(c_out10), .S(n1), .Z(c_out2) );
  CMX2X1 U6 ( .A0(s4), .A1(s3), .S(n5), .Z(sum2[1]) );
  CIVX2 U7 ( .A(c_in2), .Z(n2) );
  CIVX2 U8 ( .A(s1), .Z(n4) );
  CIVX2 U9 ( .A(s2), .Z(n3) );
  CMXI2X1 U10 ( .A0(n4), .A1(n3), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_41 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_42 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_21 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_42 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_41 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_43 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_44 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_22 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_44 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_43 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_45 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_46 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U2 ( .A(b), .B(n2), .Z(n3) );
  CND2XL U3 ( .A(n1), .B(a), .Z(n4) );
  CIVXL U4 ( .A(b), .Z(n1) );
  CIVXL U5 ( .A(a), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_23 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_46 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_45 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_47 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_48 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_24 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_48 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_47 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_6 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_24 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_23 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_22 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_21 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(s4), .Z(n5) );
  CANR2XL U4 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n1) );
  CANR2X2 U5 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n3) );
  CIVX1 U6 ( .A(s3), .Z(n4) );
  CMX2XL U7 ( .A0(c_out11), .A1(c_out10), .S(n1), .Z(c_out2) );
  CMX2X1 U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(c_in2), .Z(n2) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(n3), .Z(sum2[1]) );
endmodule


module Add_half_49 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_50 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_25 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_50 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_49 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_51 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_52 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_26 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_52 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_51 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_53 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_54 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_27 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_54 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_53 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n1), .B(n2), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n1) );
  CIVX2 U3 ( .A(w2), .Z(n2) );
endmodule


module Add_half_55 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_56 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_28 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_56 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_55 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_7 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_28 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_27 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_26 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_25 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX2 U3 ( .A(c_out11), .Z(n2) );
  CMX2X1 U4 ( .A0(s4), .A1(s3), .S(n4), .Z(sum2[1]) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n4) );
  CMXI2X1 U6 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX1 U8 ( .A(c_out10), .Z(n3) );
  CMX2X1 U9 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_57 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_58 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U2 ( .A(b), .Z(n2) );
  CIVXL U3 ( .A(a), .Z(n1) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U5 ( .A(a), .B(n2), .Z(n3) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_29 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_58 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_57 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_59 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_60 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CIVX1 U3 ( .A(a), .Z(n1) );
  CND2X1 U4 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U5 ( .A(n4), .B(n3), .Z(sum) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_30 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_60 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_59 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_61 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_62 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_31 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_62 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_61 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_63 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_64 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_32 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_64 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_63 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_8 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, net48475,
         net48476, net57009, net48478, net48477, n1, n2, n3;

  Add_full_32 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_31 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_30 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_29 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CMXI2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U4 ( .A0(net48478), .A1(net48477), .S(n1), .Z(c_out2) );
  CMXI2X1 U5 ( .A0(net48475), .A1(net48476), .S(c_in2), .Z(sum2[0]) );
  CMXI2XL U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(net57009) );
  CIVX2 U7 ( .A(c_out10), .Z(net48477) );
  CIVX2 U8 ( .A(c_out11), .Z(net48478) );
  CMXI2XL U9 ( .A0(n2), .A1(n3), .S(net57009), .Z(sum2[1]) );
  CIVX2 U10 ( .A(s1), .Z(net48475) );
  CIVX2 U11 ( .A(s2), .Z(net48476) );
  CIVX2 U12 ( .A(s3), .Z(n3) );
  CIVX2 U13 ( .A(s4), .Z(n2) );
endmodule


module bit4_2 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, net48484, net55470, net56894,
         net56615, net56613, n1, n2, n3, n4, n5, n6, n7;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_8 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_7 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_6 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_5 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U3 ( .A(n2), .Z(net56613) );
  CND2X2 U4 ( .A(n3), .B(net56615), .Z(sum4[3]) );
  CND2X2 U5 ( .A(net56613), .B(s44[1]), .Z(n3) );
  CANR2X1 U6 ( .A(c_in4), .B(c_out401), .C(n1), .D(c_out400), .Z(n2) );
  CND2X1 U7 ( .A(n2), .B(s43[1]), .Z(net56615) );
  CIVX2 U8 ( .A(c_in4), .Z(n1) );
  CANR2X1 U9 ( .A(c_in4), .B(c_out401), .C(n1), .D(c_out400), .Z(net55470) );
  CANR2XL U10 ( .A(c_in4), .B(c_out401), .C(n1), .D(c_out400), .Z(net48484) );
  CND2X1 U11 ( .A(s41[1]), .B(n1), .Z(n4) );
  CND2X1 U12 ( .A(s42[1]), .B(c_in4), .Z(n5) );
  CND2X1 U13 ( .A(n4), .B(n5), .Z(sum4[1]) );
  CND2X2 U14 ( .A(s44[0]), .B(net56894), .Z(n6) );
  CND2X1 U15 ( .A(net55470), .B(s43[0]), .Z(n7) );
  CND2X2 U16 ( .A(n6), .B(n7), .Z(sum4[2]) );
  CIVX2 U17 ( .A(net55470), .Z(net56894) );
  CMX2XL U18 ( .A0(c_out411), .A1(c_out410), .S(net48484), .Z(c_out4) );
  CMX2X1 U19 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
endmodule


module Add_half_65 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_66 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_33 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_66 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_65 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_67 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_68 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_34 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_68 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_67 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_69 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_70 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_35 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_70 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_69 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_71 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CND2X1 U3 ( .A(a), .B(b), .Z(n1) );
endmodule


module Add_half_72 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_36 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_72 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_71 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_9 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_36 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_35 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_34 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_33 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX2 U3 ( .A(n1), .Z(n4) );
  CIVX1 U4 ( .A(c_out11), .Z(n2) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2XL U6 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
  CIVX2 U7 ( .A(c_out10), .Z(n3) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U10 ( .A(s3), .Z(n6) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module Add_half_73 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_74 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_37 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_74 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_73 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_75 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_76 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_38 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_76 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_75 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_77 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVXL U1 ( .A(a), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(n2) );
  CAN2X1 U3 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U4 ( .A(n2), .B(b), .Z(sum) );
endmodule


module Add_half_78 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  CIVX1 U1 ( .A(n3), .Z(n1) );
  CIVX2 U2 ( .A(b), .Z(n3) );
  CIVX2 U3 ( .A(a), .Z(n2) );
  CND2X1 U4 ( .A(a), .B(n3), .Z(n4) );
  CND2X1 U5 ( .A(n2), .B(b), .Z(n5) );
  CND2X1 U6 ( .A(n4), .B(n5), .Z(sum) );
  CAN2XL U7 ( .A(a), .B(n1), .Z(c_out) );
endmodule


module Add_full_39 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_78 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_77 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_79 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(c_out) );
  CEOXL U3 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_80 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_40 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_80 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_79 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX1 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_10 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_40 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_39 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_38 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_37 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CMX2X1 U3 ( .A0(s4), .A1(s3), .S(n1), .Z(sum2[1]) );
  CMXI2X1 U4 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CIVX1 U5 ( .A(n2), .Z(n5) );
  CIVX1 U6 ( .A(s1), .Z(n4) );
  CIVXL U7 ( .A(n5), .Z(n1) );
  CMX2X1 U8 ( .A0(c_out10), .A1(c_out11), .S(n5), .Z(c_out2) );
  CIVX2 U9 ( .A(s2), .Z(n3) );
  CMXI2X1 U10 ( .A0(n4), .A1(n3), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_81 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_82 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_41 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_82 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_81 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_83 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_84 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U2 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CIVX1 U4 ( .A(b), .Z(n2) );
  CIVX1 U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_42 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_84 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_83 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_85 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_86 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_43 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_86 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_85 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_87 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVXL U1 ( .A(a), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(n2) );
  CAN2X1 U3 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U4 ( .A(b), .B(n2), .Z(sum) );
endmodule


module Add_half_88 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_44 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_88 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_87 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_11 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;

  Add_full_44 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_43 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_42 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_41 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(s2), .Z(n6) );
  CIVX2 U4 ( .A(c_out11), .Z(n5) );
  CIVX1 U5 ( .A(c_out10), .Z(n4) );
  CMXI2X1 U6 ( .A0(n4), .A1(n5), .S(n3), .Z(c_out2) );
  CAN2XL U7 ( .A(n8), .B(n9), .Z(n1) );
  CIVX2 U8 ( .A(c_in2), .Z(n2) );
  CND2X2 U9 ( .A(c_out00), .B(n2), .Z(n9) );
  CND2X2 U10 ( .A(c_out01), .B(c_in2), .Z(n8) );
  CND2X2 U11 ( .A(n9), .B(n8), .Z(n3) );
  CIVX2 U12 ( .A(s1), .Z(n7) );
  CMXI2X1 U13 ( .A0(n7), .A1(n6), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U14 ( .A(s4), .Z(n11) );
  CIVX2 U15 ( .A(s3), .Z(n10) );
  CMXI2X1 U16 ( .A0(n11), .A1(n10), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_89 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_90 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_45 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_90 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_89 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_91 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_92 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U2 ( .A(a), .Z(n2) );
  CIVX1 U3 ( .A(b), .Z(n3) );
  CND2X1 U4 ( .A(a), .B(n3), .Z(n4) );
  CND2X1 U5 ( .A(n2), .B(b), .Z(n5) );
  CND2X2 U6 ( .A(n5), .B(n4), .Z(sum) );
endmodule


module Add_full_46 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_92 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_91 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_93 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n3;

  CEOXL U1 ( .A(n1), .B(n3), .Z(sum) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CAN2X1 U3 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n3) );
endmodule


module Add_half_94 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_47 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_94 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_93 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X2 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_95 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVXL U1 ( .A(a), .Z(n1) );
  CIVXL U2 ( .A(n1), .Z(n2) );
  CAN2X1 U3 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U4 ( .A(b), .B(n2), .Z(sum) );
endmodule


module Add_half_96 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_48 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_96 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_95 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_12 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_48 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_47 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_46 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_45 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CMXI2X1 U3 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out2) );
  CMX2XL U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMX2X1 U5 ( .A0(s3), .A1(s4), .S(n7), .Z(sum2[1]) );
  CND2XL U6 ( .A(n5), .B(n6), .Z(n7) );
  CIVX2 U7 ( .A(c_out11), .Z(n4) );
  CIVX2 U8 ( .A(c_out10), .Z(n3) );
  CIVX2 U9 ( .A(c_in2), .Z(n1) );
  CND2X2 U10 ( .A(c_out00), .B(n1), .Z(n6) );
  CND2X2 U11 ( .A(c_out01), .B(c_in2), .Z(n5) );
  CND2X2 U12 ( .A(n5), .B(n6), .Z(n2) );
endmodule


module bit4_3 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_12 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_11 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_10 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_9 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX1 U3 ( .A(s44[1]), .Z(n12) );
  CIVX1 U4 ( .A(s43[1]), .Z(n11) );
  CND2X2 U5 ( .A(n6), .B(n5), .Z(n2) );
  CIVX2 U6 ( .A(c_out410), .Z(n3) );
  CND2IX1 U7 ( .B(n1), .A(c_out401), .Z(n5) );
  CND2IX1 U8 ( .B(c_in4), .A(c_out400), .Z(n6) );
  CIVX1 U9 ( .A(c_out411), .Z(n4) );
  CMXI2X1 U10 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out4) );
  CMX2X1 U11 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U12 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CND2XL U13 ( .A(n6), .B(n5), .Z(n7) );
  CIVX2 U14 ( .A(c_in4), .Z(n1) );
  CIVX2 U15 ( .A(s44[0]), .Z(n9) );
  CIVX2 U16 ( .A(s43[0]), .Z(n8) );
  CIVX2 U17 ( .A(n7), .Z(n10) );
  CMXI2X1 U18 ( .A0(n9), .A1(n8), .S(n10), .Z(sum4[2]) );
  CMXI2X1 U19 ( .A0(n12), .A1(n11), .S(n10), .Z(sum4[3]) );
endmodule


module Add_half_97 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_98 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_49 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_98 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_97 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_99 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_100 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_50 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_100 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_99 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_101 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_102 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_51 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_102 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_101 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_103 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n3;

  CNIVXL U1 ( .A(a), .Z(n1) );
  CENX1 U2 ( .A(n1), .B(n3), .Z(sum) );
  CAN2X1 U3 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n3) );
endmodule


module Add_half_104 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CND2XL U2 ( .A(n1), .B(b), .Z(n4) );
  CIVX1 U3 ( .A(a), .Z(n1) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_52 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_104 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_103 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_13 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_52 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_51 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_50 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_49 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(c_out2) );
  CND2X1 U4 ( .A(c_out10), .B(n1), .Z(n3) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMX2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CND2X1 U7 ( .A(c_out11), .B(n2), .Z(n4) );
  CMX2XL U8 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U9 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_105 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_106 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_53 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_106 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_105 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_107 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_108 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_54 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_108 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_107 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_109 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_110 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CND2IXL U1 ( .B(a), .A(b), .Z(n3) );
  CND2XL U2 ( .A(a), .B(n1), .Z(n2) );
  CND2X1 U3 ( .A(n2), .B(n3), .Z(sum) );
  CIVXL U4 ( .A(b), .Z(n1) );
  CAN2XL U5 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_55 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_110 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_109 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_111 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_112 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_56 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_112 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_111 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_14 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_56 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_55 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_54 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_53 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CND2X1 U3 ( .A(c_out10), .B(n1), .Z(n2) );
  CMXI2X1 U4 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMX2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n4) );
  CND2X2 U6 ( .A(c_out11), .B(n4), .Z(n3) );
  CND2X2 U7 ( .A(n2), .B(n3), .Z(c_out2) );
  CIVX1 U8 ( .A(s2), .Z(n5) );
  CIVX1 U9 ( .A(s1), .Z(n6) );
  CIVXL U10 ( .A(s3), .Z(n8) );
  CMXI2XL U11 ( .A0(n8), .A1(n7), .S(n4), .Z(sum2[1]) );
  CMXI2X1 U12 ( .A0(n6), .A1(n5), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U13 ( .A(s4), .Z(n7) );
endmodule


module Add_half_113 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_114 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_57 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_114 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_113 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_115 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_116 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_58 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_116 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_115 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_117 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(b), .B(a), .Z(n1) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_118 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_59 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_118 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_117 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_119 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CEOXL U1 ( .A(n1), .B(n3), .Z(sum) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CND2X2 U3 ( .A(a), .B(b), .Z(n2) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
  CIVX2 U5 ( .A(b), .Z(n3) );
endmodule


module Add_half_120 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX2 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_60 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_120 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_119 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_15 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_60 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_59 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_58 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_57 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CMXI2X1 U3 ( .A0(n4), .A1(n5), .S(n3), .Z(c_out2) );
  CMX2XL U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CAN2XL U5 ( .A(n7), .B(n6), .Z(n1) );
  CIVX2 U6 ( .A(c_out11), .Z(n5) );
  CIVX2 U7 ( .A(c_out10), .Z(n4) );
  CIVX2 U8 ( .A(c_in2), .Z(n2) );
  CND2X2 U9 ( .A(c_out00), .B(n2), .Z(n7) );
  CND2X2 U10 ( .A(c_out01), .B(c_in2), .Z(n6) );
  CND2X2 U11 ( .A(n7), .B(n6), .Z(n3) );
  CIVX2 U12 ( .A(s4), .Z(n9) );
  CIVX2 U13 ( .A(s3), .Z(n8) );
  CMXI2X1 U14 ( .A0(n9), .A1(n8), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_121 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_122 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_61 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_122 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_121 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_123 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_124 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_62 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_124 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_123 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_125 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CND2X1 U1 ( .A(a), .B(b), .Z(n3) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CIVX1 U3 ( .A(n1), .Z(n2) );
  CEOXL U4 ( .A(b), .B(n2), .Z(sum) );
  CIVX2 U5 ( .A(n3), .Z(c_out) );
endmodule


module Add_half_126 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX2 U1 ( .A(b), .Z(n2) );
  CENX1 U2 ( .A(n2), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_63 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_126 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_125 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_127 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_128 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX2 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_64 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_128 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_127 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_16 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_64 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_63 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_62 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_61 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(s1), .Z(n6) );
  CMXI2X1 U4 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out2) );
  CMX2X1 U5 ( .A0(s3), .A1(s4), .S(n9), .Z(sum2[1]) );
  CND2XL U6 ( .A(n7), .B(n8), .Z(n9) );
  CIVX2 U7 ( .A(c_out11), .Z(n4) );
  CIVX2 U8 ( .A(c_out10), .Z(n3) );
  CIVX2 U9 ( .A(c_in2), .Z(n1) );
  CND2X2 U10 ( .A(c_out00), .B(n1), .Z(n8) );
  CND2X2 U11 ( .A(c_out01), .B(c_in2), .Z(n7) );
  CND2X2 U12 ( .A(n8), .B(n7), .Z(n2) );
  CIVX2 U13 ( .A(s2), .Z(n5) );
  CMXI2X1 U14 ( .A0(n6), .A1(n5), .S(c_in2), .Z(sum2[0]) );
endmodule


module bit4_4 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_16 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_15 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_14 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_13 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVXL U3 ( .A(s44[1]), .Z(n12) );
  CND2X2 U4 ( .A(n6), .B(n5), .Z(n2) );
  CIVXL U5 ( .A(s43[1]), .Z(n11) );
  CIVX1 U6 ( .A(n7), .Z(n10) );
  CND2IX1 U7 ( .B(n1), .A(c_out401), .Z(n5) );
  CIVX2 U8 ( .A(c_out411), .Z(n4) );
  CIVX2 U9 ( .A(c_out410), .Z(n3) );
  CMXI2X1 U10 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out4) );
  CMX2X1 U11 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U12 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CND2XL U13 ( .A(n6), .B(n5), .Z(n7) );
  CND2IX1 U14 ( .B(c_in4), .A(c_out400), .Z(n6) );
  CIVX2 U15 ( .A(c_in4), .Z(n1) );
  CIVX2 U16 ( .A(s44[0]), .Z(n9) );
  CIVX2 U17 ( .A(s43[0]), .Z(n8) );
  CMXI2X1 U18 ( .A0(n9), .A1(n8), .S(n10), .Z(sum4[2]) );
  CMXI2X1 U19 ( .A0(n12), .A1(n11), .S(n10), .Z(sum4[3]) );
endmodule


module bit8_1 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, net48815, net48816, net55363,
         net56299, net56366, net56367, net56103, net56101, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_4 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_3 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_2 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4({b8[7], n9, n6, 
        b8[4]}), .c_in4(1'b0) );
  bit4_1 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4({b8[7], n9, n6, 
        b8[4]}), .c_in4(1'b1) );
  CND2IX2 U3 ( .B(n3), .A(s84[3]), .Z(net56366) );
  CND2X2 U4 ( .A(n4), .B(net56103), .Z(sum8[6]) );
  CNIVX3 U5 ( .A(b8[6]), .Z(n9) );
  CIVX2 U6 ( .A(n7), .Z(n8) );
  CIVX1 U7 ( .A(s81[2]), .Z(n17) );
  CMXI2X1 U8 ( .A0(n15), .A1(n14), .S(n8), .Z(sum8[1]) );
  CMXI2X1 U9 ( .A0(n13), .A1(n12), .S(n8), .Z(sum8[0]) );
  CIVX1 U10 ( .A(s82[2]), .Z(n16) );
  CIVX1 U11 ( .A(s81[3]), .Z(n19) );
  CMXI2X1 U12 ( .A0(n19), .A1(n18), .S(n8), .Z(sum8[3]) );
  CMXI2X1 U13 ( .A0(n17), .A1(n16), .S(n8), .Z(sum8[2]) );
  CIVX1 U14 ( .A(b8[5]), .Z(n5) );
  CND2X2 U15 ( .A(s83[3]), .B(n3), .Z(net56367) );
  CND2X2 U16 ( .A(net56366), .B(net56367), .Z(sum8[7]) );
  CMXI2X1 U17 ( .A0(s84[0]), .A1(s83[0]), .S(net55363), .Z(n1) );
  CIVX1 U18 ( .A(n1), .Z(sum8[4]) );
  CMXI2X1 U19 ( .A0(s84[1]), .A1(s83[1]), .S(net55363), .Z(n2) );
  CIVX1 U20 ( .A(n2), .Z(sum8[5]) );
  CND2X2 U21 ( .A(s83[2]), .B(n3), .Z(net56103) );
  CND2X1 U22 ( .A(s84[2]), .B(net56101), .Z(n4) );
  CIVX2 U23 ( .A(n3), .Z(net56101) );
  CIVXL U24 ( .A(net56101), .Z(net56299) );
  CAN2X2 U25 ( .A(net48815), .B(net48816), .Z(n3) );
  CAN2X2 U26 ( .A(net48815), .B(net48816), .Z(net55363) );
  CIVX4 U27 ( .A(n5), .Z(n6) );
  CIVXL U28 ( .A(c_in8), .Z(n7) );
  CIVX1 U29 ( .A(s82[3]), .Z(n18) );
  CND2IX1 U30 ( .B(c_in8), .A(c_out800), .Z(net48815) );
  CND2X1 U31 ( .A(c_out801), .B(c_in8), .Z(net48816) );
  CMXI2XL U32 ( .A0(n11), .A1(n10), .S(net56299), .Z(c_out8) );
  CIVX2 U33 ( .A(c_out811), .Z(n11) );
  CIVX2 U34 ( .A(c_out810), .Z(n10) );
  CIVX2 U35 ( .A(s81[0]), .Z(n13) );
  CIVX2 U36 ( .A(s82[0]), .Z(n12) );
  CIVX2 U37 ( .A(s81[1]), .Z(n15) );
  CIVX2 U38 ( .A(s82[1]), .Z(n14) );
endmodule


module Add_half_129 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_130 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_65 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_130 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_129 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_131 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_132 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_66 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_132 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_131 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_133 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_134 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U4 ( .A(a), .B(n2), .Z(n3) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_67 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_134 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_133 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_135 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_136 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(a), .Z(n1) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_68 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_136 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_135 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_17 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_68 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_67 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_66 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_65 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVXL U3 ( .A(n1), .Z(n2) );
  CMX2X1 U4 ( .A0(c_out11), .A1(c_out10), .S(n1), .Z(c_out2) );
  CMX2XL U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2XL U6 ( .A0(n4), .A1(n3), .S(n2), .Z(sum2[1]) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(s3), .Z(n4) );
  CIVX2 U9 ( .A(s4), .Z(n3) );
endmodule


module Add_half_137 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_138 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_69 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_138 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_137 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_139 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_140 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_70 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_140 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_139 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_141 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_142 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_71 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_142 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_141 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_143 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_144 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_72 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_144 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_143 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_18 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_72 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_71 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_70 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_69 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CMX2XL U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMX2X1 U4 ( .A0(c_out11), .A1(c_out10), .S(n2), .Z(c_out2) );
  CMXI2XL U5 ( .A0(n6), .A1(n5), .S(n1), .Z(sum2[1]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CIVX2 U7 ( .A(s1), .Z(n4) );
  CIVX2 U8 ( .A(s2), .Z(n3) );
  CMXI2X1 U9 ( .A0(n4), .A1(n3), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U10 ( .A(s3), .Z(n6) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module Add_half_145 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENX1 U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_146 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX3 U1 ( .A(a), .Z(n1) );
  CND2X2 U2 ( .A(n3), .B(n4), .Z(sum) );
  CND2X2 U3 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U4 ( .A(a), .B(n2), .Z(n3) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_73 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_146 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_145 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_147 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_148 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX1 U1 ( .A(a), .Z(n1) );
  CND2X1 U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X2 U3 ( .A(n1), .B(b), .Z(n4) );
  CND2X2 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_74 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_148 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_147 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_149 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_150 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_75 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_150 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_149 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX1 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_151 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_152 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_76 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_152 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_151 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_19 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_76 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_75 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_74 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_73 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n1) );
  CIVX1 U4 ( .A(s4), .Z(n8) );
  CMXI2X1 U5 ( .A0(n9), .A1(n8), .S(n2), .Z(sum2[1]) );
  CMXI2X1 U6 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n3) );
  CMX2XL U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CIVX1 U8 ( .A(s2), .Z(n6) );
  CIVX1 U9 ( .A(s1), .Z(n7) );
  CIVX2 U10 ( .A(c_out11), .Z(n4) );
  CMXI2X1 U11 ( .A0(n4), .A1(n5), .S(n3), .Z(c_out2) );
  CIVX2 U12 ( .A(c_out10), .Z(n5) );
  CMXI2X1 U13 ( .A0(n7), .A1(n6), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U14 ( .A(s3), .Z(n9) );
endmodule


module Add_half_153 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_154 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_77 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_154 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_153 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_155 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_156 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_78 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_156 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_155 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_157 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_158 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVXL U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(n1), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_79 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_158 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_157 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_159 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_160 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CENX1 U1 ( .A(a), .B(n1), .Z(sum) );
  CIVX1 U2 ( .A(b), .Z(n1) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_80 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_160 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_159 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_20 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n2, n3, n4, n5,
         n6, n7, n8;

  Add_full_80 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_79 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_78 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_77 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n2) );
  CMXI2X1 U4 ( .A0(n4), .A1(n5), .S(n3), .Z(c_out2) );
  CIVDXL U5 ( .A(n3), .Z0(n6) );
  CIVX1 U6 ( .A(c_out10), .Z(n5) );
  CMXI2X1 U7 ( .A0(c_out01), .A1(c_out00), .S(n2), .Z(n3) );
  CMX2X1 U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(c_out11), .Z(n4) );
  CIVX2 U10 ( .A(s3), .Z(n8) );
  CIVX2 U11 ( .A(s4), .Z(n7) );
  CMXI2X1 U12 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
endmodule


module bit4_5 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_20 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_19 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_18 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_17 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVXL U3 ( .A(c_out401), .Z(n1) );
  CIVXL U4 ( .A(n1), .Z(n2) );
  CANR2X1 U5 ( .A(c_out400), .B(n5), .C(c_in4), .D(c_out401), .Z(n8) );
  CANR2XL U6 ( .A(n5), .B(c_out400), .C(c_in4), .D(n2), .Z(n3) );
  CANR2XL U7 ( .A(n5), .B(c_out400), .C(c_in4), .D(n2), .Z(n4) );
  CIVX1 U8 ( .A(c_out411), .Z(n7) );
  CMX2XL U9 ( .A0(s44[1]), .A1(s43[1]), .S(n3), .Z(sum4[3]) );
  CMX2XL U10 ( .A0(s44[0]), .A1(s43[0]), .S(n4), .Z(sum4[2]) );
  CMX2X1 U11 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMX2X1 U12 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CIVX1 U13 ( .A(c_out410), .Z(n6) );
  CIVX2 U14 ( .A(c_in4), .Z(n5) );
  CMXI2X1 U15 ( .A0(n7), .A1(n6), .S(n8), .Z(c_out4) );
endmodule


module Add_half_161 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_162 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n3), .B(n4), .Z(sum) );
  CND2X1 U2 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CIVX2 U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_81 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_162 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_161 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_163 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_164 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CND2X2 U2 ( .A(n1), .B(b), .Z(n4) );
  CND2X2 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVX2 U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_82 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_164 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_163 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_165 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CENXL U3 ( .A(a), .B(n2), .Z(sum) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_166 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_83 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_166 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_165 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_167 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_168 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X2 U1 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_84 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_168 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_167 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_21 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_84 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_83 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_82 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_81 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX1 U3 ( .A(c_out10), .Z(n3) );
  CIVX1 U4 ( .A(c_out11), .Z(n2) );
  CIVXL U5 ( .A(s3), .Z(n6) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2XL U7 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U9 ( .A(n1), .Z(n4) );
  CMXI2X1 U10 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module Add_half_169 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_170 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_85 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_170 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_169 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_171 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_172 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_86 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_172 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_171 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_173 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_174 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_87 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_174 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_173 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_175 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_176 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n3), .B(n4), .Z(sum) );
  CND2X1 U2 ( .A(n1), .B(b), .Z(n4) );
  CIVX1 U3 ( .A(a), .Z(n1) );
  CND2XL U4 ( .A(a), .B(n2), .Z(n3) );
  CAN2XL U5 ( .A(a), .B(b), .Z(c_out) );
  CIVXL U6 ( .A(b), .Z(n2) );
endmodule


module Add_full_88 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_176 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_175 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_22 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_88 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_87 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_86 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_85 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CMXI2X1 U3 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
  CIVXL U4 ( .A(n1), .Z(n4) );
  CMX2X1 U5 ( .A0(c_out11), .A1(c_out10), .S(n1), .Z(c_out2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(s1), .Z(n3) );
  CIVX2 U8 ( .A(s2), .Z(n2) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U10 ( .A(s3), .Z(n6) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module Add_half_177 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_178 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_89 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_178 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_177 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_179 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_180 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_90 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_180 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_179 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_181 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_182 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_91 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_182 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_181 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_183 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_184 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CENX1 U1 ( .A(a), .B(n1), .Z(sum) );
  CIVX1 U2 ( .A(b), .Z(n1) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_92 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_184 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_183 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX1 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_23 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_92 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_91 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_90 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_89 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVXL U3 ( .A(n1), .Z(n4) );
  CMXI2X1 U4 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out2) );
  CMXI2XL U5 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out10), .Z(n3) );
  CIVX2 U8 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U9 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U10 ( .A(s3), .Z(n6) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module Add_half_185 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_186 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_93 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_186 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_185 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_187 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_188 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_94 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_188 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_187 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_189 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_190 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_95 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_190 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_189 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_191 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_192 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_96 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_192 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_191 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_24 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n2, n3, n4, n5,
         n6, n7;

  Add_full_96 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(1'b0) );
  Add_full_95 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_94 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_93 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CMXI2X1 U3 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out2) );
  CIVDXL U4 ( .A(n2), .Z0(n7) );
  CIVX1 U5 ( .A(s2), .Z(n5) );
  CIVX1 U6 ( .A(s1), .Z(n6) );
  CMX2XL U7 ( .A0(s3), .A1(s4), .S(n7), .Z(sum2[1]) );
  CIVX2 U8 ( .A(c_out10), .Z(n4) );
  CIVX2 U9 ( .A(c_out11), .Z(n3) );
  CMXI2X1 U10 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(c_in2), .Z(sum2[0]) );
endmodule


module bit4_6 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_24 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_23 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_22 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_21 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2X1 U3 ( .A0(s44[1]), .A1(s43[1]), .S(n2), .Z(sum4[3]) );
  CANR2X1 U4 ( .A(c_out400), .B(n3), .C(c_in4), .D(c_out401), .Z(n8) );
  CIVX1 U5 ( .A(c_out411), .Z(n5) );
  CANR2XL U6 ( .A(n3), .B(c_out400), .C(c_in4), .D(c_out401), .Z(n1) );
  CANR2XL U7 ( .A(n3), .B(c_out400), .C(c_in4), .D(c_out401), .Z(n2) );
  CMX2X1 U8 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U9 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX1 U10 ( .A(c_out410), .Z(n4) );
  CMXI2XL U11 ( .A0(n7), .A1(n6), .S(n1), .Z(sum4[2]) );
  CIVX2 U12 ( .A(c_in4), .Z(n3) );
  CMXI2X1 U13 ( .A0(n5), .A1(n4), .S(n8), .Z(c_out4) );
  CIVX2 U14 ( .A(s44[0]), .Z(n7) );
  CIVX2 U15 ( .A(s43[0]), .Z(n6) );
endmodule


module Add_half_193 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_194 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_97 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_194 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_193 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_195 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_196 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_98 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_196 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_195 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_197 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_198 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_99 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_198 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_197 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_199 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_200 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(n1), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_100 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_200 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_199 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_25 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_100 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_99 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(1'b1) );
  Add_full_98 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(1'b0) );
  Add_full_97 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(1'b1) );
  CIVX2 U3 ( .A(n2), .Z(n7) );
  CIVX2 U4 ( .A(c_in2), .Z(n1) );
  CMXI2X1 U5 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n2) );
  CMXI2XL U6 ( .A0(n9), .A1(n8), .S(n7), .Z(sum2[1]) );
  CIVX2 U7 ( .A(c_out10), .Z(n4) );
  CIVX2 U8 ( .A(c_out11), .Z(n3) );
  CMXI2X1 U9 ( .A0(n4), .A1(n3), .S(n7), .Z(c_out2) );
  CIVX2 U10 ( .A(s1), .Z(n6) );
  CIVX2 U11 ( .A(s2), .Z(n5) );
  CMXI2X1 U12 ( .A0(n6), .A1(n5), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U13 ( .A(s3), .Z(n9) );
  CIVX2 U14 ( .A(s4), .Z(n8) );
endmodule


module Add_half_201 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
  CENX1 U4 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_202 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U2 ( .A(a), .B(n2), .Z(sum) );
  CIVXL U3 ( .A(b), .Z(n2) );
endmodule


module Add_full_101 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_202 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_201 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_203 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_204 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_102 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_204 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_203 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_205 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_206 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_103 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_206 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_205 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_207 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_208 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_104 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_208 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_207 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_26 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_104 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_103 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_102 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_101 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out2) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U9 ( .A(n1), .Z(n4) );
endmodule


module Add_half_209 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_210 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENXL U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_105 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_210 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_209 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_211 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_212 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CENXL U1 ( .A(a), .B(n1), .Z(sum) );
  CIVX2 U2 ( .A(b), .Z(n1) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_106 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_212 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_211 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_213 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_214 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_107 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_214 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_213 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_215 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_216 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_108 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_216 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_215 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_27 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_108 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_107 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_106 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_105 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out11), .Z(n2) );
  CIVX2 U4 ( .A(c_out10), .Z(n3) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U6 ( .A(n1), .Z(n6) );
  CMXI2X1 U7 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U8 ( .A(s1), .Z(n5) );
  CIVX2 U9 ( .A(s2), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(s3), .Z(n8) );
  CIVX2 U12 ( .A(s4), .Z(n7) );
  CMXI2X1 U13 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
endmodule


module Add_half_217 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_218 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENXL U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_109 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_218 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_217 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_219 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_220 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_110 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_220 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_219 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_221 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_222 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_111 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_222 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_221 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_223 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_224 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_112 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_224 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_223 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_28 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_112 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_111 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_110 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_109 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out11), .Z(n2) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVXL U5 ( .A(s2), .Z(n4) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n6) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U10 ( .A(s1), .Z(n5) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module bit4_7 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_28 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_27 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_26 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_25 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U3 ( .A(c_in4), .Z(n1) );
  CMXI2X1 U4 ( .A0(c_out401), .A1(c_out400), .S(n1), .Z(n2) );
  CIVX1 U5 ( .A(c_out410), .Z(n4) );
  CIVX1 U6 ( .A(c_out411), .Z(n3) );
  CMX2XL U7 ( .A0(s43[1]), .A1(s44[1]), .S(n5), .Z(sum4[3]) );
  CMX2XL U8 ( .A0(s43[0]), .A1(s44[0]), .S(n5), .Z(sum4[2]) );
  CMX2X1 U9 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U10 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U11 ( .A(n2), .Z(n5) );
  CMXI2X1 U12 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out4) );
endmodule


module Add_half_225 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_226 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_113 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_226 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_225 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_227 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_228 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_114 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_228 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_227 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_229 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_230 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVXL U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(n1), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_115 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_230 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_229 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_231 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_232 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVXL U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(n1), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_116 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_232 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_231 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_29 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_116 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_115 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_114 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_113 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out01), .A1(c_out00), .S(n3), .Z(n1) );
  CMX2X1 U4 ( .A0(c_out01), .A1(c_out00), .S(n3), .Z(n2) );
  CIVX2 U5 ( .A(c_in2), .Z(n3) );
  CMXI2XL U6 ( .A0(n9), .A1(n8), .S(n2), .Z(sum2[1]) );
  CIVX1 U7 ( .A(s4), .Z(n8) );
  CIVX1 U8 ( .A(c_out10), .Z(n5) );
  CIVX2 U9 ( .A(c_out11), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(n1), .Z(c_out2) );
  CIVX2 U11 ( .A(s1), .Z(n7) );
  CIVX2 U12 ( .A(s2), .Z(n6) );
  CMXI2X1 U13 ( .A0(n7), .A1(n6), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U14 ( .A(s3), .Z(n9) );
endmodule


module Add_half_233 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_234 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_117 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_234 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_233 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_235 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_236 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_118 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_236 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_235 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_237 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_238 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVXL U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(n1), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_119 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_238 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_237 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_239 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_240 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX2 U1 ( .A(a), .Z(n1) );
  CND2X1 U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X2 U3 ( .A(n1), .B(b), .Z(n4) );
  CND2X2 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVX2 U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_120 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_240 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_239 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_30 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_120 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_119 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_118 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_117 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(n1), .Z(n4) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_241 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_242 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_121 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_242 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_241 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_243 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_244 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_122 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_244 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_243 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_245 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_246 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_123 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_246 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_245 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_247 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_248 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_124 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_248 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_247 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_31 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_124 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_123 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_122 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_121 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_out10), .Z(n3) );
  CIVX2 U4 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U6 ( .A(n1), .Z(n6) );
  CMXI2X1 U7 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U8 ( .A(s1), .Z(n5) );
  CIVX2 U9 ( .A(s2), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(s3), .Z(n8) );
  CIVX2 U12 ( .A(s4), .Z(n7) );
  CMXI2X1 U13 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
endmodule


module Add_half_249 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_250 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_125 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_250 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_249 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_251 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_252 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENXL U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_126 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_252 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_251 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_253 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_254 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_127 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_254 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_253 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_255 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_256 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_128 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_256 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_255 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_32 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_128 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_127 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_126 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_125 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n5), .Z(sum2[0]) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CIVX2 U4 ( .A(c_out10), .Z(n3) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U10 ( .A(c_in2), .Z(n5) );
endmodule


module bit4_8 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_32 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_31 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_30 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_29 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX1 U3 ( .A(c_out410), .Z(n3) );
  CMX2XL U4 ( .A0(s43[1]), .A1(s44[1]), .S(n4), .Z(sum4[3]) );
  CMX2XL U5 ( .A0(s43[0]), .A1(s44[0]), .S(n4), .Z(sum4[2]) );
  CMX2X1 U6 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U7 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX1 U8 ( .A(c_out411), .Z(n2) );
  CMXI2X1 U9 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U10 ( .A(n1), .Z(n4) );
  CMXI2X1 U11 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out4) );
endmodule


module bit8_2 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_8 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_7 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_6 A83 ( .sum4(s83), .c_out4(c_out810), .a4({n2, a8[6], n8, a8[4]}), 
        .b4(b8[7:4]), .c_in4(1'b0) );
  bit4_5 A84 ( .sum4(s84), .c_out4(c_out811), .a4({n2, a8[6], n8, a8[4]}), 
        .b4(b8[7:4]), .c_in4(1'b1) );
  CIVX1 U3 ( .A(n9), .Z(n16) );
  CIVX4 U4 ( .A(a8[7]), .Z(n1) );
  CIVX8 U5 ( .A(n1), .Z(n2) );
  CIVX2 U6 ( .A(c_in8), .Z(n6) );
  CIVX2 U7 ( .A(n4), .Z(n5) );
  CIVX2 U8 ( .A(s83[3]), .Z(n18) );
  CIVX1 U9 ( .A(s84[1]), .Z(n12) );
  CIVX1 U10 ( .A(s84[3]), .Z(n17) );
  CIVX1 U11 ( .A(s84[2]), .Z(n14) );
  CMXI2X1 U12 ( .A0(n18), .A1(n17), .S(n5), .Z(sum8[7]) );
  CIVXL U13 ( .A(s83[2]), .Z(n15) );
  CMXI2X1 U14 ( .A0(n15), .A1(n14), .S(n5), .Z(sum8[6]) );
  CIVX2 U15 ( .A(a8[5]), .Z(n7) );
  CMXI2X1 U16 ( .A0(n13), .A1(n12), .S(n5), .Z(sum8[5]) );
  CMXI2XL U17 ( .A0(c_out801), .A1(c_out800), .S(n6), .Z(n3) );
  CIVXL U18 ( .A(n16), .Z(n4) );
  CMXI2X1 U19 ( .A0(c_out801), .A1(c_out800), .S(n6), .Z(n9) );
  CIVX4 U20 ( .A(n7), .Z(n8) );
  CND2IX1 U21 ( .B(n16), .A(c_out810), .Z(n11) );
  CMX2XL U22 ( .A0(s83[0]), .A1(s84[0]), .S(n16), .Z(sum8[4]) );
  CMX2X1 U23 ( .A0(s81[3]), .A1(s82[3]), .S(c_in8), .Z(sum8[3]) );
  CMX2X1 U24 ( .A0(s81[2]), .A1(s82[2]), .S(c_in8), .Z(sum8[2]) );
  CMX2X1 U25 ( .A0(s81[1]), .A1(s82[1]), .S(c_in8), .Z(sum8[1]) );
  CMX2X1 U26 ( .A0(s81[0]), .A1(s82[0]), .S(c_in8), .Z(sum8[0]) );
  CND2IX1 U27 ( .B(n3), .A(c_out811), .Z(n10) );
  CND2X2 U28 ( .A(n11), .B(n10), .Z(c_out8) );
  CIVX2 U29 ( .A(s83[1]), .Z(n13) );
endmodule


module bit16_1 ( a16, b16, sum16, c_out16, c_in16 );
  input [15:0] a16;
  input [15:0] b16;
  output [15:0] sum16;
  input c_in16;
  output c_out16;
  wire   c1, n1, n2;

  bit8_2 A161 ( .sum8(sum16[7:0]), .c_out8(c1), .a8(a16[7:0]), .b8(b16[7:0]), 
        .c_in8(c_in16) );
  bit8_1 A162 ( .sum8(sum16[15:8]), .c_out8(c_out16), .a8(a16[15:8]), .b8({n2, 
        b16[14:9], n1}), .c_in8(c1) );
  CNIVX4 U1 ( .A(b16[8]), .Z(n1) );
  CNIVX4 U2 ( .A(b16[15]), .Z(n2) );
endmodule


module Add_half_257 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n1) );
  CENX1 U3 ( .A(a), .B(n1), .Z(sum) );
endmodule


module Add_half_258 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_129 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_258 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_257 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_259 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_260 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_130 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_260 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_259 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_261 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_262 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_131 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_262 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_261 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_263 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_264 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_132 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_264 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_263 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_33 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_132 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_131 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_130 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_129 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out10), .A1(c_out11), .S(n4), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U6 ( .A(n1), .Z(n4) );
  CIVX2 U7 ( .A(s1), .Z(n3) );
  CIVX2 U8 ( .A(s2), .Z(n2) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_265 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_266 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_133 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_266 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_265 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_267 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_268 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_134 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_268 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_267 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_269 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_270 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_135 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_270 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_269 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_271 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_272 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_136 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_272 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_271 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVXL U2 ( .A(n1), .Z(c_out) );
endmodule


module bit2_34 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_136 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_135 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_134 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_133 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX1 U5 ( .A(s3), .Z(n4) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
  CIVX2 U8 ( .A(s4), .Z(n3) );
  CMXI2X1 U9 ( .A0(n4), .A1(n3), .S(n2), .Z(sum2[1]) );
endmodule


module Add_half_273 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_274 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_137 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_274 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_273 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_275 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_276 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_138 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_276 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_275 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_277 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_278 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_139 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_278 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_277 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_279 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_280 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_140 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_280 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_279 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_35 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_140 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_139 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_138 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_137 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U4 ( .A(n1), .Z(n4) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out10), .Z(n3) );
  CIVX2 U8 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_281 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_282 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_141 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_282 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_281 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_283 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_284 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_142 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_284 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_283 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_285 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_286 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CND2X1 U2 ( .A(a), .B(n2), .Z(n3) );
  CIVX1 U3 ( .A(a), .Z(n1) );
  CND2XL U4 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U5 ( .A(n3), .B(n4), .Z(sum) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_143 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_286 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_285 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_287 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_288 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_144 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_288 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_287 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_36 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_144 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_143 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_142 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_141 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n1) );
  CIVX1 U4 ( .A(n2), .Z(n5) );
  CMXI2X1 U5 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n2) );
  CMX2XL U6 ( .A0(s3), .A1(s4), .S(n5), .Z(sum2[1]) );
  CMX2X1 U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U8 ( .A(c_out10), .Z(n4) );
  CIVX2 U9 ( .A(c_out11), .Z(n3) );
  CMXI2X1 U10 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out2) );
endmodule


module bit4_9 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_36 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_35 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_34 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_33 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2XL U3 ( .A0(s43[1]), .A1(s44[1]), .S(n4), .Z(sum4[3]) );
  CND2X1 U4 ( .A(c_out400), .B(n1), .Z(n2) );
  CND2X1 U5 ( .A(c_out401), .B(c_in4), .Z(n3) );
  CND2X2 U6 ( .A(n2), .B(n3), .Z(n4) );
  CIVX2 U7 ( .A(c_in4), .Z(n1) );
  CIVX1 U8 ( .A(s42[1]), .Z(n5) );
  CIVX1 U9 ( .A(s41[1]), .Z(n6) );
  CMX2XL U10 ( .A0(c_out410), .A1(c_out411), .S(n4), .Z(c_out4) );
  CMX2X1 U11 ( .A0(s43[0]), .A1(s44[0]), .S(n4), .Z(sum4[2]) );
  CMX2X1 U12 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMXI2X1 U13 ( .A0(n6), .A1(n5), .S(c_in4), .Z(sum4[1]) );
endmodule


module Add_half_289 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_290 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_145 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_290 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_289 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_291 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_292 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_146 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_292 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_291 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_293 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_294 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_147 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_294 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_293 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVXL U2 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_295 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_296 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_148 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_296 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_295 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_37 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_148 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_147 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_146 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_145 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out10), .A1(c_out11), .S(n4), .Z(c_out2) );
  CMXI2X1 U4 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U5 ( .A(n1), .Z(n4) );
  CIVX2 U6 ( .A(s1), .Z(n3) );
  CIVX2 U7 ( .A(s2), .Z(n2) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_297 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n1) );
  CENX1 U3 ( .A(a), .B(n1), .Z(sum) );
endmodule


module Add_half_298 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_149 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_298 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_297 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_299 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_300 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_150 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_300 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_299 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_301 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_302 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_151 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_302 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_301 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_303 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_304 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_152 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_304 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_303 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVXL U2 ( .A(n1), .Z(c_out) );
endmodule


module bit2_38 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_152 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_151 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_150 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_149 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
endmodule


module Add_half_305 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_306 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_153 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_306 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_305 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_307 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_308 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_154 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_308 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_307 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_309 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CNIVXL U1 ( .A(a), .Z(n1) );
  CEOXL U2 ( .A(b), .B(n1), .Z(sum) );
  CAN2X1 U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_310 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_155 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_310 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_309 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_311 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_312 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X2 U1 ( .A(a), .B(n2), .Z(n3) );
  CIVX1 U2 ( .A(b), .Z(n2) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVX1 U4 ( .A(a), .Z(n1) );
  CND2XL U5 ( .A(n1), .B(b), .Z(n4) );
  CAN2XL U6 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_156 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_312 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_311 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_39 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_156 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_155 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_154 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_153 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(n1), .Z(n6) );
  CIVXL U4 ( .A(s2), .Z(n4) );
  CIVXL U5 ( .A(s4), .Z(n7) );
  CIVXL U6 ( .A(s3), .Z(n8) );
  CMXI2XL U7 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
  CIVX2 U8 ( .A(c_out10), .Z(n3) );
  CIVX2 U9 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U10 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U11 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U12 ( .A(s1), .Z(n5) );
  CMXI2X1 U13 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_313 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_314 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_157 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_314 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_313 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_315 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_316 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_158 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_316 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_315 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_317 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_318 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_159 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_318 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_317 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_319 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_320 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_160 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_320 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_319 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_40 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_160 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_159 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_158 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_157 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n1) );
  CIVX2 U4 ( .A(n2), .Z(n5) );
  CIVX1 U5 ( .A(c_out10), .Z(n4) );
  CMXI2X1 U6 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n2) );
  CMX2XL U7 ( .A0(s3), .A1(s4), .S(n5), .Z(sum2[1]) );
  CMX2X1 U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(c_out11), .Z(n3) );
  CMXI2X1 U10 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out2) );
endmodule


module bit4_10 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_40 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_39 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_38 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_37 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CND2X2 U3 ( .A(c_out401), .B(c_in4), .Z(n3) );
  CND2X1 U4 ( .A(c_out400), .B(n1), .Z(n2) );
  CND2X2 U5 ( .A(n2), .B(n3), .Z(n4) );
  CIVX2 U6 ( .A(c_in4), .Z(n1) );
  CMX2X1 U7 ( .A0(s43[1]), .A1(s44[1]), .S(n4), .Z(sum4[3]) );
  CMX2XL U8 ( .A0(c_out410), .A1(c_out411), .S(n4), .Z(c_out4) );
  CMX2X1 U9 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U10 ( .A0(s43[0]), .A1(s44[0]), .S(n4), .Z(sum4[2]) );
  CMX2X1 U11 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
endmodule


module Add_half_321 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_322 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_161 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_322 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_321 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_323 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_324 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_162 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_324 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_323 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_325 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_326 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_163 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_326 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_325 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_327 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CNIVXL U1 ( .A(a), .Z(n1) );
  CEOXL U2 ( .A(b), .B(n1), .Z(sum) );
  CAN2X1 U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_328 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_164 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_328 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_327 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_41 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_164 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_163 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_162 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_161 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n1), .Z(n4) );
  CIVX1 U4 ( .A(c_out10), .Z(n3) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_329 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_330 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_165 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_330 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_329 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_331 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_332 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_166 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_332 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_331 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_333 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_334 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_167 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_334 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_333 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_335 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_336 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_168 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_336 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_335 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_42 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_168 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_167 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_166 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_165 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_337 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_338 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_169 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_338 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_337 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_339 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_340 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_170 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_340 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_339 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_341 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_342 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_171 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_342 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_341 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_343 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_344 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_172 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_344 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_343 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_43 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_172 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_171 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_170 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_169 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVXL U3 ( .A(n1), .Z(n4) );
  CMXI2X1 U4 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out2) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out10), .Z(n3) );
  CIVX2 U8 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U9 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
endmodule


module Add_half_345 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_346 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_173 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_346 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_345 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_347 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_348 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_174 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_348 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_347 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_349 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_350 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(a), .Z(n1) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CIVXL U3 ( .A(b), .Z(n2) );
  CND2XL U4 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U5 ( .A(n3), .B(n4), .Z(sum) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_175 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_350 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_349 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_351 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_352 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(a), .Z(n1) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X2 U3 ( .A(n3), .B(n4), .Z(sum) );
  CND2X1 U4 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_176 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_352 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_351 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_44 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_176 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_175 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_174 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_173 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2X2 U3 ( .A(c_out00), .B(n1), .Z(n2) );
  CND2X2 U4 ( .A(c_out01), .B(c_in2), .Z(n3) );
  CND2X2 U5 ( .A(n2), .B(n3), .Z(n4) );
  CIVX2 U6 ( .A(c_in2), .Z(n1) );
  CMX2XL U7 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(c_out10), .Z(n6) );
  CIVX2 U10 ( .A(c_out11), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(c_out2) );
endmodule


module bit4_11 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_44 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_43 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_42 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_41 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMXI2XL U3 ( .A0(n13), .A1(n12), .S(n1), .Z(sum4[3]) );
  CIVX1 U4 ( .A(c_out410), .Z(n3) );
  CMXI2X1 U5 ( .A0(n10), .A1(n9), .S(n1), .Z(sum4[2]) );
  CANR2X1 U6 ( .A(n2), .B(c_out400), .C(c_in4), .D(c_out401), .Z(n1) );
  CANR2X1 U7 ( .A(n2), .B(c_out400), .C(c_in4), .D(c_out401), .Z(n11) );
  CIVX1 U8 ( .A(s43[1]), .Z(n12) );
  CIVX1 U9 ( .A(s44[1]), .Z(n13) );
  CIVX1 U10 ( .A(c_out411), .Z(n4) );
  CIVX2 U11 ( .A(c_in4), .Z(n2) );
  CMXI2X1 U12 ( .A0(n4), .A1(n3), .S(n11), .Z(c_out4) );
  CIVX2 U13 ( .A(s41[0]), .Z(n6) );
  CIVX2 U14 ( .A(s42[0]), .Z(n5) );
  CMXI2X1 U15 ( .A0(n6), .A1(n5), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U16 ( .A(s41[1]), .Z(n8) );
  CIVX2 U17 ( .A(s42[1]), .Z(n7) );
  CMXI2X1 U18 ( .A0(n8), .A1(n7), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U19 ( .A(s44[0]), .Z(n10) );
  CIVX2 U20 ( .A(s43[0]), .Z(n9) );
endmodule


module Add_half_353 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_354 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_177 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_354 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_353 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_355 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_356 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_178 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_356 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_355 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_357 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_358 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_179 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_358 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_357 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_359 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_360 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_180 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_360 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_359 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_45 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_180 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_179 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_178 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_177 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(n1), .Z(n4) );
  CIVX2 U4 ( .A(c_out10), .Z(n3) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_361 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_362 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_181 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_362 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_361 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_363 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_364 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_182 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_364 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_363 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_365 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_366 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(b), .Z(n2) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVX1 U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_183 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_366 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_365 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_367 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X2 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_368 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U2 ( .A(n3), .B(n4), .Z(sum) );
  CND2X1 U3 ( .A(n1), .B(b), .Z(n4) );
  CIVX1 U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_184 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_368 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_367 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_46 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_184 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_183 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_182 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_181 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX1 U4 ( .A(s2), .Z(n4) );
  CIVX1 U5 ( .A(s1), .Z(n5) );
  CIVX1 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CIVX2 U8 ( .A(n1), .Z(n6) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(s3), .Z(n8) );
  CIVX2 U12 ( .A(s4), .Z(n7) );
  CMXI2X1 U13 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
endmodule


module Add_half_369 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_370 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_185 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_370 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_369 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_371 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_372 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_186 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_372 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_371 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_373 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_374 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_187 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_374 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_373 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_375 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_376 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_188 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_376 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_375 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_47 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_188 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_187 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_186 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_185 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n2) );
  CIVX20 U4 ( .A(c_in2), .Z(n1) );
  CIVXL U5 ( .A(n2), .Z(n7) );
  CMXI2X1 U6 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out2) );
  CIVX2 U7 ( .A(c_out10), .Z(n4) );
  CIVX2 U8 ( .A(c_out11), .Z(n3) );
  CIVX2 U9 ( .A(s1), .Z(n6) );
  CIVX2 U10 ( .A(s2), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U12 ( .A(s3), .Z(n9) );
  CIVX2 U13 ( .A(s4), .Z(n8) );
  CMXI2X1 U14 ( .A0(n9), .A1(n8), .S(n7), .Z(sum2[1]) );
endmodule


module Add_half_377 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_378 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_189 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_378 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_377 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_379 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_380 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_190 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_380 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_379 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_381 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_382 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(b), .Z(n2) );
  CND2XL U2 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_191 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_382 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_381 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_383 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_384 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_192 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_384 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_383 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_48 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_192 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_191 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_190 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_189 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U4 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out2) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n1), .Z(sum2[1]) );
  CMX2XL U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out10), .Z(n4) );
  CIVX2 U8 ( .A(c_out11), .Z(n3) );
  CMXI2X1 U9 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
endmodule


module bit4_12 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_48 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_47 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_46 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_45 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2XL U3 ( .A(c_out400), .B(n3), .C(c_in4), .D(c_out401), .Z(n1) );
  CIVXL U4 ( .A(s44[1]), .Z(n8) );
  CIVX1 U5 ( .A(c_out410), .Z(n4) );
  CMX2X1 U6 ( .A0(s44[0]), .A1(s43[0]), .S(n6), .Z(sum4[2]) );
  CANR2X1 U7 ( .A(c_out400), .B(n3), .C(c_in4), .D(c_out401), .Z(n2) );
  CANR2X1 U8 ( .A(c_out400), .B(n3), .C(c_in4), .D(c_out401), .Z(n6) );
  CMX2X1 U9 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U10 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMXI2XL U11 ( .A0(n8), .A1(n7), .S(n1), .Z(sum4[3]) );
  CIVX1 U12 ( .A(c_out411), .Z(n5) );
  CMXI2X1 U13 ( .A0(n5), .A1(n4), .S(n2), .Z(c_out4) );
  CIVX2 U14 ( .A(c_in4), .Z(n3) );
  CIVX2 U15 ( .A(s43[1]), .Z(n7) );
endmodule


module bit8_3 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_12 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4({b8[3:2], n8, 
        b8[0]}), .c_in4(1'b0) );
  bit4_11 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4({b8[3:2], n8, 
        b8[0]}), .c_in4(1'b1) );
  bit4_10 A83 ( .sum4(s83), .c_out4(c_out810), .a4({n2, a8[6:4]}), .b4(b8[7:4]), .c_in4(1'b0) );
  bit4_9 A84 ( .sum4(s84), .c_out4(c_out811), .a4({n2, a8[6:4]}), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CIVX1 U3 ( .A(b8[1]), .Z(n7) );
  CND2X2 U4 ( .A(n12), .B(n11), .Z(n3) );
  CIVXL U5 ( .A(n5), .Z(n1) );
  CIVX2 U6 ( .A(n5), .Z(n6) );
  CMX2X2 U7 ( .A0(s81[3]), .A1(s82[3]), .S(n1), .Z(sum8[3]) );
  CNIVX4 U8 ( .A(a8[7]), .Z(n2) );
  CMXI2X1 U9 ( .A0(n13), .A1(n14), .S(n3), .Z(sum8[4]) );
  CIVX2 U10 ( .A(c_in8), .Z(n5) );
  CMXI2X1 U11 ( .A0(n16), .A1(n15), .S(n4), .Z(sum8[5]) );
  CMX2X2 U12 ( .A0(s81[1]), .A1(s82[1]), .S(n6), .Z(sum8[1]) );
  CND2X1 U13 ( .A(c_out800), .B(n5), .Z(n12) );
  CMX2X1 U14 ( .A0(s82[0]), .A1(s81[0]), .S(n5), .Z(sum8[0]) );
  CND2IX1 U15 ( .B(n5), .A(c_out801), .Z(n11) );
  CMXI2XL U16 ( .A0(n10), .A1(n9), .S(n4), .Z(c_out8) );
  CIVX1 U17 ( .A(s84[1]), .Z(n16) );
  CMX2X2 U18 ( .A0(s81[2]), .A1(s82[2]), .S(n6), .Z(sum8[2]) );
  CAN2X2 U19 ( .A(n11), .B(n12), .Z(n4) );
  CIVX8 U20 ( .A(n7), .Z(n8) );
  CIVX1 U21 ( .A(s83[0]), .Z(n13) );
  CMX2X1 U22 ( .A0(s84[3]), .A1(s83[3]), .S(n4), .Z(sum8[7]) );
  CMXI2X1 U23 ( .A0(n18), .A1(n17), .S(n4), .Z(sum8[6]) );
  CIVX1 U24 ( .A(s84[2]), .Z(n18) );
  CIVX1 U25 ( .A(s83[2]), .Z(n17) );
  CIVX2 U26 ( .A(c_out811), .Z(n10) );
  CIVX2 U27 ( .A(c_out810), .Z(n9) );
  CIVX2 U28 ( .A(s84[0]), .Z(n14) );
  CIVX2 U29 ( .A(s83[1]), .Z(n15) );
endmodule


module Add_half_385 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_386 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_193 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_386 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_385 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_387 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_388 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_194 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_388 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_387 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_389 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_390 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_195 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_390 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_389 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_391 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_392 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_196 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_392 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_391 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_49 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_196 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_195 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_194 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_193 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out2) );
  CIVXL U4 ( .A(n1), .Z(n4) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2XL U6 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
  CIVX2 U7 ( .A(c_out10), .Z(n3) );
  CIVX2 U8 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U9 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U10 ( .A(s3), .Z(n6) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module Add_half_393 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_394 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CND2XL U2 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_197 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_394 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_393 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_395 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_396 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_198 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_396 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_395 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_397 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_398 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_199 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_398 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_397 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_399 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_400 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_200 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_400 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_399 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_50 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_200 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_199 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_198 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_197 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out10), .Z(n3) );
  CIVX1 U4 ( .A(n1), .Z(n4) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_401 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_402 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_201 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_402 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_401 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_403 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_404 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_202 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_404 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_403 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_405 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_406 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_203 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_406 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_405 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_407 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_408 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_204 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_408 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_407 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_51 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  Add_full_204 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_203 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_202 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_201 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n1), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n1), .Z(c_out2) );
endmodule


module Add_half_409 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_410 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_205 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_410 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_409 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_411 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_412 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_206 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_412 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_411 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_413 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_414 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_207 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_414 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_413 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_415 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_416 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_208 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_416 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_415 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_52 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  Add_full_208 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_207 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_206 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_205 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n1), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n1), .Z(c_out2) );
endmodule


module bit4_13 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_52 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_51 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_50 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_49 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVXL U3 ( .A(n1), .Z(n8) );
  CMX2X1 U4 ( .A0(c_out411), .A1(c_out410), .S(n1), .Z(c_out4) );
  CMXI2XL U5 ( .A0(n7), .A1(n6), .S(n8), .Z(sum4[2]) );
  CMX2XL U6 ( .A0(s43[1]), .A1(s44[1]), .S(n8), .Z(sum4[3]) );
  CMXI2X1 U7 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U8 ( .A(s41[0]), .Z(n3) );
  CIVX2 U9 ( .A(s42[0]), .Z(n2) );
  CMXI2X1 U10 ( .A0(n3), .A1(n2), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U11 ( .A(s41[1]), .Z(n5) );
  CIVX2 U12 ( .A(s42[1]), .Z(n4) );
  CMXI2X1 U13 ( .A0(n5), .A1(n4), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U14 ( .A(s43[0]), .Z(n7) );
  CIVX2 U15 ( .A(s44[0]), .Z(n6) );
endmodule


module Add_half_417 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_418 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_209 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_418 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_417 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_419 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_420 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CND2XL U2 ( .A(n3), .B(a), .Z(n4) );
  CIVX1 U3 ( .A(b), .Z(n3) );
  CND2XL U4 ( .A(n2), .B(b), .Z(n5) );
  CND2X1 U5 ( .A(n4), .B(n5), .Z(sum) );
  CIVXL U6 ( .A(a), .Z(n2) );
endmodule


module Add_full_210 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_420 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_419 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_421 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_422 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_211 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_422 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_421 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_423 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_424 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_212 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_424 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_423 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_53 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_212 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_211 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_210 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_209 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out01), .A1(c_out00), .S(n2), .Z(n1) );
  CIVX2 U4 ( .A(c_in2), .Z(n2) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n1), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out10), .Z(n4) );
  CIVX2 U8 ( .A(c_out11), .Z(n3) );
  CMXI2X1 U9 ( .A0(n4), .A1(n3), .S(n1), .Z(c_out2) );
endmodule


module Add_half_425 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_426 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_213 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_426 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_425 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_427 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_428 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U2 ( .A(b), .Z(n3) );
  CND2XL U3 ( .A(n2), .B(b), .Z(n5) );
  CND2XL U4 ( .A(a), .B(n3), .Z(n4) );
  CND2X1 U5 ( .A(n4), .B(n5), .Z(sum) );
  CIVXL U6 ( .A(a), .Z(n2) );
endmodule


module Add_full_214 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_428 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_427 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_429 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_430 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CND2X1 U1 ( .A(n2), .B(n3), .Z(sum) );
  CND2IXL U2 ( .B(b), .A(a), .Z(n3) );
  CND2X1 U3 ( .A(b), .B(n1), .Z(n2) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CAN2XL U5 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_215 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_430 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_429 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_431 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_432 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_216 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_432 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_431 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_54 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_216 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_215 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_214 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_213 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n1), .Z(n6) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U9 ( .A(s1), .Z(n5) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_433 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_434 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_217 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_434 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_433 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_435 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CNIVX2 U1 ( .A(a), .Z(n1) );
  CEOX2 U2 ( .A(n1), .B(b), .Z(sum) );
  CAN2X1 U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_436 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_218 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_436 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_435 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_437 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_438 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_219 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_438 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_437 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_439 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_440 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_220 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_440 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_439 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_55 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_220 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_219 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_218 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_217 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX1 U4 ( .A(s2), .Z(n4) );
  CIVX1 U5 ( .A(s1), .Z(n5) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n1), .Z(c_out2) );
  CMXI2X1 U9 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U10 ( .A(s3), .Z(n7) );
  CIVX2 U11 ( .A(s4), .Z(n6) );
  CMXI2X1 U12 ( .A0(n7), .A1(n6), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_441 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_442 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_221 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_442 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_441 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_443 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_444 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U2 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CAN2XL U4 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U5 ( .A(a), .Z(n1) );
  CIVX2 U6 ( .A(b), .Z(n2) );
endmodule


module Add_full_222 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_444 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_443 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_445 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_446 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_223 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_446 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_445 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_447 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_448 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_224 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_448 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_447 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_56 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_224 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_223 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_222 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_221 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out10), .Z(n3) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module bit4_14 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_56 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_55 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_54 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_53 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U3 ( .A(c_in4), .Z(n1) );
  CMXI2X1 U4 ( .A0(c_out401), .A1(c_out400), .S(n1), .Z(n2) );
  CMX2XL U5 ( .A0(s43[0]), .A1(s44[0]), .S(n5), .Z(sum4[2]) );
  CMX2X1 U6 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMX2X1 U7 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CIVX1 U8 ( .A(c_out410), .Z(n4) );
  CIVX1 U9 ( .A(c_out411), .Z(n3) );
  CIVX2 U10 ( .A(n2), .Z(n5) );
  CMXI2X1 U11 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out4) );
  CIVX2 U12 ( .A(s43[1]), .Z(n7) );
  CIVX2 U13 ( .A(s44[1]), .Z(n6) );
  CMXI2X1 U14 ( .A0(n7), .A1(n6), .S(n5), .Z(sum4[3]) );
endmodule


module Add_half_449 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_450 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_225 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_450 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_449 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_451 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_452 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_226 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_452 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_451 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_453 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_454 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_227 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_454 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_453 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_455 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_456 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_228 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_456 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_455 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_57 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_228 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_227 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_226 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_225 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_457 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_458 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_229 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_458 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_457 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_459 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_460 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_230 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_460 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_459 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_461 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_462 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_231 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_462 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_461 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_463 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_464 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_232 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_464 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_463 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_58 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_232 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_231 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_230 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_229 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_465 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_466 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_233 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_466 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_465 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_467 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_468 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_234 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_468 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_467 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_469 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_470 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_235 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_470 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_469 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_471 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_472 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_236 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_472 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_471 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_59 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_236 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_235 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_234 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_233 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_473 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_474 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_237 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_474 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_473 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_475 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_476 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_238 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_476 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_475 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_477 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_478 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_239 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_478 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_477 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_479 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_480 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_240 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_480 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_479 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_60 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_240 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_239 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_238 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_237 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_15 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_60 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_59 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_58 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_57 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module Add_half_481 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_482 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_241 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_482 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_481 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_483 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_484 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_242 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_484 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_483 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_485 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_486 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_243 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_486 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_485 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_487 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_488 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_244 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_488 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_487 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_61 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_244 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_243 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_242 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_241 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_489 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_490 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_245 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_490 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_489 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_491 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_492 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_246 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_492 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_491 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_493 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_494 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_247 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_494 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_493 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_495 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_496 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_248 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_496 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_495 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_62 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_248 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_247 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_246 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_245 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_497 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_498 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_249 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_498 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_497 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_499 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_500 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_250 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_500 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_499 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_501 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_502 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_251 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_502 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_501 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_503 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_504 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_252 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_504 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_503 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_63 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_252 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_251 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_250 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_249 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_505 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_506 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_253 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_506 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_505 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_507 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_508 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_254 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_508 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_507 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_509 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_510 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_255 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_510 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_509 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_511 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_512 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_256 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_512 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_511 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_64 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_256 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_255 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_254 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_253 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_16 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_64 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_63 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_62 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_61 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module bit8_4 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3, n4, n5, n6, n7,
         n8;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_16 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_15 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_14 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4({b8[7], n1, 
        b8[5:4]}), .c_in4(1'b0) );
  bit4_13 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4({b8[7], n1, 
        b8[5:4]}), .c_in4(1'b1) );
  CAOR2X1 U11 ( .A(s82[2]), .B(c_in8), .C(s81[2]), .D(n8), .Z(sum8[2]) );
  CAOR2X1 U12 ( .A(s82[1]), .B(c_in8), .C(s81[1]), .D(n8), .Z(sum8[1]) );
  CAOR2X1 U13 ( .A(s82[0]), .B(c_in8), .C(s81[0]), .D(n8), .Z(sum8[0]) );
  CNIVX4 U3 ( .A(b8[6]), .Z(n1) );
  CAOR2X2 U4 ( .A(s82[3]), .B(c_in8), .C(s81[3]), .D(n8), .Z(sum8[3]) );
  CMXI2X1 U5 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out8) );
  CMX2X2 U6 ( .A0(s83[3]), .A1(s84[3]), .S(n7), .Z(sum8[7]) );
  CIVX2 U7 ( .A(c_out811), .Z(n3) );
  CMXI2X2 U8 ( .A0(n6), .A1(n5), .S(n7), .Z(sum8[5]) );
  CMX2X2 U9 ( .A0(s83[2]), .A1(s84[2]), .S(n7), .Z(sum8[6]) );
  CMX2X2 U10 ( .A0(s83[0]), .A1(s84[0]), .S(n7), .Z(sum8[4]) );
  CIVX1 U14 ( .A(c_out810), .Z(n4) );
  CMXI2X1 U15 ( .A0(c_out800), .A1(c_out801), .S(c_in8), .Z(n2) );
  CIVX2 U16 ( .A(n2), .Z(n7) );
  CIVX2 U17 ( .A(s83[1]), .Z(n6) );
  CIVX2 U18 ( .A(s84[1]), .Z(n5) );
  CIVX2 U19 ( .A(c_in8), .Z(n8) );
endmodule


module bit16_2 ( a16, b16, sum16, c_out16, c_in16 );
  input [15:0] a16;
  input [15:0] b16;
  output [15:0] sum16;
  input c_in16;
  output c_out16;
  wire   c1;

  bit8_4 A161 ( .sum8(sum16[7:0]), .c_out8(c1), .a8(a16[7:0]), .b8(b16[7:0]), 
        .c_in8(c_in16) );
  bit8_3 A162 ( .sum8(sum16[15:8]), .c_out8(c_out16), .a8(a16[15:8]), .b8(
        b16[15:8]), .c_in8(c1) );
endmodule


module Add_half_513 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_514 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_257 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_514 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_513 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_515 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_516 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_258 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_516 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_515 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_517 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_518 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_259 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_518 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_517 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_519 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_520 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_260 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_520 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_519 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_65 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_260 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_259 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_258 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_257 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMX2XL U4 ( .A0(c_out10), .A1(c_out11), .S(n1), .Z(c_out2) );
  CIVX2 U5 ( .A(s1), .Z(n3) );
  CIVX2 U6 ( .A(s2), .Z(n2) );
  CMXI2X1 U7 ( .A0(n3), .A1(n2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U8 ( .A(s3), .Z(n5) );
  CIVX2 U9 ( .A(s4), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_521 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n1) );
  CENX1 U3 ( .A(a), .B(n1), .Z(sum) );
endmodule


module Add_half_522 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_261 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_522 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_521 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_523 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_524 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_262 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_524 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_523 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_525 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_526 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CND2X1 U3 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U4 ( .A(a), .B(n2), .Z(n3) );
  CIVX1 U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_263 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_526 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_525 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_527 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_528 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_264 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_528 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_527 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
endmodule


module bit2_66 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_264 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_263 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_262 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_261 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
endmodule


module Add_half_529 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_530 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_265 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_530 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_529 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_531 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_532 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_266 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_532 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_531 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_533 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_534 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVXL U1 ( .A(b), .Z(n2) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_267 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_534 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_533 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_535 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_536 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVXL U1 ( .A(b), .Z(n2) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_268 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_536 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_535 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_67 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_268 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_267 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_266 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_265 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out10), .Z(n3) );
  CIVX2 U4 ( .A(n1), .Z(n4) );
  CIVX1 U5 ( .A(c_out11), .Z(n2) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_537 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_538 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_269 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_538 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_537 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_539 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_540 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CND2XL U2 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_270 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_540 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_539 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_541 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_542 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVXL U1 ( .A(b), .Z(n2) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_271 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_542 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_541 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_543 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_544 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENX1 U1 ( .A(a), .B(n2), .Z(sum) );
  CIVXL U2 ( .A(b), .Z(n2) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_272 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_544 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_543 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_68 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_272 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_271 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_270 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_269 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n1), .Z(n6) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVX1 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U9 ( .A(s1), .Z(n5) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module bit4_17 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_68 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_67 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_66 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_65 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CND2X1 U3 ( .A(s43[0]), .B(n1), .Z(n2) );
  CIVX2 U4 ( .A(n7), .Z(n1) );
  CND2XL U5 ( .A(s44[0]), .B(n7), .Z(n3) );
  CND2X1 U6 ( .A(c_out401), .B(c_in4), .Z(n6) );
  CND2X1 U7 ( .A(n2), .B(n3), .Z(sum4[2]) );
  CND2X1 U8 ( .A(c_out400), .B(n4), .Z(n5) );
  CND2X2 U9 ( .A(n5), .B(n6), .Z(n7) );
  CIVX2 U10 ( .A(c_in4), .Z(n4) );
  CMX2XL U11 ( .A0(s43[1]), .A1(s44[1]), .S(n7), .Z(sum4[3]) );
  CMX2XL U12 ( .A0(c_out410), .A1(c_out411), .S(n7), .Z(c_out4) );
  CMX2X1 U13 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U14 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
endmodule


module Add_half_545 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_546 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_273 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_546 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_545 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_547 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_548 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_274 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_548 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_547 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_549 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_550 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_275 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_550 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_549 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVXL U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_551 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_552 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n1), .B(b), .Z(n4) );
  CIVX1 U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_276 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_552 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_551 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_69 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_276 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_275 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_274 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_273 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVXL U3 ( .A(n1), .Z(n2) );
  CMX2X1 U4 ( .A0(s4), .A1(s3), .S(n1), .Z(sum2[1]) );
  CMX2XL U5 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
endmodule


module Add_half_553 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_554 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_277 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_554 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_553 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_555 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_556 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_278 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_556 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_555 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_557 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_558 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CIVX1 U3 ( .A(b), .Z(n2) );
  CND2X1 U4 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_279 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_558 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_557 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_559 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_560 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(a), .B(n2), .Z(n3) );
  CND2X2 U2 ( .A(n4), .B(n3), .Z(sum) );
  CND2X1 U3 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_280 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_560 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_559 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_70 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_280 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_279 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_278 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_277 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2X2 U3 ( .A(c_out00), .B(n1), .Z(n2) );
  CND2X2 U4 ( .A(c_out01), .B(c_in2), .Z(n3) );
  CND2X2 U5 ( .A(n2), .B(n3), .Z(n4) );
  CIVX2 U6 ( .A(c_in2), .Z(n1) );
  CMX2XL U7 ( .A0(c_out10), .A1(c_out11), .S(n4), .Z(c_out2) );
  CMX2X1 U8 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CIVX2 U9 ( .A(s1), .Z(n6) );
  CIVX2 U10 ( .A(s2), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_561 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_562 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n1), .B(b), .Z(n4) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CND2X1 U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_281 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_562 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_561 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_563 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_564 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX2 U1 ( .A(b), .Z(n2) );
  CIVX1 U2 ( .A(a), .Z(n1) );
  CND2X1 U3 ( .A(a), .B(n2), .Z(n3) );
  CND2XL U4 ( .A(b), .B(n1), .Z(n4) );
  CND2X1 U5 ( .A(n3), .B(n4), .Z(sum) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_282 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_564 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_563 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_565 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_566 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_283 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_566 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_565 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_567 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_568 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX1 U1 ( .A(a), .Z(n1) );
  CND2X1 U2 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U3 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U4 ( .A(a), .B(n2), .Z(n3) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_284 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_568 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_567 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_71 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_284 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_283 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_282 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_281 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVXL U4 ( .A(s1), .Z(n5) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CIVX1 U6 ( .A(n1), .Z(n6) );
  CIVX2 U7 ( .A(c_out10), .Z(n3) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_569 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_570 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_285 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_570 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_569 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_571 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_572 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CIVX1 U2 ( .A(b), .Z(n2) );
  CND2XL U3 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_286 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_572 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_571 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_573 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_574 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_287 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_574 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_573 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_575 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_576 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_288 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_576 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_575 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_72 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_288 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_287 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_286 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_285 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n1) );
  CIVX1 U4 ( .A(n2), .Z(n5) );
  CMX2X1 U5 ( .A0(s3), .A1(s4), .S(n5), .Z(sum2[1]) );
  CMXI2X1 U6 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n2) );
  CIVX2 U7 ( .A(c_out10), .Z(n4) );
  CIVX2 U8 ( .A(c_out11), .Z(n3) );
  CMX2X1 U9 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U10 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out2) );
endmodule


module bit4_18 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_72 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_71 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_70 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_69 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CND2X1 U3 ( .A(s43[0]), .B(n2), .Z(n3) );
  CIVX2 U4 ( .A(c_in4), .Z(n5) );
  CND2X1 U5 ( .A(n3), .B(n4), .Z(sum4[2]) );
  CIVXL U6 ( .A(s42[1]), .Z(n7) );
  CMX2XL U7 ( .A0(c_out401), .A1(c_out400), .S(n5), .Z(n1) );
  CMX2X1 U8 ( .A0(c_out401), .A1(c_out400), .S(n5), .Z(n6) );
  CND2X1 U9 ( .A(s44[0]), .B(n6), .Z(n4) );
  CIVX2 U10 ( .A(n6), .Z(n2) );
  CIVX1 U11 ( .A(s43[1]), .Z(n10) );
  CMX2XL U12 ( .A0(c_out410), .A1(c_out411), .S(n1), .Z(c_out4) );
  CMX2X1 U13 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX1 U14 ( .A(s44[1]), .Z(n9) );
  CIVX2 U15 ( .A(s41[1]), .Z(n8) );
  CMXI2X1 U16 ( .A0(n8), .A1(n7), .S(c_in4), .Z(sum4[1]) );
  CMXI2X1 U17 ( .A0(n10), .A1(n9), .S(n1), .Z(sum4[3]) );
endmodule


module Add_half_577 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_578 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_289 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_578 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_577 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_579 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_580 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_290 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_580 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_579 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_581 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_582 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CIVX1 U1 ( .A(a), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CND2X1 U3 ( .A(n5), .B(n4), .Z(sum) );
  CIVX2 U4 ( .A(b), .Z(n3) );
  CND2X1 U5 ( .A(n2), .B(b), .Z(n5) );
  CND2X1 U6 ( .A(a), .B(n3), .Z(n4) );
endmodule


module Add_full_291 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_582 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_581 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n1), .B(n2), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n1) );
  CIVX2 U3 ( .A(w2), .Z(n2) );
endmodule


module Add_half_583 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_584 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_292 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_584 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_583 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_73 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_292 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_291 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_290 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_289 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2X1 U3 ( .A(n2), .B(n3), .Z(n4) );
  CND2X1 U4 ( .A(n5), .B(c_in2), .Z(n3) );
  CND2IX1 U5 ( .B(c_out00), .A(n1), .Z(n2) );
  CMX2X1 U6 ( .A0(c_out11), .A1(c_out10), .S(n4), .Z(c_out2) );
  CIVX2 U7 ( .A(c_out01), .Z(n5) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n6) );
  CIVX2 U9 ( .A(c_in2), .Z(n1) );
  CMXI2X1 U10 ( .A0(n7), .A1(n8), .S(n6), .Z(sum2[1]) );
  CMX2X1 U11 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U12 ( .A(s3), .Z(n8) );
  CIVX2 U13 ( .A(s4), .Z(n7) );
endmodule


module Add_half_585 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_586 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_293 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_586 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_585 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_587 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_588 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_294 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_588 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_587 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_589 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_590 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(n3), .Z(n4) );
  CND2X2 U3 ( .A(n2), .B(b), .Z(n5) );
  CND2X2 U4 ( .A(n4), .B(n5), .Z(sum) );
  CIVX1 U5 ( .A(a), .Z(n2) );
  CIVX2 U6 ( .A(b), .Z(n3) );
endmodule


module Add_full_295 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_590 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_589 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_591 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_592 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_296 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_592 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_591 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_74 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10;

  Add_full_296 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_295 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_294 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_293 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVXL U3 ( .A(s3), .Z(n10) );
  CIVXL U4 ( .A(s4), .Z(n9) );
  CMXI2X1 U5 ( .A0(c_out11), .A1(c_out10), .S(n5), .Z(n1) );
  CIVX1 U6 ( .A(n1), .Z(c_out2) );
  CIVX2 U7 ( .A(c_out00), .Z(n7) );
  CIVX2 U8 ( .A(c_out01), .Z(n6) );
  CMXI2XL U9 ( .A0(n9), .A1(n10), .S(n8), .Z(sum2[1]) );
  CND2X2 U10 ( .A(n7), .B(n2), .Z(n3) );
  CND2X2 U11 ( .A(n6), .B(c_in2), .Z(n4) );
  CND2X2 U12 ( .A(n3), .B(n4), .Z(n5) );
  CIVX2 U13 ( .A(c_in2), .Z(n2) );
  CMXI2XL U14 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n8) );
  CMX2X1 U15 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_593 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CEOX1 U1 ( .A(b), .B(n2), .Z(sum) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CIVXL U3 ( .A(n1), .Z(n2) );
  CAN2X1 U4 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_594 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CND2XL U1 ( .A(n1), .B(a), .Z(n2) );
  CND2IX1 U2 ( .B(a), .A(b), .Z(n3) );
  CND2X1 U3 ( .A(n2), .B(n3), .Z(sum) );
  CIVX1 U4 ( .A(b), .Z(n1) );
  CAN2XL U5 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_297 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_594 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_593 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_595 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_596 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_298 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_596 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_595 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_597 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVXL U1 ( .A(a), .Z(n2) );
  CENX1 U2 ( .A(n2), .B(b), .Z(sum) );
  CAN2X1 U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_598 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   net55066, n1, n2;
  assign c_out = net55066;

  CND2IXL U1 ( .B(b), .A(a), .Z(n1) );
  CND2X1 U2 ( .A(n1), .B(n2), .Z(sum) );
  CND2IX1 U3 ( .B(a), .A(b), .Z(n2) );
  CAN2XL U4 ( .A(a), .B(b), .Z(net55066) );
endmodule


module Add_full_299 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_598 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_597 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CIVX1 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_599 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n4;

  CIVXL U1 ( .A(a), .Z(n1) );
  CIVXL U2 ( .A(n1), .Z(n2) );
  CAN2X1 U3 ( .A(a), .B(b), .Z(c_out) );
  CENXL U4 ( .A(n4), .B(n2), .Z(sum) );
  CIVX2 U5 ( .A(b), .Z(n4) );
endmodule


module Add_half_600 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   net55064, n1, n2, n3, n4;
  assign c_out = net55064;

  CIVX2 U1 ( .A(a), .Z(n1) );
  CND2X1 U2 ( .A(n3), .B(n4), .Z(sum) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(net55064) );
endmodule


module Add_full_300 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_600 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_599 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_75 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, net55253, n1, n2,
         n3, n4, n5;

  Add_full_300 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_299 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_298 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_297 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CAN2X2 U3 ( .A(n2), .B(n1), .Z(net55253) );
  CIVX1 U4 ( .A(c_out10), .Z(n4) );
  CND2IX2 U5 ( .B(c_in2), .A(c_out00), .Z(n1) );
  CMXI2X1 U6 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out2) );
  CND2X2 U7 ( .A(n2), .B(n1), .Z(n5) );
  CIVX1 U8 ( .A(c_out11), .Z(n3) );
  CND2X2 U9 ( .A(c_out01), .B(c_in2), .Z(n2) );
  CMX2XL U10 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMX2X1 U11 ( .A0(s4), .A1(s3), .S(net55253), .Z(sum2[1]) );
endmodule


module Add_half_601 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_602 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_301 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_602 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_601 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_603 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_604 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_302 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_604 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_603 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_605 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVXL U1 ( .A(a), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(n2) );
  CEOXL U3 ( .A(n2), .B(b), .Z(sum) );
  CAN2X1 U4 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_606 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X2 U1 ( .A(n1), .B(b), .Z(n4) );
  CIVX1 U2 ( .A(a), .Z(n1) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CIVX1 U4 ( .A(b), .Z(n2) );
  CAN2XL U5 ( .A(a), .B(b), .Z(c_out) );
  CND2X1 U6 ( .A(n4), .B(n3), .Z(sum) );
endmodule


module Add_full_303 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_606 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_605 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_607 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n3;

  CEOXL U1 ( .A(n1), .B(n3), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVXL U3 ( .A(a), .Z(n1) );
  CIVX2 U4 ( .A(b), .Z(n3) );
endmodule


module Add_half_608 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CND2IX1 U1 ( .B(a), .A(b), .Z(n3) );
  CND2XL U2 ( .A(a), .B(n1), .Z(n2) );
  CND2X1 U3 ( .A(n2), .B(n3), .Z(sum) );
  CIVXL U4 ( .A(b), .Z(n1) );
  CAN2XL U5 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_304 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_608 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_607 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_76 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_304 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_303 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_302 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_301 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s4), .A1(s3), .S(n1), .Z(sum2[1]) );
  CIVX3 U4 ( .A(n5), .Z(n1) );
  CND2X1 U5 ( .A(n5), .B(c_out11), .Z(n3) );
  CND2X2 U6 ( .A(n6), .B(n7), .Z(n5) );
  CND2X2 U7 ( .A(c_out10), .B(n1), .Z(n2) );
  CND2X2 U8 ( .A(n2), .B(n3), .Z(c_out2) );
  CND2X2 U9 ( .A(c_out00), .B(n4), .Z(n7) );
  CMX2X1 U10 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(c_in2), .Z(n4) );
  CND2X2 U12 ( .A(c_out01), .B(c_in2), .Z(n6) );
endmodule


module bit4_19 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, net50635, net50636, net50640,
         net50641, net50642, net50643, net66310, net62930, net61222, net50638,
         n1, n2, n3, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_76 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_75 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_74 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_73 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX1 U3 ( .A(s41[1]), .Z(net50640) );
  CIVX3 U4 ( .A(net61222), .Z(net62930) );
  CND2X2 U5 ( .A(n2), .B(n3), .Z(c_out4) );
  CND2X2 U6 ( .A(net66310), .B(c_out411), .Z(n3) );
  CND2X2 U7 ( .A(net62930), .B(c_out410), .Z(n2) );
  CND2X2 U8 ( .A(n1), .B(net50638), .Z(net61222) );
  CND2X2 U9 ( .A(n1), .B(net50638), .Z(net66310) );
  CMXI2X1 U10 ( .A0(net50636), .A1(net50635), .S(net66310), .Z(sum4[2]) );
  CND2X2 U11 ( .A(c_out401), .B(c_in4), .Z(n1) );
  CND2IX2 U12 ( .B(c_in4), .A(c_out400), .Z(net50638) );
  CIVXL U13 ( .A(s43[1]), .Z(n4) );
  CIVX1 U14 ( .A(s42[1]), .Z(net50641) );
  CMXI2X1 U15 ( .A0(net50640), .A1(net50641), .S(c_in4), .Z(sum4[1]) );
  CMXI2X1 U16 ( .A0(net50642), .A1(net50643), .S(c_in4), .Z(sum4[0]) );
  CMXI2X1 U17 ( .A0(n5), .A1(n4), .S(net62930), .Z(sum4[3]) );
  CIVX1 U18 ( .A(s42[0]), .Z(net50643) );
  CIVX2 U19 ( .A(s41[0]), .Z(net50642) );
  CIVX2 U20 ( .A(s44[0]), .Z(net50635) );
  CIVX2 U21 ( .A(s43[0]), .Z(net50636) );
  CIVX2 U22 ( .A(s44[1]), .Z(n5) );
endmodule


module Add_half_609 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_610 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CND2XL U2 ( .A(a), .B(n3), .Z(n4) );
  CND2XL U3 ( .A(n2), .B(b), .Z(n5) );
  CND2X1 U4 ( .A(n4), .B(n5), .Z(sum) );
  CIVX1 U5 ( .A(a), .Z(n2) );
  CIVX2 U6 ( .A(b), .Z(n3) );
endmodule


module Add_full_305 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_610 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_609 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_611 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_612 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_306 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_612 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_611 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_613 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_614 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_307 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_614 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_613 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_615 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_616 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_308 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_616 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_615 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_77 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, net50676, n2, n3,
         n4;

  Add_full_308 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_307 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_306 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_305 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out10), .A1(c_out11), .S(n4), .Z(c_out2) );
  CMXI2X1 U4 ( .A0(n2), .A1(n3), .S(c_in2), .Z(n4) );
  CIVX2 U5 ( .A(c_out01), .Z(n3) );
  CIVX2 U6 ( .A(c_out00), .Z(n2) );
  CMXI2XL U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(net50676) );
  CMX2XL U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMX2X1 U9 ( .A0(s4), .A1(s3), .S(net50676), .Z(sum2[1]) );
endmodule


module Add_half_617 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_618 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_309 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_618 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_617 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_619 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_620 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_310 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_620 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_619 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2XL U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_621 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_622 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CND2XL U1 ( .A(a), .B(n3), .Z(n4) );
  CIVXL U2 ( .A(a), .Z(n2) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
  CND2X1 U4 ( .A(n2), .B(b), .Z(n5) );
  CND2X1 U5 ( .A(n4), .B(n5), .Z(sum) );
  CIVX2 U6 ( .A(b), .Z(n3) );
endmodule


module Add_full_311 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_622 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_621 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w2), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n1) );
endmodule


module Add_half_623 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_624 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_312 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_624 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_623 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_78 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10;

  Add_full_312 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_311 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_310 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_309 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n1) );
  CMX2XL U4 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n3) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CND2X1 U6 ( .A(c_out10), .B(n2), .Z(n4) );
  CND2X1 U7 ( .A(n3), .B(c_out11), .Z(n5) );
  CND2X1 U8 ( .A(n4), .B(n5), .Z(c_out2) );
  CMX2XL U9 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n6) );
  CIVX2 U10 ( .A(s1), .Z(n8) );
  CIVX2 U11 ( .A(s2), .Z(n7) );
  CMXI2X1 U12 ( .A0(n8), .A1(n7), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U13 ( .A(s3), .Z(n10) );
  CIVX2 U14 ( .A(s4), .Z(n9) );
  CMXI2X1 U15 ( .A0(n10), .A1(n9), .S(n6), .Z(sum2[1]) );
endmodule


module Add_half_625 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENX1 U1 ( .A(n1), .B(b), .Z(sum) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CND2X1 U3 ( .A(a), .B(b), .Z(n2) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_626 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CIVX1 U1 ( .A(a), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CND2XL U3 ( .A(a), .B(n3), .Z(n4) );
  CND2X1 U4 ( .A(n2), .B(b), .Z(n5) );
  CND2X1 U5 ( .A(n4), .B(n5), .Z(sum) );
  CIVXL U6 ( .A(b), .Z(n3) );
endmodule


module Add_full_313 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_626 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_625 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_627 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CND2IX1 U2 ( .B(n1), .A(a), .Z(n2) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_628 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CIVXL U2 ( .A(a), .Z(n1) );
  CIVX1 U3 ( .A(b), .Z(n2) );
  CND2X1 U4 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U5 ( .A(n3), .B(n4), .Z(sum) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_314 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_628 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_627 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_629 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CIVX2 U1 ( .A(n2), .Z(c_out) );
  CNIVX1 U2 ( .A(a), .Z(n1) );
  CND2IX1 U3 ( .B(n3), .A(a), .Z(n2) );
  CIVX2 U4 ( .A(b), .Z(n3) );
  CEOX2 U5 ( .A(n1), .B(b), .Z(sum) );
endmodule


module Add_half_630 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CND2IXL U2 ( .B(b), .A(a), .Z(n2) );
  CND2X1 U3 ( .A(n2), .B(n3), .Z(sum) );
  CND2IX1 U4 ( .B(a), .A(b), .Z(n3) );
endmodule


module Add_full_315 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_630 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_629 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_631 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_632 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   net56653, net60454, n2, n3, n4;

  CAN2XL U1 ( .A(net60454), .B(b), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X2 U3 ( .A(n4), .B(n3), .Z(sum) );
  CIVX1 U4 ( .A(b), .Z(n2) );
  CIVX2 U5 ( .A(a), .Z(net56653) );
  CND2X2 U6 ( .A(net56653), .B(b), .Z(n4) );
  CIVX1 U7 ( .A(net56653), .Z(net60454) );
endmodule


module Add_full_316 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_632 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_631 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CIVX1 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_79 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, net50749,
         net50750, net66378, net50752, net50751, net50755, net50747, net50746,
         n1, n2, n3, n4, n5;

  Add_full_316 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_315 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_314 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_313 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out11), .Z(net50751) );
  CIVDXL U4 ( .A(net66378), .Z0(n1), .Z1(n2) );
  CND2X2 U5 ( .A(c_out01), .B(c_in2), .Z(n3) );
  CND2X2 U6 ( .A(n3), .B(net50747), .Z(net50746) );
  CIVX2 U7 ( .A(c_in2), .Z(net50755) );
  CMXI2X1 U8 ( .A0(net50749), .A1(net50750), .S(c_in2), .Z(sum2[0]) );
  CIVXL U9 ( .A(net50746), .Z(net66378) );
  CMXI2X1 U10 ( .A0(net50752), .A1(net50751), .S(net50746), .Z(c_out2) );
  CND2X2 U11 ( .A(c_out00), .B(net50755), .Z(net50747) );
  CIVX2 U12 ( .A(c_out10), .Z(net50752) );
  CND2X1 U13 ( .A(s3), .B(n2), .Z(n4) );
  CND2X1 U14 ( .A(s4), .B(n1), .Z(n5) );
  CND2X1 U15 ( .A(n4), .B(n5), .Z(sum2[1]) );
  CIVX1 U16 ( .A(s2), .Z(net50750) );
  CIVX1 U17 ( .A(s1), .Z(net50749) );
endmodule


module Add_half_633 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_634 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CND2X2 U1 ( .A(n2), .B(b), .Z(n5) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CND2X1 U3 ( .A(a), .B(n3), .Z(n4) );
  CND2X2 U4 ( .A(n4), .B(n5), .Z(sum) );
  CIVX1 U5 ( .A(a), .Z(n2) );
  CIVX1 U6 ( .A(b), .Z(n3) );
endmodule


module Add_full_317 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_634 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_633 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_635 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_636 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U2 ( .A(b), .Z(n5) );
  CIVXL U3 ( .A(a), .Z(n2) );
  CND2XL U4 ( .A(a), .B(n5), .Z(n3) );
  CND2X1 U5 ( .A(n2), .B(b), .Z(n4) );
  CND2X1 U6 ( .A(n3), .B(n4), .Z(sum) );
endmodule


module Add_full_318 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_636 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_635 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_637 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_638 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n1), .B(b), .Z(n4) );
  CIVX1 U2 ( .A(a), .Z(n1) );
  CND2X1 U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X2 U4 ( .A(n4), .B(n3), .Z(sum) );
  CIVX1 U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_319 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_638 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_637 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n1), .B(n2), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_639 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n3;

  CNIVX1 U1 ( .A(a), .Z(n1) );
  CENX1 U2 ( .A(n3), .B(n1), .Z(sum) );
  CAN2X1 U3 ( .A(b), .B(a), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n3) );
endmodule


module Add_half_640 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_320 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_640 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_639 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX1 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_80 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, net50786,
         net50787, net54909, n1, n2, n3, n4, n5, n6, n7, n8;

  Add_full_320 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_319 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_318 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_317 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2XL U3 ( .A0(n8), .A1(n7), .S(net54909), .Z(sum2[1]) );
  CND2XL U4 ( .A(n4), .B(n3), .Z(n5) );
  CAN2X2 U5 ( .A(n4), .B(n3), .Z(net54909) );
  CND2X2 U6 ( .A(c_out10), .B(net54909), .Z(n1) );
  CND2X1 U7 ( .A(c_out11), .B(n5), .Z(n2) );
  CND2X2 U8 ( .A(n1), .B(n2), .Z(c_out2) );
  CND2X2 U9 ( .A(c_out01), .B(c_in2), .Z(n4) );
  CND2X2 U10 ( .A(c_out00), .B(n6), .Z(n3) );
  CIVX2 U11 ( .A(c_in2), .Z(n6) );
  CMXI2X1 U12 ( .A0(net50786), .A1(net50787), .S(c_in2), .Z(sum2[0]) );
  CIVX1 U13 ( .A(s1), .Z(net50786) );
  CIVXL U14 ( .A(s2), .Z(net50787) );
  CIVX2 U15 ( .A(s4), .Z(n8) );
  CIVX2 U16 ( .A(s3), .Z(n7) );
endmodule


module bit4_20 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, net55263, net56168, net64487,
         net64481, net64480, net64496, net50809, net50800, net50799, n2, n3,
         n4;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_80 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_79 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_78 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_77 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CND2X2 U3 ( .A(net55263), .B(c_out410), .Z(n3) );
  CIVX2 U4 ( .A(net64496), .Z(net55263) );
  CNR2IXL U5 ( .B(s44[0]), .A(net50799), .Z(net64481) );
  CND2X1 U6 ( .A(net55263), .B(s43[0]), .Z(n4) );
  CND2X2 U7 ( .A(net50800), .B(net50799), .Z(net64496) );
  CND2X2 U8 ( .A(n3), .B(n2), .Z(c_out4) );
  CND2X1 U9 ( .A(c_out411), .B(net64496), .Z(n2) );
  CND2IX1 U10 ( .B(net50809), .A(c_out401), .Z(net50800) );
  CNR2XL U11 ( .A(net50800), .B(net64487), .Z(net64480) );
  CIVX2 U12 ( .A(c_in4), .Z(net50809) );
  CND2IX2 U13 ( .B(c_in4), .A(c_out400), .Z(net50799) );
  CMX2X1 U14 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U15 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CND2X2 U16 ( .A(net56168), .B(n4), .Z(sum4[2]) );
  CIVX2 U17 ( .A(s44[0]), .Z(net64487) );
  CNR2X1 U18 ( .A(net64480), .B(net64481), .Z(net56168) );
  CMX2X1 U19 ( .A0(s44[1]), .A1(s43[1]), .S(net55263), .Z(sum4[3]) );
endmodule


module bit8_5 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   n31, n32, c_out800, c_out801, c_out810, c_out811, net50819, net50820,
         net57226, net57224, net59642, net59640, net58601, net57197, net56972,
         net50821, net64956, net64187, net50824, net50822, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17, n18, n19, n20, n22,
         n23, n24, n25, n26, n27, n28, n29, n30;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_20 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4({b8[3], n14, 
        n18, b8[0]}), .c_in4(1'b0) );
  bit4_19 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4({b8[3], n14, 
        n18, b8[0]}), .c_in4(1'b1) );
  bit4_18 A83 ( .sum4(s83), .c_out4(c_out810), .a4({n8, n12, a8[5:4]}), .b4(
        b8[7:4]), .c_in4(1'b0) );
  bit4_17 A84 ( .sum4(s84), .c_out4(c_out811), .a4({n8, n12, a8[5:4]}), .b4(
        b8[7:4]), .c_in4(1'b1) );
  CND2IX4 U3 ( .B(net50824), .A(net58601), .Z(net50821) );
  CND2X1 U4 ( .A(s82[3]), .B(net56972), .Z(net57226) );
  CNIVX1 U5 ( .A(c_in8), .Z(net56972) );
  CND2X4 U6 ( .A(n6), .B(n7), .Z(sum8[1]) );
  CIVX1 U7 ( .A(s83[0]), .Z(n5) );
  CIVX1 U8 ( .A(s84[0]), .Z(n4) );
  CND2X1 U9 ( .A(s81[1]), .B(net50824), .Z(n6) );
  CIVX3 U10 ( .A(c_in8), .Z(net50824) );
  CND2X2 U11 ( .A(n2), .B(n1), .Z(net58601) );
  CIVX2 U12 ( .A(c_out801), .Z(n3) );
  CND2X1 U13 ( .A(c_out801), .B(s84[0]), .Z(n1) );
  CND2X2 U14 ( .A(s83[0]), .B(n3), .Z(n2) );
  CND2IX2 U15 ( .B(net64187), .A(net64956), .Z(net50822) );
  CND2X4 U16 ( .A(net50822), .B(net50821), .Z(sum8[4]) );
  CMXI2X1 U17 ( .A0(n5), .A1(n4), .S(c_out800), .Z(net64956) );
  CIVX2 U18 ( .A(net50824), .Z(net64187) );
  CND2X2 U19 ( .A(s82[2]), .B(net64187), .Z(net59642) );
  CIVX2 U20 ( .A(net50824), .Z(net57197) );
  CND2X1 U21 ( .A(c_out800), .B(net50824), .Z(net50819) );
  CIVX1 U22 ( .A(net56972), .Z(net57224) );
  CND2X2 U23 ( .A(c_out801), .B(net57197), .Z(net50820) );
  CND2X2 U24 ( .A(s81[2]), .B(net59640), .Z(n9) );
  CND2X1 U25 ( .A(c_in8), .B(s82[1]), .Z(n7) );
  CNIVX4 U26 ( .A(a8[7]), .Z(n8) );
  CIVX1 U27 ( .A(s83[1]), .Z(n27) );
  CMX2X2 U28 ( .A0(s83[2]), .A1(s84[2]), .S(n26), .Z(sum8[6]) );
  CIVX12 U29 ( .A(n20), .Z(sum8[0]) );
  CND2X4 U30 ( .A(net59642), .B(n9), .Z(sum8[2]) );
  CIVXL U31 ( .A(c_in8), .Z(net59640) );
  CND2X2 U32 ( .A(s81[3]), .B(net57224), .Z(n10) );
  CND2X4 U33 ( .A(n10), .B(net57226), .Z(sum8[3]) );
  CIVX3 U34 ( .A(b8[1]), .Z(n17) );
  CAN2XL U35 ( .A(net50820), .B(net50819), .Z(n19) );
  CMXI2X1 U36 ( .A0(n30), .A1(n29), .S(n19), .Z(sum8[7]) );
  CIVX8 U37 ( .A(n13), .Z(n14) );
  CIVX1 U38 ( .A(s83[3]), .Z(n29) );
  CIVX2 U39 ( .A(a8[6]), .Z(n11) );
  CIVX4 U40 ( .A(n11), .Z(n12) );
  CMXI2XL U41 ( .A0(n23), .A1(n22), .S(n19), .Z(c_out8) );
  CND2X2 U42 ( .A(net50820), .B(net50819), .Z(n26) );
  CIVX4 U43 ( .A(n32), .Z(n20) );
  COND1X2 U44 ( .A(n25), .B(c_in8), .C(n24), .Z(n32) );
  CND2X2 U45 ( .A(c_in8), .B(s82[0]), .Z(n24) );
  CIVX1 U46 ( .A(s84[3]), .Z(n30) );
  CIVX2 U47 ( .A(b8[2]), .Z(n13) );
  CMXI2X1 U48 ( .A0(n27), .A1(n28), .S(n26), .Z(n31) );
  CIVX2 U49 ( .A(n31), .Z(n15) );
  CIVX4 U50 ( .A(n15), .Z(sum8[5]) );
  CIVX4 U51 ( .A(n17), .Z(n18) );
  CIVX2 U52 ( .A(c_out811), .Z(n23) );
  CIVX2 U53 ( .A(c_out810), .Z(n22) );
  CIVX2 U54 ( .A(s81[0]), .Z(n25) );
  CIVX2 U55 ( .A(s84[1]), .Z(n28) );
endmodule


module Add_half_641 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_642 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_321 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_642 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_641 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_643 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_644 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX2 U1 ( .A(a), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX2 U3 ( .A(n2), .B(b), .Z(sum) );
endmodule


module Add_full_322 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_644 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_643 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_645 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_646 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_323 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_646 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_645 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_647 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_648 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_324 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_648 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_647 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_81 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_324 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_323 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_322 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_321 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out10), .A1(c_out11), .S(n3), .Z(c_out2) );
  CAN2XL U4 ( .A(n5), .B(n4), .Z(n1) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_in2), .Z(n2) );
  CND2X2 U7 ( .A(c_out00), .B(n2), .Z(n5) );
  CND2X2 U8 ( .A(c_out01), .B(c_in2), .Z(n4) );
  CND2X2 U9 ( .A(n5), .B(n4), .Z(n3) );
  CIVX2 U10 ( .A(s4), .Z(n7) );
  CIVX2 U11 ( .A(s3), .Z(n6) );
  CMXI2X1 U12 ( .A0(n7), .A1(n6), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_649 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_650 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_325 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_650 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_649 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_651 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_652 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CENX2 U2 ( .A(n2), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(a), .Z(n2) );
endmodule


module Add_full_326 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_652 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_651 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_653 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_654 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_327 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_654 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_653 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_655 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_656 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_328 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_656 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_655 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_82 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_328 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_327 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_326 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_325 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CAN2XL U3 ( .A(n7), .B(n6), .Z(n1) );
  CND2X2 U4 ( .A(n7), .B(n6), .Z(n3) );
  CMX2X1 U5 ( .A0(c_out10), .A1(c_out11), .S(n3), .Z(c_out2) );
  CIVX2 U6 ( .A(c_in2), .Z(n2) );
  CND2X2 U7 ( .A(c_out00), .B(n2), .Z(n7) );
  CND2X2 U8 ( .A(c_out01), .B(c_in2), .Z(n6) );
  CIVX2 U9 ( .A(s1), .Z(n5) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U12 ( .A(s4), .Z(n9) );
  CIVX2 U13 ( .A(s3), .Z(n8) );
  CMXI2X1 U14 ( .A0(n9), .A1(n8), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_657 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_658 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_329 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_658 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_657 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_659 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_660 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_330 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_660 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_659 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_661 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_662 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U2 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVX1 U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_331 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_662 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_661 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_663 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_664 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVX1 U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_332 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_664 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_663 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_83 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_332 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_331 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_330 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_329 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n2), .Z(n5) );
  CMX2XL U4 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U5 ( .A0(n7), .A1(n6), .S(n1), .Z(sum2[1]) );
  CIVXL U6 ( .A(s4), .Z(n6) );
  CIVXL U7 ( .A(s3), .Z(n7) );
  CMX2X1 U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(c_out10), .Z(n4) );
  CIVX2 U10 ( .A(c_out11), .Z(n3) );
  CMXI2X1 U11 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CMXI2X1 U12 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out2) );
endmodule


module Add_half_665 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_666 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_333 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_666 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_665 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_667 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CND2X1 U2 ( .A(b), .B(a), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_668 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2, n3, n4, n5;

  CND2IX1 U1 ( .B(n5), .A(n2), .Z(n4) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U3 ( .A(a), .Z(n2) );
  CND2X1 U4 ( .A(n5), .B(a), .Z(n3) );
  CND2X2 U5 ( .A(n3), .B(n4), .Z(sum) );
  CIVX1 U6 ( .A(b), .Z(n5) );
endmodule


module Add_full_334 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_668 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_667 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_669 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVXL U1 ( .A(a), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(n2) );
  CEOXL U3 ( .A(b), .B(n2), .Z(sum) );
  CAN2X1 U4 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_670 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3;

  CIVXL U1 ( .A(b), .Z(n1) );
  CND2IXL U2 ( .B(a), .A(b), .Z(n3) );
  CND2XL U3 ( .A(a), .B(n1), .Z(n2) );
  CND2X1 U4 ( .A(n3), .B(n2), .Z(sum) );
  CAN2XL U5 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_335 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_670 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_669 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_671 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_672 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  CIVDXL U1 ( .A(b), .Z0(n1), .Z1(n2) );
  CND2X1 U2 ( .A(n4), .B(n5), .Z(sum) );
  CND2X1 U3 ( .A(n3), .B(n2), .Z(n5) );
  CND2XL U4 ( .A(a), .B(n1), .Z(n4) );
  CIVXL U5 ( .A(a), .Z(n3) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_336 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_672 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_671 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_84 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_336 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_335 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_334 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_333 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out01), .A1(c_out00), .S(n3), .Z(n1) );
  CMX2X1 U4 ( .A0(c_out01), .A1(c_out00), .S(n3), .Z(n2) );
  CIVX2 U5 ( .A(c_in2), .Z(n3) );
  CIVXL U6 ( .A(s4), .Z(n8) );
  CIVX2 U7 ( .A(c_out10), .Z(n5) );
  CIVX2 U8 ( .A(c_out11), .Z(n4) );
  CMXI2X1 U9 ( .A0(n5), .A1(n4), .S(n1), .Z(c_out2) );
  CIVX2 U10 ( .A(s1), .Z(n7) );
  CIVX2 U11 ( .A(s2), .Z(n6) );
  CMXI2X1 U12 ( .A0(n7), .A1(n6), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U13 ( .A(s3), .Z(n9) );
  CMXI2X1 U14 ( .A0(n9), .A1(n8), .S(n2), .Z(sum2[1]) );
endmodule


module bit4_21 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_84 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_83 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_82 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_81 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CND2X2 U3 ( .A(n6), .B(n5), .Z(n1) );
  CIVX1 U4 ( .A(c_out410), .Z(n3) );
  CMXI2X1 U5 ( .A0(n11), .A1(n10), .S(n9), .Z(sum4[3]) );
  CIVXL U6 ( .A(n1), .Z(n9) );
  CMXI2X1 U7 ( .A0(n3), .A1(n4), .S(n1), .Z(c_out4) );
  CMXI2X1 U8 ( .A0(n7), .A1(n8), .S(n1), .Z(sum4[2]) );
  CIVX1 U9 ( .A(c_out411), .Z(n4) );
  CMX2X1 U10 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CND2IX1 U11 ( .B(n2), .A(c_out401), .Z(n5) );
  CMX2X1 U12 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CND2IX1 U13 ( .B(c_in4), .A(c_out400), .Z(n6) );
  CIVX2 U14 ( .A(c_in4), .Z(n2) );
  CIVX2 U15 ( .A(s44[0]), .Z(n8) );
  CIVX2 U16 ( .A(s43[0]), .Z(n7) );
  CIVX2 U17 ( .A(s44[1]), .Z(n11) );
  CIVX2 U18 ( .A(s43[1]), .Z(n10) );
endmodule


module Add_half_673 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENX1 U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_674 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_337 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_674 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_673 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_675 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_676 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_338 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_676 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_675 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_677 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CNIVXL U1 ( .A(a), .Z(n1) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U3 ( .A(n1), .B(b), .Z(sum) );
endmodule


module Add_half_678 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CENX1 U2 ( .A(n2), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_339 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_678 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_677 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_679 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_680 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_340 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_680 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_679 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_85 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_340 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_339 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_338 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_337 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s4), .A1(s3), .S(n1), .Z(sum2[1]) );
  CAN2XL U4 ( .A(n5), .B(n4), .Z(n1) );
  CND2X2 U5 ( .A(n5), .B(n4), .Z(n3) );
  CMX2X1 U6 ( .A0(c_out10), .A1(c_out11), .S(n3), .Z(c_out2) );
  CMX2X1 U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U8 ( .A(c_in2), .Z(n2) );
  CND2X2 U9 ( .A(c_out00), .B(n2), .Z(n5) );
  CND2X2 U10 ( .A(c_out01), .B(c_in2), .Z(n4) );
endmodule


module Add_half_681 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_682 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_341 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_682 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_681 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_683 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_684 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_342 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_684 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_683 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_685 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_686 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CENX1 U2 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_343 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_686 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_685 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_687 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_688 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_344 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_688 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_687 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_86 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_344 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_343 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_342 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_341 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out10), .A1(c_out11), .S(n3), .Z(c_out2) );
  CAN2XL U4 ( .A(n5), .B(n4), .Z(n1) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CND2X2 U6 ( .A(n5), .B(n4), .Z(n3) );
  CIVX2 U7 ( .A(c_in2), .Z(n2) );
  CND2X2 U8 ( .A(c_out00), .B(n2), .Z(n5) );
  CND2X2 U9 ( .A(c_out01), .B(c_in2), .Z(n4) );
  CIVX2 U10 ( .A(s4), .Z(n7) );
  CIVX2 U11 ( .A(s3), .Z(n6) );
  CMXI2X1 U12 ( .A0(n7), .A1(n6), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_689 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_690 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U2 ( .A(b), .Z(n2) );
  CENX2 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_345 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_690 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_689 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_691 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_692 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(b), .Z(n2) );
  CENX2 U2 ( .A(n2), .B(a), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_346 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_692 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_691 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_693 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_694 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X1 U1 ( .A(n1), .B(b), .Z(n4) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVX1 U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_347 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_694 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_693 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_695 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_696 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U2 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVX1 U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_348 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_696 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_695 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_87 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_348 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_347 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_346 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_345 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX1 U4 ( .A(c_out11), .Z(n2) );
  CIVX1 U5 ( .A(c_out10), .Z(n3) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2XL U7 ( .A0(n5), .A1(n4), .S(n1), .Z(sum2[1]) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n1), .Z(c_out2) );
  CIVX2 U9 ( .A(s3), .Z(n5) );
  CIVX2 U10 ( .A(s4), .Z(n4) );
endmodule


module Add_half_697 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_698 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_349 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_698 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_697 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_699 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_700 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_350 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_700 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_699 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_701 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CNIVXL U1 ( .A(a), .Z(n1) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n2) );
  CIVX2 U3 ( .A(n2), .Z(c_out) );
  CEOXL U4 ( .A(b), .B(n1), .Z(sum) );
endmodule


module Add_half_702 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X2 U1 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U2 ( .A(b), .Z(n2) );
  CND2XL U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n3), .B(n4), .Z(sum) );
  CIVX1 U5 ( .A(a), .Z(n1) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_351 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_702 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_701 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_703 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVXL U1 ( .A(a), .Z(n1) );
  CIVXL U2 ( .A(n1), .Z(n2) );
  CEOXL U3 ( .A(b), .B(n2), .Z(sum) );
  CAN2X1 U4 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_704 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5, n6;

  CIVDXL U1 ( .A(b), .Z0(n1), .Z1(n2) );
  CND2X2 U2 ( .A(n4), .B(b), .Z(n6) );
  CND2XL U3 ( .A(a), .B(n1), .Z(n5) );
  CAN2X1 U4 ( .A(n2), .B(n3), .Z(c_out) );
  CNIVXL U5 ( .A(a), .Z(n3) );
  CND2X1 U6 ( .A(n5), .B(n6), .Z(sum) );
  CIVX1 U7 ( .A(a), .Z(n4) );
endmodule


module Add_full_352 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_704 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_703 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_88 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_352 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_351 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_350 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_349 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2X2 U3 ( .A(c_out10), .B(n1), .Z(n2) );
  CND2X1 U4 ( .A(c_out11), .B(n8), .Z(n3) );
  CND2X2 U5 ( .A(n2), .B(n3), .Z(c_out2) );
  CIVX1 U6 ( .A(n8), .Z(n1) );
  CMXI2X1 U7 ( .A0(c_out01), .A1(c_out00), .S(n4), .Z(n5) );
  CIVX20 U8 ( .A(c_in2), .Z(n4) );
  CIVX1 U9 ( .A(n5), .Z(n8) );
  CMX2XL U10 ( .A0(s3), .A1(s4), .S(n8), .Z(sum2[1]) );
  CIVX2 U11 ( .A(s1), .Z(n7) );
  CIVX2 U12 ( .A(s2), .Z(n6) );
  CMXI2X1 U13 ( .A0(n7), .A1(n6), .S(c_in2), .Z(sum2[0]) );
endmodule


module bit4_22 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_88 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_87 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_86 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_85 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U3 ( .A(c_in4), .Z(n3) );
  CMXI2X1 U4 ( .A0(n11), .A1(n12), .S(n1), .Z(sum4[3]) );
  CND2XL U5 ( .A(n8), .B(n7), .Z(n1) );
  CMX2X1 U6 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U7 ( .A(c_out411), .Z(n6) );
  CIVX1 U8 ( .A(n4), .Z(n2) );
  CND2IX2 U9 ( .B(c_in4), .A(c_out400), .Z(n8) );
  CND2X2 U10 ( .A(n7), .B(n8), .Z(n4) );
  CND2IX1 U11 ( .B(n3), .A(c_out401), .Z(n7) );
  CMXI2X1 U12 ( .A0(n5), .A1(n6), .S(n4), .Z(c_out4) );
  CMX2X1 U13 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U14 ( .A(c_out410), .Z(n5) );
  CIVX2 U15 ( .A(s44[0]), .Z(n10) );
  CIVX2 U16 ( .A(s43[0]), .Z(n9) );
  CMXI2X1 U17 ( .A0(n10), .A1(n9), .S(n2), .Z(sum4[2]) );
  CIVX2 U18 ( .A(s44[1]), .Z(n12) );
  CIVX2 U19 ( .A(s43[1]), .Z(n11) );
endmodule


module Add_half_705 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_706 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_353 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_706 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_705 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_707 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_708 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_354 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_708 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_707 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_709 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_710 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVXL U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(n2), .B(a), .Z(sum) );
endmodule


module Add_full_355 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_710 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_709 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_711 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_712 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVXL U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(n2), .B(a), .Z(sum) );
endmodule


module Add_full_356 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_712 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_711 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_89 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_356 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_355 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_354 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_353 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(s2), .Z(n4) );
  CIVX1 U4 ( .A(s1), .Z(n5) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U9 ( .A(n1), .Z(n6) );
  CMXI2X1 U10 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_713 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_714 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_357 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_714 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_713 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_715 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_716 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_358 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_716 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_715 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_717 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_718 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVXL U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(n2), .B(a), .Z(sum) );
endmodule


module Add_full_359 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_718 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_717 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_719 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_720 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_360 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_720 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_719 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_90 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_360 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_359 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_358 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_357 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n1) );
  CMXI2X1 U4 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n2) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n5), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out10), .Z(n4) );
  CIVX2 U8 ( .A(c_out11), .Z(n3) );
  CIVX2 U9 ( .A(n2), .Z(n5) );
  CMXI2X1 U10 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out2) );
endmodule


module Add_half_721 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_722 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CENX1 U1 ( .A(a), .B(n1), .Z(sum) );
  CIVX20 U2 ( .A(b), .Z(n1) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_361 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_722 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_721 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_723 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_724 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_362 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_724 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_723 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_725 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_726 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_363 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_726 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_725 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_727 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_728 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_364 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_728 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_727 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_91 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_364 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_363 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_362 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_361 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVXL U4 ( .A(s2), .Z(n5) );
  CIVXL U5 ( .A(s3), .Z(n8) );
  CIVX1 U6 ( .A(s1), .Z(n6) );
  CMXI2X1 U7 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out2) );
  CIVXL U8 ( .A(s4), .Z(n7) );
  CIVX2 U9 ( .A(c_out10), .Z(n4) );
  CIVX2 U10 ( .A(c_out11), .Z(n3) );
  CMXI2X1 U11 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n2) );
  CMXI2X1 U12 ( .A0(n6), .A1(n5), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U13 ( .A0(n8), .A1(n7), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_729 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_730 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CENX1 U1 ( .A(a), .B(n1), .Z(sum) );
  CIVX20 U2 ( .A(b), .Z(n1) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_365 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_730 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_729 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_731 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_732 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_366 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_732 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_731 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_733 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_734 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENX1 U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_full_367 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_734 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_733 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_735 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_736 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_368 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_736 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_735 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_92 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_368 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_367 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_366 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_365 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out01), .A1(c_out00), .S(n2), .Z(n1) );
  CIVX2 U4 ( .A(c_in2), .Z(n2) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n1), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out10), .Z(n4) );
  CIVX2 U8 ( .A(c_out11), .Z(n3) );
  CMXI2X1 U9 ( .A0(n4), .A1(n3), .S(n1), .Z(c_out2) );
endmodule


module bit4_23 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_92 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_91 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_90 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_89 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2X1 U3 ( .A0(s43[1]), .A1(s44[1]), .S(n1), .Z(sum4[3]) );
  CMX2XL U4 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX1 U5 ( .A(n2), .Z(n5) );
  CIVX1 U6 ( .A(c_out411), .Z(n3) );
  CIVX1 U7 ( .A(c_out410), .Z(n4) );
  CMX2X1 U8 ( .A0(s43[0]), .A1(s44[0]), .S(n5), .Z(sum4[2]) );
  CMX2X1 U9 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U10 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMXI2X1 U11 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n2) );
  CMXI2X1 U12 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out4) );
endmodule


module Add_half_737 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CIVX1 U2 ( .A(n1), .Z(c_out) );
  CND2X1 U3 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_738 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_369 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_738 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_737 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_739 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_740 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_370 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_740 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_739 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_741 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_742 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_371 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_742 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_741 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_743 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_744 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVXL U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(n2), .B(a), .Z(sum) );
endmodule


module Add_full_372 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_744 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_743 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_93 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_372 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_371 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_370 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_369 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n2) );
  CMXI2X1 U4 ( .A0(n4), .A1(n5), .S(n3), .Z(c_out2) );
  CMX2XL U5 ( .A0(c_out01), .A1(c_out00), .S(n2), .Z(n1) );
  CMXI2X1 U6 ( .A0(c_out01), .A1(c_out00), .S(n2), .Z(n3) );
  CMX2XL U7 ( .A0(s3), .A1(s4), .S(n1), .Z(sum2[1]) );
  CMX2X1 U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(c_out10), .Z(n5) );
  CIVX2 U10 ( .A(c_out11), .Z(n4) );
endmodule


module Add_half_745 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_746 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_373 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_746 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_745 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_747 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_748 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_374 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_748 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_747 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_749 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_750 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_375 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_750 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_749 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_751 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X2 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_752 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENX1 U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX1 U3 ( .A(b), .Z(n2) );
endmodule


module Add_full_376 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_752 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_751 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_94 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_376 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_375 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_374 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_373 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out10), .Z(n3) );
  CIVX1 U4 ( .A(n1), .Z(n4) );
  CMXI2X1 U5 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out2) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_753 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_754 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_377 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_754 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_753 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_755 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_756 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_378 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_756 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_755 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_757 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_758 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_379 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_758 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_757 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_759 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_760 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_380 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_760 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_759 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_95 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_380 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_379 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_378 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_377 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n1), .Z(n4) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_761 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_762 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_381 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_762 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_761 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_763 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_764 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_382 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_764 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_763 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_765 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_766 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_383 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_766 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_765 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_767 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_768 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_384 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_768 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_767 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_96 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_384 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_383 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_382 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_381 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out2) );
  CIVX2 U4 ( .A(c_in2), .Z(n1) );
  CMXI2X1 U5 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n2) );
  CMX2X1 U6 ( .A0(s3), .A1(s4), .S(n5), .Z(sum2[1]) );
  CMX2X1 U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U8 ( .A(c_out10), .Z(n4) );
  CIVX2 U9 ( .A(c_out11), .Z(n3) );
  CIVX2 U10 ( .A(n2), .Z(n5) );
endmodule


module bit4_24 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_96 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_95 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_94 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_93 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMXI2X1 U3 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVXL U4 ( .A(s42[1]), .Z(n6) );
  CMX2X1 U5 ( .A0(s43[1]), .A1(s44[1]), .S(n10), .Z(sum4[3]) );
  CIVX1 U6 ( .A(c_out410), .Z(n3) );
  CIVX1 U7 ( .A(c_out411), .Z(n2) );
  CIVX2 U8 ( .A(n1), .Z(n10) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n10), .Z(c_out4) );
  CIVX2 U10 ( .A(s41[0]), .Z(n5) );
  CIVX2 U11 ( .A(s42[0]), .Z(n4) );
  CMXI2X1 U12 ( .A0(n5), .A1(n4), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U13 ( .A(s41[1]), .Z(n7) );
  CMXI2X1 U14 ( .A0(n7), .A1(n6), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U15 ( .A(s43[0]), .Z(n9) );
  CIVX2 U16 ( .A(s44[0]), .Z(n8) );
  CMXI2X1 U17 ( .A0(n9), .A1(n8), .S(n10), .Z(sum4[2]) );
endmodule


module bit8_6 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3, n4, n5, n6, n7,
         n8, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_24 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_23 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_22 A83 ( .sum4(s83), .c_out4(c_out810), .a4({a8[7:6], n6, a8[4]}), .b4(
        {n13, b8[6:4]}), .c_in4(1'b0) );
  bit4_21 A84 ( .sum4(s84), .c_out4(c_out811), .a4({a8[7:6], n2, a8[4]}), .b4(
        {n13, b8[6:4]}), .c_in4(1'b1) );
  CIVX1 U3 ( .A(s82[2]), .Z(n21) );
  CNIVX1 U4 ( .A(n30), .Z(n1) );
  CAN2X1 U5 ( .A(n26), .B(n25), .Z(n11) );
  CND2X1 U6 ( .A(s83[2]), .B(n11), .Z(n4) );
  CMX2X2 U7 ( .A0(s84[3]), .A1(s83[3]), .S(n1), .Z(sum8[7]) );
  CND2IX1 U8 ( .B(c_in8), .A(c_out800), .Z(n25) );
  CMXI2X2 U9 ( .A0(n18), .A1(n17), .S(c_in8), .Z(sum8[0]) );
  CIVX3 U10 ( .A(a8[5]), .Z(n10) );
  CNIVX4 U11 ( .A(a8[5]), .Z(n2) );
  CIVX2 U12 ( .A(n30), .Z(n3) );
  CND2X1 U13 ( .A(s84[2]), .B(n3), .Z(n5) );
  CND2X4 U14 ( .A(n4), .B(n5), .Z(sum8[6]) );
  CND2X4 U15 ( .A(n7), .B(n8), .Z(sum8[4]) );
  CIVX1 U16 ( .A(s84[1]), .Z(n29) );
  CIVX1 U17 ( .A(s83[1]), .Z(n28) );
  CIVX2 U18 ( .A(n27), .Z(n30) );
  CND2X1 U19 ( .A(s84[0]), .B(n27), .Z(n7) );
  CND2X2 U20 ( .A(s83[0]), .B(n11), .Z(n8) );
  CIVX1 U21 ( .A(s81[1]), .Z(n20) );
  CIVX2 U22 ( .A(b8[7]), .Z(n12) );
  CIVX8 U23 ( .A(n12), .Z(n13) );
  CND2X2 U24 ( .A(n26), .B(n25), .Z(n27) );
  CIVX4 U25 ( .A(n10), .Z(n6) );
  CIVX1 U26 ( .A(s82[3]), .Z(n23) );
  CMXI2X1 U27 ( .A0(n29), .A1(n28), .S(n30), .Z(sum8[5]) );
  CMXI2X2 U28 ( .A0(n20), .A1(n19), .S(c_in8), .Z(sum8[1]) );
  CMXI2X1 U29 ( .A0(n22), .A1(n21), .S(c_in8), .Z(sum8[2]) );
  CIVX1 U30 ( .A(s81[2]), .Z(n22) );
  CND2IX2 U31 ( .B(n27), .A(c_out810), .Z(n15) );
  CND2X2 U32 ( .A(c_out811), .B(n3), .Z(n16) );
  CND2X4 U33 ( .A(n16), .B(n15), .Z(c_out8) );
  CMXI2X4 U34 ( .A0(n24), .A1(n23), .S(c_in8), .Z(sum8[3]) );
  CIVX2 U35 ( .A(c_in8), .Z(n14) );
  CND2IX1 U36 ( .B(n14), .A(c_out801), .Z(n26) );
  CIVX2 U37 ( .A(s81[0]), .Z(n18) );
  CIVX2 U38 ( .A(s82[0]), .Z(n17) );
  CIVX2 U39 ( .A(s82[1]), .Z(n19) );
  CIVX2 U40 ( .A(s81[3]), .Z(n24) );
endmodule


module bit16_3 ( a16, b16, sum16, c_out16, c_in16 );
  input [15:0] a16;
  input [15:0] b16;
  output [15:0] sum16;
  input c_in16;
  output c_out16;
  wire   n4, c1, n1, n2;

  bit8_6 A161 ( .sum8(sum16[7:0]), .c_out8(c1), .a8(a16[7:0]), .b8({b16[7:3], 
        n1, b16[1:0]}), .c_in8(c_in16) );
  bit8_5 A162 ( .sum8({n4, sum16[14:8]}), .c_out8(c_out16), .a8(a16[15:8]), 
        .b8(b16[15:8]), .c_in8(c1) );
  CNIVX4 U1 ( .A(b16[2]), .Z(n1) );
  CIVX1 U2 ( .A(n4), .Z(n2) );
  CIVX4 U3 ( .A(n2), .Z(sum16[15]) );
endmodule


module Add_half_769 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_770 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_385 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_770 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_769 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_771 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_772 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_386 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_772 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_771 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_773 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_774 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_387 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_774 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_773 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_775 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_776 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_388 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_776 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_775 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_97 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_388 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_387 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_386 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_385 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
endmodule


module Add_half_777 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_778 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_389 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_778 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_777 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_779 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_780 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_390 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_780 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_779 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_781 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_782 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_391 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_782 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_781 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_783 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_784 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_392 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_784 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_783 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_98 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_392 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_391 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_390 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_389 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
endmodule


module Add_half_785 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_786 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_393 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_786 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_785 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_787 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_788 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_394 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_788 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_787 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_789 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_790 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_395 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_790 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_789 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_791 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_792 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_396 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_792 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_791 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_99 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_396 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_395 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_394 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_393 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_793 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_794 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_397 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_794 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_793 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_795 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_796 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_398 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_796 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_795 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_797 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_798 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_399 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_798 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_797 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_799 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_800 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_400 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_800 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_799 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_100 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_400 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_399 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_398 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_397 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U9 ( .A(n1), .Z(n4) );
endmodule


module bit4_25 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_100 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_99 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_98 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_97 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMXI2XL U3 ( .A0(n7), .A1(n6), .S(n1), .Z(sum4[2]) );
  CMXI2XL U4 ( .A0(n9), .A1(n8), .S(n1), .Z(sum4[3]) );
  CMX2XL U5 ( .A0(c_out410), .A1(c_out411), .S(n1), .Z(c_out4) );
  CMX2X1 U6 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U7 ( .A(s41[0]), .Z(n3) );
  CIVX2 U8 ( .A(s42[0]), .Z(n2) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U10 ( .A(s41[1]), .Z(n5) );
  CIVX2 U11 ( .A(s42[1]), .Z(n4) );
  CMXI2X1 U12 ( .A0(n5), .A1(n4), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U13 ( .A(s43[0]), .Z(n7) );
  CIVX2 U14 ( .A(s44[0]), .Z(n6) );
  CIVX2 U15 ( .A(s43[1]), .Z(n9) );
  CIVX2 U16 ( .A(s44[1]), .Z(n8) );
endmodule


module Add_half_801 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_802 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_401 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_802 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_801 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_803 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_804 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_402 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_804 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_803 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_805 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_806 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_403 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_806 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_805 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_807 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_808 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_404 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_808 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_807 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_101 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_404 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_403 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_402 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_401 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out10), .A1(c_out11), .S(n4), .Z(c_out2) );
  CMXI2X1 U4 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U5 ( .A(n1), .Z(n4) );
  CIVX2 U6 ( .A(s1), .Z(n3) );
  CIVX2 U7 ( .A(s2), .Z(n2) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_809 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_810 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_405 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_810 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_809 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_811 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_812 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_406 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_812 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_811 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_813 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_814 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_407 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_814 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_813 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_815 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_816 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_408 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_816 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_815 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_102 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_408 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_407 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_406 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_405 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U6 ( .A(n1), .Z(n2) );
  CIVX2 U7 ( .A(s3), .Z(n4) );
  CIVX2 U8 ( .A(s4), .Z(n3) );
  CMXI2X1 U9 ( .A0(n4), .A1(n3), .S(n2), .Z(sum2[1]) );
endmodule


module Add_half_817 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_818 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_409 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_818 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_817 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_819 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_820 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_410 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_820 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_819 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_821 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_822 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_411 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_822 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_821 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_823 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_824 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_412 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_824 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_823 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_103 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_412 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_411 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_410 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_409 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_out10), .Z(n3) );
  CIVX2 U4 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U6 ( .A(n1), .Z(n6) );
  CMXI2X1 U7 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U8 ( .A(s1), .Z(n5) );
  CIVX2 U9 ( .A(s2), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(s3), .Z(n8) );
  CIVX2 U12 ( .A(s4), .Z(n7) );
  CMXI2X1 U13 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
endmodule


module Add_half_825 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_826 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_413 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_826 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_825 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_827 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_828 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_414 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_828 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_827 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_829 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_830 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_415 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_830 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_829 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_831 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_832 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_416 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_832 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_831 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_104 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_416 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_415 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_414 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_413 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U9 ( .A(n1), .Z(n4) );
endmodule


module bit4_26 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_104 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_103 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_102 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_101 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2XL U3 ( .A0(c_out410), .A1(c_out411), .S(n1), .Z(c_out4) );
  CMX2X1 U4 ( .A0(s43[1]), .A1(s44[1]), .S(n1), .Z(sum4[3]) );
  CMX2X1 U5 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U6 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMX2X1 U7 ( .A0(s43[0]), .A1(s44[0]), .S(n1), .Z(sum4[2]) );
  CMX2X1 U8 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
endmodule


module Add_half_833 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_834 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_417 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_834 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_833 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_835 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_836 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_418 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_836 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_835 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_837 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_838 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_419 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_838 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_837 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_839 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_840 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_420 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_840 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_839 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_105 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_420 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_419 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_418 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_417 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out10), .A1(c_out11), .S(n4), .Z(c_out2) );
  CMXI2X1 U4 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U5 ( .A(n1), .Z(n4) );
  CIVX2 U6 ( .A(s1), .Z(n3) );
  CIVX2 U7 ( .A(s2), .Z(n2) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_841 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_842 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_421 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_842 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_841 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_843 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_844 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_422 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_844 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_843 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_845 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_846 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_423 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_846 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_845 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_847 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_848 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_424 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_848 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_847 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_106 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_424 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_423 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_422 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_421 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
endmodule


module Add_half_849 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_850 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_425 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_850 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_849 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_851 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_852 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_426 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_852 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_851 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_853 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_854 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_427 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_854 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_853 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_855 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_856 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_428 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_856 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_855 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_107 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_428 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_427 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_426 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_425 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2XL U3 ( .A0(n6), .A1(n7), .S(n1), .Z(sum2[1]) );
  CMXI2X1 U4 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out2) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(s1), .Z(n5) );
  CIVX2 U9 ( .A(s2), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(s3), .Z(n7) );
  CIVX2 U12 ( .A(s4), .Z(n6) );
endmodule


module Add_half_857 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_858 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_429 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_858 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_857 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_859 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_860 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_430 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_860 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_859 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_861 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_862 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX2 U1 ( .A(a), .Z(n1) );
  CIVX1 U2 ( .A(b), .Z(n2) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
  CND2X1 U4 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U5 ( .A(n1), .B(b), .Z(n4) );
  CND2X2 U6 ( .A(n3), .B(n4), .Z(sum) );
endmodule


module Add_full_431 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_862 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_861 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_863 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_864 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_432 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_864 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_863 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_108 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_432 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_431 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_430 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_429 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_in2), .Z(n1) );
  CMXI2X1 U4 ( .A0(c_out01), .A1(c_out00), .S(n1), .Z(n2) );
  CIVX1 U5 ( .A(c_out11), .Z(n3) );
  CIVX1 U6 ( .A(n2), .Z(n5) );
  CMX2XL U7 ( .A0(s3), .A1(s4), .S(n5), .Z(sum2[1]) );
  CMX2X1 U8 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(c_out10), .Z(n4) );
  CMXI2X1 U10 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out2) );
endmodule


module bit4_27 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_108 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_107 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_106 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_105 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2X1 U3 ( .A0(s43[0]), .A1(s44[0]), .S(n4), .Z(sum4[2]) );
  CMX2XL U4 ( .A0(s43[1]), .A1(s44[1]), .S(n4), .Z(sum4[3]) );
  CMX2X1 U5 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U6 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U7 ( .A(c_out410), .Z(n3) );
  CIVX2 U8 ( .A(c_out411), .Z(n2) );
  CMXI2X1 U9 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U10 ( .A(n1), .Z(n4) );
  CMXI2X1 U11 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out4) );
endmodule


module Add_half_865 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_866 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_433 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_866 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_865 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_867 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_868 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_434 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_868 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_867 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_869 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_870 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_435 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_870 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_869 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_871 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_872 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_436 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_872 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_871 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_109 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_436 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_435 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_434 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_433 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
endmodule


module Add_half_873 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_874 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_437 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_874 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_873 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_875 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_876 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_438 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_876 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_875 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_877 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_878 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_439 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_878 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_877 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_879 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_880 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_440 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_880 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_879 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_110 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_440 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_439 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_438 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_437 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
endmodule


module Add_half_881 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_882 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_441 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_882 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_881 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_883 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_884 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_442 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_884 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_883 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_885 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_886 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_443 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_886 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_885 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_887 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_888 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_444 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_888 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_887 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_111 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_444 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_443 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_442 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_441 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n1), .Z(n4) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_889 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_890 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_445 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_890 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_889 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_891 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_892 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_446 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_892 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_891 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_893 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_894 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_447 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_894 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_893 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_895 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_896 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_448 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_896 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_895 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module bit2_112 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_448 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_447 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_446 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_445 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out10), .Z(n3) );
  CIVX1 U4 ( .A(n1), .Z(n4) );
  CMXI2X1 U5 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CMX2XL U6 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U8 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U9 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
endmodule


module bit4_28 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_112 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_111 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_110 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_109 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMXI2XL U3 ( .A0(n7), .A1(n6), .S(n8), .Z(sum4[2]) );
  CMXI2X1 U4 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out4) );
  CMX2X1 U5 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U6 ( .A(c_out410), .Z(n3) );
  CIVX2 U7 ( .A(c_out411), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U9 ( .A(n1), .Z(n8) );
  CIVX2 U10 ( .A(s41[0]), .Z(n5) );
  CIVX2 U11 ( .A(s42[0]), .Z(n4) );
  CMXI2X1 U12 ( .A0(n5), .A1(n4), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U13 ( .A(s43[0]), .Z(n7) );
  CIVX2 U14 ( .A(s44[0]), .Z(n6) );
  CIVX2 U15 ( .A(s43[1]), .Z(n10) );
  CIVX2 U16 ( .A(s44[1]), .Z(n9) );
  CMXI2X1 U17 ( .A0(n10), .A1(n9), .S(n8), .Z(sum4[3]) );
endmodule


module bit8_7 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_28 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_27 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_26 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_25 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CND2X2 U3 ( .A(s81[0]), .B(n1), .Z(n2) );
  CND2X2 U4 ( .A(n2), .B(n3), .Z(sum8[0]) );
  CND2X1 U5 ( .A(s82[0]), .B(c_in8), .Z(n3) );
  CIVX2 U6 ( .A(c_in8), .Z(n1) );
  CMX2X2 U7 ( .A0(s83[1]), .A1(s84[1]), .S(n5), .Z(sum8[5]) );
  CMX2X2 U8 ( .A0(s81[2]), .A1(s82[2]), .S(c_in8), .Z(sum8[2]) );
  CMXI2XL U9 ( .A0(n9), .A1(n8), .S(c_in8), .Z(sum8[1]) );
  CMXI2XL U10 ( .A0(n7), .A1(n6), .S(n5), .Z(c_out8) );
  CMX2X4 U11 ( .A0(s81[3]), .A1(s82[3]), .S(n4), .Z(sum8[3]) );
  CIVXL U12 ( .A(n1), .Z(n4) );
  CMXI2X1 U13 ( .A0(n11), .A1(n10), .S(n5), .Z(sum8[4]) );
  CIVX1 U14 ( .A(s82[1]), .Z(n8) );
  CMX2X1 U15 ( .A0(s83[2]), .A1(s84[2]), .S(n5), .Z(sum8[6]) );
  CMX2X2 U16 ( .A0(c_out800), .A1(c_out801), .S(c_in8), .Z(n5) );
  CMX2XL U17 ( .A0(s83[3]), .A1(s84[3]), .S(n5), .Z(sum8[7]) );
  CIVX2 U18 ( .A(c_out810), .Z(n7) );
  CIVX2 U19 ( .A(c_out811), .Z(n6) );
  CIVX2 U20 ( .A(s81[1]), .Z(n9) );
  CIVX2 U21 ( .A(s83[0]), .Z(n11) );
  CIVX2 U22 ( .A(s84[0]), .Z(n10) );
endmodule


module Add_half_897 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_898 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_449 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_898 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_897 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_899 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_900 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVXL U1 ( .A(b), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENXL U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_full_450 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_900 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_899 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_901 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_902 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_451 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_902 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_901 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_903 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_904 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_452 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_904 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_903 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_113 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  Add_full_452 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_451 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_450 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_449 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X2 U3 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n1) );
  CANR2X1 U4 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n3) );
  CMX2X1 U5 ( .A0(s4), .A1(s3), .S(n3), .Z(sum2[1]) );
  CMX2XL U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMX2X1 U7 ( .A0(c_out11), .A1(c_out10), .S(n1), .Z(c_out2) );
  CIVX2 U8 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_905 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_906 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_453 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_906 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_905 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_907 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_908 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_454 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_908 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_907 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_909 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_910 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_455 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_910 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_909 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_911 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_912 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_456 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_912 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_911 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_114 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3;

  Add_full_456 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_455 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_454 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_453 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X2 U3 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n1) );
  CANR2X1 U4 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n3) );
  CMX2XL U5 ( .A0(s4), .A1(s3), .S(n3), .Z(sum2[1]) );
  CMX2XL U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMX2X1 U7 ( .A0(c_out11), .A1(c_out10), .S(n1), .Z(c_out2) );
  CIVX2 U8 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_913 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_914 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_457 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_914 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_913 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_915 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_916 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_458 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_916 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_915 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_917 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_918 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_459 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_918 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_917 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_919 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_920 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_460 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_920 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_919 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_115 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_460 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_459 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_458 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_457 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_921 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_922 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_461 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_922 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_921 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_923 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_924 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_462 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_924 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_923 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_925 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_926 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_463 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_926 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_925 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_927 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_928 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_464 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_928 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_927 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_116 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_464 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_463 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_462 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_461 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_29 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_116 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_115 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_114 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_113 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n6), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n6), .Z(sum4[0]) );
  CMX2X1 U3 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX1 U4 ( .A(c_out410), .Z(n3) );
  CMX2X1 U5 ( .A0(s43[0]), .A1(s44[0]), .S(n1), .Z(sum4[2]) );
  CIVX1 U6 ( .A(c_out411), .Z(n2) );
  CMXI2X1 U7 ( .A0(n3), .A1(n2), .S(n1), .Z(c_out4) );
  CIVX2 U10 ( .A(s43[1]), .Z(n5) );
  CIVX2 U11 ( .A(s44[1]), .Z(n4) );
  CMXI2X1 U12 ( .A0(n5), .A1(n4), .S(n1), .Z(sum4[3]) );
  CIVX2 U13 ( .A(c_in4), .Z(n6) );
endmodule


module Add_half_929 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_930 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_465 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_930 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_929 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_931 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_932 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_466 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_932 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_931 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_933 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_934 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X2 U1 ( .A(n3), .B(n4), .Z(sum) );
  CND2X1 U2 ( .A(n1), .B(b), .Z(n4) );
  CIVXL U3 ( .A(a), .Z(n1) );
  CND2XL U4 ( .A(a), .B(n2), .Z(n3) );
  CIVX2 U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_467 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_934 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_933 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_935 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_936 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_468 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_936 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_935 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_117 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_468 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_467 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_466 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_465 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X2 U3 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n1) );
  CANR2X1 U4 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n7) );
  CMX2X1 U5 ( .A0(s4), .A1(s3), .S(n7), .Z(sum2[1]) );
  CIVXL U6 ( .A(s1), .Z(n6) );
  CIVX2 U7 ( .A(c_out11), .Z(n4) );
  CIVX2 U8 ( .A(c_out10), .Z(n3) );
  CIVX2 U9 ( .A(c_in2), .Z(n2) );
  CMXI2X1 U10 ( .A0(n4), .A1(n3), .S(n1), .Z(c_out2) );
  CIVX2 U11 ( .A(s2), .Z(n5) );
  CMXI2X1 U12 ( .A0(n6), .A1(n5), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_937 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_938 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_469 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_938 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_937 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_939 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_940 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_470 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_940 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_939 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_941 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_942 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_471 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_942 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_941 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_943 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_944 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_472 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_944 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_943 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_118 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_472 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_471 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_470 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_469 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n3) );
  CIVXL U4 ( .A(s3), .Z(n4) );
  CIVX1 U5 ( .A(s4), .Z(n5) );
  CANR2XL U6 ( .A(n2), .B(c_out00), .C(c_in2), .D(c_out01), .Z(n1) );
  CMX2XL U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMX2X1 U8 ( .A0(c_out11), .A1(c_out10), .S(n3), .Z(c_out2) );
  CMXI2XL U9 ( .A0(n5), .A1(n4), .S(n1), .Z(sum2[1]) );
  CIVX2 U10 ( .A(c_in2), .Z(n2) );
endmodule


module Add_half_945 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_946 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_473 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_946 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_945 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_947 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_948 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_474 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_948 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_947 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_949 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_950 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_475 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_950 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_949 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_951 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_952 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_476 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_952 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_951 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_119 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_476 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_475 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_474 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_473 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_953 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_954 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_477 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_954 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_953 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_955 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_956 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_478 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_956 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_955 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_957 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_958 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_479 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_958 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_957 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_959 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_960 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_480 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_960 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_959 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_120 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_480 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_479 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_478 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_477 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_30 ( sum4, c_out4, a4, b4, c_in4 );
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

  bit2_120 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_119 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_118 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_117 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n3), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n3), .Z(sum4[0]) );
  CMX2X1 U3 ( .A0(c_out411), .A1(c_out410), .S(n1), .Z(c_out4) );
  CMX2X1 U4 ( .A0(s43[1]), .A1(s44[1]), .S(n2), .Z(sum4[3]) );
  CMX2X1 U5 ( .A0(s43[0]), .A1(s44[0]), .S(n2), .Z(sum4[2]) );
  CMXI2X1 U6 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
  CIVX2 U10 ( .A(c_in4), .Z(n3) );
endmodule


module Add_half_961 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_962 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_481 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_962 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_961 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_963 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_964 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_482 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_964 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_963 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_965 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_966 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_483 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_966 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_965 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_967 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_968 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_484 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_968 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_967 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_121 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_484 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_483 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_482 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_481 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_969 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_970 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_485 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_970 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_969 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_971 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_972 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_486 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_972 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_971 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_973 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_974 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_487 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_974 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_973 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_975 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_976 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_488 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_976 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_975 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_122 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_488 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_487 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_486 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_485 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_977 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_978 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_489 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_978 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_977 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_979 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_980 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_490 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_980 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_979 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_981 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_982 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_491 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_982 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_981 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_983 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_984 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_492 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_984 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_983 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_123 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_492 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_491 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_490 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_489 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_985 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_986 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_493 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_986 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_985 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_987 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_988 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_494 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_988 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_987 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_989 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_990 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_495 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_990 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_989 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_991 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_992 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_496 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_992 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_991 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_124 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_496 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_495 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_494 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_493 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_31 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_124 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_123 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_122 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_121 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module Add_half_993 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_994 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_497 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_994 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_993 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_995 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_996 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_498 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_996 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_995 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_997 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_998 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_499 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_998 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_997 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_999 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1000 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_500 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1000 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_999 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_125 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_500 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_499 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_498 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_497 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1001 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1002 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_501 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1002 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1001 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1003 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1004 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_502 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1004 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1003 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1005 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1006 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_503 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1006 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1005 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1007 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1008 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_504 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1008 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1007 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_126 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_504 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_503 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_502 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_501 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1009 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1010 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_505 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1010 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1009 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1011 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1012 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_506 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1012 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1011 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1013 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1014 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_507 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1014 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1013 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1015 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1016 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_508 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1016 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1015 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_127 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_508 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_507 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_506 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_505 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1017 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1018 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_509 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1018 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1017 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1019 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1020 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_510 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1020 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1019 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1021 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1022 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_511 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1022 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1021 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1023 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1024 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_512 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1024 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1023 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_128 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_512 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_511 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_510 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_509 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_32 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_128 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_127 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_126 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_125 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module bit8_8 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_32 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_31 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_30 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_29 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CAOR2X1 U8 ( .A(s84[1]), .B(n11), .C(s83[1]), .D(n9), .Z(sum8[5]) );
  CAOR2X1 U9 ( .A(s84[0]), .B(n11), .C(s83[0]), .D(n9), .Z(sum8[4]) );
  CAOR2X1 U10 ( .A(s82[3]), .B(c_in8), .C(s81[3]), .D(n10), .Z(sum8[3]) );
  CAOR2X1 U11 ( .A(s82[2]), .B(c_in8), .C(s81[2]), .D(n10), .Z(sum8[2]) );
  CAOR2X1 U12 ( .A(s82[1]), .B(c_in8), .C(s81[1]), .D(n10), .Z(sum8[1]) );
  CAOR2X1 U13 ( .A(s82[0]), .B(c_in8), .C(s81[0]), .D(n10), .Z(sum8[0]) );
  COR2X1 U3 ( .A(n9), .B(s84[3]), .Z(n2) );
  CND2X2 U4 ( .A(n8), .B(n9), .Z(n1) );
  CND2X2 U5 ( .A(n1), .B(n2), .Z(n3) );
  CIVX2 U6 ( .A(n3), .Z(sum8[7]) );
  CND2X2 U7 ( .A(c_out810), .B(n9), .Z(n4) );
  CND2X1 U14 ( .A(c_out811), .B(n11), .Z(n5) );
  CND2X2 U15 ( .A(n4), .B(n5), .Z(c_out8) );
  CMXI2X1 U16 ( .A0(c_out800), .A1(c_out801), .S(c_in8), .Z(n9) );
  CIVX2 U17 ( .A(n9), .Z(n11) );
  CIVX2 U18 ( .A(s83[2]), .Z(n7) );
  CIVX2 U19 ( .A(s84[2]), .Z(n6) );
  CMXI2X1 U20 ( .A0(n7), .A1(n6), .S(n11), .Z(sum8[6]) );
  CIVX2 U21 ( .A(s83[3]), .Z(n8) );
  CIVX2 U22 ( .A(c_in8), .Z(n10) );
endmodule


module bit16_4 ( a16, b16, sum16, c_out16, c_in16 );
  input [15:0] a16;
  input [15:0] b16;
  output [15:0] sum16;
  input c_in16;
  output c_out16;
  wire   n3, c1, n1;

  bit8_8 A161 ( .sum8(sum16[7:0]), .c_out8(c1), .a8(a16[7:0]), .b8(b16[7:0]), 
        .c_in8(c_in16) );
  bit8_7 A162 ( .sum8({sum16[15:13], n3, sum16[11:8]}), .c_out8(c_out16), .a8(
        a16[15:8]), .b8(b16[15:8]), .c_in8(c1) );
  CIVX4 U1 ( .A(n1), .Z(sum16[12]) );
  CIVX2 U2 ( .A(n3), .Z(n1) );
endmodule


module Add_half_1025 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1026 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_513 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1026 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1025 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1027 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1028 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_514 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1028 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1027 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1029 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1030 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_515 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1030 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1029 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1031 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1032 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_516 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1032 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1031 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_129 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_516 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_515 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_514 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_513 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1033 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1034 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_517 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1034 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1033 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1035 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1036 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_518 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1036 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1035 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1037 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1038 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_519 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1038 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1037 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1039 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1040 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_520 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1040 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1039 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_130 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_520 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_519 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_518 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_517 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1041 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1042 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_521 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1042 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1041 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1043 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1044 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_522 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1044 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1043 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1045 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1046 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_523 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1046 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1045 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1047 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1048 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_524 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1048 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1047 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_131 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_524 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_523 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_522 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_521 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_out10), .Z(n3) );
  CIVX2 U4 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U6 ( .A(n1), .Z(n6) );
  CMXI2X1 U7 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U8 ( .A(s1), .Z(n5) );
  CIVX2 U9 ( .A(s2), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(s3), .Z(n8) );
  CIVX2 U12 ( .A(s4), .Z(n7) );
  CMXI2X1 U13 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
endmodule


module Add_half_1049 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1050 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_525 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1050 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1049 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1051 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1052 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_526 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1052 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1051 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1053 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1054 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_527 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1054 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1053 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1055 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1056 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_528 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1056 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1055 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_132 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_528 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_527 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_526 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_525 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module bit4_33 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_132 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_131 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_130 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_129 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2X2 U3 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CMX2X1 U4 ( .A0(s43[1]), .A1(s44[1]), .S(n1), .Z(sum4[3]) );
  CMX2X1 U5 ( .A0(c_out410), .A1(c_out411), .S(n1), .Z(c_out4) );
  CMX2X1 U6 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U7 ( .A0(s43[0]), .A1(s44[0]), .S(n1), .Z(sum4[2]) );
  CMX2X1 U8 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
endmodule


module Add_half_1057 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1058 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_529 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1058 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1057 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1059 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1060 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_530 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1060 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1059 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1061 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1062 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_531 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1062 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1061 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1063 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1064 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_532 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1064 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1063 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_133 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_532 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_531 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_530 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_529 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1065 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1066 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_533 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1066 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1065 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1067 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1068 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_534 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1068 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1067 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1069 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1070 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_535 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1070 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1069 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1071 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1072 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_536 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1072 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1071 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_134 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_536 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_535 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_534 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_533 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1073 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1074 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_537 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1074 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1073 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1075 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1076 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_538 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1076 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1075 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1077 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1078 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_539 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1078 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1077 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1079 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1080 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_540 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1080 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1079 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_135 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_540 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_539 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_538 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_537 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVX2 U4 ( .A(c_out10), .Z(n3) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n6) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U9 ( .A(s1), .Z(n5) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_1081 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1082 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_541 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1082 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1081 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1083 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1084 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_542 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1084 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1083 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1085 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1086 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_543 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1086 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1085 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1087 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1088 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_544 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1088 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1087 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_136 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_544 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_543 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_542 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_541 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U9 ( .A(n1), .Z(n4) );
endmodule


module bit4_34 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_136 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_135 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_134 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_133 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2X2 U3 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CMX2X1 U4 ( .A0(s43[1]), .A1(s44[1]), .S(n1), .Z(sum4[3]) );
  CMX2X1 U5 ( .A0(c_out410), .A1(c_out411), .S(n1), .Z(c_out4) );
  CMX2X1 U6 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U7 ( .A(s41[1]), .Z(n3) );
  CIVX2 U8 ( .A(s42[1]), .Z(n2) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U10 ( .A(s43[0]), .Z(n5) );
  CIVX2 U11 ( .A(s44[0]), .Z(n4) );
  CMXI2X1 U12 ( .A0(n5), .A1(n4), .S(n1), .Z(sum4[2]) );
endmodule


module Add_half_1089 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1090 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_545 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1090 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1089 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1091 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1092 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_546 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1092 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1091 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1093 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1094 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_547 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1094 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1093 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1095 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1096 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_548 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1096 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1095 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_137 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_548 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_547 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_546 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_545 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(c_out10), .A1(c_out11), .S(n4), .Z(c_out2) );
  CMXI2X1 U4 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U5 ( .A(n1), .Z(n4) );
  CIVX2 U6 ( .A(s1), .Z(n3) );
  CIVX2 U7 ( .A(s2), .Z(n2) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_1097 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1098 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_549 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1098 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1097 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1099 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1100 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_550 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1100 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1099 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1101 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1102 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_551 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1102 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1101 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1103 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1104 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_552 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1104 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1103 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_138 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_552 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_551 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_550 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_549 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_1105 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1106 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_553 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1106 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1105 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1107 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1108 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_554 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1108 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1107 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1109 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1110 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_555 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1110 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1109 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1111 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1112 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVX2 U1 ( .A(a), .Z(n1) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CND2X1 U3 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U4 ( .A(n1), .B(b), .Z(n4) );
  CND2X2 U5 ( .A(n3), .B(n4), .Z(sum) );
  CIVX2 U6 ( .A(b), .Z(n2) );
endmodule


module Add_full_556 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1112 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1111 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_139 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_556 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_555 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_554 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_553 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2XL U3 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
  CIVX1 U4 ( .A(n1), .Z(n4) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U10 ( .A(s3), .Z(n6) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module Add_half_1113 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1114 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_557 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1114 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1113 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1115 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1116 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_558 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1116 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1115 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1117 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1118 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_559 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1118 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1117 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1119 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1120 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_560 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1120 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1119 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_140 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_560 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_559 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_558 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_557 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n1), .Z(n4) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module bit4_35 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_140 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_139 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_138 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_137 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2X1 U3 ( .A0(s43[1]), .A1(s44[1]), .S(n2), .Z(sum4[3]) );
  CMX2X1 U4 ( .A0(c_out410), .A1(c_out411), .S(n2), .Z(c_out4) );
  CIVX2 U5 ( .A(n1), .Z(n2) );
  CMX2XL U6 ( .A0(s43[0]), .A1(s44[0]), .S(n2), .Z(sum4[2]) );
  CMX2X1 U7 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMX2X1 U8 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMXI2X1 U9 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
endmodule


module Add_half_1121 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1122 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_561 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1122 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1121 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1123 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1124 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_562 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1124 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1123 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1125 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1126 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_563 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1126 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1125 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1127 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1128 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_564 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1128 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1127 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_141 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_564 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_563 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_562 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_561 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_1129 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1130 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_565 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1130 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1129 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1131 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1132 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_566 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1132 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1131 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1133 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1134 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_567 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1134 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1133 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1135 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1136 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_568 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1136 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1135 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_142 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2;

  Add_full_568 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_567 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_566 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_565 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n2), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(c_out10), .A1(c_out11), .S(n2), .Z(c_out2) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n2) );
endmodule


module Add_half_1137 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1138 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_569 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1138 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1137 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1139 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1140 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_570 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1140 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1139 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1141 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1142 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_571 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1142 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1141 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1143 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1144 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_572 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1144 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1143 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_143 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_572 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_571 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_570 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_569 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n1), .Z(n6) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U9 ( .A(s1), .Z(n5) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_1145 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1146 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_573 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1146 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1145 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1147 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1148 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_574 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1148 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1147 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1149 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1150 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_575 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1150 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1149 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1151 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1152 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_576 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1152 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1151 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_144 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_576 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_575 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_574 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_573 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(n1), .Z(n4) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module bit4_36 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_144 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_143 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_142 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_141 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U3 ( .A(n1), .Z(n6) );
  CMX2X1 U4 ( .A0(c_out410), .A1(c_out411), .S(n6), .Z(c_out4) );
  CMXI2XL U5 ( .A0(n8), .A1(n7), .S(n6), .Z(sum4[3]) );
  CMXI2XL U6 ( .A0(n5), .A1(n4), .S(n6), .Z(sum4[2]) );
  CMX2X1 U7 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMXI2X1 U8 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U9 ( .A(s41[1]), .Z(n3) );
  CIVX2 U10 ( .A(s42[1]), .Z(n2) );
  CMXI2X1 U11 ( .A0(n3), .A1(n2), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U12 ( .A(s43[0]), .Z(n5) );
  CIVX2 U13 ( .A(s44[0]), .Z(n4) );
  CIVX2 U14 ( .A(s43[1]), .Z(n8) );
  CIVX2 U15 ( .A(s44[1]), .Z(n7) );
endmodule


module bit8_9 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n12, n13, n14, n15, n16, n17, n18, n19, n20;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_36 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_35 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_34 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_33 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CIVX1 U3 ( .A(n7), .Z(n2) );
  CIVX2 U4 ( .A(c_in8), .Z(n1) );
  CIVX1 U5 ( .A(c_in8), .Z(n7) );
  CMX2X2 U6 ( .A0(s83[1]), .A1(s84[1]), .S(n13), .Z(sum8[5]) );
  CMX2X2 U7 ( .A0(s81[3]), .A1(s82[3]), .S(n2), .Z(sum8[3]) );
  CND2X4 U8 ( .A(n6), .B(n16), .Z(sum8[0]) );
  CND2X2 U9 ( .A(s83[0]), .B(n3), .Z(n4) );
  CND2X1 U10 ( .A(s84[0]), .B(n12), .Z(n5) );
  CND2X4 U11 ( .A(n4), .B(n5), .Z(sum8[4]) );
  CIVX1 U12 ( .A(n12), .Z(n3) );
  CIVX1 U13 ( .A(c_out800), .Z(n20) );
  CMX2X2 U14 ( .A0(s82[2]), .A1(s81[2]), .S(n1), .Z(sum8[2]) );
  CIVX1 U15 ( .A(c_out801), .Z(n19) );
  CMXI2XL U16 ( .A0(n15), .A1(n14), .S(n13), .Z(c_out8) );
  CND2X2 U17 ( .A(n7), .B(s81[0]), .Z(n6) );
  CND2X1 U18 ( .A(n1), .B(n18), .Z(n8) );
  CND2XL U19 ( .A(c_in8), .B(n17), .Z(n9) );
  CND2X2 U20 ( .A(n8), .B(n9), .Z(n10) );
  CIVX8 U21 ( .A(n10), .Z(sum8[1]) );
  CMX2XL U22 ( .A0(s83[3]), .A1(s84[3]), .S(n13), .Z(sum8[7]) );
  CMXI2X1 U23 ( .A0(n20), .A1(n19), .S(c_in8), .Z(n12) );
  CMX2X1 U24 ( .A0(c_out800), .A1(c_out801), .S(c_in8), .Z(n13) );
  CMX2X1 U25 ( .A0(s83[2]), .A1(s84[2]), .S(n13), .Z(sum8[6]) );
  CND2X1 U26 ( .A(c_in8), .B(s82[0]), .Z(n16) );
  CIVX2 U27 ( .A(c_out810), .Z(n15) );
  CIVX2 U28 ( .A(c_out811), .Z(n14) );
  CIVX2 U29 ( .A(s81[1]), .Z(n18) );
  CIVX2 U30 ( .A(s82[1]), .Z(n17) );
endmodule


module Add_half_1153 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1154 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_577 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1154 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1153 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1155 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1156 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_578 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1156 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1155 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1157 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1158 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_579 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1158 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1157 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1159 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1160 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_580 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1160 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1159 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_145 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_580 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_579 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_578 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_577 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(s3), .Z(n6) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_1161 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1162 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_581 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1162 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1161 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1163 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1164 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_582 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1164 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1163 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1165 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1166 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_583 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1166 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1165 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1167 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1168 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_584 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1168 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1167 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CND2X1 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_146 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_584 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_583 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_582 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_581 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U4 ( .A(c_out10), .Z(n3) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n4) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_1169 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1170 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_585 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1170 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1169 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1171 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1172 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_586 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1172 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1171 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1173 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1174 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_587 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1174 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1173 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1175 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
  CND2X2 U3 ( .A(a), .B(b), .Z(n1) );
endmodule


module Add_half_1176 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_588 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1176 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1175 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_147 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_588 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_587 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_586 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_585 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2XL U3 ( .A(c_in2), .B(c_out01), .C(n2), .D(c_out00), .Z(n1) );
  CANR2X2 U4 ( .A(c_in2), .B(c_out01), .C(n2), .D(c_out00), .Z(n5) );
  CMXI2XL U5 ( .A0(n7), .A1(n6), .S(n1), .Z(sum2[1]) );
  CIVX1 U6 ( .A(s4), .Z(n7) );
  CIVX1 U7 ( .A(s3), .Z(n6) );
  CIVX1 U8 ( .A(c_out10), .Z(n3) );
  CIVX1 U9 ( .A(c_out11), .Z(n4) );
  CMX2X1 U10 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(c_in2), .Z(n2) );
  CMXI2X1 U12 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out2) );
endmodule


module Add_half_1177 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1178 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_589 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1178 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1177 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1179 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1180 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_590 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1180 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1179 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1181 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1182 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CENX2 U1 ( .A(a), .B(n1), .Z(sum) );
  CIVX2 U2 ( .A(b), .Z(n1) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_591 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1182 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1181 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w3), .Z(n2) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1183 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
  CEOXL U3 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1184 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX2 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_592 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1184 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1183 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_148 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_592 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_591 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_590 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_589 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2XL U3 ( .A(c_in2), .B(c_out01), .C(n2), .D(c_out00), .Z(n1) );
  CANR2X2 U4 ( .A(c_out01), .B(c_in2), .C(n2), .D(c_out00), .Z(n5) );
  CIVX1 U5 ( .A(c_out10), .Z(n3) );
  CMX2XL U6 ( .A0(s4), .A1(s3), .S(n1), .Z(sum2[1]) );
  CMX2X1 U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U8 ( .A(c_out11), .Z(n4) );
  CIVX2 U9 ( .A(c_in2), .Z(n2) );
  CMXI2X1 U10 ( .A0(n4), .A1(n3), .S(n5), .Z(c_out2) );
endmodule


module bit4_37 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_148 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_147 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_146 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_145 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(n3), .D(c_out400), .Z(n1) );
  CMXI2X1 U4 ( .A0(n12), .A1(n11), .S(n1), .Z(sum4[3]) );
  CANR2X1 U5 ( .A(c_out401), .B(c_in4), .C(n3), .D(c_out400), .Z(n2) );
  CIVX1 U6 ( .A(c_out410), .Z(n4) );
  CANR2X1 U7 ( .A(c_out401), .B(c_in4), .C(n3), .D(c_out400), .Z(n10) );
  CMXI2X1 U8 ( .A0(n5), .A1(n4), .S(n2), .Z(c_out4) );
  CIVX1 U9 ( .A(c_out411), .Z(n5) );
  CMX2X1 U10 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CIVX1 U11 ( .A(s41[0]), .Z(n7) );
  CIVX2 U12 ( .A(c_in4), .Z(n3) );
  CIVX2 U13 ( .A(s42[0]), .Z(n6) );
  CMXI2X1 U14 ( .A0(n7), .A1(n6), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U15 ( .A(s44[0]), .Z(n9) );
  CIVX2 U16 ( .A(s43[0]), .Z(n8) );
  CMXI2X1 U17 ( .A0(n9), .A1(n8), .S(n10), .Z(sum4[2]) );
  CIVX2 U18 ( .A(s44[1]), .Z(n12) );
  CIVX2 U19 ( .A(s43[1]), .Z(n11) );
endmodule


module Add_half_1185 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1186 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_593 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1186 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1185 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1187 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1188 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_594 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1188 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1187 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1189 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1190 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_595 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1190 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1189 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1191 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1192 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_596 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1192 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1191 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_149 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_596 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_595 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_594 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_593 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVXL U3 ( .A(s3), .Z(n8) );
  CIVX1 U4 ( .A(c_out10), .Z(n3) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n6) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U9 ( .A(s1), .Z(n5) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U12 ( .A(s4), .Z(n7) );
  CMXI2X1 U13 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
endmodule


module Add_half_1193 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1194 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_597 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1194 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1193 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1195 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1196 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_598 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1196 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1195 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1197 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1198 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_599 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1198 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1197 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1199 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1200 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_600 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1200 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1199 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_150 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_600 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_599 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_598 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_597 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U4 ( .A(c_out10), .Z(n3) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n4) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_1201 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1202 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_601 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1202 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1201 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1203 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1204 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_602 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1204 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1203 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1205 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1206 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_603 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1206 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1205 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1207 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVX2 U1 ( .A(n1), .Z(c_out) );
  CENXL U2 ( .A(n2), .B(a), .Z(sum) );
  CND2X1 U3 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1208 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_604 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1208 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1207 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_151 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_604 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_603 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_602 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_601 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CANR2X1 U3 ( .A(c_in2), .B(c_out01), .C(n2), .D(c_out00), .Z(n7) );
  CANR2XL U4 ( .A(c_in2), .B(c_out01), .C(n2), .D(c_out00), .Z(n1) );
  CIVX1 U5 ( .A(c_out10), .Z(n3) );
  CMX2XL U6 ( .A0(s4), .A1(s3), .S(n1), .Z(sum2[1]) );
  CIVX2 U7 ( .A(c_out11), .Z(n4) );
  CIVX2 U8 ( .A(c_in2), .Z(n2) );
  CMXI2X1 U9 ( .A0(n4), .A1(n3), .S(n7), .Z(c_out2) );
  CIVX2 U10 ( .A(s1), .Z(n6) );
  CIVX2 U11 ( .A(s2), .Z(n5) );
  CMXI2X1 U12 ( .A0(n6), .A1(n5), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_1209 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1210 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_605 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1210 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1209 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1211 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1212 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_606 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1212 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1211 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1213 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1214 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX2 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_607 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1214 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1213 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1215 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CNR2X2 U1 ( .A(n1), .B(n2), .Z(c_out) );
  CIVX2 U2 ( .A(a), .Z(n1) );
  CIVX2 U3 ( .A(b), .Z(n2) );
  CENXL U4 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1216 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2X2 U1 ( .A(a), .B(n2), .Z(n3) );
  CIVX4 U2 ( .A(a), .Z(n1) );
  CND2X2 U3 ( .A(n3), .B(n4), .Z(sum) );
  CND2X2 U4 ( .A(n1), .B(b), .Z(n4) );
  CIVX2 U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_608 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1216 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1215 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_152 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_608 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_607 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_606 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_605 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CND2XL U3 ( .A(c_out00), .B(n4), .Z(n2) );
  CND2XL U4 ( .A(c_in2), .B(c_out01), .Z(n1) );
  CAN2X1 U5 ( .A(n1), .B(n2), .Z(n3) );
  CMX2X1 U6 ( .A0(s4), .A1(s3), .S(n3), .Z(sum2[1]) );
  CANR2X2 U7 ( .A(c_in2), .B(c_out01), .C(n4), .D(c_out00), .Z(n7) );
  CIVX1 U8 ( .A(c_out11), .Z(n6) );
  CIVX1 U9 ( .A(c_out10), .Z(n5) );
  CMX2X1 U10 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(c_in2), .Z(n4) );
  CMXI2X1 U12 ( .A0(n6), .A1(n5), .S(n7), .Z(c_out2) );
endmodule


module bit4_38 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_152 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_151 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_150 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_149 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(n3), .D(c_out400), .Z(n1) );
  CANR2XL U4 ( .A(c_out401), .B(c_in4), .C(n3), .D(c_out400), .Z(n2) );
  CANR2X1 U5 ( .A(c_out401), .B(c_in4), .C(n3), .D(c_out400), .Z(n10) );
  CIVX1 U6 ( .A(c_out411), .Z(n5) );
  CMXI2XL U7 ( .A0(n12), .A1(n11), .S(n2), .Z(sum4[3]) );
  CMXI2X1 U8 ( .A0(n5), .A1(n4), .S(n10), .Z(c_out4) );
  CMX2X1 U9 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX1 U10 ( .A(c_out410), .Z(n4) );
  CIVX2 U11 ( .A(c_in4), .Z(n3) );
  CIVX2 U12 ( .A(s41[1]), .Z(n7) );
  CIVX2 U13 ( .A(s42[1]), .Z(n6) );
  CMXI2X1 U14 ( .A0(n7), .A1(n6), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U15 ( .A(s44[0]), .Z(n9) );
  CIVX2 U16 ( .A(s43[0]), .Z(n8) );
  CMXI2X1 U17 ( .A0(n9), .A1(n8), .S(n1), .Z(sum4[2]) );
  CIVX2 U18 ( .A(s44[1]), .Z(n12) );
  CIVX2 U19 ( .A(s43[1]), .Z(n11) );
endmodule


module Add_half_1217 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1218 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_609 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1218 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1217 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1219 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1220 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_610 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1220 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1219 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1221 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1222 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_611 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1222 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1221 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1223 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1224 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_612 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1224 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1223 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_153 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_612 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_611 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_610 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_609 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1225 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1226 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_613 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1226 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1225 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1227 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1228 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_614 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1228 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1227 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1229 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1230 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_615 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1230 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1229 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1231 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1232 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_616 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1232 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1231 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_154 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_616 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_615 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_614 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_613 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1233 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1234 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_617 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1234 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1233 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1235 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1236 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_618 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1236 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1235 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1237 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1238 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_619 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1238 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1237 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1239 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1240 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_620 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1240 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1239 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_155 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_620 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_619 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_618 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_617 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1241 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1242 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_621 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1242 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1241 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1243 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1244 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_622 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1244 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1243 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1245 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1246 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_623 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1246 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1245 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1247 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1248 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_624 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1248 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1247 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_156 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_624 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_623 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_622 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_621 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_39 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_156 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_155 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_154 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_153 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module Add_half_1249 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1250 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_625 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1250 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1249 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1251 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1252 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_626 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1252 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1251 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1253 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1254 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_627 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1254 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1253 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1255 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1256 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_628 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1256 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1255 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_157 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_628 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_627 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_626 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_625 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1257 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1258 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_629 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1258 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1257 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1259 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1260 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_630 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1260 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1259 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1261 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1262 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_631 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1262 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1261 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1263 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1264 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_632 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1264 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1263 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_158 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_632 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_631 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_630 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_629 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1265 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1266 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_633 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1266 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1265 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1267 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1268 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_634 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1268 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1267 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1269 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1270 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_635 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1270 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1269 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1271 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1272 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_636 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1272 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1271 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_159 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_636 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_635 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_634 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_633 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1273 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1274 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_637 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1274 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1273 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1275 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1276 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_638 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1276 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1275 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1277 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1278 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_639 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1278 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1277 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1279 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1280 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_640 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1280 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1279 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_160 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_640 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_639 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_638 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_637 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_40 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_160 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_159 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_158 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_157 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module bit8_10 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_40 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_39 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_38 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_37 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CAOR2X1 U10 ( .A(s82[3]), .B(c_in8), .C(s81[3]), .D(n15), .Z(sum8[3]) );
  CAOR2X1 U11 ( .A(s82[2]), .B(c_in8), .C(s81[2]), .D(n15), .Z(sum8[2]) );
  CAOR2X1 U12 ( .A(s82[1]), .B(c_in8), .C(s81[1]), .D(n15), .Z(sum8[1]) );
  CAOR2X1 U13 ( .A(s82[0]), .B(c_in8), .C(s81[0]), .D(n15), .Z(sum8[0]) );
  COR2X1 U3 ( .A(n11), .B(s84[3]), .Z(n9) );
  CND2X2 U4 ( .A(s83[0]), .B(n11), .Z(n1) );
  CND2X2 U5 ( .A(s84[0]), .B(n5), .Z(n2) );
  CND2X4 U6 ( .A(n1), .B(n2), .Z(sum8[4]) );
  CND2IX1 U7 ( .B(n11), .A(c_out811), .Z(n13) );
  CND2X2 U8 ( .A(n8), .B(n9), .Z(n10) );
  CND2X2 U9 ( .A(s83[2]), .B(n11), .Z(n3) );
  CND2X2 U14 ( .A(s84[2]), .B(n5), .Z(n4) );
  CND2X4 U15 ( .A(n4), .B(n3), .Z(sum8[6]) );
  CIVX2 U16 ( .A(n11), .Z(n5) );
  CND2X2 U17 ( .A(s83[1]), .B(n11), .Z(n6) );
  CND2X2 U18 ( .A(s84[1]), .B(n5), .Z(n7) );
  CND2X4 U19 ( .A(n6), .B(n7), .Z(sum8[5]) );
  CIVX4 U20 ( .A(n10), .Z(sum8[7]) );
  CND2X2 U21 ( .A(n13), .B(n12), .Z(c_out8) );
  CND2X1 U22 ( .A(n14), .B(n11), .Z(n8) );
  CIVXL U23 ( .A(s83[3]), .Z(n14) );
  CMXI2X1 U24 ( .A0(c_out800), .A1(c_out801), .S(c_in8), .Z(n11) );
  CND2IX1 U25 ( .B(n5), .A(c_out810), .Z(n12) );
  CIVX2 U26 ( .A(c_in8), .Z(n15) );
endmodule


module bit16_5 ( a16, b16, sum16, c_out16, c_in16 );
  input [15:0] a16;
  input [15:0] b16;
  output [15:0] sum16;
  input c_in16;
  output c_out16;
  wire   c1;

  bit8_10 A161 ( .sum8(sum16[7:0]), .c_out8(c1), .a8(a16[7:0]), .b8(b16[7:0]), 
        .c_in8(c_in16) );
  bit8_9 A162 ( .sum8(sum16[15:8]), .c_out8(c_out16), .a8(a16[15:8]), .b8(
        b16[15:8]), .c_in8(c1) );
endmodule


module Add_half_1281 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1282 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_641 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1282 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1281 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1283 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1284 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_642 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1284 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1283 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1285 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1286 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_643 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1286 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1285 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1287 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1288 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_644 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1288 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1287 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_161 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_644 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_643 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_642 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_641 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1289 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1290 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_645 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1290 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1289 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1291 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1292 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_646 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1292 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1291 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1293 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1294 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_647 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1294 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1293 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1295 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1296 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_648 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1296 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1295 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_162 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_648 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_647 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_646 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_645 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1297 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1298 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_649 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1298 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1297 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1299 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1300 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_650 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1300 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1299 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1301 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1302 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_651 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1302 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1301 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1303 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1304 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_652 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1304 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1303 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_163 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_652 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_651 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_650 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_649 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1305 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1306 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_653 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1306 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1305 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1307 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1308 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_654 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1308 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1307 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1309 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1310 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_655 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1310 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1309 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1311 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1312 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_656 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1312 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1311 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_164 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_656 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_655 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_654 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_653 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_41 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_164 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_163 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_162 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_161 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module Add_half_1313 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1314 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_657 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1314 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1313 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1315 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1316 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_658 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1316 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1315 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1317 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1318 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_659 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1318 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1317 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1319 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1320 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_660 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1320 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1319 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_165 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_660 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_659 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_658 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_657 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1321 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1322 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_661 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1322 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1321 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1323 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1324 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_662 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1324 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1323 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1325 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1326 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_663 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1326 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1325 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1327 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1328 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_664 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1328 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1327 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_166 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_664 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_663 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_662 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_661 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1329 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1330 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_665 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1330 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1329 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1331 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1332 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_666 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1332 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1331 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1333 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1334 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_667 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1334 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1333 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1335 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1336 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_668 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1336 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1335 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_167 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_668 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_667 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_666 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_665 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1337 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1338 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_669 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1338 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1337 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1339 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1340 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_670 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1340 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1339 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1341 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1342 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_671 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1342 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1341 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1343 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1344 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_672 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1344 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1343 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_168 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_672 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_671 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_670 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_669 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_42 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_168 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_167 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_166 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_165 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in4), .Z(n4) );
  CAOR2X1 U6 ( .A(s44[1]), .B(n5), .C(s43[1]), .D(n1), .Z(sum4[3]) );
  CAOR2X1 U7 ( .A(s44[0]), .B(n5), .C(s43[0]), .D(n1), .Z(sum4[2]) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n4), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n4), .Z(sum4[0]) );
  CAOR2X1 U10 ( .A(c_out411), .B(n5), .C(c_out410), .D(n1), .Z(c_out4) );
  CANR2X1 U3 ( .A(c_out401), .B(c_in4), .C(c_out400), .D(n4), .Z(n1) );
endmodule


module Add_half_1345 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1346 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_673 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1346 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1345 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1347 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1348 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_674 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1348 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1347 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1349 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1350 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_675 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1350 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1349 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1351 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1352 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_676 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1352 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1351 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_169 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_676 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_675 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_674 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_673 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_out10), .Z(n3) );
  CIVX2 U4 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U6 ( .A(n1), .Z(n6) );
  CMXI2X1 U7 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U8 ( .A(s1), .Z(n5) );
  CIVX2 U9 ( .A(s2), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(s3), .Z(n8) );
  CIVX2 U12 ( .A(s4), .Z(n7) );
  CMXI2X1 U13 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
endmodule


module Add_half_1353 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1354 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_677 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1354 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1353 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1355 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1356 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_678 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1356 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1355 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1357 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1358 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_679 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1358 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1357 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1359 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1360 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_680 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1360 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1359 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_170 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_680 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_679 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_678 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_677 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U4 ( .A(c_out10), .Z(n3) );
  CIVX2 U5 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U6 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U7 ( .A(n1), .Z(n4) );
  CMXI2X1 U8 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U9 ( .A(s3), .Z(n6) );
  CIVX2 U10 ( .A(s4), .Z(n5) );
  CMXI2X1 U11 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
endmodule


module Add_half_1361 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1362 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_681 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1362 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1361 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1363 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1364 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_682 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1364 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1363 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1365 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1366 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_683 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1366 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1365 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1367 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1368 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_684 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1368 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1367 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_171 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_684 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_683 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_682 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_681 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U3 ( .A(c_out10), .Z(n3) );
  CIVX2 U4 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U5 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U6 ( .A(n1), .Z(n6) );
  CMXI2X1 U7 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U8 ( .A(s1), .Z(n5) );
  CIVX2 U9 ( .A(s2), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U11 ( .A(s3), .Z(n8) );
  CIVX2 U12 ( .A(s4), .Z(n7) );
  CMXI2X1 U13 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
endmodule


module Add_half_1369 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1370 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_685 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1370 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1369 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1371 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1372 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_686 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1372 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1371 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1373 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1374 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_687 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1374 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1373 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1375 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1376 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_688 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1376 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1375 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X2 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_172 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_688 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_687 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_686 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_685 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module bit4_43 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_172 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_171 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_170 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_169 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMX2XL U3 ( .A0(s43[1]), .A1(s44[1]), .S(n4), .Z(sum4[3]) );
  CMX2X1 U4 ( .A0(s43[0]), .A1(s44[0]), .S(n4), .Z(sum4[2]) );
  CMX2X1 U5 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U6 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U7 ( .A(c_out410), .Z(n3) );
  CIVX2 U8 ( .A(c_out411), .Z(n2) );
  CMXI2X1 U9 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U10 ( .A(n1), .Z(n4) );
  CMXI2X1 U11 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out4) );
endmodule


module Add_half_1377 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1378 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_689 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1378 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1377 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1379 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1380 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_690 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1380 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1379 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1381 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1382 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_691 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1382 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1381 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1383 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1384 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_692 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1384 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1383 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_173 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_692 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_691 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_690 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_689 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_1385 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1386 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_693 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1386 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1385 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1387 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1388 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_694 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1388 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1387 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1389 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1390 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_695 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1390 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1389 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1391 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1392 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_696 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1392 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1391 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_174 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_696 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_695 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_694 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_693 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_1393 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1394 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_697 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1394 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1393 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1395 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1396 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_698 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1396 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1395 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1397 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1398 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_699 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1398 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1397 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1399 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1400 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_700 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1400 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1399 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_175 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_700 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_699 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_698 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_697 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_1401 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1402 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_701 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1402 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1401 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1403 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1404 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_702 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1404 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1403 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1405 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1406 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CENX1 U1 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_703 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1406 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1405 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1407 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1408 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_704 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1408 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1407 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_176 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_704 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_703 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_702 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_701 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2XL U3 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U4 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module bit4_44 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_176 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_175 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_174 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_173 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CIVX2 U3 ( .A(c_out410), .Z(n3) );
  CIVX2 U4 ( .A(c_out411), .Z(n2) );
  CMXI2X1 U5 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U6 ( .A(n1), .Z(n10) );
  CMXI2X1 U7 ( .A0(n3), .A1(n2), .S(n10), .Z(c_out4) );
  CIVX2 U8 ( .A(s41[0]), .Z(n5) );
  CIVX2 U9 ( .A(s42[0]), .Z(n4) );
  CMXI2X1 U10 ( .A0(n5), .A1(n4), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U11 ( .A(s41[1]), .Z(n7) );
  CIVX2 U12 ( .A(s42[1]), .Z(n6) );
  CMXI2X1 U13 ( .A0(n7), .A1(n6), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U14 ( .A(s43[0]), .Z(n9) );
  CIVX2 U15 ( .A(s44[0]), .Z(n8) );
  CMXI2X1 U16 ( .A0(n9), .A1(n8), .S(n10), .Z(sum4[2]) );
  CIVX2 U17 ( .A(s43[1]), .Z(n12) );
  CIVX2 U18 ( .A(s44[1]), .Z(n11) );
  CMXI2X1 U19 ( .A0(n12), .A1(n11), .S(n10), .Z(sum4[3]) );
endmodule


module bit8_11 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   n25, n26, c_out800, c_out801, c_out810, c_out811, n2, n3, n4, n5, n6,
         n7, n8, n10, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_44 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_43 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_42 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_41 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CNR2IX1 U3 ( .B(s83[0]), .A(c_out801), .Z(n18) );
  CNIVX3 U4 ( .A(n25), .Z(sum8[7]) );
  CIVX2 U5 ( .A(c_in8), .Z(n7) );
  CMXI2X4 U6 ( .A0(n24), .A1(n23), .S(n4), .Z(sum8[6]) );
  CIVX1 U7 ( .A(s81[2]), .Z(n16) );
  CIVX1 U8 ( .A(n26), .Z(n10) );
  COND4CX1 U9 ( .A(s84[0]), .B(c_out801), .C(n18), .D(c_in8), .Z(n19) );
  CMX2X1 U10 ( .A0(n21), .A1(n22), .S(n3), .Z(n2) );
  CND2X1 U11 ( .A(n5), .B(n6), .Z(n3) );
  CAN2X2 U12 ( .A(n5), .B(n6), .Z(n4) );
  CND2X1 U13 ( .A(n7), .B(c_out800), .Z(n5) );
  CMX2XL U14 ( .A0(s81[3]), .A1(s82[3]), .S(c_in8), .Z(n26) );
  CND2X1 U15 ( .A(c_out801), .B(c_in8), .Z(n6) );
  CND2X2 U16 ( .A(n7), .B(s81[0]), .Z(n8) );
  CND2X4 U17 ( .A(n8), .B(n14), .Z(sum8[0]) );
  CMXI2X1 U18 ( .A0(n16), .A1(n15), .S(c_in8), .Z(sum8[2]) );
  CIVX4 U19 ( .A(n2), .Z(sum8[5]) );
  CIVX4 U20 ( .A(n10), .Z(sum8[3]) );
  CMX2XL U21 ( .A0(s84[3]), .A1(s83[3]), .S(n4), .Z(n25) );
  CMX2X1 U22 ( .A0(s81[1]), .A1(s82[1]), .S(c_in8), .Z(sum8[1]) );
  COND4CX1 U23 ( .A(s84[0]), .B(c_out800), .C(n17), .D(n7), .Z(n20) );
  CND2X1 U24 ( .A(s82[0]), .B(c_in8), .Z(n14) );
  CMXI2XL U25 ( .A0(n13), .A1(n12), .S(n4), .Z(c_out8) );
  CNR2IXL U26 ( .B(s83[0]), .A(c_out800), .Z(n17) );
  CIVX2 U27 ( .A(c_out811), .Z(n13) );
  CIVX2 U28 ( .A(c_out810), .Z(n12) );
  CIVX2 U29 ( .A(s82[2]), .Z(n15) );
  CND2X2 U30 ( .A(n20), .B(n19), .Z(sum8[4]) );
  CIVX2 U31 ( .A(s84[1]), .Z(n22) );
  CIVX2 U32 ( .A(s83[1]), .Z(n21) );
  CIVX2 U33 ( .A(s84[2]), .Z(n24) );
  CIVX2 U34 ( .A(s83[2]), .Z(n23) );
endmodule


module Add_half_1409 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1410 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_705 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1410 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1409 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1411 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1412 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_706 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1412 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1411 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1413 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1414 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_707 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1414 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1413 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1415 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1416 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_708 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1416 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1415 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_177 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_708 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_707 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_706 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_705 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out10), .Z(n3) );
  CMX2XL U4 ( .A0(s3), .A1(s4), .S(n4), .Z(sum2[1]) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_1417 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1418 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_709 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1418 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1417 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1419 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1420 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_710 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1420 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1419 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1421 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1422 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_711 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1422 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1421 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1423 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1424 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_712 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1424 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1423 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CNR2X1 U1 ( .A(w3), .B(w2), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(c_out) );
endmodule


module bit2_178 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_712 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_711 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_710 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_709 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2XL U4 ( .A0(n6), .A1(n5), .S(n4), .Z(sum2[1]) );
  CIVX2 U5 ( .A(c_out10), .Z(n3) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
  CIVX2 U10 ( .A(s3), .Z(n6) );
  CIVX2 U11 ( .A(s4), .Z(n5) );
endmodule


module Add_half_1425 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1426 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_713 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1426 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1425 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1427 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1428 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_714 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1428 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1427 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1429 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1430 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(a), .Z(n1) );
  CND2XL U2 ( .A(a), .B(n2), .Z(n3) );
  CIVXL U3 ( .A(b), .Z(n2) );
  CND2XL U4 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U5 ( .A(n3), .B(n4), .Z(sum) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_715 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1430 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1429 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1431 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1432 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_716 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1432 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1431 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_179 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_716 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_715 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_714 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_713 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out11), .Z(n3) );
  CIVX1 U4 ( .A(c_out10), .Z(n2) );
  CMX2XL U5 ( .A0(s4), .A1(s3), .S(n4), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_in2), .Z(n1) );
  CANR2X2 U8 ( .A(c_in2), .B(c_out01), .C(n1), .D(c_out00), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module Add_half_1433 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1434 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_717 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1434 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1433 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1435 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1436 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_718 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1436 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1435 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1437 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1438 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_719 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1438 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1437 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1439 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1440 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_720 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1440 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1439 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_180 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_720 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_719 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_718 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_717 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out11), .Z(n3) );
  CIVX1 U4 ( .A(c_out10), .Z(n2) );
  CMX2XL U5 ( .A0(s4), .A1(s3), .S(n4), .Z(sum2[1]) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_in2), .Z(n1) );
  CANR2X2 U8 ( .A(c_in2), .B(c_out01), .C(n1), .D(c_out00), .Z(n4) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module bit4_45 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_180 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_179 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_178 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_177 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CMXI2X1 U3 ( .A0(n11), .A1(n10), .S(n1), .Z(sum4[3]) );
  CANR2X1 U4 ( .A(c_in4), .B(c_out401), .C(n2), .D(c_out400), .Z(n1) );
  CANR2X1 U5 ( .A(c_in4), .B(c_out401), .C(n2), .D(c_out400), .Z(n9) );
  CMX2X1 U6 ( .A0(c_out411), .A1(c_out410), .S(n9), .Z(c_out4) );
  CMXI2X1 U7 ( .A0(n8), .A1(n7), .S(n1), .Z(sum4[2]) );
  CIVX2 U8 ( .A(c_in4), .Z(n2) );
  CIVX2 U9 ( .A(s41[0]), .Z(n4) );
  CIVX2 U10 ( .A(s42[0]), .Z(n3) );
  CMXI2X1 U11 ( .A0(n4), .A1(n3), .S(c_in4), .Z(sum4[0]) );
  CIVX2 U12 ( .A(s41[1]), .Z(n6) );
  CIVX2 U13 ( .A(s42[1]), .Z(n5) );
  CMXI2X1 U14 ( .A0(n6), .A1(n5), .S(c_in4), .Z(sum4[1]) );
  CIVX2 U15 ( .A(s44[0]), .Z(n8) );
  CIVX2 U16 ( .A(s43[0]), .Z(n7) );
  CIVX2 U17 ( .A(s44[1]), .Z(n11) );
  CIVX2 U18 ( .A(s43[1]), .Z(n10) );
endmodule


module Add_half_1441 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1442 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_721 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1442 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1441 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1443 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1444 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX2 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_722 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1444 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1443 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1445 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1446 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_723 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1446 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1445 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1447 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1448 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_724 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1448 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1447 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_181 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6;

  Add_full_724 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_723 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_722 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_721 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX1 U4 ( .A(c_out10), .Z(n3) );
  CMX2XL U5 ( .A0(s3), .A1(s4), .S(n6), .Z(sum2[1]) );
  CIVX2 U6 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U7 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U8 ( .A(n1), .Z(n6) );
  CIVX2 U9 ( .A(s1), .Z(n5) );
  CIVX2 U10 ( .A(s2), .Z(n4) );
  CMXI2X1 U11 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_1449 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1450 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_725 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1450 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1449 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1451 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1452 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_726 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1452 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1451 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1453 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U2 ( .A(b), .Z(n2) );
  CENX1 U3 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1454 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_727 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1454 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1453 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1455 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1456 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_728 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1456 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1455 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_182 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5;

  Add_full_728 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_727 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_726 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_725 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2XL U3 ( .A0(n4), .A1(n5), .S(n1), .Z(sum2[1]) );
  CMXI2XL U4 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out2) );
  CMX2X1 U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out10), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n2) );
  CMXI2X1 U8 ( .A0(c_out00), .A1(c_out01), .S(c_in2), .Z(n1) );
  CIVX2 U9 ( .A(s3), .Z(n5) );
  CIVX2 U10 ( .A(s4), .Z(n4) );
endmodule


module Add_half_1457 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1458 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_729 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1458 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1457 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2IX1 U2 ( .B(w3), .A(n1), .Z(c_out) );
endmodule


module Add_half_1459 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1460 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_730 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1460 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1459 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1461 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOXL U1 ( .A(a), .B(b), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_half_1462 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CND2XL U1 ( .A(a), .B(n2), .Z(n3) );
  CND2XL U2 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U3 ( .A(n3), .B(n4), .Z(sum) );
  CIVXL U4 ( .A(a), .Z(n1) );
  CIVXL U5 ( .A(b), .Z(n2) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_731 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1462 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1461 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module Add_half_1463 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1464 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_732 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1464 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1463 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module bit2_183 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8;

  Add_full_732 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_731 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_730 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_729 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(s4), .Z(n8) );
  CIVX1 U4 ( .A(c_out10), .Z(n2) );
  CIVX1 U5 ( .A(s3), .Z(n7) );
  CIVX1 U6 ( .A(c_out11), .Z(n3) );
  CMXI2XL U7 ( .A0(n8), .A1(n7), .S(n6), .Z(sum2[1]) );
  CIVX2 U8 ( .A(c_in2), .Z(n1) );
  CANR2X2 U9 ( .A(c_in2), .B(c_out01), .C(n1), .D(c_out00), .Z(n6) );
  CMXI2X1 U10 ( .A0(n3), .A1(n2), .S(n6), .Z(c_out2) );
  CIVX2 U11 ( .A(s1), .Z(n5) );
  CIVX2 U12 ( .A(s2), .Z(n4) );
  CMXI2X1 U13 ( .A0(n5), .A1(n4), .S(c_in2), .Z(sum2[0]) );
endmodule


module Add_half_1465 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1466 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_733 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1466 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1465 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1467 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(n2), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1468 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_734 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1468 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1467 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1469 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CAN2X1 U2 ( .A(a), .B(b), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
endmodule


module Add_half_1470 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CIVXL U1 ( .A(b), .Z(n2) );
  CIVX2 U2 ( .A(a), .Z(n1) );
  CND2XL U3 ( .A(n1), .B(b), .Z(n4) );
  CND2X1 U4 ( .A(a), .B(n2), .Z(n3) );
  CND2X1 U5 ( .A(n3), .B(n4), .Z(sum) );
  CAN2XL U6 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_735 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1470 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1469 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX1 U1 ( .A(w2), .Z(n1) );
  CND2X2 U2 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U3 ( .A(w3), .Z(n2) );
endmodule


module Add_half_1471 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1472 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_736 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1;

  Add_half_1472 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1471 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2IX1 U1 ( .B(w3), .A(n1), .Z(c_out) );
  CIVX1 U2 ( .A(w2), .Z(n1) );
endmodule


module bit2_184 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4;

  Add_full_736 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_735 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_734 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_733 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX1 U3 ( .A(c_out11), .Z(n3) );
  CIVX1 U4 ( .A(c_out10), .Z(n2) );
  CANR2X2 U5 ( .A(c_in2), .B(c_out01), .C(n1), .D(c_out00), .Z(n4) );
  CMX2XL U6 ( .A0(s4), .A1(s3), .S(n4), .Z(sum2[1]) );
  CMX2X1 U7 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U8 ( .A(c_in2), .Z(n1) );
  CMXI2X1 U9 ( .A0(n3), .A1(n2), .S(n4), .Z(c_out2) );
endmodule


module bit4_46 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6, n7,
         n8;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_184 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_183 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_182 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_181 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CND2XL U3 ( .A(n6), .B(c_out410), .Z(n3) );
  CIVX1 U4 ( .A(n6), .Z(n1) );
  CND2X1 U5 ( .A(n2), .B(n3), .Z(c_out4) );
  CND2X1 U6 ( .A(c_out411), .B(n1), .Z(n2) );
  CMX2X1 U7 ( .A0(s44[0]), .A1(s43[0]), .S(n4), .Z(sum4[2]) );
  CANR2X1 U8 ( .A(c_out401), .B(c_in4), .C(n5), .D(c_out400), .Z(n4) );
  CANR2X1 U9 ( .A(c_in4), .B(c_out401), .C(n5), .D(c_out400), .Z(n6) );
  CMX2X1 U10 ( .A0(s41[1]), .A1(s42[1]), .S(c_in4), .Z(sum4[1]) );
  CMX2X1 U11 ( .A0(s41[0]), .A1(s42[0]), .S(c_in4), .Z(sum4[0]) );
  CMXI2XL U12 ( .A0(n8), .A1(n7), .S(n4), .Z(sum4[3]) );
  CIVX2 U13 ( .A(c_in4), .Z(n5) );
  CIVX2 U14 ( .A(s44[1]), .Z(n8) );
  CIVX2 U15 ( .A(s43[1]), .Z(n7) );
endmodule


module Add_half_1473 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1474 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_737 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1474 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1473 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1475 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1476 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_738 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1476 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1475 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1477 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CND2IX1 U2 ( .B(n1), .A(a), .Z(n2) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_1478 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_739 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1478 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1477 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1479 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U2 ( .A(n1), .Z(c_out) );
  CIVX2 U3 ( .A(b), .Z(n2) );
  CENX1 U4 ( .A(a), .B(n2), .Z(sum) );
endmodule


module Add_half_1480 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_740 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1480 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1479 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_185 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;

  Add_full_740 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_739 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_738 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_737 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CAN2X1 U3 ( .A(n7), .B(n6), .Z(n1) );
  CMXI2X1 U4 ( .A0(n4), .A1(n5), .S(n3), .Z(c_out2) );
  CMX2XL U5 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U6 ( .A(c_out11), .Z(n5) );
  CIVX2 U7 ( .A(c_out10), .Z(n4) );
  CIVX2 U8 ( .A(c_in2), .Z(n2) );
  CND2X2 U9 ( .A(c_out00), .B(n2), .Z(n7) );
  CND2X2 U10 ( .A(c_out01), .B(c_in2), .Z(n6) );
  CND2X2 U11 ( .A(n7), .B(n6), .Z(n3) );
  CIVX2 U12 ( .A(s4), .Z(n9) );
  CIVX2 U13 ( .A(s3), .Z(n8) );
  CMXI2X1 U14 ( .A0(n9), .A1(n8), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_1481 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X1 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1482 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_741 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1482 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1481 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1483 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1484 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_742 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1484 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1483 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1485 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CND2IX1 U2 ( .B(n1), .A(a), .Z(n2) );
  CEOXL U3 ( .A(b), .B(a), .Z(sum) );
  CIVX2 U4 ( .A(n2), .Z(c_out) );
endmodule


module Add_half_1486 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_743 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1486 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1485 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1487 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CENXL U1 ( .A(a), .B(n2), .Z(sum) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1488 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX1 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_744 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1488 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1487 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_186 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_744 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_743 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_742 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_741 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMXI2X1 U3 ( .A0(n4), .A1(n5), .S(n3), .Z(c_out2) );
  CMX2X1 U4 ( .A0(s4), .A1(s3), .S(n1), .Z(sum2[1]) );
  CAN2XL U5 ( .A(n7), .B(n6), .Z(n1) );
  CMX2X1 U6 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U7 ( .A(c_out11), .Z(n5) );
  CIVX2 U8 ( .A(c_out10), .Z(n4) );
  CIVX2 U9 ( .A(c_in2), .Z(n2) );
  CND2X2 U10 ( .A(c_out00), .B(n2), .Z(n7) );
  CND2X2 U11 ( .A(c_out01), .B(c_in2), .Z(n6) );
  CND2X2 U12 ( .A(n7), .B(n6), .Z(n3) );
endmodule


module Add_half_1489 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1490 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_745 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1490 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1489 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1491 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1492 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_746 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1492 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1491 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1493 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1494 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_747 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1494 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1493 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1495 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1496 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_748 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1496 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1495 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_187 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_748 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_747 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_746 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_745 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1497 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1498 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_749 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1498 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1497 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1499 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1500 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_750 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1500 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1499 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1501 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1502 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_751 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1502 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1501 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1503 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1504 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_752 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1504 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1503 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_188 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_752 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_751 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_750 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_749 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_47 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5, n6;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_188 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_187 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_186 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_185 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n6), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n6), .Z(sum4[0]) );
  CMX2X1 U3 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX1 U4 ( .A(c_out410), .Z(n3) );
  CIVX1 U5 ( .A(c_out411), .Z(n2) );
  CMX2X1 U6 ( .A0(s43[0]), .A1(s44[0]), .S(n1), .Z(sum4[2]) );
  CIVX1 U7 ( .A(s43[1]), .Z(n5) );
  CMXI2X1 U10 ( .A0(n3), .A1(n2), .S(n1), .Z(c_out4) );
  CIVX2 U11 ( .A(s44[1]), .Z(n4) );
  CMXI2X1 U12 ( .A0(n5), .A1(n4), .S(n1), .Z(sum4[3]) );
  CIVX2 U13 ( .A(c_in4), .Z(n6) );
endmodule


module Add_half_1505 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX1 U1 ( .A(n1), .Z(c_out) );
  CND2X1 U2 ( .A(a), .B(b), .Z(n1) );
  CEOXL U3 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1506 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_753 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1506 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1505 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1507 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1508 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_754 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1508 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1507 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1509 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1510 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX2 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_755 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1510 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1509 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1511 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
endmodule


module Add_half_1512 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CIVX2 U1 ( .A(b), .Z(n1) );
  CENX2 U2 ( .A(a), .B(n1), .Z(sum) );
  CAN2XL U3 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_756 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1512 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1511 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CND2X1 U1 ( .A(n2), .B(n1), .Z(c_out) );
  CIVX2 U2 ( .A(w3), .Z(n2) );
  CIVX2 U3 ( .A(w2), .Z(n1) );
endmodule


module bit2_189 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;

  Add_full_756 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_755 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_754 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_753 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVXL U3 ( .A(s1), .Z(n7) );
  CMXI2X1 U4 ( .A0(n4), .A1(n5), .S(n3), .Z(c_out2) );
  CAN2XL U5 ( .A(n9), .B(n8), .Z(n1) );
  CND2X2 U6 ( .A(n9), .B(n8), .Z(n3) );
  CIVX2 U7 ( .A(c_out11), .Z(n5) );
  CIVX2 U8 ( .A(c_out10), .Z(n4) );
  CIVX2 U9 ( .A(c_in2), .Z(n2) );
  CND2X2 U10 ( .A(c_out00), .B(n2), .Z(n9) );
  CND2X2 U11 ( .A(c_out01), .B(c_in2), .Z(n8) );
  CIVX2 U12 ( .A(s2), .Z(n6) );
  CMXI2X1 U13 ( .A0(n7), .A1(n6), .S(c_in2), .Z(sum2[0]) );
  CIVX2 U14 ( .A(s4), .Z(n11) );
  CIVX2 U15 ( .A(s3), .Z(n10) );
  CMXI2X1 U16 ( .A0(n11), .A1(n10), .S(n1), .Z(sum2[1]) );
endmodule


module Add_half_1513 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(a), .B(b), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1514 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n2;

  CIVX1 U1 ( .A(a), .Z(n2) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
  CENX1 U3 ( .A(n2), .B(b), .Z(sum) );
endmodule


module Add_full_757 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1514 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1513 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1515 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOXL U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_half_1516 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2XL U1 ( .A(a), .B(b), .Z(c_out) );
  CEOX1 U2 ( .A(a), .B(b), .Z(sum) );
endmodule


module Add_full_758 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1516 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1515 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w3), .B(w2), .Z(c_out) );
endmodule


module Add_half_1517 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1, n2;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CENXL U2 ( .A(a), .B(n2), .Z(sum) );
  CIVX2 U3 ( .A(n1), .Z(c_out) );
  CIVX2 U4 ( .A(b), .Z(n2) );
endmodule


module Add_half_1518 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_759 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1518 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1517 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module Add_half_1519 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;
  wire   n1;

  CND2X2 U1 ( .A(a), .B(b), .Z(n1) );
  CIVX1 U2 ( .A(n1), .Z(c_out) );
  CEOXL U3 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_half_1520 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX2 U1 ( .A(a), .B(b), .Z(sum) );
  CAN2XL U2 ( .A(a), .B(b), .Z(c_out) );
endmodule


module Add_full_760 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3, n1, n2;

  Add_half_1520 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1519 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  CIVX2 U1 ( .A(w3), .Z(n2) );
  CIVX2 U2 ( .A(w2), .Z(n1) );
  CND2X2 U3 ( .A(n2), .B(n1), .Z(c_out) );
endmodule


module bit2_190 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n2, n3, n4,
         n5, n6, n7;

  Add_full_760 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_759 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_758 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_757 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CMX2X1 U3 ( .A0(s1), .A1(s2), .S(c_in2), .Z(sum2[0]) );
  CMXI2X1 U4 ( .A0(n3), .A1(n4), .S(n2), .Z(c_out2) );
  CMX2X1 U5 ( .A0(s3), .A1(s4), .S(n7), .Z(sum2[1]) );
  CND2XL U6 ( .A(n6), .B(n5), .Z(n7) );
  CIVX2 U7 ( .A(c_out11), .Z(n4) );
  CIVX2 U8 ( .A(c_out10), .Z(n3) );
  CIVX2 U9 ( .A(c_in2), .Z(n1) );
  CND2X2 U10 ( .A(c_out00), .B(n1), .Z(n6) );
  CND2X2 U11 ( .A(c_out01), .B(c_in2), .Z(n5) );
  CND2X2 U12 ( .A(n6), .B(n5), .Z(n2) );
endmodule


module Add_half_1521 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1522 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_761 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1522 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1521 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1523 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1524 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_762 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1524 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1523 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1525 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1526 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_763 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1526 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1525 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1527 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1528 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_764 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1528 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1527 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_191 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_764 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_763 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_762 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_761 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module Add_half_1529 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1530 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_765 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1530 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1529 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1531 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1532 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_766 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1532 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1531 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1533 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1534 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CAN2X1 U1 ( .A(b), .B(a), .Z(c_out) );
  CEOX1 U2 ( .A(b), .B(a), .Z(sum) );
endmodule


module Add_full_767 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1534 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1533 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module Add_half_1535 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_half_1536 ( sum, c_out, a, b );
  input a, b;
  output sum, c_out;


  CEOX1 U1 ( .A(b), .B(a), .Z(sum) );
  CAN2X1 U2 ( .A(b), .B(a), .Z(c_out) );
endmodule


module Add_full_768 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   w1, w2, w3;

  Add_half_1536 M1 ( .sum(w1), .c_out(w2), .a(a), .b(b) );
  Add_half_1535 M2 ( .sum(sum), .c_out(w3), .a(w1), .b(c_in) );
  COR2X1 U1 ( .A(w2), .B(w3), .Z(c_out) );
endmodule


module bit2_192 ( sum2, c_out2, a2, b2, c_in2 );
  output [1:0] sum2;
  input [1:0] a2;
  input [1:0] b2;
  input c_in2;
  output c_out2;
  wire   s1, c_out00, s2, c_out01, s3, c_out10, s4, c_out11, n1, n4, n5;

  Add_full_768 A1 ( .sum(s1), .c_out(c_out00), .a(a2[0]), .b(b2[0]), .c_in(
        1'b0) );
  Add_full_767 A2 ( .sum(s2), .c_out(c_out01), .a(a2[0]), .b(b2[0]), .c_in(
        1'b1) );
  Add_full_766 A3 ( .sum(s3), .c_out(c_out10), .a(a2[1]), .b(b2[1]), .c_in(
        1'b0) );
  Add_full_765 A4 ( .sum(s4), .c_out(c_out11), .a(a2[1]), .b(b2[1]), .c_in(
        1'b1) );
  CIVX2 U4 ( .A(n1), .Z(n5) );
  CIVX2 U5 ( .A(c_in2), .Z(n4) );
  CAOR2X1 U6 ( .A(s4), .B(n5), .C(s3), .D(n1), .Z(sum2[1]) );
  CAOR2X1 U7 ( .A(s2), .B(c_in2), .C(s1), .D(n4), .Z(sum2[0]) );
  CAOR2X1 U8 ( .A(c_out11), .B(n5), .C(c_out10), .D(n1), .Z(c_out2) );
  CANR2X1 U3 ( .A(c_out01), .B(c_in2), .C(c_out00), .D(n4), .Z(n1) );
endmodule


module bit4_48 ( sum4, c_out4, a4, b4, c_in4 );
  output [3:0] sum4;
  input [3:0] a4;
  input [3:0] b4;
  input c_in4;
  output c_out4;
  wire   c_out400, c_out401, c_out410, c_out411, n1, n2, n3, n4, n5;
  wire   [1:0] s41;
  wire   [1:0] s42;
  wire   [1:0] s43;
  wire   [1:0] s44;

  bit2_192 A41 ( .sum2(s41), .c_out2(c_out400), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b0) );
  bit2_191 A42 ( .sum2(s42), .c_out2(c_out401), .a2(a4[1:0]), .b2(b4[1:0]), 
        .c_in2(1'b1) );
  bit2_190 A43 ( .sum2(s43), .c_out2(c_out410), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b0) );
  bit2_189 A44 ( .sum2(s44), .c_out2(c_out411), .a2(a4[3:2]), .b2(b4[3:2]), 
        .c_in2(1'b1) );
  CAOR2X1 U8 ( .A(s42[1]), .B(c_in4), .C(s41[1]), .D(n5), .Z(sum4[1]) );
  CAOR2X1 U9 ( .A(s42[0]), .B(c_in4), .C(s41[0]), .D(n5), .Z(sum4[0]) );
  CMXI2X1 U3 ( .A0(n2), .A1(n3), .S(n1), .Z(c_out4) );
  CIVX1 U4 ( .A(c_out410), .Z(n3) );
  CMX2X1 U5 ( .A0(s43[1]), .A1(s44[1]), .S(n4), .Z(sum4[3]) );
  CMX2X1 U6 ( .A0(s43[0]), .A1(s44[0]), .S(n4), .Z(sum4[2]) );
  CIVX1 U7 ( .A(c_out411), .Z(n2) );
  CMXI2X1 U10 ( .A0(c_out400), .A1(c_out401), .S(c_in4), .Z(n1) );
  CIVX2 U11 ( .A(n1), .Z(n4) );
  CIVX2 U12 ( .A(c_in4), .Z(n5) );
endmodule


module bit8_12 ( sum8, c_out8, a8, b8, c_in8 );
  output [7:0] sum8;
  input [7:0] a8;
  input [7:0] b8;
  input c_in8;
  output c_out8;
  wire   c_out800, c_out801, c_out810, c_out811, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [3:0] s81;
  wire   [3:0] s82;
  wire   [3:0] s83;
  wire   [3:0] s84;

  bit4_48 A81 ( .sum4(s81), .c_out4(c_out800), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b0) );
  bit4_47 A82 ( .sum4(s82), .c_out4(c_out801), .a4(a8[3:0]), .b4(b8[3:0]), 
        .c_in4(1'b1) );
  bit4_46 A83 ( .sum4(s83), .c_out4(c_out810), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b0) );
  bit4_45 A84 ( .sum4(s84), .c_out4(c_out811), .a4(a8[7:4]), .b4(b8[7:4]), 
        .c_in4(1'b1) );
  CAOR2X1 U12 ( .A(s82[1]), .B(c_in8), .C(s81[1]), .D(n10), .Z(sum8[1]) );
  CAOR2X1 U13 ( .A(s82[0]), .B(c_in8), .C(s81[0]), .D(n10), .Z(sum8[0]) );
  CMX2X2 U3 ( .A0(s84[1]), .A1(s83[1]), .S(n4), .Z(sum8[5]) );
  CIVX1 U4 ( .A(n4), .Z(n6) );
  CIVXL U5 ( .A(n6), .Z(n7) );
  CND2X2 U6 ( .A(s84[0]), .B(n1), .Z(n2) );
  CND2X1 U7 ( .A(s83[0]), .B(n13), .Z(n3) );
  CND2X4 U8 ( .A(n2), .B(n3), .Z(sum8[4]) );
  CIVX1 U9 ( .A(n13), .Z(n1) );
  CMXI2X1 U10 ( .A0(n15), .A1(n14), .S(n7), .Z(sum8[7]) );
  CMX2X2 U11 ( .A0(s84[2]), .A1(s83[2]), .S(n5), .Z(sum8[6]) );
  CANR2X1 U14 ( .A(c_in8), .B(c_out801), .C(n10), .D(c_out800), .Z(n4) );
  CANR2X1 U15 ( .A(c_out801), .B(c_in8), .C(c_out800), .D(n10), .Z(n13) );
  CIVX1 U16 ( .A(n6), .Z(n5) );
  CND2XL U17 ( .A(c_out810), .B(n4), .Z(n9) );
  CIVXL U18 ( .A(s83[3]), .Z(n14) );
  CND2X1 U19 ( .A(c_out811), .B(n6), .Z(n8) );
  CND2X2 U20 ( .A(n9), .B(n8), .Z(c_out8) );
  CIVXL U21 ( .A(s84[3]), .Z(n15) );
  CMX2X4 U22 ( .A0(s81[3]), .A1(s82[3]), .S(c_in8), .Z(sum8[3]) );
  CIVX2 U23 ( .A(c_in8), .Z(n10) );
  CIVX2 U24 ( .A(s81[2]), .Z(n12) );
  CIVX2 U25 ( .A(s82[2]), .Z(n11) );
  CMXI2X1 U26 ( .A0(n12), .A1(n11), .S(c_in8), .Z(sum8[2]) );
endmodule


module bit16_6 ( a16, b16, sum16, c_out16, c_in16 );
  input [15:0] a16;
  input [15:0] b16;
  output [15:0] sum16;
  input c_in16;
  output c_out16;
  wire   c1;

  bit8_12 A161 ( .sum8(sum16[7:0]), .c_out8(c1), .a8(a16[7:0]), .b8(b16[7:0]), 
        .c_in8(c_in16) );
  bit8_11 A162 ( .sum8(sum16[15:8]), .c_out8(c_out16), .a8(a16[15:8]), .b8(
        b16[15:8]), .c_in8(c1) );
endmodule


module array_bin ( mlier, mcand, prodt, start, reset, valid, clock );
  input [7:0] mlier;
  input [7:0] mcand;
  output [15:0] prodt;
  input start, reset, clock;
  output valid;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, net54110, net63304, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57;
  wire   [15:0] s7;
  wire   [7:0] p0;
  wire   [7:0] p1;
  wire   [7:0] p2;
  wire   [7:0] p3;
  wire   [7:0] p4;
  wire   [7:0] p5;
  wire   [7:0] p6;
  wire   [7:0] p7;
  wire   [15:0] s1;
  wire   [15:0] s2;
  wire   [15:0] s3;
  wire   [15:0] s4;
  wire   [15:0] s5;
  wire   [15:0] s6;

  bit16_0 A0 ( .a16({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, p0}), 
        .b16({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, p1, 1'b0}), .sum16(s1), 
        .c_in16(1'b0) );
  bit16_6 A1 ( .a16({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, p2, 1'b0, 1'b0}), 
        .b16({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, p3, 1'b0, 1'b0, 1'b0}), .sum16(s2), 
        .c_in16(1'b0) );
  bit16_5 A2 ( .a16({1'b0, 1'b0, 1'b0, 1'b0, p4, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b16({1'b0, 1'b0, 1'b0, p5, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .sum16(s3), 
        .c_in16(1'b0) );
  bit16_4 A3 ( .a16({1'b0, 1'b0, p6, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b16({1'b0, p7, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .sum16(s4), 
        .c_in16(1'b0) );
  bit16_3 A4 ( .a16(s1), .b16(s2), .sum16(s5), .c_in16(1'b0) );
  bit16_2 A5 ( .a16(s3), .b16(s4), .sum16(s6), .c_in16(1'b0) );
  bit16_1 A6 ( .a16({s5[15:3], n47, s5[1:0]}), .b16({s6[15:13], n57, s6[11:0]}), .sum16(s7), .c_in16(1'b0) );
  CFD1QX1 \prodt_reg[9]  ( .D(N12), .CP(clock), .Q(prodt[9]) );
  CFD1QX1 \prodt_reg[8]  ( .D(N11), .CP(clock), .Q(prodt[8]) );
  CFD1QX1 \prodt_reg[7]  ( .D(N10), .CP(clock), .Q(prodt[7]) );
  CFD1QX1 \prodt_reg[6]  ( .D(N9), .CP(clock), .Q(prodt[6]) );
  CFD1QXL \prodt_reg[3]  ( .D(N6), .CP(clock), .Q(prodt[3]) );
  CFD1QXL \prodt_reg[2]  ( .D(N5), .CP(clock), .Q(prodt[2]) );
  CFD1QXL \prodt_reg[1]  ( .D(N4), .CP(clock), .Q(prodt[1]) );
  CFD1QXL \prodt_reg[0]  ( .D(N3), .CP(clock), .Q(prodt[0]) );
  CFD1QXL valid_reg ( .D(net54110), .CP(clock), .Q(valid) );
  CFD1QXL \prodt_reg[4]  ( .D(N7), .CP(clock), .Q(prodt[4]) );
  CFD1QX2 \prodt_reg[14]  ( .D(N17), .CP(clock), .Q(prodt[14]) );
  CFD3QX2 \prodt_reg[15]  ( .D(N18), .CP(clock), .CD(1'b1), .SD(1'b1), .Q(
        prodt[15]) );
  CFD1QX2 \prodt_reg[12]  ( .D(N15), .CP(clock), .Q(prodt[12]) );
  CFD1QX2 \prodt_reg[13]  ( .D(N16), .CP(clock), .Q(prodt[13]) );
  CFD1QX2 \prodt_reg[10]  ( .D(N13), .CP(clock), .Q(prodt[10]) );
  CFD1QX2 \prodt_reg[11]  ( .D(N14), .CP(clock), .Q(prodt[11]) );
  CFD1QX2 \prodt_reg[5]  ( .D(N8), .CP(clock), .Q(prodt[5]) );
  CND2X4 U100 ( .A(mlier[3]), .B(mcand[2]), .Z(n19) );
  CIVX20 U101 ( .A(n19), .Z(p3[2]) );
  CIVX8 U102 ( .A(n56), .Z(n57) );
  CIVX8 U103 ( .A(n49), .Z(p1[1]) );
  CAN2X2 U104 ( .A(mlier[3]), .B(mcand[3]), .Z(p3[3]) );
  CAN2X2 U105 ( .A(mlier[2]), .B(mcand[4]), .Z(p2[4]) );
  CIVX2 U106 ( .A(s5[2]), .Z(n46) );
  CIVX2 U107 ( .A(n25), .Z(N17) );
  CND2IX2 U108 ( .B(reset), .A(s7[14]), .Z(n25) );
  CAN2X2 U109 ( .A(mlier[3]), .B(mcand[5]), .Z(p3[5]) );
  CIVX8 U110 ( .A(n48), .Z(p1[3]) );
  CIVX4 U111 ( .A(n40), .Z(p0[1]) );
  CIVX8 U112 ( .A(n30), .Z(p1[4]) );
  CIVX4 U113 ( .A(n20), .Z(p0[5]) );
  CIVX2 U114 ( .A(n27), .Z(p6[1]) );
  CIVX4 U115 ( .A(n28), .Z(p7[0]) );
  CIVX4 U116 ( .A(n21), .Z(p1[2]) );
  CIVX8 U117 ( .A(n50), .Z(p2[1]) );
  CAN2X2 U118 ( .A(mlier[1]), .B(mcand[6]), .Z(p1[6]) );
  CIVX4 U119 ( .A(n41), .Z(p4[4]) );
  CIVX4 U120 ( .A(n45), .Z(p5[1]) );
  CAN2X2 U121 ( .A(mcand[4]), .B(mlier[6]), .Z(p6[4]) );
  CIVX8 U122 ( .A(n52), .Z(p0[4]) );
  CAN2X1 U123 ( .A(s7[11]), .B(net54110), .Z(N14) );
  CAN2X2 U124 ( .A(mlier[0]), .B(mcand[7]), .Z(p0[7]) );
  CIVX8 U125 ( .A(n33), .Z(p4[1]) );
  CIVX12 U126 ( .A(mcand[2]), .Z(n29) );
  CND2X4 U127 ( .A(mlier[0]), .B(mcand[5]), .Z(n20) );
  CND2X4 U128 ( .A(mlier[1]), .B(mcand[2]), .Z(n21) );
  CND2X2 U129 ( .A(s7[15]), .B(net54110), .Z(n22) );
  CIVX2 U130 ( .A(n22), .Z(N18) );
  CND2X2 U131 ( .A(s7[13]), .B(net54110), .Z(n23) );
  CIVX2 U132 ( .A(n23), .Z(N16) );
  CND2X2 U133 ( .A(s7[12]), .B(net54110), .Z(n24) );
  CIVX2 U134 ( .A(n24), .Z(N15) );
  CNR2X4 U135 ( .A(n29), .B(net63304), .Z(p0[2]) );
  CIVX2 U136 ( .A(reset), .Z(net54110) );
  CND2X4 U137 ( .A(mlier[0]), .B(mcand[0]), .Z(n26) );
  CIVX8 U138 ( .A(n26), .Z(p0[0]) );
  CIVX4 U139 ( .A(n46), .Z(n47) );
  CND2X4 U140 ( .A(mcand[1]), .B(mlier[6]), .Z(n27) );
  CIVX8 U141 ( .A(n55), .Z(p2[0]) );
  CND2X4 U142 ( .A(mlier[7]), .B(mcand[0]), .Z(n28) );
  CIVX20 U143 ( .A(mlier[0]), .Z(net63304) );
  CIVX8 U144 ( .A(n37), .Z(p3[1]) );
  CIVX8 U145 ( .A(n38), .Z(p7[1]) );
  CND2X4 U146 ( .A(mlier[1]), .B(mcand[4]), .Z(n30) );
  CIVX8 U147 ( .A(n54), .Z(p4[0]) );
  CIVX8 U148 ( .A(n43), .Z(p0[6]) );
  CIVX8 U150 ( .A(n53), .Z(p1[0]) );
  CIVX8 U151 ( .A(n32), .Z(p3[0]) );
  CIVX8 U152 ( .A(n36), .Z(p4[2]) );
  CIVX8 U153 ( .A(n35), .Z(p6[2]) );
  CIVX8 U154 ( .A(n34), .Z(p2[2]) );
  CAN2X4 U155 ( .A(mlier[2]), .B(mcand[5]), .Z(p2[5]) );
  CIVX8 U156 ( .A(n51), .Z(p1[5]) );
  CND2X4 U157 ( .A(mlier[3]), .B(mcand[0]), .Z(n32) );
  CAN2X2 U158 ( .A(mlier[5]), .B(mcand[5]), .Z(p5[5]) );
  CAN2X2 U159 ( .A(mlier[4]), .B(mcand[6]), .Z(p4[6]) );
  CIVX8 U160 ( .A(n42), .Z(p5[3]) );
  CIVX8 U161 ( .A(n44), .Z(p5[0]) );
  CIVX8 U162 ( .A(n39), .Z(p6[0]) );
  CND2X4 U163 ( .A(mlier[4]), .B(mcand[1]), .Z(n33) );
  CND2X4 U164 ( .A(mlier[2]), .B(mcand[2]), .Z(n34) );
  CND2X4 U165 ( .A(mcand[2]), .B(mlier[6]), .Z(n35) );
  CND2X4 U166 ( .A(mlier[4]), .B(mcand[2]), .Z(n36) );
  CAN2X2 U167 ( .A(mlier[7]), .B(mcand[3]), .Z(p7[3]) );
  CND2X4 U168 ( .A(mlier[3]), .B(mcand[1]), .Z(n37) );
  CND2X4 U169 ( .A(mlier[7]), .B(mcand[1]), .Z(n38) );
  CND2X4 U170 ( .A(mcand[0]), .B(mlier[6]), .Z(n39) );
  CND2X4 U171 ( .A(mlier[0]), .B(mcand[1]), .Z(n40) );
  CND2X4 U172 ( .A(mlier[4]), .B(mcand[4]), .Z(n41) );
  CND2X2 U173 ( .A(mlier[5]), .B(mcand[1]), .Z(n45) );
  CAN2X4 U174 ( .A(mlier[2]), .B(mcand[7]), .Z(p2[7]) );
  CAN2X4 U175 ( .A(mlier[3]), .B(mcand[6]), .Z(p3[6]) );
  CND2X4 U176 ( .A(mlier[5]), .B(mcand[3]), .Z(n42) );
  CND2X4 U177 ( .A(mlier[0]), .B(mcand[6]), .Z(n43) );
  CND2X4 U178 ( .A(mlier[5]), .B(mcand[0]), .Z(n44) );
  CAN2X4 U179 ( .A(mlier[5]), .B(mcand[2]), .Z(p5[2]) );
  CAN2X4 U180 ( .A(mlier[4]), .B(mcand[3]), .Z(p4[3]) );
  CAN2X4 U181 ( .A(mlier[4]), .B(mcand[5]), .Z(p4[5]) );
  CND2X4 U182 ( .A(mlier[1]), .B(mcand[3]), .Z(n48) );
  CND2X4 U183 ( .A(mlier[1]), .B(mcand[1]), .Z(n49) );
  CND2X4 U184 ( .A(mlier[2]), .B(mcand[1]), .Z(n50) );
  CND2X4 U185 ( .A(mlier[1]), .B(mcand[5]), .Z(n51) );
  CND2X4 U186 ( .A(mlier[0]), .B(mcand[4]), .Z(n52) );
  CAN2X2 U187 ( .A(mlier[7]), .B(mcand[2]), .Z(p7[2]) );
  CAN2X2 U188 ( .A(mcand[3]), .B(mlier[6]), .Z(p6[3]) );
  CND2X4 U189 ( .A(mlier[1]), .B(mcand[0]), .Z(n53) );
  CAN2X2 U190 ( .A(mlier[7]), .B(mcand[4]), .Z(p7[4]) );
  CAN2X4 U191 ( .A(mlier[3]), .B(mcand[4]), .Z(p3[4]) );
  CAN2X4 U192 ( .A(mlier[5]), .B(mcand[4]), .Z(p5[4]) );
  CAN2X4 U193 ( .A(mlier[1]), .B(mcand[7]), .Z(p1[7]) );
  CAN2X4 U194 ( .A(mlier[2]), .B(mcand[6]), .Z(p2[6]) );
  CND2X4 U195 ( .A(mlier[2]), .B(mcand[0]), .Z(n55) );
  CND2X4 U196 ( .A(mlier[4]), .B(mcand[0]), .Z(n54) );
  CAN2X2 U197 ( .A(mlier[2]), .B(mcand[3]), .Z(p2[3]) );
  CAN2X2 U198 ( .A(mlier[0]), .B(mcand[3]), .Z(p0[3]) );
  CIVX2 U199 ( .A(s6[12]), .Z(n56) );
  CAN2X1 U200 ( .A(s7[0]), .B(net54110), .Z(N3) );
  CAN2X1 U201 ( .A(s7[1]), .B(net54110), .Z(N4) );
  CAN2X1 U202 ( .A(s7[2]), .B(net54110), .Z(N5) );
  CAN2X1 U203 ( .A(s7[3]), .B(net54110), .Z(N6) );
  CAN2X1 U204 ( .A(s7[4]), .B(net54110), .Z(N7) );
  CAN2X1 U205 ( .A(s7[5]), .B(net54110), .Z(N8) );
  CAN2X1 U206 ( .A(s7[6]), .B(net54110), .Z(N9) );
  CAN2X1 U207 ( .A(s7[7]), .B(net54110), .Z(N10) );
  CAN2X1 U208 ( .A(s7[8]), .B(net54110), .Z(N11) );
  CAN2X1 U209 ( .A(s7[9]), .B(net54110), .Z(N12) );
  CAN2X1 U210 ( .A(s7[10]), .B(net54110), .Z(N13) );
  CAN2X1 U211 ( .A(mlier[6]), .B(mcand[7]), .Z(p6[7]) );
  CAN2X1 U212 ( .A(mcand[6]), .B(mlier[6]), .Z(p6[6]) );
  CAN2X1 U213 ( .A(mcand[5]), .B(mlier[6]), .Z(p6[5]) );
  CAN2X1 U214 ( .A(mlier[7]), .B(mcand[7]), .Z(p7[7]) );
  CAN2X1 U215 ( .A(mlier[7]), .B(mcand[6]), .Z(p7[6]) );
  CAN2X1 U216 ( .A(mlier[7]), .B(mcand[5]), .Z(p7[5]) );
  CAN2X1 U217 ( .A(mlier[4]), .B(mcand[7]), .Z(p4[7]) );
  CAN2X1 U218 ( .A(mlier[5]), .B(mcand[7]), .Z(p5[7]) );
  CAN2X1 U219 ( .A(mlier[5]), .B(mcand[6]), .Z(p5[6]) );
  CAN2X1 U220 ( .A(mlier[3]), .B(mcand[7]), .Z(p3[7]) );
endmodule


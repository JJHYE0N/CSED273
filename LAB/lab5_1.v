/* CSED273 lab5 experiment 1 */
/* lab5_1.v */

`timescale 1ps / 1fs

/* Implement adder 
 * You must not use Verilog arithmetic operators */
module adder(
    input [3:0] x,
    input [3:0] y,
    input c_in,             // Carry in
    output [3:0] out,
    output c_out            // Carry out
); 

    ////////////////////////
    /* Add your code here */
    wire [3:0] A;
    wire [3:0] B;
    wire [3:0] C;
    wire [2:0] cout;
    
    xor(out[0],x[0],y[0],c_in);
    and(A[0],x[0],y[0]);
    xor(B[0],x[0],y[0]);
    and(C[0],B[0],c_in);
    or(cout[0],A[0],C[0]);
    
    xor(out[1],x[1],y[1],cout[0]);
    and(A[1],x[1],y[1]);
    xor(B[1],x[1],y[1]);
    and(C[1],B[1],cout[0]);
    or(cout[1],A[1],C[1]);
    
    xor(out[2],x[2],y[2],cout[1]);
    and(A[2],x[2],y[2]);
    xor(B[2],x[2],y[2]);
    and(C[2],B[2],cout[1]);
    or(cout[2],A[2],C[2]);
    
    xor(out[3],x[3],y[3],cout[2]);
    and(A[3],x[3],y[3]);
    xor(B[3],x[3],y[3]);
    and(C[3],B[3],cout[2]);
    or(c_out,A[3],C[3]);
    ////////////////////////

endmodule

/* Implement arithmeticUnit with adder module
 * You must use one adder module.
 * You must not use Verilog arithmetic operators */
module arithmeticUnit(
    input [3:0] x,
    input [3:0] y,
    input [2:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    /* Add your code here */
    wire [3:0] y_;
    wire a0,a1,a2,b0,b1,b2,c0,c1,c2,d0,d1,d2;
    and(a0, select[1],y[0]);//s1,y0
    not(a1, y[0]);
    and(a2, select[2], a1);//s2,y0'
    or(y_[0],a0,a2);
    
    and(b0, select[1],y[1]);//s1,y1
    not(b1, y[1]);
    and(b2, select[2], b1);//s2,y1'
    or(y_[1],b0,b2);
    
    and(c0, select[1],y[2]);//s1,y2
    not(c1, y[2]);
    and(c2, select[2], c1);//s2,y2'
    or(y_[2],c0,c2);
    
    and(d0, select[1],y[3]);//s1,y3
    not(d1, y[3]);
    and(d2, select[2], d1);//s2,y3'
    or(y_[3],d0,d2);
    
    adder A(y_[3:0],x[3:0],select[0],out[3:0],c_out);
    ////////////////////////

endmodule

/* Implement 4:1 mux */
module mux4to1(
    input [3:0] in,
    input [1:0] select,
    output out
);

    ////////////////////////
    /* Add your code here */
    wire A,B,C,D;
    and(A,in[0],~select[1],~select[0]);
    and(B,in[1],~select[1],select[0]);
    and(C,in[2],select[1],~select[0]);
    and(D,in[3],select[1],select[0]);
    or(out,A,B,C,D);
    ////////////////////////

endmodule

/* Implement logicUnit with mux4to1 */
module logicUnit(
    input [3:0] x,
    input [3:0] y,
    input [1:0] select,
    output [3:0] out
);

    ////////////////////////
    /* Add your code here */
    wire [3:0] in_value0;
    wire [3:0] in_value1;
    wire [3:0] in_value2;
    wire [3:0] in_value3;
    and(in_value0[0],x[0],y[0]);
    or(in_value0[1],x[0],y[0]);
    xor(in_value0[2],x[0],y[0]);
    not(in_value0[3],x[0]);
    
    and(in_value1[0],x[1],y[1]);
    or(in_value1[1],x[1],y[1]);
    xor(in_value1[2],x[1],y[1]);
    not(in_value1[3],x[1]);
    
    and(in_value2[0],x[2],y[2]);
    or(in_value2[1],x[2],y[2]);
    xor(in_value2[2],x[2],y[2]);
    not(in_value2[3],x[2]);
    
    and(in_value3[0],x[3],y[3]);
    or(in_value3[1],x[3],y[3]);
    xor(in_value3[2],x[3],y[3]);
    not(in_value3[3],x[3]);
    
    mux4to1 A(in_value0[3:0],select[1:0],out[0]);
    mux4to1 B(in_value1[3:0],select[1:0],out[1]);
    mux4to1 C(in_value2[3:0],select[1:0],out[2]);
    mux4to1 D(in_value3[3:0],select[1:0],out[3]);
    
    ////////////////////////

endmodule

/* Implement 2:1 mux */
module mux2to1(
    input [1:0] in,
    input  select,
    output out
);

    ////////////////////////
    /* Add your code here */
    wire A,B;
    and(A,in[0],~select,1);
    and(B,in[1],select,1);
    or(out,A,B);
    ////////////////////////

endmodule

/* Implement ALU with mux2to1 */
module lab5_1(
    input [3:0] x,
    input [3:0] y,
    input [3:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    /* Add your code here */
    wire [3:0] out_1;
    wire [3:0] out_2;
    arithmeticUnit A(x[3:0],y[3:0],select[2:0],out_1[3:0],c_out);
    logicUnit B(x[3:0],y[3:0],select[1:0],out_2[3:0]);
    wire [1:0] ab0;
    wire [1:0] ab1;
    wire [1:0] ab2;
    wire [1:0] ab3;
    
    assign ab0[0]=out_1[0];
    assign ab0[1]=out_2[0];
    assign ab1[0]=out_1[1];
    assign ab1[1]=out_2[1];
    assign ab2[0]=out_1[2];
    assign ab2[1]=out_2[2];
    assign ab3[0]=out_1[3];
    assign ab3[1]=out_2[3];
    
    mux2to1 C(ab0[1:0],select[3],out[0]);
    mux2to1 D(ab1[1:0],select[3],out[1]);
    mux2to1 E(ab2[1:0],select[3],out[2]);
    mux2to1 F(ab3[1:0],select[3],out[3]);
    ////////////////////////

endmodule

/* CSED273 lab2 experiment 1 */
/* lab2_1.v */

/* Unsimplifed equation
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_1(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT cal_gt(outGT, inA, inB);
    CAL_EQ cal_eq(outEQ, inA, inB);
    CAL_LT cal_lt(outLT, inA, inB);
    
endmodule

/* Implement output about "A>B" */
module CAL_GT(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    wire A,B,C,D,E,F;
    and(A,~inB[1],~inB[0],~inA[1],inA[0]);
    and(B,~inB[1],~inB[0],inA[1],inA[0]);
    and(C,~inB[1],inB[0],inA[1],inA[0]);
    and(D,inB[1],~inB[0],inA[1],inA[0]);
    and(E,~inB[1],~inB[0],inA[1],~inA[0]);
    and(F,~inB[1],inB[0],inA[1],~inA[0]);
    
    or(outGT,A,B,C,D,E,F);
    ////////////////////////

endmodule

/* Implement output about "A=B" */
module CAL_EQ(
    output wire outEQ,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    wire A,B,C,D;
    and(A,inA[0],inA[1],inB[0],inB[1]);
    and(B,~inA[0],~inA[1],~inB[0],~inB[1]);
    and(C,~inA[0],inA[1],~inB[0],inB[1]);
    and(D,inA[0],~inA[1],inB[0],~inB[1]);
    or(outEQ,A,B,C,D);
    ////////////////////////

endmodule

/* Implement output about "A<B" */
module CAL_LT(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    wire A,B,C,D,E,F;
    and(A,~inA[1],~inA[0],~inB[1],inB[0]);
    and(B,~inA[1],~inA[0],inB[1],inB[0]);
    and(C,~inA[1],inA[0],inB[1],inB[0]);
    and(D,inA[1],~inA[0],inB[1],inB[0]);
    and(E,~inA[1],~inA[0],inB[1],~inB[0]);
    and(F,~inA[1],inA[0],inB[1],~inB[0]);
    
    or(outLT,A,B,C,D,E,F);
    ////////////////////////

endmodule
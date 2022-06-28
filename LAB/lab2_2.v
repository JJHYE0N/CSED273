/* CSED273 lab2 experiment 2 */
/* lab2_2.v */

/* Simplifed equation by K-Map method
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_2(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT_2 cal_gt2(outGT, inA, inB);
    CAL_EQ_2 cal_eq2(outEQ, inA, inB);
    CAL_LT_2 cal_lt2(outLT, inA, inB);

endmodule

/* Implement output about "A>B" */
module CAL_GT_2(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    wire A,B,C;
    and(A,inA[1],inA[0],~inB[0]);
    and(B,inA[0],~inB[0],~inB[1]);
    and(C,inA[1],~inB[1]);
    or(outGT,A,B,C);
    ////////////////////////

endmodule

/* Implement output about "A=B" */
module CAL_EQ_2(
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
module CAL_LT_2(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */
    wire A,B,C;
    and(A,~inA[0],inB[1],inB[0]);
    and(B,~inA[1],~inA[0],inB[0]);
    and(C,~inA[1],inB[1]);
    or(outLT,A,B,C);
    ////////////////////////

endmodule
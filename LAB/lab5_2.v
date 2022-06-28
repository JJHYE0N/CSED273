/* CSED273 lab5 experiment 2 */
/* lab5_2.v */

`timescale 1ns / 1ps

/* Implement srLatch */
module srLatch(
    input s, r,
    output q, q_
    );

    ////////////////////////
    /* Add your code here */
    nor(q,r,q_);
    nor(q_,q,s);
    ////////////////////////

endmodule

/* Implement master-slave JK flip-flop with srLatch module */
module lab5_2(
    input reset_n, j, k, clk,
    output q, q_
    );

    ////////////////////////
    /* Add your code here */
    wire s1,s2,r1,r2,q0,q0_,q1,q1_;
    assign q0 = (reset_n) ? q : 0;
    assign q0_ = (reset_n) ? q_ : 1;
    
    and(r1, k, q0, clk);
    and(s1, j, q0_, clk);
    srLatch B(s1,r1,q1,q1_);
    and(r2, q1_, ~clk);
    and(s2, q1, ~clk);
    srLatch C(s2,r2,q,q_);
    ////////////////////////
    
endmodule
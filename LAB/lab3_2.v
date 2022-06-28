/* CSED273 lab3 experiment 2 */
/* lab3_2.v */


/* Implement Prime Number Indicator & Multiplier Indicator
 * You may use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
 
/* 11: out_mul[4], 7: out_mul[3], 5: out_mul[2],
 * 3: out_mul[1], 2: out_mul[0] */
module lab3_2(
    input wire [3:0] in,
    output wire out_prime,
    output wire [4:0] out_mul
    );

    ////////////////////////
    /* Add your code here */
    wire A,B,C,D;
    and(A,~in[3],~in[2],in[1]);
    and(B,~in[3],in[1],in[0]);
    and(C,~in[2],in[1],in[0]);
    and(D,in[2],~in[1],in[0]);
    or(out_prime,A,B,C,D);
    
    /*
    and(out_prime,~in[3],~in[2],in[1],~in[0]);//2
    and(out_prime,~in[3],~in[2],in[1],in[0]);//3
    and(out_prime,~in[3],in[2],~in[1],in[0]);//5
    and(out_prime,~in[3],in[2],in[1],in[0]);//7
    and(out_prime,in[3],~in[2],in[1],in[0]);//11
    and(out_prime,in[3],in[2],~in[1],in[0]);//13
    */
    
    wire E;
    or(E,in[3],in[2],in[1]);
    and(out_mul[0],~in[0],E);
    /*
    and(out_mul[0],~in[3],~in[2],in[1],~in[0]);//2
    and(out_mul[0],~in[3],in[2],~in[1],~in[0]);//4
    and(out_mul[0],~in[3],in[2],in[1],~in[0]);//6
    and(out_mul[0],in[3],~in[2],~in[1],~in[0]);//8
    and(out_mul[0],in[3],~in[2],in[1],~in[0]);//10
    and(out_mul[0],in[3],in[2],~in[1],~in[0]);//12
    and(out_mul[0],in[3],in[2],in[1],~in[0]);//14
    */
    wire [4:0] X;
    and(X[4],~in[3],~in[2],in[1],in[0]);//3
    and(X[3],~in[3],in[2],in[1],~in[0]);//6
    and(X[2],in[3],~in[2],~in[1],in[0]);//9
    and(X[1],in[3],in[2],~in[1],~in[0]);//12
    and(X[0],in[3],in[2],in[1],in[0]);//15
    or(out_mul[1],X[4],X[3],X[2],X[1],X[0]);
    
    wire [2:0] Y;
    and(Y[2],~in[3],in[2],~in[1],in[0]);//5
    and(Y[1],in[3],~in[2],in[1],~in[0]);//10
    and(Y[0],in[3],in[2],in[1],in[0]);//15
    or(out_mul[2],Y[2],Y[1],Y[0]);
    
    wire [1:0] Z;
    and(Z[1],~in[3],in[2],in[1],in[0]);//7
    and(Z[0],in[3],in[2],in[1],~in[0]);//14
    or(out_mul[3],Z[1],Z[0]);
    
    and(out_mul[4],in[3],~in[2],in[1],in[0]);//11
    ////////////////////////

endmodule
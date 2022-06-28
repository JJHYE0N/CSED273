/* CSED273 lab4 experiment 4 */
/* lab4_4.v */

/* Implement 5x3 Binary Mutliplier
 * You must use lab4_2 module in lab4_2.v
 * You cannot use fullAdder or halfAdder module directly
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module lab4_4(
    input [4:0]in_a,
    input [2:0]in_b,
    output [7:0]out_m
    );

    ////////////////////////
    /* Add your code here */
    //a,b,in_c,4:0s,out_c
    //assign out_m[0]=in_a[0]&in_b[0];
    and(out_m[0],in_a[0],in_b[0]);
    wire [4:0] A;
    and(A[0],in_a[0],in_b[1]);
    and(A[1],in_a[1],in_b[1]);
    and(A[2],in_a[2],in_b[1]);
    and(A[3],in_a[3],in_b[1]);
    and(A[4],in_a[4],in_b[1]);
    
    wire [4:0] B;
    and(B[0],in_a[1],in_b[0]);
    and(B[1],in_a[2],in_b[0]);
    and(B[2],in_a[3],in_b[0]);
    and(B[3],in_a[4],in_b[0]);
    assign B[4] = 0;
    wire [4:0] C;
    wire cout;
    wire cin;
    assign cin = 0;
    lab4_2 X(A[4:0],B[4:0],cin,C[4:0],cout);
    assign out_m[1]=C[0];
    
    wire [4:0] F;
    assign F[0]=C[1];
    assign F[1]=C[2];
    assign F[2]=C[3];
    assign F[3]=C[4];
    assign F[4]= cout;
    
    wire [4:0] D;
    and(D[0],in_a[0],in_b[2]);
    and(D[1],in_a[1],in_b[2]);
    and(D[2],in_a[2],in_b[2]);
    and(D[3],in_a[3],in_b[2]);
    and(D[4],in_a[4],in_b[2]);
    lab4_2 Y(F[4:0],D[4:0],cin,out_m[6:2],out_m[7]);
    ////////////////////////
    
endmodule
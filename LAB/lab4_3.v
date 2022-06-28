/* CSED273 lab4 experiment 3 */
/* lab4_3.v */

/* Implement 5-Bit Ripple Subtractor
 * You must use lab4_2 module in lab4_2.v
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module lab4_3(
    input [4:0] in_a,
    input [4:0] in_b,
    input in_c,
    output [4:0] out_s,
    output out_c
    );

    ////////////////////////
    /* Add your code here */
    wire [3:0] c;
    assign in_c=1;
    fullAdder a (in_a[0],~in_b[0],in_c,out_s[0],c[0]);
    fullAdder b (in_a[1],~in_b[1],c[0],out_s[1],c[1]);
    fullAdder d (in_a[2],~in_b[2],c[1],out_s[2],c[2]);
    fullAdder e (in_a[3],~in_b[3],c[2],out_s[3],c[3]);
    fullAdder f (in_a[4],~in_b[4],c[3],out_s[4],out_c);
    ////////////////////////

endmodule
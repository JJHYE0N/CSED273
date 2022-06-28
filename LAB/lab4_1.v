/* CSED273 lab4 experiment 1 */
/* lab4_1.v */


/* Implement Half Adder
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module halfAdder(
    input in_a,
    input in_b,
    output out_s,
    output out_c
    );

    ////////////////////////
    /* Add your code here */
    and(out_c,in_a,in_b);
    xor(out_s,in_a,in_b);
    ////////////////////////

endmodule

/* Implement Full Adder
 * You must use halfAdder module
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module fullAdder(
    input in_a,
    input in_b,
    input in_c,
    output out_s,
    output out_c
    );

    ////////////////////////
    /* Add your code here */
    //a,b,s,c
    wire A,B,C;
    halfAdder a(in_b,in_c,A,B);
    halfAdder b(in_a,A,out_s,C);
    or(out_c,B,C);
    
    ////////////////////////

endmodule
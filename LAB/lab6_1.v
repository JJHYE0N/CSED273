/* CSED273 lab6 experiment 1 */
/* lab6_1.v */

`timescale 1ps / 1fs

/* Implement synchronous BCD decade counter (0-9)
 * You must use JK flip-flop of lab6_ff.v */
module decade_counter(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    /* Add your code here */
    wire [3:0] count_ =~count;
    
    edge_trigger_JKFF JK1(reset_n,count[2]&count[1]&count[0],count[0],clk,count[3],count_[3]);
    edge_trigger_JKFF JK2(reset_n,count[1]&count[0],count[1]&count[0],clk,count[2],count_[2]);
    edge_trigger_JKFF JK3(reset_n,count_[3]&count[0],count[0],clk,count[1],count_[1]);
    edge_trigger_JKFF JK4(reset_n,1,1,clk,count[0],count_[0]);
    ////////////////////////
	
endmodule
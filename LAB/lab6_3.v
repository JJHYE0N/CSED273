/* CSED273 lab6 experiment 3 */
/* lab6_3.v */

`timescale 1ps / 1fs

/* Implement 369 game counter (0, 3, 6, 9, 13, 6, 9, 13, 6 ...)
 * You must first implement D flip-flop in lab6_ff.v
 * then you use D flip-flop of lab6_ff.v */
module counter_369(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    /* Add your code here */
    wire [3:0] count_ = ~count;
    
    edge_trigger_D_FF FF1(reset_n, count[3]&count_[2]|count[1]&count_[0], clk, count[3], count_[3]);
    edge_trigger_D_FF FF2(reset_n, count[0], clk, count[2], count_[2]);
    edge_trigger_D_FF FF3(reset_n, count_[3]&count_[2]|count[2]&count_[1], clk, count[1], count_[1]);
    edge_trigger_D_FF FF4(reset_n, count_[0]|count_[2]&count_[1], clk, count[0], count_[0]);
    ////////////////////////
	
endmodule

/* CSED273 lab6 experiments */
/* lab6_tb.v */
 
`timescale 1ps / 1fs
 
module lab6_tb();
 
    integer Passed;
    integer Failed;
 
    /* Define input, output and instantiate module */
    ////////////////////////
    reg reset_n;
    reg clk;
    
    wire [3:0] decade_count;
    wire [7:0] decade_count_2digits;
    wire [3:0] count_369;
    
    decade_counter DC(
        .reset_n(reset_n),
        .clk(clk),
        .count(decade_count)
    );
    
    decade_counter_2digits DC_2digits(
        .reset_n(reset_n),
        .clk(clk),
        .count(decade_count_2digits)
    );
    
    counter_369 C_369(
        .reset_n(reset_n),
        .clk(clk),
        .count(count_369)
    );
    
    initial begin
        reset_n = 0;
        clk = 0;
        
        #5 reset_n = 1;
    end
    
    
    always begin
        clk = !clk;  #5;
    end
    
    ////////////////////////
    initial begin
        Passed = 0;
        Failed = 0;
 
        lab6_1_test;
        lab6_2_test;
        lab6_3_test;
 
        $display("Lab6 Passed = %0d, Failed = %0d", Passed, Failed);
        $finish;
    end
 
    /* Implement test task for lab6_1 */
    task lab6_1_test;
        ////////////////////////
        integer i;
        begin
            //$display("%d",decade_count);
            for (i = 0; i < 10; i = i + 1) begin
                #10;
                if (decade_count == (i + 1) % 10) begin
                    Passed = Passed + 1;
                end
                else begin
                    Failed = Failed + 1;
                end
            end
        end
        ////////////////////////
    endtask
 
    /* Implement test task for lab6_2 */
    task lab6_2_test;
        ////////////////////////
        
        integer j;
        integer dec;
        begin
            #900;
            //$display("%d",decade_count_2digits);
            for (j = 0; j < 100; j = j + 1) begin
                #10;           
                dec = (decade_count_2digits)/16*10+(decade_count_2digits)%16;
                //$display(" %d , %d",decade_count_2digits/16,(decade_count_2digits)%16);
                //$display("j= %0d, dec = %0d",j+1, dec);
                if (dec == (j + 1) % 100) begin
                    Passed = Passed + 1;
                end
                else begin
                    Failed = Failed + 1;
                end
                
            end
        end
        ////////////////////////
    endtask
 
    /* Implement test task for lab6_3 */
    task lab6_3_test;
        ////////////////////////
        
        integer j;
        integer k;
        begin
            clk = 0;
            reset_n=0;
            #10
            reset_n=1;
            
            j=0;
            for (k=0;k<11;k=k+1) begin
                //$display("j = %d, count = %d",j,count_369);
                if (count_369 == j) begin
                    Passed = Passed + 1;
                end
                else begin
                    Failed = Failed + 1;
                end
                
                if (j==0) begin
                    j=3;
                end
                else if (j==3) begin 
                    j=6;
                end
                else if (j == 6) begin
                    j=9;
                end
                else if (j == 9) begin
                    j=13;
                end
                else if (j == 13) begin
                    j=6;
                end
                #10;    
            end
            
            //$display("%d",count_369);
            
        end
        ////////////////////////
    endtask
 
endmodule
`timescale 1ns/1ns

module lock_tb;
  reg clk, reset, a;
  wire l;

 
  fivebitLock uut (
    .a(a),
    .reset(reset),
    .clk(clk),
    .l(l)
  );

  initial begin
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, lock_tb);

    clk = 0;
    reset = 0;
    a = 0;

    
    #10 reset = 1;

    
    #10 a = 1;
    #10 a = 1;
    #10 a = 1;
    #10 a = 0;  
    #10 a = 0;  
    #10 a = 0;
    #10;
    
    $finish;
  end

  always @(posedge clk,negedge reset) begin
    $display("%0t\t%b\t%b\t%b",$time,clk, a, l);
  end
endmodule

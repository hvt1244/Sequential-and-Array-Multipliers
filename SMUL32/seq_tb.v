`timescale 1ns/10ps

module seq_adder_tb();
  parameter n=32;
  wire [2*n:0] prodt_end;
  wire valid;
  reg [n-1:0] mlier,mcand;
  reg clock,start,reset;

  seq_adder A0 (.mlier(mlier),.mcand(mcand),.prodt_end(prodt_end),.clock(clock),.start(start),.valid(valid),.reset(reset));

  initial
  begin
     
    mcand={4{8'b11010111}};mlier={4{8'b11110111}};  
    start=1;
    clock=0;reset=1;
    #25 reset=0;
    #700 mcand=32'b11011101110110000101110111011101;
    	mlier=32'b10111011101110111110111010111011;
    #600     mcand=32'b11011101110111110100110111011101;
    mlier=32'b10111011101000111011101110111000;
    #600 mcand=0;mlier=0;   


   
    end
  
  always #3 clock=!clock;
  
	initial  begin
	     $dumpfile ("counter.vcd"); 
	     $dumpvars; 
        end 
	     
        initial  begin
          $display("\t\ttime,\tclock,\tmlier,\tmcand,\tstart,\tprodt_end,\tvalid"); 
          $monitor("%d,\t%b,\t%b,\t%b,\t%b,\t%b,\t%b",$time,clock,mlier,mcand,start,prodt_end,valid); 
        end
	     
        initial 
	    #2400  $finish; 
endmodule

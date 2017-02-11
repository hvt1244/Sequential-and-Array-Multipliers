`timescale 1ns/10ps

module array_bin_tb();
  //parameter n=8;
  wire [63:0] prodt;
  reg [31:0] mlier,mcand;
  reg clock,start,reset;
  wire valid;

  array_bin A0(.mlier(mlier),.mcand(mcand),.prodt(prodt),.start(start),.reset(reset),.valid(valid),.clock(clock));

  initial
  begin
    
    mcand=4'b1101;
    mlier=4'b0101;
    start=1;
    clock=0;reset=1;
    #25 reset=0;
    #200 mcand=32'b11011101110110000101110111011101;
    	mlier=32'b10111011101110111110111010111011;
    #200     mcand=32'b11011101110111110100110111011101;
    mlier=32'b10111011101000111011101110111000;
    #200 mcand=0;mlier=0;
   
    end
  always #20 clock=!clock;

	initial  begin
	     $dumpfile ("counter.vcd"); 
	     $dumpvars; 
        end 
	     
        initial  begin
          $display("\t\ttime,\tmlier,\tmcand,\tclock,\tvalid,\treset,\tstart,\tprodt"); 
          $monitor("%d,\t%b,\t%b,\t%b,\t%b,\t%b,\t%b,\t%b",$time,mlier,mcand,clock,valid,reset,start,prodt); 
        end
	     
        initial 
	    #1000  $finish; 
endmodule

`timescale 1ns/10ps

module array_bin_tb();
  wire [15:0] prodt;
  reg [7:0] mlier,mcand;
  reg clock,start,reset;
  wire valid;

  array_bin A0(.mlier(mlier),.mcand(mcand),.prodt(prodt),.start(start),.reset(reset),.valid(valid),.clock(clock));

  initial
  begin
    

    mcand=8'b11011110;mlier=8'b10110111;  
    start=1;
    clock=0;reset=1;
    #25 reset=0;
    #200	 mcand=8'b00011110;mlier=8'b10110111;  
    #200     mcand=8'b11011011;mlier=8'b10010101;
    #200    mcand=8'b11111100;mlier=8'b11101111;

    end
  always #4 clock=!clock;

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

`timescale 1ns/10ps

module array_bin_tb();
  wire [31:0] prodt;
  reg [15:0] mlier,mcand;
  reg clock,start,reset;
  wire valid;

  array_bin A0(.mlier(mlier),.mcand(mcand),.prodt(prodt),.start(start),.reset(reset),.valid(valid),.clock(clock));

  initial
  begin
    

    mcand={2{8'b11010100}};mlier={2{8'b10010111}};  
    start=1;
    clock=0;reset=1;
    #25 reset=0;
    #200	 mcand={2{8'b11011110}};mlier={2{8'b10010111}};  
    #200     mcand={2{8'b11011111}};mlier={2{8'b00010101}};
    #200    mcand={2{8'b11111111}};mlier={2{8'b11111111}};

    end
  always #7.5 clock=!clock;

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

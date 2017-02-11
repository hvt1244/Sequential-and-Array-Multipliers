`timescale 1ns/10ps

module seq_adder_tb();
  parameter n=16;
  wire [2*n:0] prodt_end;
  wire valid;
  reg [n-1:0] mlier,mcand;
  reg clock,start,reset;

  seq_adder A0 (.mlier(mlier),.mcand(mcand),.prodt_end(prodt_end),.clock(clock),.start(start),.valid(valid),.reset(reset));

  initial
  begin
     
    mcand={2{8'b11010100}};mlier={2{8'b10010111}};  
    start=1;
    clock=0;reset=1;
    #25 reset=0;
    #400	 mcand={2{8'b11011110}};mlier={2{8'b10010111}};  
    #400     mcand={2{8'b11011111}};mlier={2{8'b00010101}};
    #400    mcand={2{8'b11111111}};mlier={2{8'b11111111}};


   
    end
  
  always #2 clock=!clock;
  
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

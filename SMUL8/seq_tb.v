`timescale 1ns/10ps 
module seq_adder_tb();
  parameter n=8;
  wire [2*n:0] prodt_end;
  //wire c_out;
  wire valid;
  reg [n-1:0] mlier,mcand;
  reg clock,start,reset;

  seq_adder A0 (.mlier(mlier),.mcand(mcand),.prodt_end(prodt_end),.clock(clock),.start(start),.valid(valid),.reset(reset));

  initial
  begin
     

    mcand=8'b11011110;mlier=8'b10110111;  
    start=1;
    clock=0;reset=1;
    #25 reset=0;
    #200	 mcand=8'b00011110;mlier=8'b10110111; 
    #20 start=0; #20 start=1;
    #200     mcand=8'b11011011;mlier=8'b10010101;
    #200    mcand=8'b11111100;mlier=8'b11101111;

   
    end
    //assign prodt_end=8'b00000000;
  
  always #10 clock=!clock;
  
	initial  begin
	     $dumpfile ("seq_adder.vcd"); 
	     $dumpvars; 
        end 
	     
        initial  begin
          $display("\t\ttime,\tclock,\tmlier,\tmcand,\tstart,\tprodt_end,\tvalid"); 
          $monitor("%d,\t%b,\t%b,\t%b,\t%b,\t%b,\t%b",$time,clock,mlier,mcand,start,prodt_end,valid); 
        end
	     
        initial 
	    #2400  $finish; 
endmodule

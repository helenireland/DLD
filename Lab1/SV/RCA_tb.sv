`timescale 1ns / 1ps
module tb ();

integer handle3;
integer desc3;
integer i;

logic [3:0]       a;
   logic [3:0] 	b;
   logic 	c;
   
   logic [3:0] y;
   logic [3:0] sum;
   logic [2:0] cin;
   logic        clk;
   logic [3:0] Sum_correct;
   logic [3:0] Error;   

RCA dut(a, b, c, y, sum);
initial
	begin
		
		desc3 = $fopen("rca.out");
		
		#1900 $finish;
	end
	assign Sum_correct = a + b + c;
		assign Error = y != (a & b) | (a & c) | (b & c);

initial begin
	clk = 1'b1;
	forever #5 clk = ~clk;
end

initial
begin
	for (i=0; i < 180; i=i+1)
	begin
		// Put vectors before beginning of clk
		
		@(posedge clk)
		begin
			a = $random;
			b = $random;
			c = $random;
			
			
		end
		@(negedge clk)
		begin

			$fdisplay(desc3, "%h %h || %h | %h | %b", a, b, c, sum, (Sum_correct == sum));
		end
	end // @(negedge clk)
end
    

   
endmodule

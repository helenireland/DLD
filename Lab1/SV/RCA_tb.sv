`timescale 1ns / 1ps
module tb ();

integer handle3;
integer desc3;
integer i;

logic [3:0]       a;
   logic [3:0] 	b;
   logic 	c;
   
   logic [3:0] f;
   logic [3:0] sum;
   logic [2:0] cin;
   logic        clk;   

RCA dut(a, b, c, sum, f);
initial
	begin
		handle3 = $fopen("rca.out");
		desc3 = handle3;
		#1250 $finish;
	end

initial
begin
	for (i=0; i < 128; i=i+1)
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
			$fdisplay(desc3, "%h %h || %h | %h | %b", a, b, c, sum, (c == sum));
		end
	end // @(negedge clk)
end
    

   
endmodule

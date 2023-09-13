`timescale 1ns / 1ps
module tb ();

integer handle3;
integer desc3;
integer i;

logic [3:0]       a;
   logic [3:0] 	b;
   logic 	c;
   logic [2:0] cin;
   logic [3:0] f;
   logic sum;
   logic        clk;   

RCA dut(a, b, c, cin, sum);
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
			$fdisplay(desc3, "%h %h || %h | %h | %b", A, B, Sum, Sum_correct, (Sum == Sum_corr));
		end
	end // @(negedge clk)
end
    

   
endmodule

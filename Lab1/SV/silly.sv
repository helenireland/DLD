module silly (input  logic a, b, c, output logic cin, sum);
   
  assign sum = a ^ b ^ c;

  assign cin = (a & b) | (a & c) | (b & c);
   
endmodule

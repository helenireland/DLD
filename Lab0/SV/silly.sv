module silly (input  logic a, b, c, output logic y, sum);
   
  assign sum = a ^ b ^ c;

  assign y = (a & b) | (a & c) | (b & c);
   
endmodule

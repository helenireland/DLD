module silly (input  logic a, b, c, output logic y, output logic sum);
   
  assign sum = a ^ b ^ c;

  assign y = (a & b) | (a & c) | (b & c);
   
endmodule

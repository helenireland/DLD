module RCA (input logic [3:0] a, b, input logic c, output logic [3:0] sum, output logic f);
  logic [2:0] cin;
  
  


  silly FA0 (a[0], b[0], c, cin[0], sum[0]); 
  silly FA1 (a[1], b[1], cin[0], cin[1], sum[1]);
  silly FA2 (a[2], b[2], cin[1], cin[2], sum[2]);
  silly FA3 (a[3], b[3], cin[2], f, sum[3]);
endmodule

module labk;

reg [31:0] x;   // a 32-bit register
reg one;
reg [1:0] two;
reg [2:0] three;

initial
begin
   $display("time = %5d, x = %b", $time, x);     // displays value of x using combination of format specifiers and text literals
   x = 32'hffff0000;
   $display("time = %5d, x = %b", $time, x);
   x = x + 2;
   $display("time = %5d, x = %b", $time, x);

   one = &x;                 // and reduction
   two = x[1:0];            // part-select
   three = {one, two};    // concatenate

   $display("time = %5d, one = %b, two = %b, three = %b", $time, one, two, three);
   $finish;
end

endmodule

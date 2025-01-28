module LabL;
reg [1:0] a, b;
reg c;
reg [1:0] ex;
wire [1:0] z;
integer i, j, k;

yMux2 my_yMux2(z, a, b, c);

initial
begin
for (i = 0; i < 4; i = i + 1)           // there are now 4 possible values for a
begin
   for (j = 0; j < 4; j = j + 1)          // there are now 4 possible values for b
   begin
      for (k = 0; k < 2; k = k + 1)          // nested loop for exhaustive testbench
      begin
         a = i; b = j; c = k;
         ex = c ? b : a;                        // non-bitwise oracle
         #1
         if (ex === z)                          // if actual = expected, print 'pass'
            $display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
         else
            $display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
      end
   end
 end
 $finish;
end

endmodule

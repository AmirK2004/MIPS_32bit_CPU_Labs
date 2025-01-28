module LabL;
reg a, b, c;
reg ex;
wire z;
integer i, j, k;

yMux1 my_yMux1(z, a, b, c);

initial
begin
for (i = 0; i < 2; i = i + 1)
begin
   for (j = 0; j < 2; j = j + 1)
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

module labK;
reg a, b, expect;
wire tmp, z;
integer i, j;

not my_not(tmp, b);
and my_and(z, a, tmp);

initial
begin
   for (i = 0; i < 2; i = i + 1)
   begin
      for (j = 0; j < 2; j = j + 1)
      begin
         a = i; b = j;
         expect = i & ~b;             // added bitwise representation of circuit to obtain expected value to compare to
         #1;
         if (expect === z)                  // print 'pass' if actual value (z) = expected
            $display("PASS: a=%b b=%b z=%b", a, b, z);
         else
            $display("FAIL: a=%b b=%b z=%b", a, b, z);
      end
    end
    $finish;
end
endmodule

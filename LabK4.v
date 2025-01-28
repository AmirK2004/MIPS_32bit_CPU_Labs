module labK;
reg a, b;
wire tmp, z;
integer i, j;

not my_not(tmp, b);
and my_and(z, a, tmp);

initial
begin
   for (i = 0; i < 2; i = i + 1)
   begin
      for (j = 0; j < 2; j = j + 1)         // nested loop for all test cases (2^2), exhaustive testing works as our testbench
      begin
         a = i; b = j;
         #1 $display("a=%b b=%b z=%b", a, b, z);
      end
    end
    $finish;
end
endmodule

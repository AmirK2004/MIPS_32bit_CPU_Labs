module labK;

reg a, b, c, expect;
reg flag;
wire notC, top1, top2, bottom1, bottom2, topOut, bottomOut, z;
integer i, j, k;

assign top2 = ~c;
assign top1 = a;

assign topOut = top1 & top2;            // top gate

assign bottom1 = c;
assign bottom2 = b;
assign bottomOut = bottom1 & bottom2;         // bottom gate

assign z = topOut | bottomOut;               // final gate

initial
begin
   for (i = 0; i < 2; i = i + 1)
   begin
      for (j = 0; j < 2; j = j + 1)
      begin
         for (k = 0; k < 2; k = k + 1)          // nested loop for exhaustive testbench
         begin
            a = i; b = j; c = k;
            //expect = (a & ~c) | (b & c);             // commented out bitwise oracle
            expect = c ? b : a;                        // non-bitwise oracle
            #1
            if (expect === z)                          // if actual = expected, print 'pass'
               $display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
            else
               $display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
         end
      end
    end
   $finish;
end
endmodule

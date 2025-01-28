module labK;

reg a, b, c, expect;
reg flag;
wire notC, top1, top2, bottom1, bottom2, topOut, bottomOut, z;
integer i, j, k;

assign top2 = ~c;
assign top1 = a;

assign topOut = top1 & top2;

assign bottom1 = c;
assign bottom2 = b;
assign bottomOut = bottom1 & bottom2;

assign z = topOut | bottomOut;

initial
begin
   for (i = 0; i < 2; i = i + 1)
   begin
      for (j = 0; j < 2; j = j + 1)
      begin
         for (k = 0; k < 2; k = k + 1)
         begin
            a = i; b = j; c = k;
            //expect = (a & ~c) | (b & c);
            expect = c ? b : a;
            #1
            if (expect === z)
               $display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
            else
               $display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
         end
      end
    end
   $finish;
end
endmodule

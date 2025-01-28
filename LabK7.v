module labK;

reg a, b, c;
reg flag;
wire notC, top1, top2, bottom1, bottom2, topOut, bottomOut, z;

assign top2 = ~c;
assign top1 = a;

assign topOut = top1 & top2;

assign bottom1 = c;
assign bottom2 = b;
assign bottomOut = bottom1 & bottom2;

assign z = topOut | bottomOut;

initial
begin
   flag = $value$plusargs("a=%b", a);
   if (flag == 0)
      $display("Warning: Enter a value for 'a'");
   flag = $value$plusargs("b=%b", b);
   if (flag == 0)
      $display("Warning: Enter a value for 'b'");
   flag = $value$plusargs("c=%b", c);
   if (flag == 0)
      $display("Warning: Enter a value for 'c'");
   #1;
   $display("a=%b b=%b c=%b z=%b", a, b, c, z);
   $finish;
end
endmodule

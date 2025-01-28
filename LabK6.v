module labK;

reg a, b, c;
wire notC, top1, top2, bottom1, bottom2, topOut, bottomOut, z;

assign top2 = ~c;
assign top1 = a;

assign topOut = top1 & top2;             // top gate

assign bottom1 = c;
assign bottom2 = b;
assign bottomOut = bottom1 & bottom2;           // bottom gate

assign z = topOut | bottomOut;              // final gate

initial
begin
   a = 0; b = 0; c = 1;                    // test values
   #1;
   $display("a=%b b=%b c=%b z=%b", a, b, c, z);
   $finish;
end

endmodule

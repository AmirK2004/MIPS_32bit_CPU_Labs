module LabL;
reg [31:0] a0, a1, a2, a3;
reg [1:0] c;
reg [31:0] ex;
wire [31:0] z;
integer i;

yMux4to1 #(32) my_yMux4to1(z, a0, a1, a2, a3, c);

initial
begin
   repeat(10)
   begin

   a0 = $random;
   a1 = $random;
   a2 = $random;
   a3 = $random;
   c = $random % 4;

   ex = (c == 2'b00) ? a0 :
        (c == 2'b01) ? a1 :
        (c == 2'b10) ? a2 : a3;

   #1;

   $display("a0=%d a1=%d a2=%d a3=%d c=%d", a0, a1, a2, a3, c);
   $display("z=%d", z);

   if (z === ex)
     $display("PASS");
   else
     $display("FAIL");

   end
 $finish;
end

endmodule

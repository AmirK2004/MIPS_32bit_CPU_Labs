module LabL;
reg [31:0] a, b;
reg c;
reg [31:0] ex;
wire [31:0] z;

yMux #(32) my_yMux(z, a, b, c);

initial
begin
   repeat(500)
   begin

   a = $random;
   b = $random;
   c = $random % 2;

   ex = (c === 0) ? a : b;

   #1;

   if (z !== ex)
     $display("FAIL");

   end
 $finish;
end

endmodule

module LabM;
reg [31:0] memIn;
reg [31:0] address;
reg clk, read, write;
wire [31:0] memOut;

mem data(memOut, address, memIn, clk, read, write);

initial
begin
   clk = 0;

   address = 16;
   write = 1;
   read = 0;
   memIn = 32'h12345678;
   clk = 1;
   #1;

   #1;
   address = 24;
   memIn = 32'h89abcdef;
   #1;

   write = 0; address = 16; read = 1;

   repeat(3) begin
     #1 $display("Address %d contains %h", address, memOut);
     address = address + 4;
   end
   $finish;
end

always begin
  #1 clk = ~clk;
end
endmodule

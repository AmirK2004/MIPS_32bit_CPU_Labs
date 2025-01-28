module LabL;
reg [31:0] a, b;
reg ctrl;
wire [31:0] z;
wire cout;
reg [31:0] expect;
reg ok;

yArith m_yArith(z, cout, a, b, ctrl);

initial
begin

  repeat(10)
  begin

  a = $random;
  b = $random;
  ctrl = $random % 2;

  if (ctrl == 0)
    expect = a + b;
  else
    expect = a - b;

  #1;

  ok = (z == expect);
  $display("a=%d, b=%d, ctrl=%d, z=%d, expect=%d, ok=%b", a, b, ctrl, z, expect, ok);
end
$finish;
end
endmodule

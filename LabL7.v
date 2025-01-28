module LabL;
reg signed [31:0] a, b;
reg signed [31:0] expect;
reg ok;
reg cin;
wire signed [31:0] z;
wire cout;

yAdder my_yAdder(z, cout, a, b, cin);

initial
begin
  cin = 0;

  repeat(10) begin

    a = $random;
    b = $random;
    expect = a + b + cin;

    ok = 0;
    #1;
    if (expect === z)
      ok = 1;

    $display("a=%d b=%d cin=%d expected=%d z=%d", a, b, cin, expect, z);

    if (ok)
      $display("PASS");
    else
      $display("FAIL");
  end
  $finish;
end
endmodule

module LabL;
reg a, b, cin;
wire z, cout;
reg ex_z, ex_cout;

yAdder1 my_adder(z, cout, a, b, cin);

initial
begin
  for(a = 0; a < 2; a = a + 1) begin
    for (b = 0; b < 2; b = b + 1) begin
      for (cin = 0; cin < 2; cin = cin + 1) begin
        {ex_cout, ex_z} = a + b + cin;

        #1;
        if (z !== ex_z || cout !== ex_cout)
          $display("FAIL: a=%b b=%b cin=%b, Expected: z=%b cout=%b, Actual: z=%b cout = %b", a, b, cin, ex_z, ex_cout, z, cout);
      end
    end
  end
  $finish;
  end
endmodule

module LabL;
reg [31:0] a, b;
reg [31:0] expect;
reg [2:0] op;
wire ex;
wire [31:0] z;
reg ok, flag;

yAlu mine(z, ex, a, b, op);

initial
begin
  repeat(10) begin
    a = $random;
    b = $random;
    flag = $value$plusargs("op=%d", op);

    if (op == 3'b000) begin
      expect = a & b;
    end else if (op == 3'b001) begin
      expect = a | b;
    end else if (op == 3'b010) begin
      expect = a + b;
    end else if (op == 3'b110) begin
      expect = a - b;
    end else if (op == 3'b111) begin
      expect = 32'b0;
    end else begin
      expect = 32'bx;
    end

    #1;

    ok = (z === expect);

    $display("a=%d b=%d op=%b expect=%d z=%d ok=%b", a, b, op, expect, z, ok);

    if (!ok)
      $display("Test failed!");
      $finish;

    end
end
endmodule

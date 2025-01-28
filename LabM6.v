module labM;
reg clk, read, write;
reg [31:0] address, memIn;
wire [31:0] memOut;

mem data(memOut, address, memIn, clk, read, write);

initial begin
  address = 128; write = 0; read = 1;
  repeat(11) begin
    #10;
    $display("Instruction: %h", memOut);

    if (memOut[31:26] == 0) begin
      $display("R-type: rs=%d, rt=%d, rd=%d, funct=%d", memOut[25:21], memOut[20:16], memOut[15:11], memOut[5:0]);
    end
    else if (memOut[31:26] == 2) begin
      $display("J-type: opcode=%d, address=%d", memOut[31:26], memOut[25:0]);
    end else begin
      $display("I-type: opcode=%d, rs=%d, rt=%d, immediate=%d", memOut[31:26], memOut[25:21], memOut[20:16], memOut[15:0]);
    end
    address = address + 4;
  end
end
endmodule

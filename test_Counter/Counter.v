// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : Counter
// Git hash  : 95d6bcd599277f65c1cb6acfe7a971d8d9b90c2f



module Counter (
  input               io_clear,
  output     [5:0]    io_value,
  input               clk,
  input               reset
);
  reg        [5:0]    register_1;

  assign io_value = register_1;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      register_1 <= 6'h0;
    end else begin
      register_1 <= (register_1 + 6'h01);
      if(io_clear)begin
        register_1 <= 6'h0;
      end
    end
  end


endmodule

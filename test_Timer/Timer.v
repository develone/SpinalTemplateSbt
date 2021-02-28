// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : Timer
// Git hash  : 9c13f210b31389c81a44fbd0081a6b175ec3617b



module Timer (
  input               io_tick,
  input               io_clear,
  input      [9:0]    io_limit,
  output              io_full,
  output     [9:0]    io_value,
  input               clk,
  /* verilator lint_off UNUSED */
  input               reset
  /* verilator lint_off UNUSED */
);
  reg        [9:0]    counter;

  assign io_full = ((counter == io_limit) && io_tick);
  assign io_value = counter;
  always @ (posedge clk) begin
    if((io_tick && (! io_full)))begin
      counter <= (counter + 10'h001);
    end
    if(io_clear)begin
      counter <= 10'h0;
    end
  end


endmodule

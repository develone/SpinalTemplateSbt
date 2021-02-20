// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : Timer
// Git hash  : bc7d809004d6a0595f5f1e457cb39c0bae8ac288



module Timer (
  input               io_tick,
  input               io_clear,
  input      [7:0]    io_limit,
  output              io_full,
  input               clk
  //input               reset
);
  reg        [7:0]    counter;

  assign io_full = (counter == io_limit);
  always @ (posedge clk) begin
    if((io_tick && (! io_full)))begin
      counter <= (counter + 8'h01);
    end
    if(io_clear)begin
      counter <= 8'h0;
    end
  end


endmodule

// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : CatTopLevel
// Git hash  : 5525bfb9f550b9a618a4a34b562424bf968abd4c



module CatTopLevel (
  input               io_clk100Mhz,
  output     [3:0]    io_result
);
  wire                _zz_2;
  wire                clkCtrl_pll_clkOut;
  wire                clkCtrl_pll_isLocked;
  wire                bufferCC_1_io_dataOut;
  wire                core_clk;
  wire                core_reset;
  wire                _zz_1;
  reg        [3:0]    core_counter;

  PLL clkCtrl_pll (
    .clkIn       (io_clk100Mhz          ), //i
    .clkOut      (clkCtrl_pll_clkOut    ), //o
    .isLocked    (clkCtrl_pll_isLocked  )  //o
  );
  BufferCC bufferCC_1 (
    .io_dataIn     (_zz_2                  ), //i
    .io_dataOut    (bufferCC_1_io_dataOut  ), //o
    .core_clk      (core_clk               ), //i
    ._zz_1         (_zz_1                  )  //i
  );
  assign core_clk = clkCtrl_pll_clkOut;
  assign _zz_1 = (! clkCtrl_pll_isLocked);
  assign _zz_2 = 1'b0;
  assign core_reset = bufferCC_1_io_dataOut;
  assign io_result = core_counter;
  always @ (posedge core_clk or posedge core_reset) begin
    if (core_reset) begin
      core_counter <= 4'b0000;
    end else begin
      core_counter <= (core_counter + 4'b0001);
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               core_clk,
  input               _zz_1
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge core_clk or posedge _zz_1) begin
    if (_zz_1) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

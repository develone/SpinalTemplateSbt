// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : BootResetTop
// Git hash  : d30a2e7e90f86f9b199572306a07cec8932bbbfd



module BootResetTop (
  input               clk
);
  wire       [0:0]    _zz_1;
  wire       [9:0]    _zz_2;
  /* verilator lint_off UNUSED */
  wire                reset;
  /* verilator lint_off UNUSED */
  wire                ca_cnt_willIncrement;
  wire                ca_cnt_willClear;
  reg        [9:0]    ca_cnt_valueNext;
  reg        [9:0]    ca_cnt_value = 10'h0;
  wire                ca_cnt_willOverflowIfInc;
  wire                ca_cnt_willOverflow;

  assign _zz_1 = ca_cnt_willIncrement;
  assign _zz_2 = {9'd0, _zz_1};
  assign ca_cnt_willClear = 1'b0;
  assign ca_cnt_willOverflowIfInc = (ca_cnt_value == 10'h299);
  assign ca_cnt_willOverflow = (ca_cnt_willOverflowIfInc && ca_cnt_willIncrement);
  always @ (*) begin
    if(ca_cnt_willOverflow)begin
      ca_cnt_valueNext = 10'h0;
    end else begin
      ca_cnt_valueNext = (ca_cnt_value + _zz_2);
    end
    if(ca_cnt_willClear)begin
      ca_cnt_valueNext = 10'h0;
    end
  end

  assign ca_cnt_willIncrement = 1'b1;
  always @ (posedge clk) begin
    ca_cnt_value <= ca_cnt_valueNext;
  end


endmodule

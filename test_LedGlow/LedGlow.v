// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : LedGlow
// Git hash  : 4f8a72604d6ca7ca88278658f557b33b1715d1b6



module LedGlow (
  output              io_led,
  input               clk
);
  wire       [3:0]    _zz_1;
  wire       [4:0]    _zz_2;
  wire       [4:0]    _zz_3;
  reg        [23:0]   cnt;
  reg        [4:0]    pwm;
  reg        [3:0]    pwmInput;

  assign _zz_1 = pwm[3 : 0];
  assign _zz_2 = {1'd0, _zz_1};
  assign _zz_3 = {1'd0, pwmInput};
  always @ (*) begin
    if(cnt[23])begin
      pwmInput = cnt[22 : 19];
    end else begin
      pwmInput = (~ cnt[22 : 19]);
    end
  end

  assign io_led = pwm[4];
  always @ (posedge clk) begin
    cnt <= (cnt + 24'h000001);
    pwm <= (_zz_2 + _zz_3);
  end


endmodule

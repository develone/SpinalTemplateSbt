`default_nettype	none
// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : UartCtrlUsageExample
// Git hash  : 01d6917a96b2aa7832ec37be76816aafc9a2240e


`define UartParityType_defaultEncoding_type [1:0]
`define UartParityType_defaultEncoding_NONE 2'b00
`define UartParityType_defaultEncoding_EVEN 2'b01
`define UartParityType_defaultEncoding_ODD 2'b10

`define UartStopType_defaultEncoding_type [0:0]
`define UartStopType_defaultEncoding_ONE 1'b0
`define UartStopType_defaultEncoding_TWO 1'b1

`define UartCtrlTxState_defaultEncoding_type [2:0]
`define UartCtrlTxState_defaultEncoding_IDLE 3'b000
`define UartCtrlTxState_defaultEncoding_START 3'b001
`define UartCtrlTxState_defaultEncoding_DATA 3'b010
`define UartCtrlTxState_defaultEncoding_PARITY 3'b011
`define UartCtrlTxState_defaultEncoding_STOP 3'b100

`define UartCtrlRxState_defaultEncoding_type [2:0]
`define UartCtrlRxState_defaultEncoding_IDLE 3'b000
`define UartCtrlRxState_defaultEncoding_START 3'b001
`define UartCtrlRxState_defaultEncoding_DATA 3'b010
`define UartCtrlRxState_defaultEncoding_PARITY 3'b011
`define UartCtrlRxState_defaultEncoding_STOP 3'b100


module rxuart (
  output              io_uart_txd,
  input               io_uart_rxd,
  input      [7:0]    io_switchs,
  output     [7:0]    io_leds,
  input               clk
  //input               reset
);
  wire       [2:0]    _zz_7;
  wire       `UartStopType_defaultEncoding_type _zz_8;
  wire       `UartParityType_defaultEncoding_type _zz_9;
  wire       [19:0]   _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  /* verilator lint_off UNUSED */
  wire                uartCtrl_1_io_readError;
  /* verilator lint_off UNUSED */
  wire                uartCtrl_1_io_readBreak;
  wire       [0:0]    _zz_13;
  wire       [10:0]   _zz_14;
  reg        [7:0]    _zz_1;
  wire                write_valid;
  wire                write_ready;
  wire       [7:0]    write_payload;
  wire                _zz_2;
  reg        [10:0]   _zz_3;
  reg        [10:0]   _zz_4;
  wire                _zz_5;
  wire                _zz_6;
  wire                write_m2sPipe_valid;
  wire                write_m2sPipe_ready;
  wire       [7:0]    write_m2sPipe_payload;
  reg                 write_m2sPipe_rValid;
  reg        [7:0]    write_m2sPipe_rData;

  assign _zz_13 = _zz_2;
  assign _zz_14 = {10'd0, _zz_13};
  /* verilator lint_off UNUSED */
  wire reset;
  /* verilator lint_off UNUSED */
  /* verilator lint_off UNUSED */
  wire [5:0] pwrup;
  /* verilator lint_off UNUSED */
  pwruprst puprst (
    clk,
    reset,
    pwrup
  );
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength    (_zz_7[2:0]                       ), //i
    .io_config_frame_stop          (_zz_8                            ), //i
    .io_config_frame_parity        (_zz_9[1:0]                       ), //i
    .io_config_clockDivider        (_zz_10[19:0]                     ), //i
    .io_write_valid                (write_m2sPipe_valid              ), //i
    .io_write_ready                (uartCtrl_1_io_write_ready        ), //o
    .io_write_payload              (write_m2sPipe_payload[7:0]       ), //i
    .io_read_valid                 (uartCtrl_1_io_read_valid         ), //o
    .io_read_ready                 (_zz_11                           ), //i
    .io_read_payload               (uartCtrl_1_io_read_payload[7:0]  ), //o
    .io_uart_txd                   (uartCtrl_1_io_uart_txd           ), //o
    .io_uart_rxd                   (io_uart_rxd                      ), //i
    .io_readError                  (uartCtrl_1_io_readError          ), //o
    .io_writeBreak                 (_zz_12                           ), //i
    .io_readBreak                  (uartCtrl_1_io_readBreak          ), //o
    .clk                           (clk                              ), //i
    .reset                         (reset                            )  //i
  );
  assign _zz_10 = 20'h0006c;
  assign _zz_7 = 3'b111;
  assign _zz_9 = `UartParityType_defaultEncoding_NONE;
  assign _zz_8 = `UartStopType_defaultEncoding_ONE;
  assign _zz_12 = 1'b0;
  assign io_uart_txd = uartCtrl_1_io_uart_txd;
  assign _zz_11 = 1'b1;
  assign io_leds = _zz_1;
  assign _zz_5 = (_zz_4 == 11'h7cf);
  assign _zz_6 = (_zz_5 && _zz_2);
  always @ (*) begin
    if(_zz_6)begin
      _zz_3 = 11'h0;
    end else begin
      _zz_3 = (_zz_4 + _zz_14);
    end
    if(1'b0)begin
      _zz_3 = 11'h0;
    end
  end

  assign _zz_2 = 1'b1;
  assign write_valid = _zz_6;
  assign write_payload = io_switchs;
  assign write_ready = ((1'b1 && (! write_m2sPipe_valid)) || write_m2sPipe_ready);
  assign write_m2sPipe_valid = write_m2sPipe_rValid;
  assign write_m2sPipe_payload = write_m2sPipe_rData;
  assign write_m2sPipe_ready = uartCtrl_1_io_write_ready;
  always @ (posedge clk) begin
    if(uartCtrl_1_io_read_valid)begin
      _zz_1 <= uartCtrl_1_io_read_payload;
    end
    if(write_ready)begin
      write_m2sPipe_rData <= write_payload;
    end
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      _zz_4 <= 11'h0;
      write_m2sPipe_rValid <= 1'b0;
    end else begin
      _zz_4 <= _zz_3;
      if(write_ready)begin
        write_m2sPipe_rValid <= write_valid;
      end
    end
  end


endmodule
/* verilator lint_off DECLFILENAME */
module UartCtrl (
/* verilator lint_off DECLFILENAME */
  input      [2:0]    io_config_frame_dataLength,
  input      `UartStopType_defaultEncoding_type io_config_frame_stop,
  input      `UartParityType_defaultEncoding_type io_config_frame_parity,
  input      [19:0]   io_config_clockDivider,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_readError,
  input               io_writeBreak,
  output              io_readBreak,
  input               clk,
  input               reset
);
  wire                _zz_1;
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tick                ), //i
    .io_write_valid               (io_write_thrown_valid            ), //i
    .io_write_ready               (tx_io_write_ready                ), //o
    .io_write_payload             (io_write_thrown_payload[7:0]     ), //i
    .io_cts                       (_zz_1                            ), //i
    .io_txd                       (tx_io_txd                        ), //o
    .io_break                     (io_writeBreak                    ), //i
    .clk                          (clk                              ), //i
    .reset                        (reset                            )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tick                ), //i
    .io_read_valid                (rx_io_read_valid                 ), //o
    .io_read_ready                (io_read_ready                    ), //i
    .io_read_payload              (rx_io_read_payload[7:0]          ), //o
    .io_rxd                       (io_uart_rxd                      ), //i
    .io_rts                       (rx_io_rts                        ), //o
    .io_error                     (rx_io_error                      ), //o
    .io_break                     (rx_io_break                      ), //o
    .clk                          (clk                              ), //i
    .reset                        (reset                            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_defaultEncoding_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_defaultEncoding_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @ (*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break)begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break)begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign _zz_1 = 1'b0;
  assign io_readBreak = rx_io_break;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      clockDivider_counter <= 20'h0;
    end else begin
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick)begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               clk,
  input               reset
);
  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire       [0:0]    _zz_6;
  wire       [2:0]    _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  reg                 _zz_1;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  reg        `UartCtrlRxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_2 = (stateMachine_parity == sampler_value);
  assign _zz_3 = (! sampler_value);
  assign _zz_4 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign _zz_5 = (bitCounter_value == io_configFrame_dataLength);
  assign _zz_6 = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? 1'b0 : 1'b1);
  assign _zz_7 = {2'd0, _zz_6};
  assign _zz_8 = ((((1'b0 || ((_zz_13 && sampler_samples_1) && sampler_samples_2)) || (((_zz_14 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_9 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_10 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_11 = (1'b1 && sampler_samples_1);
  assign _zz_12 = 1'b1;
  assign _zz_13 = (1'b1 && sampler_samples_0);
  assign _zz_14 = 1'b1;
  BufferCC io_rxd_buffercc (
    .io_dataIn     (io_rxd                      ), //i
    .io_dataOut    (io_rxd_buffercc_io_dataOut  ), //o
    .clk           (clk                         ), //i
    .reset         (reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlRxState_defaultEncoding_START : begin
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          if(! _zz_2) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick)begin
          if(_zz_3)begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_1;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @ (*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick)begin
      if((bitTimer_counter == 3'b000))begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign break_valid = (break_counter == 7'h68);
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign io_read_payload = stateMachine_shifter;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      _zz_1 <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_1 <= (! io_read_ready);
      if(io_samplingTick)begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick)begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick)begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick)begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_8 || _zz_9) || (_zz_10 && sampler_samples_4)) || ((_zz_11 && sampler_samples_2) && sampler_samples_4)) || (((_zz_12 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value)begin
        break_counter <= 7'h0;
      end else begin
        if((io_samplingTick && (! break_valid)))begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_defaultEncoding_IDLE : begin
          if(_zz_4)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_START;
          end
        end
        `UartCtrlRxState_defaultEncoding_START : begin
          if(bitTimer_tick)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_DATA;
            if((sampler_value == 1'b1))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_DATA : begin
          if(bitTimer_tick)begin
            if(_zz_5)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_PARITY : begin
          if(bitTimer_tick)begin
            if(_zz_2)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick)begin
            if(_zz_3)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end else begin
              if((bitCounter_value == _zz_7))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @ (posedge clk) begin
    if(sampler_tick)begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick)begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick)begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
        if(_zz_4)begin
          bitTimer_counter <= 3'b010;
        end
      end
      `UartCtrlRxState_defaultEncoding_START : begin
        if(bitTimer_tick)begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
        end
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
        if(bitTimer_tick)begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(_zz_5)begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               clk,
  input               reset
);
  wire                _zz_2;
  wire       [0:0]    _zz_3;
  wire       [2:0]    _zz_4;
  wire       [0:0]    _zz_5;
  wire       [2:0]    _zz_6;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        `UartCtrlTxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  reg                 _zz_1;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_2 = (tickCounter_value == io_configFrame_dataLength);
  assign _zz_3 = clockDivider_counter_willIncrement;
  assign _zz_4 = {2'd0, _zz_3};
  assign _zz_5 = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? 1'b0 : 1'b1);
  assign _zz_6 = {2'd0, _zz_5};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick)begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b111);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @ (*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_4);
    if(clockDivider_counter_willClear)begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @ (*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_2)begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign io_txd = _zz_1;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= `UartCtrlTxState_defaultEncoding_IDLE;
      _zz_1 <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_defaultEncoding_IDLE : begin
          if(((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow))begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_START;
          end
        end
        `UartCtrlTxState_defaultEncoding_START : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_DATA;
          end
        end
        `UartCtrlTxState_defaultEncoding_DATA : begin
          if(clockDivider_counter_willOverflow)begin
            if(_zz_2)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_defaultEncoding_PARITY : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow)begin
            if((tickCounter_value == _zz_6))begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_defaultEncoding_START : `UartCtrlTxState_defaultEncoding_IDLE);
            end
          end
        end
      endcase
      _zz_1 <= (stateMachine_txd && (! io_break));
    end
  end

  always @ (posedge clk) begin
    if(clockDivider_counter_willOverflow)begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow)begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        if(clockDivider_counter_willOverflow)begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_2)begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        if(clockDivider_counter_willOverflow)begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
module pwruprst (
    clk,
    reset,
    pwrup
);


input clk;
output reset;
reg reset;
output [5:0] pwrup;
reg [5:0] pwrup;




always @(posedge clk) begin: PWRUPRST_LOGIC2
    /* verilator lint_off SYNCASYNCNET */
    if (((reset == 0) && (pwrup == 40))) begin
    /* verilator lint_off SYNCASYNCNET */
        reset <= 1;
    end
    else begin
        if ((pwrup <= 60)) begin
            pwrup <= (pwrup + 1);
        end
    end
    if ((pwrup == 60)) begin
        reset <= 0;
    end
end

endmodule

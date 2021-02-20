package mylib

import spinal.core._

class Timer(width:Int) extends Component {

  /**
    * This is the component definition that corresponds to
    * the VHDL entity of the component
    */
  val io = new Bundle {
    val tick = in Bool
    val clear = in Bool
    val limit = in UInt(width bits)
    val full = out Bool
  }

  val counter = Reg(UInt(width bits))
    when(io.tick && !io.full) {
      counter:= counter + 1
  }

  when (io.clear) {
    counter := 0
  }

  io.full := counter === io.limit
}

object TimerVhdl {
  // Let's go
  def main(args: Array[String]) {
    SpinalVhdl(new Timer(8))
  }
}

object TimerVerilog {
  // Let's go
  def main(args: Array[String]) {
    SpinalVerilog(new Timer(8))
  }
}

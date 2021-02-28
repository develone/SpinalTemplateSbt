package mylib

import spinal.core._

class Counter(width : Int) extends Component{
  val io = new Bundle{
    val clear = in Bool
    val value = out UInt(width bits)
  }
  val register = Reg(UInt(width bits)) init(0)
  register := register + 1
  when(io.clear){
    register := 0
  }
  io.value := register
}

object CounterVerilog {
  // Let's go
  def main(args: Array[String]) {
    SpinalVerilog(new Counter(6))
  }
}

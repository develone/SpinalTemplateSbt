package mylib

import spinal.core._
import spinal.lib._

class pwruprst extends Component {

  /**
    * This is the component definition that corresponds to
    * the VHDL entity of the component
    */
  val io = new Bundle {
    val clk = in Bool
    val reset = out Bool
    val inc, clear, needsreset,clrreset = Bool
    val pwrup = Reg(UInt(6 bits))
  }
  // Here we define some asynchronous logic
  //when((io.reset==0) && (io.pwrup==40)) {
    
      //io.reset := True
  //}
      //
    //if(io.pwrup==60)
      //io.reset := False
  //}
  when(io.inc) {
    io.pwrup := io.pwrup + 1
  }
  when(io.clear) {
    io.reset := False
  }
} 
 

object pwruprstVerilog {
  // Let's go
  def main(args: Array[String]) {
    SpinalVerilog(new pwruprst)
  }
}

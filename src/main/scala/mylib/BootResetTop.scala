package mylib

import spinal.core._
import spinal.lib._
class BootResetTop() extends Component {
    val clk: Bool = in Bool
    val ca: ClockingArea = new ClockingArea(new ClockDomain(
      clock = clk,
      config = ClockDomainConfig(
        resetKind = BOOT
      ),
      frequency = FixedFrequency(100 MHz)
    )) {
      val cnt: Counter = CounterFreeRun(666)
    }
  }
 
object BootResetTopVerilog {
  // Let's go
  def main(args: Array[String]) {
    SpinalVerilog(new BootResetTop)
  }
}

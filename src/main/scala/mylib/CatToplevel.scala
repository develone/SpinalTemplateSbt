package mylib

import spinal.core._
import spinal.lib._

class SB_PLL40_CORE extends BlackBox{
  val io = new Bundle{
    val REFERENCECLK    = in Bool
    val PLLOUTCORE   = out Bool
    val LOCK = out Bool
  }

  noIoPrefix()
}


class CatTopLevel extends Component{
  val io = new Bundle {
    //val aReset    = in Bool
    val clk100Mhz = in Bool
    val result    = out UInt(4 bits)
  }

  // Create an Area to manage all clocks and reset things
  val clkCtrl = new Area {
    //Instanciate and drive the SB_PLL40_CORE
    val pll = new SB_PLL40_CORE
    pll.io.REFERENCECLK := io.clk100Mhz

    //Create a new clock domain named 'core'
    val coreClockDomain = ClockDomain.internal(
      name = "core",
      frequency = FixedFrequency(100 MHz)  // This frequency specification can be used
    )                                      // by coreClockDomain users to do some calculations

    //Drive clock and reset signals of the coreClockDomain previously created
    coreClockDomain.clock := pll.io.PLLOUTCORE
    coreClockDomain.reset := ResetCtrl.asyncAssertSyncDeassert(
      input =  ! pll.io.LOCK,
      clockDomain = coreClockDomain
    )
  }
//Create a ClockingArea which will be under the effect of the clkCtrl.coreClockDomain
  val core = new ClockingArea(clkCtrl.coreClockDomain){
    //Do your stuff which use coreClockDomain here
    val counter = Reg(UInt(4 bits)) init(0)
    counter := counter + 1
    io.result := counter
  }
}
 
object CatTopLevelVerilog {
  // Let's go
  def main(args: Array[String]) {
    SpinalVerilog(new CatTopLevel)
  }
}

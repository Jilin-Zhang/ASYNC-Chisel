package examples

import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import firrtl.options.TargetDirAnnotation
import tool._

// ***************************************
// Simple FIFO: Out = In
// ***************************************
class FIFO extends Module{
  val io = IO(new Bundle{
    val In = new HS_Data(8)
    val Out: HS_Data = Flipped(new HS_Data(8))
  })

  private val ACG = Module(new ACG(Map(
    "InNum" -> 1,
    "OutNum" -> 1
  )))

  ACG.In(0) <> io.In.HS
  ACG.Out(0) <> io.Out.HS

  AsyncClock(ACG.fire_o, reset){
    io.Out.Data := RegNext(io.In.Data)
  }
}

object elaborate_FIFO extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new FIFO()),
      TargetDirAnnotation("Outputs/FIFO"))
  )
}
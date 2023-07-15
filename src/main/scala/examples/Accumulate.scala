package examples

import chisel3._
import chisel3.util._
import chisel3.stage.ChiselGeneratorAnnotation
import firrtl.options.TargetDirAnnotation
import tool._

// ***************************************
// Simple Accumulator: Out = Out + In
// ***************************************
class Accumulator extends Module{
  val io = IO(new Bundle{
    val In = new HS_Data(8)
    val Out = Flipped(new HS_Data(16))
  })

  private val ACG_main = Module(new ACG(Map(
    "InNum" -> 1,
    "OutNum" -> 1
  )))

  ACG_main.In(0) <> io.In.HS
  io.Out.HS <> ACG_main.Out(0)

  withClockAndReset(ACG_main.fire_o, reset){
    val ff_Data = RegInit(0.U(16.W))
    ff_Data := Cat(Fill(8, io.In.Data(7)),io.In.Data) + ff_Data
    io.Out.Data := ff_Data
  }
}


object elaborate_Accu extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new Accumulator()),
      TargetDirAnnotation("Verilog"))
  )
}

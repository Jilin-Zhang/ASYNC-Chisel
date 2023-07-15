package examples

import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import firrtl.options.TargetDirAnnotation
import tool._

// ***************************************
// Simple Fork: Out0 = In; Out1 = In
// ***************************************
class Fork extends Module{
  val io = IO(new Bundle{
    val In = new HS_Data(8)
    val Out0 = Flipped(new HS_Data(8))
    val Out1 = Flipped(new HS_Data(8))
  })

  private val ACG = Module(new ACG(Map(
    "InNum" -> 1,
    "OutNum" -> 2,
    "OutEnFF" -> 1,
    "OutPLB" -> Seq(1),
  )))
  private val sel = Wire(Bool())

  ACG.In(0) <> io.In.HS
  ACG.Out(0) <> io.Out0.HS
  ACG.Out(1) <> io.Out1.HS
  ACG.OutEn(0) := !sel
  ACG.OutEn(1) := sel

  AsyncClock(ACG.fire_o, reset){
    val ff_Data0, ff_Data1 = Reg(UInt(io.In.Data.getWidth.W))
    val ff_sel = RegInit(false.B)
    when(sel) {
      ff_Data1 := io.In.Data
    }.otherwise {
      ff_Data0 := io.In.Data
    }
    ff_sel := !ff_sel
    io.Out0.Data := ff_Data0
    io.Out1.Data := ff_Data1
    sel := ff_sel
  }
}

// ***************************************
// Simple Join: Out = In0 or In1
// ***************************************
class Join extends Module{
  val io = IO(new Bundle{
    val In0 = new HS_Data(8)
    val In1 = new HS_Data(8)
    val Out = Flipped(new HS_Data(8))
  })

  private val ACG_Join = Module(new ACG(Map(
    "InNum" -> 2,
    "OutNum" -> 1,
    "InPLB" -> Seq(1)
  )))

  ACG_Join.In(0) <> io.In0.HS
  ACG_Join.In(1) <> io.In1.HS
  ACG_Join.Out(0) <> io.Out.HS

  AsyncClock(ACG_Join.fire_o, reset){
    val SelData = Mux(io.In0.HS.Req ^ io.In0.HS.Ack, io.In0.Data, io.In1.Data)
    io.Out.Data := RegNext(SelData)
  }
}

// ***************************************
// Simple Fork Join: Out = In
// ***************************************
class Fork_Join extends Module{
  val io = IO(new Bundle{
    val In = new HS_Data(8)
    val Out = Flipped(new HS_Data(8))
  })

  val Fork = Module(new Fork()).io
  val Join = Module(new Join()).io

  Fork.In <> io.In
  Join.In0 <> Fork.Out0
  Join.In1 <> Fork.Out1
  io.Out <> Join.Out
}

object elaborate_FJ extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new Fork_Join()),
      TargetDirAnnotation("Outputs/Fork_Join"))
  )
}
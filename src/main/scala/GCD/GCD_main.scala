package examples

import tool._
import chisel3._
import chisel3.experimental.{ChiselAnnotation, RunFirrtlTransform, annotate}
import chisel3.internal.InstanceId
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.{Cat, HasBlackBoxResource, MixedVec, is, isPow2, log2Down, log2Up, switch}
import firrtl._
import firrtl.annotations.{Annotation, SingleTargetAnnotation}
import firrtl.annotations.{CircuitTarget, InstanceTarget, ModuleTarget, ReferenceTarget, Target}
import firrtl.options.{CustomFileEmission, TargetDirAnnotation}

trait GCD_Param{
  def DATAWIDTH = 8
}

class GCD_main extends Module with GCD_Param {
  val io = IO(new GCD_IO(DATAWIDTH))

  val CL = Module(new CL_GCD()).io
  val MUX = Module(new MUX_GCD()).io

  MUX.In <> io.In
  MUX.In_CL <> CL.Out_Mux
  MUX.AB_Neq := CL.AB_Neq

  CL.In <> MUX.Out

  io.Out <> CL.Out
}

class CL_GCD extends Module with GCD_Param {
  val io = IO(new CL_IO(DATAWIDTH))

  private val UAC_CL = Module(new ACG(Map(
    "InNum" -> 1,
    "OutNum" -> 2,
    "OutEnFF" -> 1,
  )))
  private val wire_RF1_A, wire_RF1_B = Wire(UInt(DATAWIDTH.W))

  UAC_CL.In(0) <> io.In.HS
  UAC_CL.Out(0) <> io.Out.HS
  UAC_CL.Out(1) <> io.Out_Mux.HS
  UAC_CL.OutEn(0) := wire_RF1_A === wire_RF1_B
  UAC_CL.OutEn(1) := !UAC_CL.OutEn(0)

  AsyncClock(UAC_CL.fire_o, reset){
    when(io.In.Data.A > io.In.Data.B){
      wire_RF1_A := io.In.Data.A - io.In.Data.B
      wire_RF1_B := io.In.Data.B
    }.otherwise{
      wire_RF1_A := io.In.Data.A
      wire_RF1_B := io.In.Data.B - io.In.Data.A
    }
    io.Out.Data.A := RegNext(wire_RF1_A)
    io.Out.Data.B := RegNext(wire_RF1_B)
    io.Out_Mux.Data.A := io.Out.Data.A
    io.Out_Mux.Data.B := io.Out.Data.B
    io.AB_Neq := RegNext(!UAC_CL.OutEn(0), init=false.B)
  }
}

class MUX_GCD extends Module with GCD_Param {
  val io = IO(new MUX_IO(DATAWIDTH))

  val UAC_MUX = Module(new ACG(Map(
    "InNum" -> 2,
    "OutNum" -> 1,
    "InPLB" -> Seq(1),
  )))

  UAC_MUX.In(0) <> io.In.HS
  UAC_MUX.In(1) <> io.In_CL.HS
  UAC_MUX.Out(0) <> io.Out.HS

  AsyncClock(UAC_MUX.fire_o, reset){
    io.Out.Data.A := RegNext(Mux(io.AB_Neq, io.In_CL.Data.A, io.In.Data.A))
    io.Out.Data.B := RegNext(Mux(io.AB_Neq, io.In_CL.Data.B, io.In.Data.B))
  }
}


object elaborate_GCD extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new GCD_main()),
      TargetDirAnnotation("Outputs/GCD_main"))
  )
}

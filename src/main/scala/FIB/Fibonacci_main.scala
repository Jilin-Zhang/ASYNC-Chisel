package examples

import tool._
import chisel3._
import chisel3.experimental.{ChiselAnnotation, RunFirrtlTransform, annotate}
import chisel3.internal.InstanceId
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.{HasBlackBoxResource, MixedVec, is, isPow2, log2Down, log2Up, switch}
import firrtl._
import firrtl.annotations.{Annotation, SingleTargetAnnotation}
import firrtl.annotations.{CircuitTarget, InstanceTarget, ModuleTarget, ReferenceTarget, Target}
import firrtl.options.{CustomFileEmission, TargetDirAnnotation}

trait FIB_Param{
  def DATAWIDTH = 8
}

class Fibonacci_main extends Module with FIB_Param {
  val io = IO(new Fibonacci_main_IO())

  val RF0 = Module(new F_Fork(InitValue=1, InitCh=Seq(1,1))).io
  val RF1 = Module(new F_Fork(InitValue=0, InitCh=Seq(0,1))).io
  val CL = Module(new CL()).io

  RF0.Go <> io.Go
  RF0.In <> CL.Out

  RF1.Go <> io.Go
  RF1.In <> RF0.Out0

  CL.Go <> io.Go
  CL.In0 <> RF0.Out1
  CL.In1 <> RF1.Out1

  io.Out <> RF1.Out0
}

class F_Fork(val InitValue: Int, val InitCh: Seq[Int]) extends Module with FIB_Param {
  val io = IO(new FORK_IO())

  val Click_Fork = Module(new ACG(Map(
    "InNum" -> 1,
    "OutNum" -> 2,
    "InitFull" -> Seq(InitCh(0),InitCh(1)),
    "MrGoEn" -> 1
  )))

  Click_Fork.go := io.Go
  Click_Fork.In(0) <> io.In.HS
  Click_Fork.Out(0) <> io.Out0.HS
  Click_Fork.Out(1) <> io.Out1.HS

  AsyncClock(Click_Fork.fire_o, reset){
    val ff_Data = RegInit(InitValue.U(DATAWIDTH.W))

    ff_Data := io.In.Data
    io.Out0.Data := ff_Data
    io.Out1.Data := ff_Data
  }
}

class CL extends Module with FIB_Param {
  val io = IO(new JOIN_IO())

  val Click_Join = Module(new ACG(Map(
    "InNum" -> 2,
    "OutNum" -> 1,
    "MrGoEn" -> 1
  )))

  Click_Join.go := io.Go
  Click_Join.In(0) <> io.In0.HS
  Click_Join.In(1) <> io.In1.HS
  Click_Join.Out(0) <> io.Out.HS

  AsyncClock(Click_Join.fire_o, reset){
    io.Out.Data := RegNext(io.In0.Data + io.In1.Data, init=0.U)
  }
}

object elaborate_Fibonacci extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new Fibonacci_main()),
      TargetDirAnnotation("Outputs/Fibonacci_main"))
  )
}

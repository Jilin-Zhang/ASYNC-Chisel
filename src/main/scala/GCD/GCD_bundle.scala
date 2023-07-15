package examples

import tool._
import chisel3.{Flipped, Input, _}
import chisel3.experimental.{ChiselAnnotation, RunFirrtlTransform, annotate}
import chisel3.internal.InstanceId
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.{HasBlackBoxResource, MixedVec, is, isPow2, log2Down, log2Up, switch}
import firrtl._
import firrtl.annotations.{Annotation, SingleTargetAnnotation}
import firrtl.annotations.{CircuitTarget, InstanceTarget, ModuleTarget, ReferenceTarget, Target}
import firrtl.options.{CustomFileEmission, TargetDirAnnotation}

class GCD_bundle(val WIDTH: Int) extends Bundle{
  val HS = new HS_IO
  val Data = new Bundle{
    val A = Input(UInt(WIDTH.W))
    val B = Input(UInt(WIDTH.W))
  }
}

class MUX_IO(val WIDTH: Int) extends Bundle {
  val In = new GCD_bundle(WIDTH)
  val In_CL = new GCD_bundle(WIDTH)
  val Out = Flipped(new GCD_bundle(WIDTH))
  val AB_Neq = Input(Bool())
}

class CL_IO(val WIDTH: Int) extends Bundle {
  val In = new GCD_bundle(WIDTH)
  val Out_Mux = Flipped(new GCD_bundle(WIDTH))
  val Out = Flipped(new GCD_bundle(WIDTH))
  val AB_Neq = Output(Bool())
}

class GCD_IO(val WIDTH: Int) extends Bundle {
  val In = new GCD_bundle(WIDTH)
  val Out = Flipped(new GCD_bundle(WIDTH))
}
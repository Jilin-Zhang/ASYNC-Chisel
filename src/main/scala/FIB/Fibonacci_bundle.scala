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

class Fibonacci_main_IO extends Bundle with FIB_Param {
  val Out = Flipped(new HS_Data(DATAWIDTH))
  val Go = Input(Bool())
}
class FORK_IO extends Bundle with FIB_Param {
  val In = new HS_Data(DATAWIDTH)
  val Out0 = Flipped(new HS_Data(DATAWIDTH))
  val Out1 = Flipped(new HS_Data(DATAWIDTH))
  val Go = Input(Bool())
}
class JOIN_IO extends Bundle with FIB_Param {
  val In0 = new HS_Data(DATAWIDTH)
  val In1 = new HS_Data(DATAWIDTH)
  val Out = Flipped(new HS_Data(DATAWIDTH))
  val Go = Input(Bool())
}
class BUF_IO extends Bundle with FIB_Param{
  val In = new HS_Data(DATAWIDTH)
  val Out = Flipped(new HS_Data(DATAWIDTH))
  val Go = Input(Bool())
}


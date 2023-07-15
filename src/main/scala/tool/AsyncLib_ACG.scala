package tool

import chisel3._
import chisel3.util.HasBlackBoxResource

// ***************************************
// Asynchronous Handshake Channel
// ***************************************
class HS_IO extends Bundle{
  val Req: Bool = Input(Bool())
  val Ack: Bool = Output(Bool())
}

// ***************************************
// Asynchronous Handshake Channel with Data
// ***************************************
class HS_Data(val WIDTH: Int) extends Bundle{
  val HS = new HS_IO
  val Data: UInt = Input(UInt(WIDTH.W))
}

// ***************************************
// Delay Element for Simulation
// ***************************************
class DelayElement(val DelayValue: Int) extends BlackBox(Map("DelayValue" -> DelayValue)) with HasBlackBoxResource {
  require(DelayValue >= 0)
  val io = IO(new Bundle {
    val I: Bool = Input(Bool())
    val Z: Bool = Output(Bool())
  })
  addResource("/ASYNC/DelayElement.v")
}

// ***************************************
// MrGo unit. For more information about MrGo please refers to
// M. Roncken et al., "How to think about self-timed systems,"
// ***************************************
class MrGo extends BlackBox with HasBlackBoxResource{
  val io = IO(new Bundle {
    val fire: Bool = Input(Bool())
    val En: Bool = Input(Bool())
    val Out: Bool = Output(Bool())
  })
  addResource("/ASYNC/MrGo.v")
}

// ***************************************
// Asynchronous Controller Generator
// ***************************************
class ACG(val Para: Map[String, Any]) extends Module{

  // Get Parameters
  private val InNum: Int = Para.getOrElse("InNum", 0).asInstanceOf[Int]
  private val OutNum: Int = Para.getOrElse("OutNum", 0).asInstanceOf[Int]
  private val InEnFF: Int = Para.getOrElse("InEnFF", 0).asInstanceOf[Int]
  private val OutEnFF: Int = Para.getOrElse("OutEnFF", 0).asInstanceOf[Int]
  private val InitFull: Seq[Int] = Para.getOrElse("InitFull", Seq.fill(OutNum)(0)).asInstanceOf[Seq[Int]]
  private val MrGoEn: Int = Para.getOrElse("MrGoEn", 0).asInstanceOf[Int]
  private val InPLB: Seq[Int] = Para.getOrElse("InPLB", Seq.fill(InNum - 1)(0)).asInstanceOf[Seq[Int]]
  private val OutPLB: Seq[Int] = Para.getOrElse("OutPLB", Seq.fill(OutNum - 1)(0)).asInstanceOf[Seq[Int]]

  // Check Parameters
  require(InNum >= 0, s"[UAC] InNum must be >= 0")
  require(OutNum >= 0, s"[UAC] OutNum must be >= 0")
  require(InNum+OutNum > 0, s"[UAC] InNum+OutNum must be > 0")
  require(InEnFF==0 || InEnFF==1, s"[UAC] InEnFF must be 0 or 1")
  require(OutEnFF==0 || OutEnFF==1, s"[UAC] OutEnFF must be 0 or 1")
  require(MrGoEn==0 || MrGoEn==1, s"[UAC] OutEnFF must be 0 or 1")
  require(InPLB.forall(x => x == 0 || x == 1), "InPLB must contain only 0 or 1")
  require(OutPLB.forall(x => x == 0 || x == 1), "OutPLB must contain only 0 or 1")

  // Create ports
  val In: Vec[HS_IO] = if (InNum != 0) IO(Vec(InNum, new HS_IO())) else Vec(InNum, new HS_IO())
  val Out: Vec[HS_IO] = if (OutNum != 0) IO(Vec(OutNum, Flipped(new HS_IO()))) else Vec(OutNum, Flipped(new HS_IO()))
  val InEn: Vec[Bool] = if (InEnFF != 0) IO(Input(Vec(InNum, Bool()))) else Vec(InNum, Bool())
  val OutEn: Vec[Bool] = if (OutEnFF != 0) IO(Input(Vec(OutNum, Bool()))) else Vec(OutNum, Bool())
  val fire_o: Clock = IO(Output(Clock()))
  val Start: Bool = if (InNum == 0) IO(Input(Bool())) else false.B
  val go: Bool = if (MrGoEn != 0) IO(Input(Bool())) else Bool()

  // Implementing input links
  private def input_links(HS: HS_IO, InEn: Bool, fire: Bool):Bool = {
    val req_tmp = Wire(Bool())
    val Dreq = Module(new DelayElement(5))
    Dreq.io.I := HS.Req
    req_tmp := Dreq.io.Z
    AsyncClock(fire.asClock, reset){
      val ff = RegInit(false.B)
      if (InEnFF == 1) {
        ff := Mux(InEn, HS.Req, HS.Ack)
      } else {
        ff := HS.Req
      }
      HS.Ack := ff
    }
    HS.Ack ^ req_tmp
  }

  // Implementing output links
  private def output_links(HS: HS_IO, OutEn: Bool, init: Int, fire: Bool):Bool = {
    AsyncClock(fire.asClock, reset){
      val ff = RegInit(init.asUInt)
      if (OutEnFF == 1) {
        ff := Mux(OutEn, !HS.Ack, HS.Req)
      } else {
        ff := !HS.Ack
      }
      HS.Req := ff
    }
    !(HS.Ack ^ HS.Req)
  }

  // Implementing joint
  private def joint(full: Bool, empty: Bool, go: Bool): Bool = {
    val fire_and = full && empty
    val Dfire = Module(new DelayElement(1))
    if (MrGoEn == 1) {
      val MrGo = Module(new MrGo()).io
      MrGo.fire := fire_and
      MrGo.En := !go
      Dfire.io.I := MrGo.Out
    } else {
      Dfire.io.I := fire_and
    }
    Dfire.io.Z
  }

  //Implementing Input Parameterized logic block
  private val full: Bool = (0 until InNum).foldLeft(Start)((ResFull, idx) => {
    val wire_PRO = Wire(Bool())
    if (idx == 0) {
      if (InNum == 0) {
        wire_PRO := ResFull
      } else {
        wire_PRO := ResFull || input_links(In(idx), InEn(idx), fire_o.asBool)
      }

    }else if(InPLB(idx - 1) == 1){
      wire_PRO := ResFull || input_links(In(idx), InEn(idx), fire_o.asBool)
    } else {
      wire_PRO := ResFull && input_links(In(idx), InEn(idx), fire_o.asBool)
    }
    wire_PRO
  })

  //Implementing Output Parameterized logic block
  private val empty: Bool = (0 until OutNum).foldLeft(true.B)((ResEmpty, idx) => {
    val wire_PRO = Wire(Bool())
    if (idx == 0) {
      if (OutNum == 0) {
        wire_PRO := ResEmpty
      } else {
        wire_PRO := ResEmpty && output_links(Out(idx), OutEn(idx), InitFull(idx), fire_o.asBool)
      }
    }else if(OutPLB(idx - 1) == 1){
      wire_PRO := ResEmpty || output_links(Out(idx), OutEn(idx), InitFull(idx), fire_o.asBool)
    } else {
      wire_PRO := ResEmpty && output_links(Out(idx), OutEn(idx), InitFull(idx), fire_o.asBool)
    }
    wire_PRO
  })

  //Create asynchronous clock
  fire_o := joint(full, empty, go).asClock
}

object AsyncClock {
  /** Creates a new asynchronous clock and reset scope
   *
   * @param Aclock the new asynchronous Clock
   * @param reset the new asynchronous Reset
   * @param block the block of code to run with new implicit asynchronous Clock and Reset
   */
  def apply[T](Aclock: Clock, reset: Reset)(block: => T): T = {
    withClockAndReset(Aclock, reset.asAsyncReset) {
      block
    }
  }
}
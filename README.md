# ASYNC-Chisel

## Introduction

ASYNC-Chisel is an open-source library for designing self-timed asynchronous circuits using Chisel. It includes the following components:

- ACG (Asynchronous Controller Generator) for generating asynchronous controllers.

- Custom circuit transformation for finding asynchronous clocks and handshake channels.

- Several examples of asynchronous circuit designs using Chisel, such as FIB and GCD.

ASYNC-Chisel provides a convenient and powerful framework for designing self-timed asynchronous circuits using Chisel, a hardware construction language embedded in Scala.

## Asynchronous handshake signals

### Request and acknowledge signals

Compared to synchronous circuits, asynchronous circuits use handshake signals (request *Req* and acknowledge *Ack*) for necessary synchronization, which results in a higher number of signals that need to be connected, making the design more complex. When designing asynchronous circuits using Chisel, this complexity can be reduced by using Bundles or Bulk connections for connecting signals.

In Chisel, Bundles provide a convenient way to group related signals together and simplify their connections. Bundles can be connected using Bulk connections, where all signals in the Bundle are connected automatically, reducing the need for manual and tedious signal connections.

By leveraging the capabilities of Chisel, asynchronous circuit designers can manage the complexity of signal connections more effectively, thereby increasing the production.

```scala
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
```

## Asynchronous Controller Generator: ACG

### Parameter list

| Parameters | Default value | Description                                           |
|:----------:|:-------------:|:----------------------------------------------------- |
| InNum      | 1             | Deciding the number of input links                    |
| OutNum     | 1             | Deciding the number of output links                   |
| InEnFF     | Seq(0)        | Deciding the existence of InEn signal                 |
| OutEnFF    | Seq(0)        | Deciding the existence of OutEn signal                |
| InPLB      | Seq(0)        | Deciding the logic between input links                |
| OutPLB     | Seq(0)        | Deciding the logic between output links               |
| InitFull   | Seq(0)        | Deciding the initial value of DFF inside output links |
| MrGo       | 0             | Deciding the existence of MrGo unit inside joint      |

### Bootcamp

Click on the following link to access ASYNC-Chisel-Bootcamp and try with ASYNC-Chisel without the need of local installation:

https://mybinder.org/v2/gh/Jilin-Zhang/ASYNC-Chisel-Bootcamp/main
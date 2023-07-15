# ASYNC-Chisel

ASYNC-Chisel是采用Chisel进行自定时异步电路设计的一个开源库。其中包含了

- 用于生成异步控制器的: ACG (Asynchronous Controller Generator)

- 用于寻找异步时钟以及握手通道的transformation

- 使用Chisel进行异步电路设计的几个示例: FIB和GCD
  
  ## 异步握手信号
  
  ### 请求与应答信号
  
  与同步电路相比，异步电路中使用握手信号（请求*Req*与应答*Ack*）进行必要的同步，这就使得异步电路设计时需要连接的信号数目增加很多，使得设计变的繁琐。使用Chisel进行异步电路设计时可以通过Bundle已经Bulk connection来进行连接，降低连接的复杂度。
  
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
  
  ## 异步控制模块生成器: ACG
  
  ### 参数列表
  
  | 控制参数     | 默认值    | 说明                       |
  | -------- | ------ | ------------------------ |
  | InNum    | 1      | 决定异步控制模块输入通道数目           |
  | OutNum   | 1      | 决定异步控制模块输出通道数目           |
  | InEnFF   | Seq(0) | 决定输入通道是否有InEn的控制信号       |
  | OutEnFF  | Seq(0) | 决定输出通道是否有OutEn的控制信号      |
  | InPLB    | Seq(0) | 决定输入通道之间的逻辑              |
  | OutPLB   | Seq(0) | 决定输出通道之间的逻辑              |
  | InitFull | Seq(0) | 决定输出通道初始逻辑为高电平还是低电平      |
  | MrGo     | 0      | 决定异步控制模块Joint中是否存在MrGo单元 |
  
  ### 使用示例
  
  点击下面的链接进入 ASYNC-Chisel-Bootcamp ，无需安装即可尝试使用ASYNC-Chisel进行设计。
  
  [Binder](https://mybinder.org/v2/gh/Jilin-Zhang/ASYNC-Chisel-Bootcamp/main)
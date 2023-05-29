# ASYNC-Chisel
An open source library for designing self-timed asynchronous circuits using Chisel.

---

# ASYNC-Chisel
ASYNC-Chisel是采用Chisel进行自定时异步电路设计的一个开源库。其中包含了
- 用于生成异步控制器的: ACG (Asynchronous Controller Generator)
- 用于寻找异步时钟以及握手通道的transformation
- 使用Chisel进行异步电路设计的两个示例: FIB和GCD

## 异步握手信号
### 请求与应答信号
与同步电路相比，异步电路中使用握手信号（请求*Req*与应答*Ack*）进行必要的同步，这就使得异步电路设计时需要连接的信号数目增加很多，使得设计变的繁琐。使用Chisel进行异步电路设计时可以通过Bundle已经Bulk connection来进行连接，降低连接的复杂度。

## 异步控制模块生成器: ACG
### 参数列表
| 控制参数  | 默认值 | 说明 |
| ------------- | ------------- | ------------- |
| InNum  | 1  | 决定异步控制模块输入通道数目 |
| InEnFF | Seq(0) | 决定输入通道是否有InEn的控制信号 |
| PLB | Seq(0) | 决定输入通道之间的逻辑 |
| OutNum  | 1  | 决定异步控制模块输出通道数目 |
| OutEnFF  | Seq(0) | 决定输出通道是否有OutEn的控制信号 |
| InitFull  | Seq(0) | 决定输出通道初始逻辑为高电平还是低电平 |
| MrGo | 0 | 决定异步控制模块Joint中是否存在MrGo单元 |

### 使用示例
#### 1输入1输出Click单元
该Click单元（ACG_1in1out）只有一个输入通道和一个输出通道。当输入通道的请求与应当具有不同的逻辑值，并且输出通道的请求与应答有相同的逻辑值时，ACG_1in1out开始工作。其工作时，ACG_1in1out的fire_o信号上回产生一个脉冲信号，该脉冲信号会让ACG_1in1out返回一个应答信号到上一级（即令输入通道的应答信号翻转，使其与输入通道的请求信号有相同的逻辑值），同时会发出一个请求信号到下一级（即令输出通道的请求信号翻转，使其与输出通道的应答信号有不同的逻辑值）。
```scala
private val ACG_1in1out = Module(new ACG(Map(
    "InNum" -> 1,
    "OutNum" -> 1
  )))
```

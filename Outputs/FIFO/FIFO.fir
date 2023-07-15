circuit FIFO :
  extmodule DelayElement :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 5

  extmodule DelayElement_1 :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 1

  module ACG :
    input clock : Clock
    input reset : Reset
    output In : { flip Req : UInt<1>, Ack : UInt<1>}[1]
    input Out : { flip Req : UInt<1>, Ack : UInt<1>}[1]
    output fire_o : Clock

    wire full : UInt<1> @[AsyncLib_ACG.scala 130:24]
    node _full_wire_PRO_T = asUInt(fire_o) @[AsyncLib_ACG.scala 135:71]
    node _full_wire_PRO_T_1 = bits(_full_wire_PRO_T, 0, 0) @[AsyncLib_ACG.scala 135:71]
    wire full_wire_PRO_req_tmp : UInt<1> @[AsyncLib_ACG.scala 83:23]
    inst full_wire_PRO_Dreq of DelayElement @[AsyncLib_ACG.scala 84:22]
    full_wire_PRO_Dreq.Z is invalid
    full_wire_PRO_Dreq.I is invalid
    full_wire_PRO_Dreq.I <= In[0].Req @[AsyncLib_ACG.scala 85:15]
    full_wire_PRO_req_tmp <= full_wire_PRO_Dreq.Z @[AsyncLib_ACG.scala 86:13]
    node _full_wire_PRO_T_2 = asClock(_full_wire_PRO_T_1) @[AsyncLib_ACG.scala 87:21]
    node _full_wire_PRO_T_3 = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg full_wire_PRO_ff : UInt<1>, _full_wire_PRO_T_2 with :
      reset => (_full_wire_PRO_T_3, UInt<1>("h0")) @[AsyncLib_ACG.scala 88:23]
    full_wire_PRO_ff <= In[0].Req @[AsyncLib_ACG.scala 92:12]
    In[0].Ack <= full_wire_PRO_ff @[AsyncLib_ACG.scala 94:14]
    node _full_wire_PRO_T_4 = xor(In[0].Ack, full_wire_PRO_req_tmp) @[AsyncLib_ACG.scala 96:12]
    node _full_wire_PRO_T_5 = or(UInt<1>("h0"), _full_wire_PRO_T_4) @[AsyncLib_ACG.scala 135:29]
    full <= _full_wire_PRO_T_5 @[AsyncLib_ACG.scala 135:18]
    wire empty : UInt<1> @[AsyncLib_ACG.scala 148:24]
    node _empty_wire_PRO_T = asUInt(fire_o) @[AsyncLib_ACG.scala 153:90]
    node _empty_wire_PRO_T_1 = bits(_empty_wire_PRO_T, 0, 0) @[AsyncLib_ACG.scala 153:90]
    node _empty_wire_PRO_T_2 = asClock(_empty_wire_PRO_T_1) @[AsyncLib_ACG.scala 101:21]
    node _empty_wire_PRO_T_3 = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg empty_wire_PRO_ff : UInt, _empty_wire_PRO_T_2 with :
      reset => (_empty_wire_PRO_T_3, UInt<1>("h0")) @[AsyncLib_ACG.scala 102:23]
    node _empty_wire_PRO_ff_T = eq(Out[0].Ack, UInt<1>("h0")) @[AsyncLib_ACG.scala 106:15]
    empty_wire_PRO_ff <= _empty_wire_PRO_ff_T @[AsyncLib_ACG.scala 106:12]
    Out[0].Req <= empty_wire_PRO_ff @[AsyncLib_ACG.scala 108:14]
    node _empty_wire_PRO_T_4 = xor(Out[0].Ack, Out[0].Req) @[AsyncLib_ACG.scala 110:14]
    node _empty_wire_PRO_T_5 = eq(_empty_wire_PRO_T_4, UInt<1>("h0")) @[AsyncLib_ACG.scala 110:5]
    node _empty_wire_PRO_T_6 = and(UInt<1>("h1"), _empty_wire_PRO_T_5) @[AsyncLib_ACG.scala 153:30]
    empty <= _empty_wire_PRO_T_6 @[AsyncLib_ACG.scala 153:18]
    node fire_o_fire_and = and(full, empty) @[AsyncLib_ACG.scala 115:25]
    inst fire_o_Dfire of DelayElement_1 @[AsyncLib_ACG.scala 116:23]
    fire_o_Dfire.Z is invalid
    fire_o_Dfire.I is invalid
    fire_o_Dfire.I <= fire_o_fire_and @[AsyncLib_ACG.scala 123:18]
    node _fire_o_T = asClock(fire_o_Dfire.Z) @[AsyncLib_ACG.scala 164:36]
    fire_o <= _fire_o_T @[AsyncLib_ACG.scala 164:10]

  module FIFO :
    input clock : Clock
    input reset : UInt<1>
    output io : { In : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}}

    inst ACG of ACG @[FIFO.scala 17:27]
    ACG.clock <= clock
    ACG.reset <= reset
    io.In.HS.Ack <= ACG.In[0].Ack @[FIFO.scala 22:13]
    ACG.In[0].Req <= io.In.HS.Req @[FIFO.scala 22:13]
    ACG.Out[0] <= io.Out.HS @[FIFO.scala 23:14]
    node _T = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg io_Out_Data_REG : UInt, ACG.fire_o with :
      reset => (UInt<1>("h0"), io_Out_Data_REG) @[FIFO.scala 26:27]
    io_Out_Data_REG <= io.In.Data @[FIFO.scala 26:27]
    io.Out.Data <= io_Out_Data_REG @[FIFO.scala 26:17]


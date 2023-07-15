circuit Fibonacci_main :
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

  extmodule MrGo :
    input fire : UInt<1>
    input En : UInt<1>
    output Out : UInt<1>
    defname = MrGo

  module ACG :
    input clock : Clock
    input reset : Reset
    output In : { flip Req : UInt<1>, Ack : UInt<1>}[1]
    input Out : { flip Req : UInt<1>, Ack : UInt<1>}[2]
    output fire_o : Clock
    input go : UInt<1>

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
    wire empty_wire_PRO : UInt<1> @[AsyncLib_ACG.scala 148:24]
    node _empty_wire_PRO_T = asUInt(fire_o) @[AsyncLib_ACG.scala 153:90]
    node _empty_wire_PRO_T_1 = bits(_empty_wire_PRO_T, 0, 0) @[AsyncLib_ACG.scala 153:90]
    node _empty_wire_PRO_T_2 = asClock(_empty_wire_PRO_T_1) @[AsyncLib_ACG.scala 101:21]
    node _empty_wire_PRO_T_3 = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg empty_wire_PRO_ff : UInt, _empty_wire_PRO_T_2 with :
      reset => (_empty_wire_PRO_T_3, UInt<1>("h1")) @[AsyncLib_ACG.scala 102:23]
    node _empty_wire_PRO_ff_T = eq(Out[0].Ack, UInt<1>("h0")) @[AsyncLib_ACG.scala 106:15]
    empty_wire_PRO_ff <= _empty_wire_PRO_ff_T @[AsyncLib_ACG.scala 106:12]
    Out[0].Req <= empty_wire_PRO_ff @[AsyncLib_ACG.scala 108:14]
    node _empty_wire_PRO_T_4 = xor(Out[0].Ack, Out[0].Req) @[AsyncLib_ACG.scala 110:14]
    node _empty_wire_PRO_T_5 = eq(_empty_wire_PRO_T_4, UInt<1>("h0")) @[AsyncLib_ACG.scala 110:5]
    node _empty_wire_PRO_T_6 = and(UInt<1>("h1"), _empty_wire_PRO_T_5) @[AsyncLib_ACG.scala 153:30]
    empty_wire_PRO <= _empty_wire_PRO_T_6 @[AsyncLib_ACG.scala 153:18]
    wire empty : UInt<1> @[AsyncLib_ACG.scala 148:24]
    node _empty_wire_PRO_T_7 = asUInt(fire_o) @[AsyncLib_ACG.scala 158:88]
    node _empty_wire_PRO_T_8 = bits(_empty_wire_PRO_T_7, 0, 0) @[AsyncLib_ACG.scala 158:88]
    node _empty_wire_PRO_T_9 = asClock(_empty_wire_PRO_T_8) @[AsyncLib_ACG.scala 101:21]
    node _empty_wire_PRO_T_10 = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg empty_wire_PRO_ff_1 : UInt, _empty_wire_PRO_T_9 with :
      reset => (_empty_wire_PRO_T_10, UInt<1>("h1")) @[AsyncLib_ACG.scala 102:23]
    node _empty_wire_PRO_ff_T_1 = eq(Out[1].Ack, UInt<1>("h0")) @[AsyncLib_ACG.scala 106:15]
    empty_wire_PRO_ff_1 <= _empty_wire_PRO_ff_T_1 @[AsyncLib_ACG.scala 106:12]
    Out[1].Req <= empty_wire_PRO_ff_1 @[AsyncLib_ACG.scala 108:14]
    node _empty_wire_PRO_T_11 = xor(Out[1].Ack, Out[1].Req) @[AsyncLib_ACG.scala 110:14]
    node _empty_wire_PRO_T_12 = eq(_empty_wire_PRO_T_11, UInt<1>("h0")) @[AsyncLib_ACG.scala 110:5]
    node _empty_wire_PRO_T_13 = and(empty_wire_PRO, _empty_wire_PRO_T_12) @[AsyncLib_ACG.scala 158:28]
    empty <= _empty_wire_PRO_T_13 @[AsyncLib_ACG.scala 158:16]
    node fire_o_fire_and = and(full, empty) @[AsyncLib_ACG.scala 115:25]
    inst fire_o_Dfire of DelayElement_1 @[AsyncLib_ACG.scala 116:23]
    fire_o_Dfire.Z is invalid
    fire_o_Dfire.I is invalid
    inst MrGo of MrGo @[AsyncLib_ACG.scala 118:24]
    MrGo.Out is invalid
    MrGo.En is invalid
    MrGo.fire is invalid
    MrGo.fire <= fire_o_fire_and @[AsyncLib_ACG.scala 119:17]
    node _fire_o_T = eq(go, UInt<1>("h0")) @[AsyncLib_ACG.scala 120:18]
    MrGo.En <= _fire_o_T @[AsyncLib_ACG.scala 120:15]
    fire_o_Dfire.I <= MrGo.Out @[AsyncLib_ACG.scala 121:18]
    node _fire_o_T_1 = asClock(fire_o_Dfire.Z) @[AsyncLib_ACG.scala 164:36]
    fire_o <= _fire_o_T_1 @[AsyncLib_ACG.scala 164:10]

  module F_Fork :
    input clock : Clock
    input reset : Reset
    output io : { In : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out0 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out1 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Go : UInt<1>}

    inst Click_Fork of ACG @[Fibonacci_main.scala 41:26]
    Click_Fork.clock <= clock
    Click_Fork.reset <= reset
    Click_Fork.go <= io.Go @[Fibonacci_main.scala 48:17]
    io.In.HS.Ack <= Click_Fork.In[0].Ack @[Fibonacci_main.scala 49:20]
    Click_Fork.In[0].Req <= io.In.HS.Req @[Fibonacci_main.scala 49:20]
    Click_Fork.Out[0] <= io.Out0.HS @[Fibonacci_main.scala 50:21]
    Click_Fork.Out[1] <= io.Out1.HS @[Fibonacci_main.scala 51:21]
    node _T = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg ff_Data : UInt<8>, Click_Fork.fire_o with :
      reset => (_T, UInt<8>("h1")) @[Fibonacci_main.scala 54:26]
    ff_Data <= io.In.Data @[Fibonacci_main.scala 56:13]
    io.Out0.Data <= ff_Data @[Fibonacci_main.scala 57:18]
    io.Out1.Data <= ff_Data @[Fibonacci_main.scala 58:18]

  extmodule DelayElement_2 :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 5

  extmodule DelayElement_3 :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 1

  extmodule MrGo_1 :
    input fire : UInt<1>
    input En : UInt<1>
    output Out : UInt<1>
    defname = MrGo

  module ACG_1 :
    input clock : Clock
    input reset : Reset
    output In : { flip Req : UInt<1>, Ack : UInt<1>}[1]
    input Out : { flip Req : UInt<1>, Ack : UInt<1>}[2]
    output fire_o : Clock
    input go : UInt<1>

    wire full : UInt<1> @[AsyncLib_ACG.scala 130:24]
    node _full_wire_PRO_T = asUInt(fire_o) @[AsyncLib_ACG.scala 135:71]
    node _full_wire_PRO_T_1 = bits(_full_wire_PRO_T, 0, 0) @[AsyncLib_ACG.scala 135:71]
    wire full_wire_PRO_req_tmp : UInt<1> @[AsyncLib_ACG.scala 83:23]
    inst full_wire_PRO_Dreq of DelayElement_2 @[AsyncLib_ACG.scala 84:22]
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
    wire empty_wire_PRO : UInt<1> @[AsyncLib_ACG.scala 148:24]
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
    empty_wire_PRO <= _empty_wire_PRO_T_6 @[AsyncLib_ACG.scala 153:18]
    wire empty : UInt<1> @[AsyncLib_ACG.scala 148:24]
    node _empty_wire_PRO_T_7 = asUInt(fire_o) @[AsyncLib_ACG.scala 158:88]
    node _empty_wire_PRO_T_8 = bits(_empty_wire_PRO_T_7, 0, 0) @[AsyncLib_ACG.scala 158:88]
    node _empty_wire_PRO_T_9 = asClock(_empty_wire_PRO_T_8) @[AsyncLib_ACG.scala 101:21]
    node _empty_wire_PRO_T_10 = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg empty_wire_PRO_ff_1 : UInt, _empty_wire_PRO_T_9 with :
      reset => (_empty_wire_PRO_T_10, UInt<1>("h1")) @[AsyncLib_ACG.scala 102:23]
    node _empty_wire_PRO_ff_T_1 = eq(Out[1].Ack, UInt<1>("h0")) @[AsyncLib_ACG.scala 106:15]
    empty_wire_PRO_ff_1 <= _empty_wire_PRO_ff_T_1 @[AsyncLib_ACG.scala 106:12]
    Out[1].Req <= empty_wire_PRO_ff_1 @[AsyncLib_ACG.scala 108:14]
    node _empty_wire_PRO_T_11 = xor(Out[1].Ack, Out[1].Req) @[AsyncLib_ACG.scala 110:14]
    node _empty_wire_PRO_T_12 = eq(_empty_wire_PRO_T_11, UInt<1>("h0")) @[AsyncLib_ACG.scala 110:5]
    node _empty_wire_PRO_T_13 = and(empty_wire_PRO, _empty_wire_PRO_T_12) @[AsyncLib_ACG.scala 158:28]
    empty <= _empty_wire_PRO_T_13 @[AsyncLib_ACG.scala 158:16]
    node fire_o_fire_and = and(full, empty) @[AsyncLib_ACG.scala 115:25]
    inst fire_o_Dfire of DelayElement_3 @[AsyncLib_ACG.scala 116:23]
    fire_o_Dfire.Z is invalid
    fire_o_Dfire.I is invalid
    inst MrGo of MrGo_1 @[AsyncLib_ACG.scala 118:24]
    MrGo.Out is invalid
    MrGo.En is invalid
    MrGo.fire is invalid
    MrGo.fire <= fire_o_fire_and @[AsyncLib_ACG.scala 119:17]
    node _fire_o_T = eq(go, UInt<1>("h0")) @[AsyncLib_ACG.scala 120:18]
    MrGo.En <= _fire_o_T @[AsyncLib_ACG.scala 120:15]
    fire_o_Dfire.I <= MrGo.Out @[AsyncLib_ACG.scala 121:18]
    node _fire_o_T_1 = asClock(fire_o_Dfire.Z) @[AsyncLib_ACG.scala 164:36]
    fire_o <= _fire_o_T_1 @[AsyncLib_ACG.scala 164:10]

  module F_Fork_1 :
    input clock : Clock
    input reset : Reset
    output io : { In : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out0 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out1 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Go : UInt<1>}

    inst Click_Fork of ACG_1 @[Fibonacci_main.scala 41:26]
    Click_Fork.clock <= clock
    Click_Fork.reset <= reset
    Click_Fork.go <= io.Go @[Fibonacci_main.scala 48:17]
    io.In.HS.Ack <= Click_Fork.In[0].Ack @[Fibonacci_main.scala 49:20]
    Click_Fork.In[0].Req <= io.In.HS.Req @[Fibonacci_main.scala 49:20]
    Click_Fork.Out[0] <= io.Out0.HS @[Fibonacci_main.scala 50:21]
    Click_Fork.Out[1] <= io.Out1.HS @[Fibonacci_main.scala 51:21]
    node _T = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg ff_Data : UInt<8>, Click_Fork.fire_o with :
      reset => (_T, UInt<8>("h0")) @[Fibonacci_main.scala 54:26]
    ff_Data <= io.In.Data @[Fibonacci_main.scala 56:13]
    io.Out0.Data <= ff_Data @[Fibonacci_main.scala 57:18]
    io.Out1.Data <= ff_Data @[Fibonacci_main.scala 58:18]

  extmodule DelayElement_4 :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 5

  extmodule DelayElement_5 :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 5

  extmodule DelayElement_6 :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 1

  extmodule MrGo_2 :
    input fire : UInt<1>
    input En : UInt<1>
    output Out : UInt<1>
    defname = MrGo

  module ACG_2 :
    input clock : Clock
    input reset : Reset
    output In : { flip Req : UInt<1>, Ack : UInt<1>}[2]
    input Out : { flip Req : UInt<1>, Ack : UInt<1>}[1]
    output fire_o : Clock
    input go : UInt<1>

    wire full_wire_PRO : UInt<1> @[AsyncLib_ACG.scala 130:24]
    node _full_wire_PRO_T = asUInt(fire_o) @[AsyncLib_ACG.scala 135:71]
    node _full_wire_PRO_T_1 = bits(_full_wire_PRO_T, 0, 0) @[AsyncLib_ACG.scala 135:71]
    wire full_wire_PRO_req_tmp : UInt<1> @[AsyncLib_ACG.scala 83:23]
    inst full_wire_PRO_Dreq of DelayElement_4 @[AsyncLib_ACG.scala 84:22]
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
    full_wire_PRO <= _full_wire_PRO_T_5 @[AsyncLib_ACG.scala 135:18]
    wire full : UInt<1> @[AsyncLib_ACG.scala 130:24]
    node _full_wire_PRO_T_6 = asUInt(fire_o) @[AsyncLib_ACG.scala 141:69]
    node _full_wire_PRO_T_7 = bits(_full_wire_PRO_T_6, 0, 0) @[AsyncLib_ACG.scala 141:69]
    wire full_wire_PRO_req_tmp_1 : UInt<1> @[AsyncLib_ACG.scala 83:23]
    inst full_wire_PRO_Dreq_1 of DelayElement_5 @[AsyncLib_ACG.scala 84:22]
    full_wire_PRO_Dreq_1.Z is invalid
    full_wire_PRO_Dreq_1.I is invalid
    full_wire_PRO_Dreq_1.I <= In[1].Req @[AsyncLib_ACG.scala 85:15]
    full_wire_PRO_req_tmp_1 <= full_wire_PRO_Dreq_1.Z @[AsyncLib_ACG.scala 86:13]
    node _full_wire_PRO_T_8 = asClock(_full_wire_PRO_T_7) @[AsyncLib_ACG.scala 87:21]
    node _full_wire_PRO_T_9 = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg full_wire_PRO_ff_1 : UInt<1>, _full_wire_PRO_T_8 with :
      reset => (_full_wire_PRO_T_9, UInt<1>("h0")) @[AsyncLib_ACG.scala 88:23]
    full_wire_PRO_ff_1 <= In[1].Req @[AsyncLib_ACG.scala 92:12]
    In[1].Ack <= full_wire_PRO_ff_1 @[AsyncLib_ACG.scala 94:14]
    node _full_wire_PRO_T_10 = xor(In[1].Ack, full_wire_PRO_req_tmp_1) @[AsyncLib_ACG.scala 96:12]
    node _full_wire_PRO_T_11 = and(full_wire_PRO, _full_wire_PRO_T_10) @[AsyncLib_ACG.scala 141:27]
    full <= _full_wire_PRO_T_11 @[AsyncLib_ACG.scala 141:16]
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
    inst fire_o_Dfire of DelayElement_6 @[AsyncLib_ACG.scala 116:23]
    fire_o_Dfire.Z is invalid
    fire_o_Dfire.I is invalid
    inst MrGo of MrGo_2 @[AsyncLib_ACG.scala 118:24]
    MrGo.Out is invalid
    MrGo.En is invalid
    MrGo.fire is invalid
    MrGo.fire <= fire_o_fire_and @[AsyncLib_ACG.scala 119:17]
    node _fire_o_T = eq(go, UInt<1>("h0")) @[AsyncLib_ACG.scala 120:18]
    MrGo.En <= _fire_o_T @[AsyncLib_ACG.scala 120:15]
    fire_o_Dfire.I <= MrGo.Out @[AsyncLib_ACG.scala 121:18]
    node _fire_o_T_1 = asClock(fire_o_Dfire.Z) @[AsyncLib_ACG.scala 164:36]
    fire_o <= _fire_o_T_1 @[AsyncLib_ACG.scala 164:10]

  module CL :
    input clock : Clock
    input reset : Reset
    output io : { In0 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, In1 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Go : UInt<1>}

    inst Click_Join of ACG_2 @[Fibonacci_main.scala 65:26]
    Click_Join.clock <= clock
    Click_Join.reset <= reset
    Click_Join.go <= io.Go @[Fibonacci_main.scala 71:17]
    io.In0.HS.Ack <= Click_Join.In[0].Ack @[Fibonacci_main.scala 72:20]
    Click_Join.In[0].Req <= io.In0.HS.Req @[Fibonacci_main.scala 72:20]
    io.In1.HS.Ack <= Click_Join.In[1].Ack @[Fibonacci_main.scala 73:20]
    Click_Join.In[1].Req <= io.In1.HS.Req @[Fibonacci_main.scala 73:20]
    Click_Join.Out[0] <= io.Out.HS @[Fibonacci_main.scala 74:21]
    node _T = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    node _io_Out_Data_T = add(io.In0.Data, io.In1.Data) @[Fibonacci_main.scala 77:40]
    node _io_Out_Data_T_1 = tail(_io_Out_Data_T, 1) @[Fibonacci_main.scala 77:40]
    reg io_Out_Data_REG : UInt, Click_Join.fire_o with :
      reset => (_T, UInt<1>("h0")) @[Fibonacci_main.scala 77:27]
    io_Out_Data_REG <= _io_Out_Data_T_1 @[Fibonacci_main.scala 77:27]
    io.Out.Data <= io_Out_Data_REG @[Fibonacci_main.scala 77:17]

  module Fibonacci_main :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip Out : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Go : UInt<1>}

    inst F_Fork of F_Fork @[Fibonacci_main.scala 21:19]
    F_Fork.clock <= clock
    F_Fork.reset <= reset
    inst F_Fork_1 of F_Fork_1 @[Fibonacci_main.scala 22:19]
    F_Fork_1.clock <= clock
    F_Fork_1.reset <= reset
    inst CL of CL @[Fibonacci_main.scala 23:18]
    CL.clock <= clock
    CL.reset <= reset
    F_Fork.io.Go <= io.Go @[Fibonacci_main.scala 25:10]
    CL.io.Out <= F_Fork.io.In @[Fibonacci_main.scala 26:10]
    F_Fork_1.io.Go <= io.Go @[Fibonacci_main.scala 28:10]
    F_Fork.io.Out0 <= F_Fork_1.io.In @[Fibonacci_main.scala 29:10]
    CL.io.Go <= io.Go @[Fibonacci_main.scala 31:9]
    F_Fork.io.Out1 <= CL.io.In0 @[Fibonacci_main.scala 32:10]
    F_Fork_1.io.Out1 <= CL.io.In1 @[Fibonacci_main.scala 33:10]
    F_Fork_1.io.Out0 <= io.Out @[Fibonacci_main.scala 35:10]


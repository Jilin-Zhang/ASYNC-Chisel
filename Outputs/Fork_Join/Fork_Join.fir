circuit Fork_Join :
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
    input Out : { flip Req : UInt<1>, Ack : UInt<1>}[2]
    input OutEn : UInt<1>[2]
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
    wire empty_wire_PRO : UInt<1> @[AsyncLib_ACG.scala 148:24]
    node _empty_wire_PRO_T = asUInt(fire_o) @[AsyncLib_ACG.scala 153:90]
    node _empty_wire_PRO_T_1 = bits(_empty_wire_PRO_T, 0, 0) @[AsyncLib_ACG.scala 153:90]
    node _empty_wire_PRO_T_2 = asClock(_empty_wire_PRO_T_1) @[AsyncLib_ACG.scala 101:21]
    node _empty_wire_PRO_T_3 = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg empty_wire_PRO_ff : UInt, _empty_wire_PRO_T_2 with :
      reset => (_empty_wire_PRO_T_3, UInt<1>("h0")) @[AsyncLib_ACG.scala 102:23]
    node _empty_wire_PRO_ff_T = eq(Out[0].Ack, UInt<1>("h0")) @[AsyncLib_ACG.scala 104:26]
    node _empty_wire_PRO_ff_T_1 = mux(OutEn[0], _empty_wire_PRO_ff_T, Out[0].Req) @[AsyncLib_ACG.scala 104:18]
    empty_wire_PRO_ff <= _empty_wire_PRO_ff_T_1 @[AsyncLib_ACG.scala 104:12]
    Out[0].Req <= empty_wire_PRO_ff @[AsyncLib_ACG.scala 108:14]
    node _empty_wire_PRO_T_4 = xor(Out[0].Ack, Out[0].Req) @[AsyncLib_ACG.scala 110:14]
    node _empty_wire_PRO_T_5 = eq(_empty_wire_PRO_T_4, UInt<1>("h0")) @[AsyncLib_ACG.scala 110:5]
    node _empty_wire_PRO_T_6 = and(UInt<1>("h1"), _empty_wire_PRO_T_5) @[AsyncLib_ACG.scala 153:30]
    empty_wire_PRO <= _empty_wire_PRO_T_6 @[AsyncLib_ACG.scala 153:18]
    wire empty : UInt<1> @[AsyncLib_ACG.scala 148:24]
    node _empty_wire_PRO_T_7 = asUInt(fire_o) @[AsyncLib_ACG.scala 156:88]
    node _empty_wire_PRO_T_8 = bits(_empty_wire_PRO_T_7, 0, 0) @[AsyncLib_ACG.scala 156:88]
    node _empty_wire_PRO_T_9 = asClock(_empty_wire_PRO_T_8) @[AsyncLib_ACG.scala 101:21]
    node _empty_wire_PRO_T_10 = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg empty_wire_PRO_ff_1 : UInt, _empty_wire_PRO_T_9 with :
      reset => (_empty_wire_PRO_T_10, UInt<1>("h0")) @[AsyncLib_ACG.scala 102:23]
    node _empty_wire_PRO_ff_T_2 = eq(Out[1].Ack, UInt<1>("h0")) @[AsyncLib_ACG.scala 104:26]
    node _empty_wire_PRO_ff_T_3 = mux(OutEn[1], _empty_wire_PRO_ff_T_2, Out[1].Req) @[AsyncLib_ACG.scala 104:18]
    empty_wire_PRO_ff_1 <= _empty_wire_PRO_ff_T_3 @[AsyncLib_ACG.scala 104:12]
    Out[1].Req <= empty_wire_PRO_ff_1 @[AsyncLib_ACG.scala 108:14]
    node _empty_wire_PRO_T_11 = xor(Out[1].Ack, Out[1].Req) @[AsyncLib_ACG.scala 110:14]
    node _empty_wire_PRO_T_12 = eq(_empty_wire_PRO_T_11, UInt<1>("h0")) @[AsyncLib_ACG.scala 110:5]
    node _empty_wire_PRO_T_13 = or(empty_wire_PRO, _empty_wire_PRO_T_12) @[AsyncLib_ACG.scala 156:28]
    empty <= _empty_wire_PRO_T_13 @[AsyncLib_ACG.scala 156:16]
    node fire_o_fire_and = and(full, empty) @[AsyncLib_ACG.scala 115:25]
    inst fire_o_Dfire of DelayElement_1 @[AsyncLib_ACG.scala 116:23]
    fire_o_Dfire.Z is invalid
    fire_o_Dfire.I is invalid
    fire_o_Dfire.I <= fire_o_fire_and @[AsyncLib_ACG.scala 123:18]
    node _fire_o_T = asClock(fire_o_Dfire.Z) @[AsyncLib_ACG.scala 164:36]
    fire_o <= _fire_o_T @[AsyncLib_ACG.scala 164:10]

  module Fork :
    input clock : Clock
    input reset : Reset
    output io : { In : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out0 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out1 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}}

    inst ACG of ACG @[Fork_Join.scala 18:27]
    ACG.clock <= clock
    ACG.reset <= reset
    wire sel : UInt<1> @[Fork_Join.scala 24:25]
    io.In.HS.Ack <= ACG.In[0].Ack @[Fork_Join.scala 26:13]
    ACG.In[0].Req <= io.In.HS.Req @[Fork_Join.scala 26:13]
    ACG.Out[0] <= io.Out0.HS @[Fork_Join.scala 27:14]
    ACG.Out[1] <= io.Out1.HS @[Fork_Join.scala 28:14]
    node _ACG_OutEn_0_T = eq(sel, UInt<1>("h0")) @[Fork_Join.scala 29:19]
    ACG.OutEn[0] <= _ACG_OutEn_0_T @[Fork_Join.scala 29:16]
    ACG.OutEn[1] <= sel @[Fork_Join.scala 30:16]
    node _T = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    reg ff_Data0 : UInt<8>, ACG.fire_o with :
      reset => (UInt<1>("h0"), ff_Data0) @[Fork_Join.scala 33:33]
    reg ff_Data1 : UInt<8>, ACG.fire_o with :
      reset => (UInt<1>("h0"), ff_Data1) @[Fork_Join.scala 33:33]
    reg ff_sel : UInt<1>, ACG.fire_o with :
      reset => (_T, UInt<1>("h0")) @[Fork_Join.scala 34:25]
    when sel : @[Fork_Join.scala 35:15]
      ff_Data1 <= io.In.Data @[Fork_Join.scala 36:16]
    else :
      ff_Data0 <= io.In.Data @[Fork_Join.scala 38:16]
    node _ff_sel_T = eq(ff_sel, UInt<1>("h0")) @[Fork_Join.scala 40:15]
    ff_sel <= _ff_sel_T @[Fork_Join.scala 40:12]
    io.Out0.Data <= ff_Data0 @[Fork_Join.scala 41:18]
    io.Out1.Data <= ff_Data1 @[Fork_Join.scala 42:18]
    sel <= ff_sel @[Fork_Join.scala 43:9]

  extmodule DelayElement_2 :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 5

  extmodule DelayElement_3 :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 5

  extmodule DelayElement_4 :
    input I : UInt<1>
    output Z : UInt<1>
    defname = DelayElement
    parameter DelayValue = 1

  module ACG_1 :
    input clock : Clock
    input reset : Reset
    output In : { flip Req : UInt<1>, Ack : UInt<1>}[2]
    input Out : { flip Req : UInt<1>, Ack : UInt<1>}[1]
    output fire_o : Clock

    wire full_wire_PRO : UInt<1> @[AsyncLib_ACG.scala 130:24]
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
    full_wire_PRO <= _full_wire_PRO_T_5 @[AsyncLib_ACG.scala 135:18]
    wire full : UInt<1> @[AsyncLib_ACG.scala 130:24]
    node _full_wire_PRO_T_6 = asUInt(fire_o) @[AsyncLib_ACG.scala 139:69]
    node _full_wire_PRO_T_7 = bits(_full_wire_PRO_T_6, 0, 0) @[AsyncLib_ACG.scala 139:69]
    wire full_wire_PRO_req_tmp_1 : UInt<1> @[AsyncLib_ACG.scala 83:23]
    inst full_wire_PRO_Dreq_1 of DelayElement_3 @[AsyncLib_ACG.scala 84:22]
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
    node _full_wire_PRO_T_11 = or(full_wire_PRO, _full_wire_PRO_T_10) @[AsyncLib_ACG.scala 139:27]
    full <= _full_wire_PRO_T_11 @[AsyncLib_ACG.scala 139:16]
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
    inst fire_o_Dfire of DelayElement_4 @[AsyncLib_ACG.scala 116:23]
    fire_o_Dfire.Z is invalid
    fire_o_Dfire.I is invalid
    fire_o_Dfire.I <= fire_o_fire_and @[AsyncLib_ACG.scala 123:18]
    node _fire_o_T = asClock(fire_o_Dfire.Z) @[AsyncLib_ACG.scala 164:36]
    fire_o <= _fire_o_T @[AsyncLib_ACG.scala 164:10]

  module Join :
    input clock : Clock
    input reset : Reset
    output io : { In0 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, In1 : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}}

    inst ACG_Join of ACG_1 @[Fork_Join.scala 57:32]
    ACG_Join.clock <= clock
    ACG_Join.reset <= reset
    io.In0.HS.Ack <= ACG_Join.In[0].Ack @[Fork_Join.scala 63:18]
    ACG_Join.In[0].Req <= io.In0.HS.Req @[Fork_Join.scala 63:18]
    io.In1.HS.Ack <= ACG_Join.In[1].Ack @[Fork_Join.scala 64:18]
    ACG_Join.In[1].Req <= io.In1.HS.Req @[Fork_Join.scala 64:18]
    ACG_Join.Out[0] <= io.Out.HS @[Fork_Join.scala 65:19]
    node _T = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    node _SelData_T = xor(io.In0.HS.Req, io.In0.HS.Ack) @[Fork_Join.scala 68:37]
    node SelData = mux(_SelData_T, io.In0.Data, io.In1.Data) @[Fork_Join.scala 68:22]
    reg io_Out_Data_REG : UInt, ACG_Join.fire_o with :
      reset => (UInt<1>("h0"), io_Out_Data_REG) @[Fork_Join.scala 69:27]
    io_Out_Data_REG <= SelData @[Fork_Join.scala 69:27]
    io.Out.Data <= io_Out_Data_REG @[Fork_Join.scala 69:17]

  module Fork_Join :
    input clock : Clock
    input reset : UInt<1>
    output io : { In : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}, flip Out : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, flip Data : UInt<8>}}

    inst Fork of Fork @[Fork_Join.scala 82:20]
    Fork.clock <= clock
    Fork.reset <= reset
    inst Join of Join @[Fork_Join.scala 83:20]
    Join.clock <= clock
    Join.reset <= reset
    Fork.io.In.Data <= io.In.Data @[Fork_Join.scala 85:11]
    io.In.HS.Ack <= Fork.io.In.HS.Ack @[Fork_Join.scala 85:11]
    Fork.io.In.HS.Req <= io.In.HS.Req @[Fork_Join.scala 85:11]
    Fork.io.Out0 <= Join.io.In0 @[Fork_Join.scala 86:12]
    Fork.io.Out1 <= Join.io.In1 @[Fork_Join.scala 87:12]
    Join.io.Out <= io.Out @[Fork_Join.scala 88:10]


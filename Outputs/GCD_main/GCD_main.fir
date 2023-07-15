circuit GCD_main :
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
    node _empty_wire_PRO_T_7 = asUInt(fire_o) @[AsyncLib_ACG.scala 158:88]
    node _empty_wire_PRO_T_8 = bits(_empty_wire_PRO_T_7, 0, 0) @[AsyncLib_ACG.scala 158:88]
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
    node _empty_wire_PRO_T_13 = and(empty_wire_PRO, _empty_wire_PRO_T_12) @[AsyncLib_ACG.scala 158:28]
    empty <= _empty_wire_PRO_T_13 @[AsyncLib_ACG.scala 158:16]
    node fire_o_fire_and = and(full, empty) @[AsyncLib_ACG.scala 115:25]
    inst fire_o_Dfire of DelayElement_1 @[AsyncLib_ACG.scala 116:23]
    fire_o_Dfire.Z is invalid
    fire_o_Dfire.I is invalid
    fire_o_Dfire.I <= fire_o_fire_and @[AsyncLib_ACG.scala 123:18]
    node _fire_o_T = asClock(fire_o_Dfire.Z) @[AsyncLib_ACG.scala 164:36]
    fire_o <= _fire_o_T @[AsyncLib_ACG.scala 164:10]

  module CL_GCD :
    input clock : Clock
    input reset : Reset
    output io : { In : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, Data : { flip A : UInt<8>, flip B : UInt<8>}}, flip Out_Mux : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, Data : { flip A : UInt<8>, flip B : UInt<8>}}, flip Out : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, Data : { flip A : UInt<8>, flip B : UInt<8>}}, AB_Neq : UInt<1>}

    inst UAC_CL of ACG @[GCD_main.scala 36:30]
    UAC_CL.clock <= clock
    UAC_CL.reset <= reset
    wire wire_RF1_A : UInt<8> @[GCD_main.scala 41:44]
    wire wire_RF1_B : UInt<8> @[GCD_main.scala 41:44]
    io.In.HS.Ack <= UAC_CL.In[0].Ack @[GCD_main.scala 43:16]
    UAC_CL.In[0].Req <= io.In.HS.Req @[GCD_main.scala 43:16]
    UAC_CL.Out[0] <= io.Out.HS @[GCD_main.scala 44:17]
    UAC_CL.Out[1] <= io.Out_Mux.HS @[GCD_main.scala 45:17]
    node _UAC_CL_OutEn_0_T = eq(wire_RF1_A, wire_RF1_B) @[GCD_main.scala 46:33]
    UAC_CL.OutEn[0] <= _UAC_CL_OutEn_0_T @[GCD_main.scala 46:19]
    node _UAC_CL_OutEn_1_T = eq(UAC_CL.OutEn[0], UInt<1>("h0")) @[GCD_main.scala 47:22]
    UAC_CL.OutEn[1] <= _UAC_CL_OutEn_1_T @[GCD_main.scala 47:19]
    node _T = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    node _T_1 = gt(io.In.Data.A, io.In.Data.B) @[GCD_main.scala 50:23]
    when _T_1 : @[GCD_main.scala 50:38]
      node _wire_RF1_A_T = sub(io.In.Data.A, io.In.Data.B) @[GCD_main.scala 51:34]
      node _wire_RF1_A_T_1 = tail(_wire_RF1_A_T, 1) @[GCD_main.scala 51:34]
      wire_RF1_A <= _wire_RF1_A_T_1 @[GCD_main.scala 51:18]
      wire_RF1_B <= io.In.Data.B @[GCD_main.scala 52:18]
    else :
      wire_RF1_A <= io.In.Data.A @[GCD_main.scala 54:18]
      node _wire_RF1_B_T = sub(io.In.Data.B, io.In.Data.A) @[GCD_main.scala 55:34]
      node _wire_RF1_B_T_1 = tail(_wire_RF1_B_T, 1) @[GCD_main.scala 55:34]
      wire_RF1_B <= _wire_RF1_B_T_1 @[GCD_main.scala 55:18]
    reg io_Out_Data_A_REG : UInt, UAC_CL.fire_o with :
      reset => (UInt<1>("h0"), io_Out_Data_A_REG) @[GCD_main.scala 57:29]
    io_Out_Data_A_REG <= wire_RF1_A @[GCD_main.scala 57:29]
    io.Out.Data.A <= io_Out_Data_A_REG @[GCD_main.scala 57:19]
    reg io_Out_Data_B_REG : UInt, UAC_CL.fire_o with :
      reset => (UInt<1>("h0"), io_Out_Data_B_REG) @[GCD_main.scala 58:29]
    io_Out_Data_B_REG <= wire_RF1_B @[GCD_main.scala 58:29]
    io.Out.Data.B <= io_Out_Data_B_REG @[GCD_main.scala 58:19]
    io.Out_Mux.Data.A <= io.Out.Data.A @[GCD_main.scala 59:23]
    io.Out_Mux.Data.B <= io.Out.Data.B @[GCD_main.scala 60:23]
    node _io_AB_Neq_T = eq(UAC_CL.OutEn[0], UInt<1>("h0")) @[GCD_main.scala 61:26]
    reg io_AB_Neq_REG : UInt<1>, UAC_CL.fire_o with :
      reset => (_T, UInt<1>("h0")) @[GCD_main.scala 61:25]
    io_AB_Neq_REG <= _io_AB_Neq_T @[GCD_main.scala 61:25]
    io.AB_Neq <= io_AB_Neq_REG @[GCD_main.scala 61:15]

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

  module MUX_GCD :
    input clock : Clock
    input reset : Reset
    output io : { In : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, Data : { flip A : UInt<8>, flip B : UInt<8>}}, In_CL : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, Data : { flip A : UInt<8>, flip B : UInt<8>}}, flip Out : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, Data : { flip A : UInt<8>, flip B : UInt<8>}}, flip AB_Neq : UInt<1>}

    inst UAC_MUX of ACG_1 @[GCD_main.scala 68:23]
    UAC_MUX.clock <= clock
    UAC_MUX.reset <= reset
    io.In.HS.Ack <= UAC_MUX.In[0].Ack @[GCD_main.scala 74:17]
    UAC_MUX.In[0].Req <= io.In.HS.Req @[GCD_main.scala 74:17]
    io.In_CL.HS.Ack <= UAC_MUX.In[1].Ack @[GCD_main.scala 75:17]
    UAC_MUX.In[1].Req <= io.In_CL.HS.Req @[GCD_main.scala 75:17]
    UAC_MUX.Out[0] <= io.Out.HS @[GCD_main.scala 76:18]
    node _T = asAsyncReset(reset) @[AsyncLib_ACG.scala 175:37]
    node _io_Out_Data_A_T = mux(io.AB_Neq, io.In_CL.Data.A, io.In.Data.A) @[GCD_main.scala 79:33]
    reg io_Out_Data_A_REG : UInt, UAC_MUX.fire_o with :
      reset => (UInt<1>("h0"), io_Out_Data_A_REG) @[GCD_main.scala 79:29]
    io_Out_Data_A_REG <= _io_Out_Data_A_T @[GCD_main.scala 79:29]
    io.Out.Data.A <= io_Out_Data_A_REG @[GCD_main.scala 79:19]
    node _io_Out_Data_B_T = mux(io.AB_Neq, io.In_CL.Data.B, io.In.Data.B) @[GCD_main.scala 80:33]
    reg io_Out_Data_B_REG : UInt, UAC_MUX.fire_o with :
      reset => (UInt<1>("h0"), io_Out_Data_B_REG) @[GCD_main.scala 80:29]
    io_Out_Data_B_REG <= _io_Out_Data_B_T @[GCD_main.scala 80:29]
    io.Out.Data.B <= io_Out_Data_B_REG @[GCD_main.scala 80:19]

  module GCD_main :
    input clock : Clock
    input reset : UInt<1>
    output io : { In : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, Data : { flip A : UInt<8>, flip B : UInt<8>}}, flip Out : { HS : { flip Req : UInt<1>, Ack : UInt<1>}, Data : { flip A : UInt<8>, flip B : UInt<8>}}}

    inst CL_GCD of CL_GCD @[GCD_main.scala 21:18]
    CL_GCD.clock <= clock
    CL_GCD.reset <= reset
    inst MUX_GCD of MUX_GCD @[GCD_main.scala 22:19]
    MUX_GCD.clock <= clock
    MUX_GCD.reset <= reset
    MUX_GCD.io.In.Data.B <= io.In.Data.B @[GCD_main.scala 24:10]
    MUX_GCD.io.In.Data.A <= io.In.Data.A @[GCD_main.scala 24:10]
    io.In.HS.Ack <= MUX_GCD.io.In.HS.Ack @[GCD_main.scala 24:10]
    MUX_GCD.io.In.HS.Req <= io.In.HS.Req @[GCD_main.scala 24:10]
    CL_GCD.io.Out_Mux <= MUX_GCD.io.In_CL @[GCD_main.scala 25:13]
    MUX_GCD.io.AB_Neq <= CL_GCD.io.AB_Neq @[GCD_main.scala 26:14]
    MUX_GCD.io.Out <= CL_GCD.io.In @[GCD_main.scala 28:9]
    CL_GCD.io.Out <= io.Out @[GCD_main.scala 30:10]


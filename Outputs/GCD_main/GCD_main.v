module ACG(
  input   reset,
  input   In_0_Req,
  output  In_0_Ack,
  output  Out_0_Req,
  input   Out_0_Ack,
  output  Out_1_Req,
  input   Out_1_Ack,
  input   OutEn_0,
  input   OutEn_1,
  output  fire_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  full_wire_PRO_Dreq_I; // @[AsyncLib_ACG.scala 84:22]
  wire  full_wire_PRO_Dreq_Z; // @[AsyncLib_ACG.scala 84:22]
  wire  fire_o_Dfire_I; // @[AsyncLib_ACG.scala 116:23]
  wire  fire_o_Dfire_Z; // @[AsyncLib_ACG.scala 116:23]
  reg  full_wire_PRO_ff; // @[AsyncLib_ACG.scala 88:23]
  wire  full_wire_PRO_req_tmp = full_wire_PRO_Dreq_Z; // @[AsyncLib_ACG.scala 83:23 86:13]
  wire  full = In_0_Ack ^ full_wire_PRO_req_tmp; // @[AsyncLib_ACG.scala 96:12]
  reg  empty_wire_PRO_ff; // @[AsyncLib_ACG.scala 102:23]
  wire  empty_wire_PRO = ~(Out_0_Ack ^ Out_0_Req); // @[AsyncLib_ACG.scala 110:5]
  reg  empty_wire_PRO_ff_1; // @[AsyncLib_ACG.scala 102:23]
  wire  _empty_wire_PRO_T_12 = ~(Out_1_Ack ^ Out_1_Req); // @[AsyncLib_ACG.scala 110:5]
  wire  empty = empty_wire_PRO & _empty_wire_PRO_T_12; // @[AsyncLib_ACG.scala 158:28]
  DelayElement #(.DelayValue(5)) full_wire_PRO_Dreq ( // @[AsyncLib_ACG.scala 84:22]
    .I(full_wire_PRO_Dreq_I),
    .Z(full_wire_PRO_Dreq_Z)
  );
  DelayElement #(.DelayValue(1)) fire_o_Dfire ( // @[AsyncLib_ACG.scala 116:23]
    .I(fire_o_Dfire_I),
    .Z(fire_o_Dfire_Z)
  );
  assign In_0_Ack = full_wire_PRO_ff; // @[AsyncLib_ACG.scala 94:14]
  assign Out_0_Req = empty_wire_PRO_ff; // @[AsyncLib_ACG.scala 108:14]
  assign Out_1_Req = empty_wire_PRO_ff_1; // @[AsyncLib_ACG.scala 108:14]
  assign fire_o = fire_o_Dfire_Z; // @[AsyncLib_ACG.scala 164:36]
  assign full_wire_PRO_Dreq_I = In_0_Req; // @[AsyncLib_ACG.scala 85:15]
  assign fire_o_Dfire_I = full & empty; // @[AsyncLib_ACG.scala 115:25]
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 88:23]
      full_wire_PRO_ff <= 1'h0; // @[AsyncLib_ACG.scala 88:23]
    end else begin
      full_wire_PRO_ff <= In_0_Req; // @[AsyncLib_ACG.scala 92:12]
    end
  end
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 104:18]
      empty_wire_PRO_ff <= 1'h0;
    end else if (OutEn_0) begin
      empty_wire_PRO_ff <= ~Out_0_Ack;
    end else begin
      empty_wire_PRO_ff <= Out_0_Req;
    end
  end
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 104:18]
      empty_wire_PRO_ff_1 <= 1'h0;
    end else if (OutEn_1) begin
      empty_wire_PRO_ff_1 <= ~Out_1_Ack;
    end else begin
      empty_wire_PRO_ff_1 <= Out_1_Req;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  full_wire_PRO_ff = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  empty_wire_PRO_ff = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  empty_wire_PRO_ff_1 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    full_wire_PRO_ff = 1'h0;
  end
  if (reset) begin
    empty_wire_PRO_ff = 1'h0;
  end
  if (reset) begin
    empty_wire_PRO_ff_1 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CL_GCD(
  input        reset,
  input        io_In_HS_Req,
  output       io_In_HS_Ack,
  input  [7:0] io_In_Data_A,
  input  [7:0] io_In_Data_B,
  output       io_Out_Mux_HS_Req,
  input        io_Out_Mux_HS_Ack,
  output [7:0] io_Out_Mux_Data_A,
  output [7:0] io_Out_Mux_Data_B,
  output       io_Out_HS_Req,
  input        io_Out_HS_Ack,
  output [7:0] io_Out_Data_A,
  output [7:0] io_Out_Data_B,
  output       io_AB_Neq
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  UAC_CL_reset; // @[GCD_main.scala 36:30]
  wire  UAC_CL_In_0_Req; // @[GCD_main.scala 36:30]
  wire  UAC_CL_In_0_Ack; // @[GCD_main.scala 36:30]
  wire  UAC_CL_Out_0_Req; // @[GCD_main.scala 36:30]
  wire  UAC_CL_Out_0_Ack; // @[GCD_main.scala 36:30]
  wire  UAC_CL_Out_1_Req; // @[GCD_main.scala 36:30]
  wire  UAC_CL_Out_1_Ack; // @[GCD_main.scala 36:30]
  wire  UAC_CL_OutEn_0; // @[GCD_main.scala 36:30]
  wire  UAC_CL_OutEn_1; // @[GCD_main.scala 36:30]
  wire  UAC_CL_fire_o; // @[GCD_main.scala 36:30]
  wire [7:0] _wire_RF1_A_T_1 = io_In_Data_A - io_In_Data_B; // @[GCD_main.scala 51:34]
  wire [7:0] wire_RF1_A = io_In_Data_A > io_In_Data_B ? _wire_RF1_A_T_1 : io_In_Data_A; // @[GCD_main.scala 50:38 51:18 54:18]
  wire [7:0] _wire_RF1_B_T_1 = io_In_Data_B - io_In_Data_A; // @[GCD_main.scala 55:34]
  wire [7:0] wire_RF1_B = io_In_Data_A > io_In_Data_B ? io_In_Data_B : _wire_RF1_B_T_1; // @[GCD_main.scala 50:38 52:18 55:18]
  reg [7:0] io_Out_Data_A_REG; // @[GCD_main.scala 57:29]
  reg [7:0] io_Out_Data_B_REG; // @[GCD_main.scala 58:29]
  reg  io_AB_Neq_REG; // @[GCD_main.scala 61:25]
  ACG UAC_CL ( // @[GCD_main.scala 36:30]
    .reset(UAC_CL_reset),
    .In_0_Req(UAC_CL_In_0_Req),
    .In_0_Ack(UAC_CL_In_0_Ack),
    .Out_0_Req(UAC_CL_Out_0_Req),
    .Out_0_Ack(UAC_CL_Out_0_Ack),
    .Out_1_Req(UAC_CL_Out_1_Req),
    .Out_1_Ack(UAC_CL_Out_1_Ack),
    .OutEn_0(UAC_CL_OutEn_0),
    .OutEn_1(UAC_CL_OutEn_1),
    .fire_o(UAC_CL_fire_o)
  );
  assign io_In_HS_Ack = UAC_CL_In_0_Ack; // @[GCD_main.scala 43:16]
  assign io_Out_Mux_HS_Req = UAC_CL_Out_1_Req; // @[GCD_main.scala 45:17]
  assign io_Out_Mux_Data_A = io_Out_Data_A; // @[GCD_main.scala 59:23]
  assign io_Out_Mux_Data_B = io_Out_Data_B; // @[GCD_main.scala 60:23]
  assign io_Out_HS_Req = UAC_CL_Out_0_Req; // @[GCD_main.scala 44:17]
  assign io_Out_Data_A = io_Out_Data_A_REG; // @[GCD_main.scala 57:19]
  assign io_Out_Data_B = io_Out_Data_B_REG; // @[GCD_main.scala 58:19]
  assign io_AB_Neq = io_AB_Neq_REG; // @[GCD_main.scala 61:15]
  assign UAC_CL_reset = reset;
  assign UAC_CL_In_0_Req = io_In_HS_Req; // @[GCD_main.scala 43:16]
  assign UAC_CL_Out_0_Ack = io_Out_HS_Ack; // @[GCD_main.scala 44:17]
  assign UAC_CL_Out_1_Ack = io_Out_Mux_HS_Ack; // @[GCD_main.scala 45:17]
  assign UAC_CL_OutEn_0 = wire_RF1_A == wire_RF1_B; // @[GCD_main.scala 46:33]
  assign UAC_CL_OutEn_1 = ~UAC_CL_OutEn_0; // @[GCD_main.scala 47:22]
  always @(posedge UAC_CL_fire_o) begin
    if (io_In_Data_A > io_In_Data_B) begin // @[GCD_main.scala 50:38]
      io_Out_Data_A_REG <= _wire_RF1_A_T_1; // @[GCD_main.scala 51:18]
    end else begin
      io_Out_Data_A_REG <= io_In_Data_A; // @[GCD_main.scala 54:18]
    end
    if (io_In_Data_A > io_In_Data_B) begin // @[GCD_main.scala 50:38]
      io_Out_Data_B_REG <= io_In_Data_B; // @[GCD_main.scala 52:18]
    end else begin
      io_Out_Data_B_REG <= _wire_RF1_B_T_1; // @[GCD_main.scala 55:18]
    end
  end
  always @(posedge UAC_CL_fire_o or posedge reset) begin
    if (reset) begin // @[GCD_main.scala 61:26]
      io_AB_Neq_REG <= 1'h0;
    end else begin
      io_AB_Neq_REG <= ~UAC_CL_OutEn_0;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_Out_Data_A_REG = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  io_Out_Data_B_REG = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  io_AB_Neq_REG = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    io_AB_Neq_REG = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ACG_1(
  input   reset,
  input   In_0_Req,
  output  In_0_Ack,
  input   In_1_Req,
  output  In_1_Ack,
  output  Out_0_Req,
  input   Out_0_Ack,
  output  fire_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  full_wire_PRO_Dreq_I; // @[AsyncLib_ACG.scala 84:22]
  wire  full_wire_PRO_Dreq_Z; // @[AsyncLib_ACG.scala 84:22]
  wire  full_wire_PRO_Dreq_1_I; // @[AsyncLib_ACG.scala 84:22]
  wire  full_wire_PRO_Dreq_1_Z; // @[AsyncLib_ACG.scala 84:22]
  wire  fire_o_Dfire_I; // @[AsyncLib_ACG.scala 116:23]
  wire  fire_o_Dfire_Z; // @[AsyncLib_ACG.scala 116:23]
  reg  full_wire_PRO_ff; // @[AsyncLib_ACG.scala 88:23]
  wire  full_wire_PRO_req_tmp = full_wire_PRO_Dreq_Z; // @[AsyncLib_ACG.scala 83:23 86:13]
  wire  full_wire_PRO = In_0_Ack ^ full_wire_PRO_req_tmp; // @[AsyncLib_ACG.scala 96:12]
  reg  full_wire_PRO_ff_1; // @[AsyncLib_ACG.scala 88:23]
  wire  full_wire_PRO_req_tmp_1 = full_wire_PRO_Dreq_1_Z; // @[AsyncLib_ACG.scala 83:23 86:13]
  wire  _full_wire_PRO_T_10 = In_1_Ack ^ full_wire_PRO_req_tmp_1; // @[AsyncLib_ACG.scala 96:12]
  wire  full = full_wire_PRO | _full_wire_PRO_T_10; // @[AsyncLib_ACG.scala 139:27]
  reg  empty_wire_PRO_ff; // @[AsyncLib_ACG.scala 102:23]
  wire  empty = ~(Out_0_Ack ^ Out_0_Req); // @[AsyncLib_ACG.scala 110:5]
  DelayElement #(.DelayValue(5)) full_wire_PRO_Dreq ( // @[AsyncLib_ACG.scala 84:22]
    .I(full_wire_PRO_Dreq_I),
    .Z(full_wire_PRO_Dreq_Z)
  );
  DelayElement #(.DelayValue(5)) full_wire_PRO_Dreq_1 ( // @[AsyncLib_ACG.scala 84:22]
    .I(full_wire_PRO_Dreq_1_I),
    .Z(full_wire_PRO_Dreq_1_Z)
  );
  DelayElement #(.DelayValue(1)) fire_o_Dfire ( // @[AsyncLib_ACG.scala 116:23]
    .I(fire_o_Dfire_I),
    .Z(fire_o_Dfire_Z)
  );
  assign In_0_Ack = full_wire_PRO_ff; // @[AsyncLib_ACG.scala 94:14]
  assign In_1_Ack = full_wire_PRO_ff_1; // @[AsyncLib_ACG.scala 94:14]
  assign Out_0_Req = empty_wire_PRO_ff; // @[AsyncLib_ACG.scala 108:14]
  assign fire_o = fire_o_Dfire_Z; // @[AsyncLib_ACG.scala 164:36]
  assign full_wire_PRO_Dreq_I = In_0_Req; // @[AsyncLib_ACG.scala 85:15]
  assign full_wire_PRO_Dreq_1_I = In_1_Req; // @[AsyncLib_ACG.scala 85:15]
  assign fire_o_Dfire_I = full & empty; // @[AsyncLib_ACG.scala 115:25]
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 88:23]
      full_wire_PRO_ff <= 1'h0; // @[AsyncLib_ACG.scala 88:23]
    end else begin
      full_wire_PRO_ff <= In_0_Req; // @[AsyncLib_ACG.scala 92:12]
    end
  end
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 88:23]
      full_wire_PRO_ff_1 <= 1'h0; // @[AsyncLib_ACG.scala 88:23]
    end else begin
      full_wire_PRO_ff_1 <= In_1_Req; // @[AsyncLib_ACG.scala 92:12]
    end
  end
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 106:15]
      empty_wire_PRO_ff <= 1'h0;
    end else begin
      empty_wire_PRO_ff <= ~Out_0_Ack;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  full_wire_PRO_ff = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  full_wire_PRO_ff_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  empty_wire_PRO_ff = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    full_wire_PRO_ff = 1'h0;
  end
  if (reset) begin
    full_wire_PRO_ff_1 = 1'h0;
  end
  if (reset) begin
    empty_wire_PRO_ff = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MUX_GCD(
  input        reset,
  input        io_In_HS_Req,
  output       io_In_HS_Ack,
  input  [7:0] io_In_Data_A,
  input  [7:0] io_In_Data_B,
  input        io_In_CL_HS_Req,
  output       io_In_CL_HS_Ack,
  input  [7:0] io_In_CL_Data_A,
  input  [7:0] io_In_CL_Data_B,
  output       io_Out_HS_Req,
  input        io_Out_HS_Ack,
  output [7:0] io_Out_Data_A,
  output [7:0] io_Out_Data_B,
  input        io_AB_Neq
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  UAC_MUX_reset; // @[GCD_main.scala 68:23]
  wire  UAC_MUX_In_0_Req; // @[GCD_main.scala 68:23]
  wire  UAC_MUX_In_0_Ack; // @[GCD_main.scala 68:23]
  wire  UAC_MUX_In_1_Req; // @[GCD_main.scala 68:23]
  wire  UAC_MUX_In_1_Ack; // @[GCD_main.scala 68:23]
  wire  UAC_MUX_Out_0_Req; // @[GCD_main.scala 68:23]
  wire  UAC_MUX_Out_0_Ack; // @[GCD_main.scala 68:23]
  wire  UAC_MUX_fire_o; // @[GCD_main.scala 68:23]
  reg [7:0] io_Out_Data_A_REG; // @[GCD_main.scala 79:29]
  reg [7:0] io_Out_Data_B_REG; // @[GCD_main.scala 80:29]
  ACG_1 UAC_MUX ( // @[GCD_main.scala 68:23]
    .reset(UAC_MUX_reset),
    .In_0_Req(UAC_MUX_In_0_Req),
    .In_0_Ack(UAC_MUX_In_0_Ack),
    .In_1_Req(UAC_MUX_In_1_Req),
    .In_1_Ack(UAC_MUX_In_1_Ack),
    .Out_0_Req(UAC_MUX_Out_0_Req),
    .Out_0_Ack(UAC_MUX_Out_0_Ack),
    .fire_o(UAC_MUX_fire_o)
  );
  assign io_In_HS_Ack = UAC_MUX_In_0_Ack; // @[GCD_main.scala 74:17]
  assign io_In_CL_HS_Ack = UAC_MUX_In_1_Ack; // @[GCD_main.scala 75:17]
  assign io_Out_HS_Req = UAC_MUX_Out_0_Req; // @[GCD_main.scala 76:18]
  assign io_Out_Data_A = io_Out_Data_A_REG; // @[GCD_main.scala 79:19]
  assign io_Out_Data_B = io_Out_Data_B_REG; // @[GCD_main.scala 80:19]
  assign UAC_MUX_reset = reset;
  assign UAC_MUX_In_0_Req = io_In_HS_Req; // @[GCD_main.scala 74:17]
  assign UAC_MUX_In_1_Req = io_In_CL_HS_Req; // @[GCD_main.scala 75:17]
  assign UAC_MUX_Out_0_Ack = io_Out_HS_Ack; // @[GCD_main.scala 76:18]
  always @(posedge UAC_MUX_fire_o) begin
    if (io_AB_Neq) begin // @[GCD_main.scala 79:33]
      io_Out_Data_A_REG <= io_In_CL_Data_A;
    end else begin
      io_Out_Data_A_REG <= io_In_Data_A;
    end
    if (io_AB_Neq) begin // @[GCD_main.scala 80:33]
      io_Out_Data_B_REG <= io_In_CL_Data_B;
    end else begin
      io_Out_Data_B_REG <= io_In_Data_B;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_Out_Data_A_REG = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  io_Out_Data_B_REG = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module GCD_main(
  input        clock,
  input        reset,
  input        io_In_HS_Req,
  output       io_In_HS_Ack,
  input  [7:0] io_In_Data_A,
  input  [7:0] io_In_Data_B,
  output       io_Out_HS_Req,
  input        io_Out_HS_Ack,
  output [7:0] io_Out_Data_A,
  output [7:0] io_Out_Data_B
);
  wire  CL_GCD_reset; // @[GCD_main.scala 21:18]
  wire  CL_GCD_io_In_HS_Req; // @[GCD_main.scala 21:18]
  wire  CL_GCD_io_In_HS_Ack; // @[GCD_main.scala 21:18]
  wire [7:0] CL_GCD_io_In_Data_A; // @[GCD_main.scala 21:18]
  wire [7:0] CL_GCD_io_In_Data_B; // @[GCD_main.scala 21:18]
  wire  CL_GCD_io_Out_Mux_HS_Req; // @[GCD_main.scala 21:18]
  wire  CL_GCD_io_Out_Mux_HS_Ack; // @[GCD_main.scala 21:18]
  wire [7:0] CL_GCD_io_Out_Mux_Data_A; // @[GCD_main.scala 21:18]
  wire [7:0] CL_GCD_io_Out_Mux_Data_B; // @[GCD_main.scala 21:18]
  wire  CL_GCD_io_Out_HS_Req; // @[GCD_main.scala 21:18]
  wire  CL_GCD_io_Out_HS_Ack; // @[GCD_main.scala 21:18]
  wire [7:0] CL_GCD_io_Out_Data_A; // @[GCD_main.scala 21:18]
  wire [7:0] CL_GCD_io_Out_Data_B; // @[GCD_main.scala 21:18]
  wire  CL_GCD_io_AB_Neq; // @[GCD_main.scala 21:18]
  wire  MUX_GCD_reset; // @[GCD_main.scala 22:19]
  wire  MUX_GCD_io_In_HS_Req; // @[GCD_main.scala 22:19]
  wire  MUX_GCD_io_In_HS_Ack; // @[GCD_main.scala 22:19]
  wire [7:0] MUX_GCD_io_In_Data_A; // @[GCD_main.scala 22:19]
  wire [7:0] MUX_GCD_io_In_Data_B; // @[GCD_main.scala 22:19]
  wire  MUX_GCD_io_In_CL_HS_Req; // @[GCD_main.scala 22:19]
  wire  MUX_GCD_io_In_CL_HS_Ack; // @[GCD_main.scala 22:19]
  wire [7:0] MUX_GCD_io_In_CL_Data_A; // @[GCD_main.scala 22:19]
  wire [7:0] MUX_GCD_io_In_CL_Data_B; // @[GCD_main.scala 22:19]
  wire  MUX_GCD_io_Out_HS_Req; // @[GCD_main.scala 22:19]
  wire  MUX_GCD_io_Out_HS_Ack; // @[GCD_main.scala 22:19]
  wire [7:0] MUX_GCD_io_Out_Data_A; // @[GCD_main.scala 22:19]
  wire [7:0] MUX_GCD_io_Out_Data_B; // @[GCD_main.scala 22:19]
  wire  MUX_GCD_io_AB_Neq; // @[GCD_main.scala 22:19]
  CL_GCD CL_GCD ( // @[GCD_main.scala 21:18]
    .reset(CL_GCD_reset),
    .io_In_HS_Req(CL_GCD_io_In_HS_Req),
    .io_In_HS_Ack(CL_GCD_io_In_HS_Ack),
    .io_In_Data_A(CL_GCD_io_In_Data_A),
    .io_In_Data_B(CL_GCD_io_In_Data_B),
    .io_Out_Mux_HS_Req(CL_GCD_io_Out_Mux_HS_Req),
    .io_Out_Mux_HS_Ack(CL_GCD_io_Out_Mux_HS_Ack),
    .io_Out_Mux_Data_A(CL_GCD_io_Out_Mux_Data_A),
    .io_Out_Mux_Data_B(CL_GCD_io_Out_Mux_Data_B),
    .io_Out_HS_Req(CL_GCD_io_Out_HS_Req),
    .io_Out_HS_Ack(CL_GCD_io_Out_HS_Ack),
    .io_Out_Data_A(CL_GCD_io_Out_Data_A),
    .io_Out_Data_B(CL_GCD_io_Out_Data_B),
    .io_AB_Neq(CL_GCD_io_AB_Neq)
  );
  MUX_GCD MUX_GCD ( // @[GCD_main.scala 22:19]
    .reset(MUX_GCD_reset),
    .io_In_HS_Req(MUX_GCD_io_In_HS_Req),
    .io_In_HS_Ack(MUX_GCD_io_In_HS_Ack),
    .io_In_Data_A(MUX_GCD_io_In_Data_A),
    .io_In_Data_B(MUX_GCD_io_In_Data_B),
    .io_In_CL_HS_Req(MUX_GCD_io_In_CL_HS_Req),
    .io_In_CL_HS_Ack(MUX_GCD_io_In_CL_HS_Ack),
    .io_In_CL_Data_A(MUX_GCD_io_In_CL_Data_A),
    .io_In_CL_Data_B(MUX_GCD_io_In_CL_Data_B),
    .io_Out_HS_Req(MUX_GCD_io_Out_HS_Req),
    .io_Out_HS_Ack(MUX_GCD_io_Out_HS_Ack),
    .io_Out_Data_A(MUX_GCD_io_Out_Data_A),
    .io_Out_Data_B(MUX_GCD_io_Out_Data_B),
    .io_AB_Neq(MUX_GCD_io_AB_Neq)
  );
  assign io_In_HS_Ack = MUX_GCD_io_In_HS_Ack; // @[GCD_main.scala 24:10]
  assign io_Out_HS_Req = CL_GCD_io_Out_HS_Req; // @[GCD_main.scala 30:10]
  assign io_Out_Data_A = CL_GCD_io_Out_Data_A; // @[GCD_main.scala 30:10]
  assign io_Out_Data_B = CL_GCD_io_Out_Data_B; // @[GCD_main.scala 30:10]
  assign CL_GCD_reset = reset;
  assign CL_GCD_io_In_HS_Req = MUX_GCD_io_Out_HS_Req; // @[GCD_main.scala 28:9]
  assign CL_GCD_io_In_Data_A = MUX_GCD_io_Out_Data_A; // @[GCD_main.scala 28:9]
  assign CL_GCD_io_In_Data_B = MUX_GCD_io_Out_Data_B; // @[GCD_main.scala 28:9]
  assign CL_GCD_io_Out_Mux_HS_Ack = MUX_GCD_io_In_CL_HS_Ack; // @[GCD_main.scala 25:13]
  assign CL_GCD_io_Out_HS_Ack = io_Out_HS_Ack; // @[GCD_main.scala 30:10]
  assign MUX_GCD_reset = reset;
  assign MUX_GCD_io_In_HS_Req = io_In_HS_Req; // @[GCD_main.scala 24:10]
  assign MUX_GCD_io_In_Data_A = io_In_Data_A; // @[GCD_main.scala 24:10]
  assign MUX_GCD_io_In_Data_B = io_In_Data_B; // @[GCD_main.scala 24:10]
  assign MUX_GCD_io_In_CL_HS_Req = CL_GCD_io_Out_Mux_HS_Req; // @[GCD_main.scala 25:13]
  assign MUX_GCD_io_In_CL_Data_A = CL_GCD_io_Out_Mux_Data_A; // @[GCD_main.scala 25:13]
  assign MUX_GCD_io_In_CL_Data_B = CL_GCD_io_Out_Mux_Data_B; // @[GCD_main.scala 25:13]
  assign MUX_GCD_io_Out_HS_Ack = CL_GCD_io_In_HS_Ack; // @[GCD_main.scala 28:9]
  assign MUX_GCD_io_AB_Neq = CL_GCD_io_AB_Neq; // @[GCD_main.scala 26:14]
endmodule

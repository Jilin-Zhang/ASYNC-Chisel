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
  wire  empty = empty_wire_PRO | _empty_wire_PRO_T_12; // @[AsyncLib_ACG.scala 156:28]
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
module Fork(
  input        reset,
  input        io_In_HS_Req,
  output       io_In_HS_Ack,
  input  [7:0] io_In_Data,
  output       io_Out0_HS_Req,
  input        io_Out0_HS_Ack,
  output [7:0] io_Out0_Data,
  output       io_Out1_HS_Req,
  input        io_Out1_HS_Ack,
  output [7:0] io_Out1_Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  ACG_reset; // @[Fork_Join.scala 18:27]
  wire  ACG_In_0_Req; // @[Fork_Join.scala 18:27]
  wire  ACG_In_0_Ack; // @[Fork_Join.scala 18:27]
  wire  ACG_Out_0_Req; // @[Fork_Join.scala 18:27]
  wire  ACG_Out_0_Ack; // @[Fork_Join.scala 18:27]
  wire  ACG_Out_1_Req; // @[Fork_Join.scala 18:27]
  wire  ACG_Out_1_Ack; // @[Fork_Join.scala 18:27]
  wire  ACG_OutEn_0; // @[Fork_Join.scala 18:27]
  wire  ACG_OutEn_1; // @[Fork_Join.scala 18:27]
  wire  ACG_fire_o; // @[Fork_Join.scala 18:27]
  reg  ff_sel; // @[Fork_Join.scala 34:25]
  reg [7:0] ff_Data0; // @[Fork_Join.scala 33:33]
  reg [7:0] ff_Data1; // @[Fork_Join.scala 33:33]
  ACG ACG ( // @[Fork_Join.scala 18:27]
    .reset(ACG_reset),
    .In_0_Req(ACG_In_0_Req),
    .In_0_Ack(ACG_In_0_Ack),
    .Out_0_Req(ACG_Out_0_Req),
    .Out_0_Ack(ACG_Out_0_Ack),
    .Out_1_Req(ACG_Out_1_Req),
    .Out_1_Ack(ACG_Out_1_Ack),
    .OutEn_0(ACG_OutEn_0),
    .OutEn_1(ACG_OutEn_1),
    .fire_o(ACG_fire_o)
  );
  assign io_In_HS_Ack = ACG_In_0_Ack; // @[Fork_Join.scala 26:13]
  assign io_Out0_HS_Req = ACG_Out_0_Req; // @[Fork_Join.scala 27:14]
  assign io_Out0_Data = ff_Data0; // @[Fork_Join.scala 41:18]
  assign io_Out1_HS_Req = ACG_Out_1_Req; // @[Fork_Join.scala 28:14]
  assign io_Out1_Data = ff_Data1; // @[Fork_Join.scala 42:18]
  assign ACG_reset = reset;
  assign ACG_In_0_Req = io_In_HS_Req; // @[Fork_Join.scala 26:13]
  assign ACG_Out_0_Ack = io_Out0_HS_Ack; // @[Fork_Join.scala 27:14]
  assign ACG_Out_1_Ack = io_Out1_HS_Ack; // @[Fork_Join.scala 28:14]
  assign ACG_OutEn_0 = ~ff_sel; // @[Fork_Join.scala 29:19]
  assign ACG_OutEn_1 = ff_sel; // @[Fork_Join.scala 24:25 43:9]
  always @(posedge ACG_fire_o) begin
    if (!(ff_sel)) begin // @[Fork_Join.scala 35:15]
      ff_Data0 <= io_In_Data; // @[Fork_Join.scala 38:16]
    end
    if (ff_sel) begin // @[Fork_Join.scala 35:15]
      ff_Data1 <= io_In_Data; // @[Fork_Join.scala 36:16]
    end
  end
  always @(posedge ACG_fire_o or posedge reset) begin
    if (reset) begin // @[Fork_Join.scala 40:15]
      ff_sel <= 1'h0;
    end else begin
      ff_sel <= ~ff_sel;
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
  ff_sel = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  ff_Data0 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  ff_Data1 = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ff_sel = 1'h0;
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
module Join(
  input        reset,
  input        io_In0_HS_Req,
  output       io_In0_HS_Ack,
  input  [7:0] io_In0_Data,
  input        io_In1_HS_Req,
  output       io_In1_HS_Ack,
  input  [7:0] io_In1_Data,
  output       io_Out_HS_Req,
  input        io_Out_HS_Ack,
  output [7:0] io_Out_Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  ACG_Join_reset; // @[Fork_Join.scala 57:32]
  wire  ACG_Join_In_0_Req; // @[Fork_Join.scala 57:32]
  wire  ACG_Join_In_0_Ack; // @[Fork_Join.scala 57:32]
  wire  ACG_Join_In_1_Req; // @[Fork_Join.scala 57:32]
  wire  ACG_Join_In_1_Ack; // @[Fork_Join.scala 57:32]
  wire  ACG_Join_Out_0_Req; // @[Fork_Join.scala 57:32]
  wire  ACG_Join_Out_0_Ack; // @[Fork_Join.scala 57:32]
  wire  ACG_Join_fire_o; // @[Fork_Join.scala 57:32]
  reg [7:0] io_Out_Data_REG; // @[Fork_Join.scala 69:27]
  ACG_1 ACG_Join ( // @[Fork_Join.scala 57:32]
    .reset(ACG_Join_reset),
    .In_0_Req(ACG_Join_In_0_Req),
    .In_0_Ack(ACG_Join_In_0_Ack),
    .In_1_Req(ACG_Join_In_1_Req),
    .In_1_Ack(ACG_Join_In_1_Ack),
    .Out_0_Req(ACG_Join_Out_0_Req),
    .Out_0_Ack(ACG_Join_Out_0_Ack),
    .fire_o(ACG_Join_fire_o)
  );
  assign io_In0_HS_Ack = ACG_Join_In_0_Ack; // @[Fork_Join.scala 63:18]
  assign io_In1_HS_Ack = ACG_Join_In_1_Ack; // @[Fork_Join.scala 64:18]
  assign io_Out_HS_Req = ACG_Join_Out_0_Req; // @[Fork_Join.scala 65:19]
  assign io_Out_Data = io_Out_Data_REG; // @[Fork_Join.scala 69:17]
  assign ACG_Join_reset = reset;
  assign ACG_Join_In_0_Req = io_In0_HS_Req; // @[Fork_Join.scala 63:18]
  assign ACG_Join_In_1_Req = io_In1_HS_Req; // @[Fork_Join.scala 64:18]
  assign ACG_Join_Out_0_Ack = io_Out_HS_Ack; // @[Fork_Join.scala 65:19]
  always @(posedge ACG_Join_fire_o) begin
    if (io_In0_HS_Req ^ io_In0_HS_Ack) begin // @[Fork_Join.scala 68:22]
      io_Out_Data_REG <= io_In0_Data;
    end else begin
      io_Out_Data_REG <= io_In1_Data;
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
  io_Out_Data_REG = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Fork_Join(
  input        clock,
  input        reset,
  input        io_In_HS_Req,
  output       io_In_HS_Ack,
  input  [7:0] io_In_Data,
  output       io_Out_HS_Req,
  input        io_Out_HS_Ack,
  output [7:0] io_Out_Data
);
  wire  Fork_reset; // @[Fork_Join.scala 82:20]
  wire  Fork_io_In_HS_Req; // @[Fork_Join.scala 82:20]
  wire  Fork_io_In_HS_Ack; // @[Fork_Join.scala 82:20]
  wire [7:0] Fork_io_In_Data; // @[Fork_Join.scala 82:20]
  wire  Fork_io_Out0_HS_Req; // @[Fork_Join.scala 82:20]
  wire  Fork_io_Out0_HS_Ack; // @[Fork_Join.scala 82:20]
  wire [7:0] Fork_io_Out0_Data; // @[Fork_Join.scala 82:20]
  wire  Fork_io_Out1_HS_Req; // @[Fork_Join.scala 82:20]
  wire  Fork_io_Out1_HS_Ack; // @[Fork_Join.scala 82:20]
  wire [7:0] Fork_io_Out1_Data; // @[Fork_Join.scala 82:20]
  wire  Join_reset; // @[Fork_Join.scala 83:20]
  wire  Join_io_In0_HS_Req; // @[Fork_Join.scala 83:20]
  wire  Join_io_In0_HS_Ack; // @[Fork_Join.scala 83:20]
  wire [7:0] Join_io_In0_Data; // @[Fork_Join.scala 83:20]
  wire  Join_io_In1_HS_Req; // @[Fork_Join.scala 83:20]
  wire  Join_io_In1_HS_Ack; // @[Fork_Join.scala 83:20]
  wire [7:0] Join_io_In1_Data; // @[Fork_Join.scala 83:20]
  wire  Join_io_Out_HS_Req; // @[Fork_Join.scala 83:20]
  wire  Join_io_Out_HS_Ack; // @[Fork_Join.scala 83:20]
  wire [7:0] Join_io_Out_Data; // @[Fork_Join.scala 83:20]
  Fork Fork ( // @[Fork_Join.scala 82:20]
    .reset(Fork_reset),
    .io_In_HS_Req(Fork_io_In_HS_Req),
    .io_In_HS_Ack(Fork_io_In_HS_Ack),
    .io_In_Data(Fork_io_In_Data),
    .io_Out0_HS_Req(Fork_io_Out0_HS_Req),
    .io_Out0_HS_Ack(Fork_io_Out0_HS_Ack),
    .io_Out0_Data(Fork_io_Out0_Data),
    .io_Out1_HS_Req(Fork_io_Out1_HS_Req),
    .io_Out1_HS_Ack(Fork_io_Out1_HS_Ack),
    .io_Out1_Data(Fork_io_Out1_Data)
  );
  Join Join ( // @[Fork_Join.scala 83:20]
    .reset(Join_reset),
    .io_In0_HS_Req(Join_io_In0_HS_Req),
    .io_In0_HS_Ack(Join_io_In0_HS_Ack),
    .io_In0_Data(Join_io_In0_Data),
    .io_In1_HS_Req(Join_io_In1_HS_Req),
    .io_In1_HS_Ack(Join_io_In1_HS_Ack),
    .io_In1_Data(Join_io_In1_Data),
    .io_Out_HS_Req(Join_io_Out_HS_Req),
    .io_Out_HS_Ack(Join_io_Out_HS_Ack),
    .io_Out_Data(Join_io_Out_Data)
  );
  assign io_In_HS_Ack = Fork_io_In_HS_Ack; // @[Fork_Join.scala 85:11]
  assign io_Out_HS_Req = Join_io_Out_HS_Req; // @[Fork_Join.scala 88:10]
  assign io_Out_Data = Join_io_Out_Data; // @[Fork_Join.scala 88:10]
  assign Fork_reset = reset;
  assign Fork_io_In_HS_Req = io_In_HS_Req; // @[Fork_Join.scala 85:11]
  assign Fork_io_In_Data = io_In_Data; // @[Fork_Join.scala 85:11]
  assign Fork_io_Out0_HS_Ack = Join_io_In0_HS_Ack; // @[Fork_Join.scala 86:12]
  assign Fork_io_Out1_HS_Ack = Join_io_In1_HS_Ack; // @[Fork_Join.scala 87:12]
  assign Join_reset = reset;
  assign Join_io_In0_HS_Req = Fork_io_Out0_HS_Req; // @[Fork_Join.scala 86:12]
  assign Join_io_In0_Data = Fork_io_Out0_Data; // @[Fork_Join.scala 86:12]
  assign Join_io_In1_HS_Req = Fork_io_Out1_HS_Req; // @[Fork_Join.scala 87:12]
  assign Join_io_In1_Data = Fork_io_Out1_Data; // @[Fork_Join.scala 87:12]
  assign Join_io_Out_HS_Ack = io_Out_HS_Ack; // @[Fork_Join.scala 88:10]
endmodule

module ACG(
  input   reset,
  input   In_0_Req,
  output  In_0_Ack,
  output  Out_0_Req,
  input   Out_0_Ack,
  output  fire_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  full_wire_PRO_Dreq_I; // @[AsyncLib_ACG.scala 84:22]
  wire  full_wire_PRO_Dreq_Z; // @[AsyncLib_ACG.scala 84:22]
  wire  fire_o_Dfire_I; // @[AsyncLib_ACG.scala 116:23]
  wire  fire_o_Dfire_Z; // @[AsyncLib_ACG.scala 116:23]
  reg  full_wire_PRO_ff; // @[AsyncLib_ACG.scala 88:23]
  wire  full_wire_PRO_req_tmp = full_wire_PRO_Dreq_Z; // @[AsyncLib_ACG.scala 83:23 86:13]
  wire  full = In_0_Ack ^ full_wire_PRO_req_tmp; // @[AsyncLib_ACG.scala 96:12]
  reg  empty_wire_PRO_ff; // @[AsyncLib_ACG.scala 102:23]
  wire  empty = ~(Out_0_Ack ^ Out_0_Req); // @[AsyncLib_ACG.scala 110:5]
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
  empty_wire_PRO_ff = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    full_wire_PRO_ff = 1'h0;
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
module FIFO(
  input        clock,
  input        reset,
  input        io_In_HS_Req,
  output       io_In_HS_Ack,
  input  [7:0] io_In_Data,
  output       io_Out_HS_Req,
  input        io_Out_HS_Ack,
  output [7:0] io_Out_Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  ACG_reset; // @[FIFO.scala 17:27]
  wire  ACG_In_0_Req; // @[FIFO.scala 17:27]
  wire  ACG_In_0_Ack; // @[FIFO.scala 17:27]
  wire  ACG_Out_0_Req; // @[FIFO.scala 17:27]
  wire  ACG_Out_0_Ack; // @[FIFO.scala 17:27]
  wire  ACG_fire_o; // @[FIFO.scala 17:27]
  reg [7:0] io_Out_Data_REG; // @[FIFO.scala 26:27]
  ACG ACG ( // @[FIFO.scala 17:27]
    .reset(ACG_reset),
    .In_0_Req(ACG_In_0_Req),
    .In_0_Ack(ACG_In_0_Ack),
    .Out_0_Req(ACG_Out_0_Req),
    .Out_0_Ack(ACG_Out_0_Ack),
    .fire_o(ACG_fire_o)
  );
  assign io_In_HS_Ack = ACG_In_0_Ack; // @[FIFO.scala 22:13]
  assign io_Out_HS_Req = ACG_Out_0_Req; // @[FIFO.scala 23:14]
  assign io_Out_Data = io_Out_Data_REG; // @[FIFO.scala 26:17]
  assign ACG_reset = reset;
  assign ACG_In_0_Req = io_In_HS_Req; // @[FIFO.scala 22:13]
  assign ACG_Out_0_Ack = io_Out_HS_Ack; // @[FIFO.scala 23:14]
  always @(posedge ACG_fire_o) begin
    io_Out_Data_REG <= io_In_Data; // @[FIFO.scala 26:27]
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

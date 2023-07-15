module ACG(
  input   reset,
  input   In_0_Req,
  output  In_0_Ack,
  output  Out_0_Req,
  input   Out_0_Ack,
  output  Out_1_Req,
  input   Out_1_Ack,
  output  fire_o,
  input   go
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
  wire  MrGo_fire; // @[AsyncLib_ACG.scala 118:24]
  wire  MrGo_En; // @[AsyncLib_ACG.scala 118:24]
  wire  MrGo_Out; // @[AsyncLib_ACG.scala 118:24]
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
  MrGo MrGo ( // @[AsyncLib_ACG.scala 118:24]
    .fire(MrGo_fire),
    .En(MrGo_En),
    .Out(MrGo_Out)
  );
  assign In_0_Ack = full_wire_PRO_ff; // @[AsyncLib_ACG.scala 94:14]
  assign Out_0_Req = empty_wire_PRO_ff; // @[AsyncLib_ACG.scala 108:14]
  assign Out_1_Req = empty_wire_PRO_ff_1; // @[AsyncLib_ACG.scala 108:14]
  assign fire_o = fire_o_Dfire_Z; // @[AsyncLib_ACG.scala 164:36]
  assign full_wire_PRO_Dreq_I = In_0_Req; // @[AsyncLib_ACG.scala 85:15]
  assign fire_o_Dfire_I = MrGo_Out; // @[AsyncLib_ACG.scala 121:18]
  assign MrGo_fire = full & empty; // @[AsyncLib_ACG.scala 115:25]
  assign MrGo_En = ~go; // @[AsyncLib_ACG.scala 120:18]
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 88:23]
      full_wire_PRO_ff <= 1'h0; // @[AsyncLib_ACG.scala 88:23]
    end else begin
      full_wire_PRO_ff <= In_0_Req; // @[AsyncLib_ACG.scala 92:12]
    end
  end
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 106:15]
      empty_wire_PRO_ff <= 1'h1;
    end else begin
      empty_wire_PRO_ff <= ~Out_0_Ack;
    end
  end
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 106:15]
      empty_wire_PRO_ff_1 <= 1'h1;
    end else begin
      empty_wire_PRO_ff_1 <= ~Out_1_Ack;
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
    empty_wire_PRO_ff = 1'h1;
  end
  if (reset) begin
    empty_wire_PRO_ff_1 = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module F_Fork(
  input        reset,
  input        io_In_HS_Req,
  output       io_In_HS_Ack,
  input  [7:0] io_In_Data,
  output       io_Out0_HS_Req,
  input        io_Out0_HS_Ack,
  output [7:0] io_Out0_Data,
  output       io_Out1_HS_Req,
  input        io_Out1_HS_Ack,
  output [7:0] io_Out1_Data,
  input        io_Go
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  Click_Fork_reset; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_In_0_Req; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_In_0_Ack; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_Out_0_Req; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_Out_0_Ack; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_Out_1_Req; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_Out_1_Ack; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_fire_o; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_go; // @[Fibonacci_main.scala 41:26]
  reg [7:0] ff_Data; // @[Fibonacci_main.scala 54:26]
  ACG Click_Fork ( // @[Fibonacci_main.scala 41:26]
    .reset(Click_Fork_reset),
    .In_0_Req(Click_Fork_In_0_Req),
    .In_0_Ack(Click_Fork_In_0_Ack),
    .Out_0_Req(Click_Fork_Out_0_Req),
    .Out_0_Ack(Click_Fork_Out_0_Ack),
    .Out_1_Req(Click_Fork_Out_1_Req),
    .Out_1_Ack(Click_Fork_Out_1_Ack),
    .fire_o(Click_Fork_fire_o),
    .go(Click_Fork_go)
  );
  assign io_In_HS_Ack = Click_Fork_In_0_Ack; // @[Fibonacci_main.scala 49:20]
  assign io_Out0_HS_Req = Click_Fork_Out_0_Req; // @[Fibonacci_main.scala 50:21]
  assign io_Out0_Data = ff_Data; // @[Fibonacci_main.scala 57:18]
  assign io_Out1_HS_Req = Click_Fork_Out_1_Req; // @[Fibonacci_main.scala 51:21]
  assign io_Out1_Data = ff_Data; // @[Fibonacci_main.scala 58:18]
  assign Click_Fork_reset = reset;
  assign Click_Fork_In_0_Req = io_In_HS_Req; // @[Fibonacci_main.scala 49:20]
  assign Click_Fork_Out_0_Ack = io_Out0_HS_Ack; // @[Fibonacci_main.scala 50:21]
  assign Click_Fork_Out_1_Ack = io_Out1_HS_Ack; // @[Fibonacci_main.scala 51:21]
  assign Click_Fork_go = io_Go; // @[Fibonacci_main.scala 48:17]
  always @(posedge Click_Fork_fire_o or posedge reset) begin
    if (reset) begin // @[Fibonacci_main.scala 54:26]
      ff_Data <= 8'h1; // @[Fibonacci_main.scala 54:26]
    end else begin
      ff_Data <= io_In_Data; // @[Fibonacci_main.scala 56:13]
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
  ff_Data = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ff_Data = 8'h1;
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
  output  Out_0_Req,
  input   Out_0_Ack,
  output  Out_1_Req,
  input   Out_1_Ack,
  output  fire_o,
  input   go
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
  wire  MrGo_fire; // @[AsyncLib_ACG.scala 118:24]
  wire  MrGo_En; // @[AsyncLib_ACG.scala 118:24]
  wire  MrGo_Out; // @[AsyncLib_ACG.scala 118:24]
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
  MrGo MrGo ( // @[AsyncLib_ACG.scala 118:24]
    .fire(MrGo_fire),
    .En(MrGo_En),
    .Out(MrGo_Out)
  );
  assign In_0_Ack = full_wire_PRO_ff; // @[AsyncLib_ACG.scala 94:14]
  assign Out_0_Req = empty_wire_PRO_ff; // @[AsyncLib_ACG.scala 108:14]
  assign Out_1_Req = empty_wire_PRO_ff_1; // @[AsyncLib_ACG.scala 108:14]
  assign fire_o = fire_o_Dfire_Z; // @[AsyncLib_ACG.scala 164:36]
  assign full_wire_PRO_Dreq_I = In_0_Req; // @[AsyncLib_ACG.scala 85:15]
  assign fire_o_Dfire_I = MrGo_Out; // @[AsyncLib_ACG.scala 121:18]
  assign MrGo_fire = full & empty; // @[AsyncLib_ACG.scala 115:25]
  assign MrGo_En = ~go; // @[AsyncLib_ACG.scala 120:18]
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
  always @(posedge fire_o or posedge reset) begin
    if (reset) begin // @[AsyncLib_ACG.scala 106:15]
      empty_wire_PRO_ff_1 <= 1'h1;
    end else begin
      empty_wire_PRO_ff_1 <= ~Out_1_Ack;
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
    empty_wire_PRO_ff_1 = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module F_Fork_1(
  input        reset,
  input        io_In_HS_Req,
  output       io_In_HS_Ack,
  input  [7:0] io_In_Data,
  output       io_Out0_HS_Req,
  input        io_Out0_HS_Ack,
  output [7:0] io_Out0_Data,
  output       io_Out1_HS_Req,
  input        io_Out1_HS_Ack,
  output [7:0] io_Out1_Data,
  input        io_Go
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  Click_Fork_reset; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_In_0_Req; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_In_0_Ack; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_Out_0_Req; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_Out_0_Ack; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_Out_1_Req; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_Out_1_Ack; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_fire_o; // @[Fibonacci_main.scala 41:26]
  wire  Click_Fork_go; // @[Fibonacci_main.scala 41:26]
  reg [7:0] ff_Data; // @[Fibonacci_main.scala 54:26]
  ACG_1 Click_Fork ( // @[Fibonacci_main.scala 41:26]
    .reset(Click_Fork_reset),
    .In_0_Req(Click_Fork_In_0_Req),
    .In_0_Ack(Click_Fork_In_0_Ack),
    .Out_0_Req(Click_Fork_Out_0_Req),
    .Out_0_Ack(Click_Fork_Out_0_Ack),
    .Out_1_Req(Click_Fork_Out_1_Req),
    .Out_1_Ack(Click_Fork_Out_1_Ack),
    .fire_o(Click_Fork_fire_o),
    .go(Click_Fork_go)
  );
  assign io_In_HS_Ack = Click_Fork_In_0_Ack; // @[Fibonacci_main.scala 49:20]
  assign io_Out0_HS_Req = Click_Fork_Out_0_Req; // @[Fibonacci_main.scala 50:21]
  assign io_Out0_Data = ff_Data; // @[Fibonacci_main.scala 57:18]
  assign io_Out1_HS_Req = Click_Fork_Out_1_Req; // @[Fibonacci_main.scala 51:21]
  assign io_Out1_Data = ff_Data; // @[Fibonacci_main.scala 58:18]
  assign Click_Fork_reset = reset;
  assign Click_Fork_In_0_Req = io_In_HS_Req; // @[Fibonacci_main.scala 49:20]
  assign Click_Fork_Out_0_Ack = io_Out0_HS_Ack; // @[Fibonacci_main.scala 50:21]
  assign Click_Fork_Out_1_Ack = io_Out1_HS_Ack; // @[Fibonacci_main.scala 51:21]
  assign Click_Fork_go = io_Go; // @[Fibonacci_main.scala 48:17]
  always @(posedge Click_Fork_fire_o or posedge reset) begin
    if (reset) begin // @[Fibonacci_main.scala 54:26]
      ff_Data <= 8'h0; // @[Fibonacci_main.scala 54:26]
    end else begin
      ff_Data <= io_In_Data; // @[Fibonacci_main.scala 56:13]
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
  ff_Data = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ff_Data = 8'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ACG_2(
  input   reset,
  input   In_0_Req,
  output  In_0_Ack,
  input   In_1_Req,
  output  In_1_Ack,
  output  Out_0_Req,
  input   Out_0_Ack,
  output  fire_o,
  input   go
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
  wire  MrGo_fire; // @[AsyncLib_ACG.scala 118:24]
  wire  MrGo_En; // @[AsyncLib_ACG.scala 118:24]
  wire  MrGo_Out; // @[AsyncLib_ACG.scala 118:24]
  reg  full_wire_PRO_ff; // @[AsyncLib_ACG.scala 88:23]
  wire  full_wire_PRO_req_tmp = full_wire_PRO_Dreq_Z; // @[AsyncLib_ACG.scala 83:23 86:13]
  wire  full_wire_PRO = In_0_Ack ^ full_wire_PRO_req_tmp; // @[AsyncLib_ACG.scala 96:12]
  reg  full_wire_PRO_ff_1; // @[AsyncLib_ACG.scala 88:23]
  wire  full_wire_PRO_req_tmp_1 = full_wire_PRO_Dreq_1_Z; // @[AsyncLib_ACG.scala 83:23 86:13]
  wire  _full_wire_PRO_T_10 = In_1_Ack ^ full_wire_PRO_req_tmp_1; // @[AsyncLib_ACG.scala 96:12]
  wire  full = full_wire_PRO & _full_wire_PRO_T_10; // @[AsyncLib_ACG.scala 141:27]
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
  MrGo MrGo ( // @[AsyncLib_ACG.scala 118:24]
    .fire(MrGo_fire),
    .En(MrGo_En),
    .Out(MrGo_Out)
  );
  assign In_0_Ack = full_wire_PRO_ff; // @[AsyncLib_ACG.scala 94:14]
  assign In_1_Ack = full_wire_PRO_ff_1; // @[AsyncLib_ACG.scala 94:14]
  assign Out_0_Req = empty_wire_PRO_ff; // @[AsyncLib_ACG.scala 108:14]
  assign fire_o = fire_o_Dfire_Z; // @[AsyncLib_ACG.scala 164:36]
  assign full_wire_PRO_Dreq_I = In_0_Req; // @[AsyncLib_ACG.scala 85:15]
  assign full_wire_PRO_Dreq_1_I = In_1_Req; // @[AsyncLib_ACG.scala 85:15]
  assign fire_o_Dfire_I = MrGo_Out; // @[AsyncLib_ACG.scala 121:18]
  assign MrGo_fire = full & empty; // @[AsyncLib_ACG.scala 115:25]
  assign MrGo_En = ~go; // @[AsyncLib_ACG.scala 120:18]
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
module CL(
  input        reset,
  input        io_In0_HS_Req,
  output       io_In0_HS_Ack,
  input  [7:0] io_In0_Data,
  input        io_In1_HS_Req,
  output       io_In1_HS_Ack,
  input  [7:0] io_In1_Data,
  output       io_Out_HS_Req,
  input        io_Out_HS_Ack,
  output [7:0] io_Out_Data,
  input        io_Go
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  Click_Join_reset; // @[Fibonacci_main.scala 65:26]
  wire  Click_Join_In_0_Req; // @[Fibonacci_main.scala 65:26]
  wire  Click_Join_In_0_Ack; // @[Fibonacci_main.scala 65:26]
  wire  Click_Join_In_1_Req; // @[Fibonacci_main.scala 65:26]
  wire  Click_Join_In_1_Ack; // @[Fibonacci_main.scala 65:26]
  wire  Click_Join_Out_0_Req; // @[Fibonacci_main.scala 65:26]
  wire  Click_Join_Out_0_Ack; // @[Fibonacci_main.scala 65:26]
  wire  Click_Join_fire_o; // @[Fibonacci_main.scala 65:26]
  wire  Click_Join_go; // @[Fibonacci_main.scala 65:26]
  reg [7:0] io_Out_Data_REG; // @[Fibonacci_main.scala 77:27]
  ACG_2 Click_Join ( // @[Fibonacci_main.scala 65:26]
    .reset(Click_Join_reset),
    .In_0_Req(Click_Join_In_0_Req),
    .In_0_Ack(Click_Join_In_0_Ack),
    .In_1_Req(Click_Join_In_1_Req),
    .In_1_Ack(Click_Join_In_1_Ack),
    .Out_0_Req(Click_Join_Out_0_Req),
    .Out_0_Ack(Click_Join_Out_0_Ack),
    .fire_o(Click_Join_fire_o),
    .go(Click_Join_go)
  );
  assign io_In0_HS_Ack = Click_Join_In_0_Ack; // @[Fibonacci_main.scala 72:20]
  assign io_In1_HS_Ack = Click_Join_In_1_Ack; // @[Fibonacci_main.scala 73:20]
  assign io_Out_HS_Req = Click_Join_Out_0_Req; // @[Fibonacci_main.scala 74:21]
  assign io_Out_Data = io_Out_Data_REG; // @[Fibonacci_main.scala 77:17]
  assign Click_Join_reset = reset;
  assign Click_Join_In_0_Req = io_In0_HS_Req; // @[Fibonacci_main.scala 72:20]
  assign Click_Join_In_1_Req = io_In1_HS_Req; // @[Fibonacci_main.scala 73:20]
  assign Click_Join_Out_0_Ack = io_Out_HS_Ack; // @[Fibonacci_main.scala 74:21]
  assign Click_Join_go = io_Go; // @[Fibonacci_main.scala 71:17]
  always @(posedge Click_Join_fire_o or posedge reset) begin
    if (reset) begin // @[Fibonacci_main.scala 77:40]
      io_Out_Data_REG <= 8'h0;
    end else begin
      io_Out_Data_REG <= io_In0_Data + io_In1_Data;
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
  if (reset) begin
    io_Out_Data_REG = 8'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Fibonacci_main(
  input        clock,
  input        reset,
  output       io_Out_HS_Req,
  input        io_Out_HS_Ack,
  output [7:0] io_Out_Data,
  input        io_Go
);
  wire  F_Fork_reset; // @[Fibonacci_main.scala 21:19]
  wire  F_Fork_io_In_HS_Req; // @[Fibonacci_main.scala 21:19]
  wire  F_Fork_io_In_HS_Ack; // @[Fibonacci_main.scala 21:19]
  wire [7:0] F_Fork_io_In_Data; // @[Fibonacci_main.scala 21:19]
  wire  F_Fork_io_Out0_HS_Req; // @[Fibonacci_main.scala 21:19]
  wire  F_Fork_io_Out0_HS_Ack; // @[Fibonacci_main.scala 21:19]
  wire [7:0] F_Fork_io_Out0_Data; // @[Fibonacci_main.scala 21:19]
  wire  F_Fork_io_Out1_HS_Req; // @[Fibonacci_main.scala 21:19]
  wire  F_Fork_io_Out1_HS_Ack; // @[Fibonacci_main.scala 21:19]
  wire [7:0] F_Fork_io_Out1_Data; // @[Fibonacci_main.scala 21:19]
  wire  F_Fork_io_Go; // @[Fibonacci_main.scala 21:19]
  wire  F_Fork_1_reset; // @[Fibonacci_main.scala 22:19]
  wire  F_Fork_1_io_In_HS_Req; // @[Fibonacci_main.scala 22:19]
  wire  F_Fork_1_io_In_HS_Ack; // @[Fibonacci_main.scala 22:19]
  wire [7:0] F_Fork_1_io_In_Data; // @[Fibonacci_main.scala 22:19]
  wire  F_Fork_1_io_Out0_HS_Req; // @[Fibonacci_main.scala 22:19]
  wire  F_Fork_1_io_Out0_HS_Ack; // @[Fibonacci_main.scala 22:19]
  wire [7:0] F_Fork_1_io_Out0_Data; // @[Fibonacci_main.scala 22:19]
  wire  F_Fork_1_io_Out1_HS_Req; // @[Fibonacci_main.scala 22:19]
  wire  F_Fork_1_io_Out1_HS_Ack; // @[Fibonacci_main.scala 22:19]
  wire [7:0] F_Fork_1_io_Out1_Data; // @[Fibonacci_main.scala 22:19]
  wire  F_Fork_1_io_Go; // @[Fibonacci_main.scala 22:19]
  wire  CL_reset; // @[Fibonacci_main.scala 23:18]
  wire  CL_io_In0_HS_Req; // @[Fibonacci_main.scala 23:18]
  wire  CL_io_In0_HS_Ack; // @[Fibonacci_main.scala 23:18]
  wire [7:0] CL_io_In0_Data; // @[Fibonacci_main.scala 23:18]
  wire  CL_io_In1_HS_Req; // @[Fibonacci_main.scala 23:18]
  wire  CL_io_In1_HS_Ack; // @[Fibonacci_main.scala 23:18]
  wire [7:0] CL_io_In1_Data; // @[Fibonacci_main.scala 23:18]
  wire  CL_io_Out_HS_Req; // @[Fibonacci_main.scala 23:18]
  wire  CL_io_Out_HS_Ack; // @[Fibonacci_main.scala 23:18]
  wire [7:0] CL_io_Out_Data; // @[Fibonacci_main.scala 23:18]
  wire  CL_io_Go; // @[Fibonacci_main.scala 23:18]
  F_Fork F_Fork ( // @[Fibonacci_main.scala 21:19]
    .reset(F_Fork_reset),
    .io_In_HS_Req(F_Fork_io_In_HS_Req),
    .io_In_HS_Ack(F_Fork_io_In_HS_Ack),
    .io_In_Data(F_Fork_io_In_Data),
    .io_Out0_HS_Req(F_Fork_io_Out0_HS_Req),
    .io_Out0_HS_Ack(F_Fork_io_Out0_HS_Ack),
    .io_Out0_Data(F_Fork_io_Out0_Data),
    .io_Out1_HS_Req(F_Fork_io_Out1_HS_Req),
    .io_Out1_HS_Ack(F_Fork_io_Out1_HS_Ack),
    .io_Out1_Data(F_Fork_io_Out1_Data),
    .io_Go(F_Fork_io_Go)
  );
  F_Fork_1 F_Fork_1 ( // @[Fibonacci_main.scala 22:19]
    .reset(F_Fork_1_reset),
    .io_In_HS_Req(F_Fork_1_io_In_HS_Req),
    .io_In_HS_Ack(F_Fork_1_io_In_HS_Ack),
    .io_In_Data(F_Fork_1_io_In_Data),
    .io_Out0_HS_Req(F_Fork_1_io_Out0_HS_Req),
    .io_Out0_HS_Ack(F_Fork_1_io_Out0_HS_Ack),
    .io_Out0_Data(F_Fork_1_io_Out0_Data),
    .io_Out1_HS_Req(F_Fork_1_io_Out1_HS_Req),
    .io_Out1_HS_Ack(F_Fork_1_io_Out1_HS_Ack),
    .io_Out1_Data(F_Fork_1_io_Out1_Data),
    .io_Go(F_Fork_1_io_Go)
  );
  CL CL ( // @[Fibonacci_main.scala 23:18]
    .reset(CL_reset),
    .io_In0_HS_Req(CL_io_In0_HS_Req),
    .io_In0_HS_Ack(CL_io_In0_HS_Ack),
    .io_In0_Data(CL_io_In0_Data),
    .io_In1_HS_Req(CL_io_In1_HS_Req),
    .io_In1_HS_Ack(CL_io_In1_HS_Ack),
    .io_In1_Data(CL_io_In1_Data),
    .io_Out_HS_Req(CL_io_Out_HS_Req),
    .io_Out_HS_Ack(CL_io_Out_HS_Ack),
    .io_Out_Data(CL_io_Out_Data),
    .io_Go(CL_io_Go)
  );
  assign io_Out_HS_Req = F_Fork_1_io_Out0_HS_Req; // @[Fibonacci_main.scala 35:10]
  assign io_Out_Data = F_Fork_1_io_Out0_Data; // @[Fibonacci_main.scala 35:10]
  assign F_Fork_reset = reset;
  assign F_Fork_io_In_HS_Req = CL_io_Out_HS_Req; // @[Fibonacci_main.scala 26:10]
  assign F_Fork_io_In_Data = CL_io_Out_Data; // @[Fibonacci_main.scala 26:10]
  assign F_Fork_io_Out0_HS_Ack = F_Fork_1_io_In_HS_Ack; // @[Fibonacci_main.scala 29:10]
  assign F_Fork_io_Out1_HS_Ack = CL_io_In0_HS_Ack; // @[Fibonacci_main.scala 32:10]
  assign F_Fork_io_Go = io_Go; // @[Fibonacci_main.scala 25:10]
  assign F_Fork_1_reset = reset;
  assign F_Fork_1_io_In_HS_Req = F_Fork_io_Out0_HS_Req; // @[Fibonacci_main.scala 29:10]
  assign F_Fork_1_io_In_Data = F_Fork_io_Out0_Data; // @[Fibonacci_main.scala 29:10]
  assign F_Fork_1_io_Out0_HS_Ack = io_Out_HS_Ack; // @[Fibonacci_main.scala 35:10]
  assign F_Fork_1_io_Out1_HS_Ack = CL_io_In1_HS_Ack; // @[Fibonacci_main.scala 33:10]
  assign F_Fork_1_io_Go = io_Go; // @[Fibonacci_main.scala 28:10]
  assign CL_reset = reset;
  assign CL_io_In0_HS_Req = F_Fork_io_Out1_HS_Req; // @[Fibonacci_main.scala 32:10]
  assign CL_io_In0_Data = F_Fork_io_Out1_Data; // @[Fibonacci_main.scala 32:10]
  assign CL_io_In1_HS_Req = F_Fork_1_io_Out1_HS_Req; // @[Fibonacci_main.scala 33:10]
  assign CL_io_In1_Data = F_Fork_1_io_Out1_Data; // @[Fibonacci_main.scala 33:10]
  assign CL_io_Out_HS_Ack = F_Fork_io_In_HS_Ack; // @[Fibonacci_main.scala 26:10]
  assign CL_io_Go = io_Go; // @[Fibonacci_main.scala 31:9]
endmodule

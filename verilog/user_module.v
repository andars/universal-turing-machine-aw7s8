`default_nettype none

module user_module_PROJECT_ID(
  input [7:0] io_in,
  output [7:0] io_out
);

wire mode;
wire clock;
wire reset;

wire direction;

wire sym_valid;
wire [2:0] sym_in;
wire [2:0] new_sym;

// 1-hot state in & out
wire [7:0] state_in;
wire [7:0] state_out;

// 3-bit dense encoding of state in & out
wire [2:0] encoded_state_in;
wire [2:0] encoded_state_out;

assign mode = io_in[7];
assign clock = io_in[0];
assign reset = (mode == 0) ? 1'b1 : io_in[1];

assign encoded_state_in = (mode == 0) ? io_in[3:1] : 3'b0;
assign io_out[7:5] = encoded_state_out;

assign sym_valid = (mode == 0) ? 1'b0 : io_in[2];
assign sym_in = io_in[6:4];
assign io_out[4:2] = new_sym;

assign io_out[1] = direction;
assign io_out[0] = 1'b0;

utm_core_PROJECT_ID core(
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .encoded_state_in(encoded_state_in),
    .sym_in(sym_in),
    .sym_in_valid(sym_valid),
    .new_sym(new_sym),
    .direction(direction),
    .encoded_next_state(encoded_state_out)
);

endmodule

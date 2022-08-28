`default_nettype none

module user_module_PROJECT_ID(
  input [7:0] io_in,
  output [7:0] io_out
);

wire [2:0] sym_in;
wire [2:0] new_sym;

// 1-hot state in & out
wire [7:0] state_in;
wire [7:0] state_out;

// 3-bit dense encoding of state in & out
wire [2:0] encoded_state_in;
wire [2:0] encoded_state_out;

assign encoded_state_in = io_in[7:5];
assign io_out[7:5] = encoded_state_out;

assign sym_in = io_in[4:2];
assign new_sym = 3'b0; // TODO
assign io_out[4:2] = new_sym;

assign io_out[1:0] = 2'b0;

decoder_3to8_PROJECT_ID decode_state_in(
    .in(encoded_state_in),
    .out(state_in)
);

next_state_PROJECT_ID next_state_block(
    .state_in(state_in),
    .s2(sym_in[2]),
    .s1(sym_in[1]),
    .s0(sym_in[0]),
    .state_out(state_out));

new_symbol_PROJECT_ID new_sym_block(
    .state_in(state_in),
    .s2(sym_in[2]),
    .s1(sym_in[1]),
    .s0(sym_in[0]),
    .z2(new_sym[2]),
    .z1(new_sym[1]),
    .z0(new_sym[0])
);


encoder_8to3_PROJECT_ID encode_state_out(
    .in(state_out),
    .out(encoded_state_out)
);

endmodule

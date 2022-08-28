`default_nettype none

module user_module_PROJECT_ID(
  input [7:0] io_in,
  output [7:0] io_out
);

wire [2:0] sym;
wire [7:0] state_in;
wire [7:0] state_out;

assign state_in = io_in;
assign sym = 3'b0;
assign io_out = state_out;

next_state_PROJECT_ID next_state_block(
    .state_in(state_in),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .state_out(state_out));

endmodule

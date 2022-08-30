`default_nettype none

module utm_core_PROJECT_ID(
    input clock,
    input reset,
    input mode,
    input [2:0] encoded_state_in,
    input [2:0] sym_in,
    input sym_in_valid,
    output [2:0] new_sym,
    output direction,
    output [2:0] encoded_next_state
);

reg [7:0] stored_state;
reg [2:0] symbuf;
reg symbuf_valid;

wire [7:0] state_in;
wire [7:0] state;
wire [7:0] next_state;
wire [2:0] sym;

always @(posedge clock) begin
    if (reset) begin
        stored_state <= 8'h01;
    end
    else if (sym_in_valid && symbuf_valid) begin
        stored_state <= next_state;
    end
    else begin
        stored_state <= stored_state;
    end
end

always @(posedge clock) begin
    if (reset) begin
        symbuf <= 3'b0;
    end
    else if (sym_in_valid) begin
        symbuf <= sym_in;
    end
    else begin
        symbuf <= symbuf;
    end
end

always @(posedge clock) begin
    if (reset) begin
        symbuf_valid <= 0;
    end
    else if (sym_in_valid) begin
        symbuf_valid <= 1;
    end
    else begin
        symbuf_valid <= symbuf_valid;
    end
end

decoder_3to8_PROJECT_ID decode_state_in(
    .in(encoded_state_in),
    .out(state_in)
);

assign state = (mode == 0) ? state_in : stored_state;
assign sym = (mode == 0) ? sym_in : symbuf;

direction_PROJECT_ID direction_block(
    .state(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .direction(direction)
);

next_state_PROJECT_ID next_state_block(
    .state_in(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .state_out(next_state));

new_symbol_PROJECT_ID new_sym_block(
    .state_in(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .z2(new_sym[2]),
    .z1(new_sym[1]),
    .z0(new_sym[0])
);

encoder_8to3_PROJECT_ID encode_state_out(
    .in(next_state),
    .out(encoded_next_state)
);

endmodule

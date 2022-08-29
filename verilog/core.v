module utm_core_PROJECT_ID(
    input clock,
    input reset,
    input [2:0] sym_in,
    input sym_valid,
    output [2:0] new_sym,
    output direction
);

reg [7:0] state;
reg [2:0] symbuf;
reg symbuf_valid;

wire [7:0] next_state;

always @(posedge clock) begin
    if (reset) begin
        state <= 8'h01;
    end
    else if (sym_valid && symbuf_valid) begin
        state <= next_state;
    end
    else begin
        state <= state;
    end
end

always @(posedge clock) begin
    if (reset) begin
        symbuf <= 3'b0;
    end
    else if (sym_valid) begin
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
    else if (sym_valid) begin
        symbuf_valid <= 1;
    end
    else begin
        symbuf_valid <= symbuf_valid;
    end
end

direction_PROJECT_ID direction_block(
    .state(state),
    .s2(symbuf[2]),
    .s1(symbuf[1]),
    .s0(symbuf[0]),
    .direction(direction)
);

next_state_PROJECT_ID next_state_block(
    .state_in(state),
    .s2(symbuf[2]),
    .s1(symbuf[1]),
    .s0(symbuf[0]),
    .state_out(next_state));

new_symbol_PROJECT_ID new_sym_block(
    .state_in(state),
    .s2(symbuf[2]),
    .s1(symbuf[1]),
    .s0(symbuf[0]),
    .z2(new_sym[2]),
    .z1(new_sym[1]),
    .z0(new_sym[0])
);

endmodule

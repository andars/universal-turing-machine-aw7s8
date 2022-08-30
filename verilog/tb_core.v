`default_nettype none

module tb_core();

reg clock;
reg reset;
reg [2:0] sym;
reg sym_valid;

wire [2:0] new_sym;
wire direction;
wire [2:0] encoded_next_state;

utm_core_PROJECT_ID core(
    .clock(clock),
    .reset(reset),
    .mode(1'b1),
    .encoded_state_in(3'b0),
    .sym_in(sym),
    .sym_in_valid(sym_valid),
    .new_sym(new_sym),
    .direction(direction),
    .encoded_next_state(encoded_next_state)
);

initial begin
    $dumpvars;
    clock = 0;
    reset = 1;
    sym_valid = 0;
    sym = 3'b001;
    repeat(5) @(posedge clock);
    reset = 0;
    repeat(5) @(posedge clock);
    @(negedge clock);
    sym_valid = 1;
    @(posedge clock);
    @(negedge clock);
    sym_valid = 0;
    repeat(10) @(posedge clock);
    @(negedge clock);
    sym_valid = 1;
    @(posedge clock);
    @(negedge clock);
    sym_valid = 0;

    repeat(10) @(posedge clock);
    @(negedge clock);
    sym = 3'b010;
    sym_valid = 1;
    @(posedge clock);
    @(negedge clock);
    sym_valid = 0;

    repeat(10) @(posedge clock);
    @(negedge clock);
    sym = 3'b010;
    sym_valid = 1;
    @(posedge clock);
    @(negedge clock);
    sym_valid = 0;

    $finish;
end

always begin
    #10 clock = ~clock;
end

endmodule

`default_nettype none

module tb_core();

reg clock;
reg reset;
reg [2:0] sym;
reg sym_valid;

wire [2:0] new_sym;
wire direction;

utm_core_PROJECT_ID core(
    .clock(clock),
    .reset(reset),
    .sym_in(sym),
    .sym_valid(sym_valid),
    .new_sym(new_sym),
    .direction(direction)
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

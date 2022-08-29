module tb_system();

reg clock;
reg reset;
wire direction;
wire [2:0] new_sym;
wire [2:0] sym;
wire sym_valid;

tape_interface tif(
    .clock(clock),
    .reset(reset),
    .direction(direction),
    .new_sym(new_sym),
    .sym(sym),
    .sym_valid(sym_valid)
);

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
    repeat(5) @(posedge clock);
    @(negedge clock);
    reset = 0;
    repeat(50) @(posedge clock);

    $finish;
end

always begin
    #10 clock = ~clock;
end

endmodule

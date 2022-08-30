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

integer i;

initial begin
    $dumpvars;
    for (i = 0; i < 512; i++) begin
        $dumpvars(0, tif.tape[i]);
    end
    clock = 0;
    reset = 1;
    repeat(5) @(posedge clock);
    @(negedge clock);
    reset = 0;
    repeat(250000) @(posedge clock);

    $finish;
end

always begin
    #10 clock = ~clock;
end

always @(tif.seq) begin
    if (tif.seq == 2'b11) begin
        $display("halted after %d cycles", tif.cycle_count);
        $finish;
    end
end

endmodule

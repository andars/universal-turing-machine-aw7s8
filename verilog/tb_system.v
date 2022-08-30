module tb_system();

reg clock;
reg reset;
wire direction;
wire [2:0] new_sym;
wire [2:0] sym;
wire sym_valid;
wire [2:0] encoded_next_state;

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
    .mode(1'b1),
    .encoded_state_in(3'b0),
    .sym_in(sym),
    .sym_in_valid(sym_valid),
    .new_sym(new_sym),
    .direction(direction),
    .encoded_next_state(encoded_next_state)
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

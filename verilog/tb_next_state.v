module tb_next_state();

reg [7:0] state;
wire [7:0] state_next;
reg [2:0] sym;

next_state ns(
    .state_in(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .state_out(state_next));

integer i;
integer j;
initial begin
    $dumpvars;
    for (i = 0; i < 8; i = i + 1) begin
        state = 1 << i;
        $display("==== state 0x%x %c", state, "A" + $clog2(state));
        sym = 3'b000;
        #10;
        $display("0x%x %c", state_next, "A" + $clog2(state_next));
        #10;
        sym = 3'b001;
        #10;
        $display("0x%x %c", state_next, "A" + $clog2(state_next));
        #10;
        sym = 3'b010;
        #10;
        $display("0x%x %c", state_next, "A" + $clog2(state_next));
        #10;
        sym = 3'b100;
        #10;
        $display("0x%x %c", state_next, "A" + $clog2(state_next));
        #10;
        sym = 3'b101;
        #10;
        $display("0x%x %c", state_next, "A" + $clog2(state_next));
    end
end

endmodule

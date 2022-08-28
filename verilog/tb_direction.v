module tb_direction();

reg [7:0] state;
reg [2:0] sym;
wire direction;

direction_PROJECT_ID direction_block(
    .state(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .direction(direction)
);

integer i;
initial begin
    $dumpvars;
    for (i = 0; i < 8; i = i + 1) begin
        state = 1 << i;
        $display("==== state 0x%x %c ====", state, "A" + $clog2(state));
        sym = 3'b000;
        #10;
        $display("sym %b -> direction %b", sym, direction);
        #10;

        sym = 3'b001;
        #10;
        $display("sym %b -> direction %b", sym, direction);
        #10;

        sym = 3'b010;
        #10;
        $display("sym %b -> direction %b", sym, direction);
        #10;

        sym = 3'b100;
        #10;
        $display("sym %b -> direction %b", sym, direction);
        #10;

        sym = 3'b101;
        #10;
        $display("sym %b -> direction %b", sym, direction);
        #10;
    end
end

endmodule

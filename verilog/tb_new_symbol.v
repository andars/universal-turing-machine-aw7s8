module tb_new_symbol();

reg [7:0] state;
reg [2:0] sym;
wire [2:0] new_sym;

new_symbol_PROJECT_ID newsym(
    .state_in(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .z2(new_sym[2]),
    .z1(new_sym[1]),
    .z0(new_sym[0])
);

integer i;
integer j;
initial begin
    $dumpvars;
    for (i = 0; i < 8; i = i + 1) begin
        state = 1 << i;
        $display("==== state 0x%x %c", state, "A" + $clog2(state));
        sym = 3'b000;
        #10;
        $display("sym %b -> new sym %b", sym, new_sym);
        #10;
        sym = 3'b001;
        #10;
        $display("sym %b -> new sym %b", sym, new_sym);
        #10;
        sym = 3'b010;
        #10;
        $display("sym %b -> new sym %b", sym, new_sym);
        #10;
        sym = 3'b100;
        #10;
        $display("sym %b -> new sym %b", sym, new_sym);
        #10;
        sym = 3'b101;
        #10;
        $display("sym %b -> new sym %b", sym, new_sym);
        #10;
        sym = 3'b110;
        #10;
        $display("sym %b -> new sym %b", sym, new_sym);
        #10;
        sym = 3'b111;
        #10;
        $display("sym %b -> new sym %b", sym, new_sym);
    end
end

endmodule

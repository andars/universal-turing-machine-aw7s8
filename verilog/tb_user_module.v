module tb_user_module();


wire [7:0] inputs;
wire [7:0] outputs;

reg [2:0] state_in;
wire [2:0] next_state;

reg [2:0] sym_in;
wire [2:0] new_sym;

wire direction;

assign inputs = {state_in, sym_in, 2'b0};
assign next_state = outputs[7:5];
assign new_sym = outputs[4:2];
assign direction = outputs[1];

user_module_PROJECT_ID um(
    .io_in(inputs),
    .io_out(outputs)
);

integer i;
initial begin
    $dumpvars;
    sym_in = 3'b0;
    #10;
    for (i = 0; i < 8; i = i + 1) begin
        state_in = i;

        sym_in = 3'b000;
        #10;
        $display("in 0b%b -> out 0b%b", inputs, outputs);
        $display("  state %c + symbol %b", "A" + state_in, sym_in);
        $display("  -> next state %c", "A" + next_state);
        $display("  -> direction %b", direction);
        #10;

        sym_in = 3'b001;
        #10;
        $display("in 0b%b -> out 0b%b", inputs, outputs);
        $display("  state %c + symbol %b", "A" + state_in, sym_in);
        $display("  -> next state %c", "A" + next_state);
        $display("  -> direction %b", direction);
        #10;

        sym_in = 3'b010;
        #10;
        $display("in 0b%b -> out 0b%b", inputs, outputs);
        $display("  state %c + symbol %b", "A" + state_in, sym_in);
        $display("  -> next state %c", "A" + next_state);
        $display("  -> direction %b", direction);
        #10;

        sym_in = 3'b100;
        #10;
        $display("in 0b%b -> out 0b%b", inputs, outputs);
        $display("  state %c + symbol %b", "A" + state_in, sym_in);
        $display("  -> next state %c", "A" + next_state);
        $display("  -> direction %b", direction);
        #10;

        sym_in = 3'b101;
        #10;
        $display("in 0b%b -> out 0b%b", inputs, outputs);
        $display("  state %c + symbol %b", "A" + state_in, sym_in);
        $display("  -> next state %c", "A" + next_state);
        $display("  -> direction %b", direction);
        #10;

        $display;
    end
end

endmodule

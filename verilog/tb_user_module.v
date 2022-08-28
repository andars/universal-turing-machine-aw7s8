module tb_user_module();

reg [7:0] inputs;
wire [7:0] outputs;

user_module_PROJECT_ID um(
    .io_in(inputs),
    .io_out(outputs)
);

integer i;
initial begin
    $dumpvars;
    #10;
    for (i = 0; i < 8; i = i + 1) begin
        inputs = (1 << i);
        #10;
        $display("in 0b%b (%c)-> out 0b%b (%c)", inputs, "A" + $clog2(inputs),
                                                outputs, "A" + $clog2(outputs));
        #10;
    end
end

endmodule

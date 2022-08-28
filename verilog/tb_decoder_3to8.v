module tb_decoder_3to8();

reg [2:0] in;
wire [7:0] out;

decoder_3to8_PROJECT_ID decoder(
    .in(in),
    .out(out)
);

integer i;
initial begin
    $dumpvars;
    #10;
    for (i = 0; i < 8; i = i + 1) begin
        in = i;
        #10;
        $display("in 0b%b -> out 0b%b", in, out);
        #10;
    end
end

endmodule

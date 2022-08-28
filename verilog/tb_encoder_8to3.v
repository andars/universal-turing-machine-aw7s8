module tb_encoder_8to3();

reg [7:0] in;
wire [2:0] out;

encoder_8to3_PROJECT_ID encoder(
    .in(in),
    .out(out)
);

integer i;
initial begin
    $dumpvars;
    #10;
    for (i = 0; i < 8; i = i + 1) begin
        in = (1 << i);
        #10;
        $display("in 0b%b -> out 0b%b", in, out);
        #10;
    end
end

endmodule

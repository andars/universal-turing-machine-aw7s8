`default_nettype none
module direction_PROJECT_ID(
    input [7:0] state,
    input s2,
    input s1,
    input s0,
    // 0 = left, 1 = right
    output direction
);

wire a,b,c,d,e,f,g,h;

assign a = state[0];
assign b = state[1];
assign c = state[2];
assign d = state[3];
assign e = state[4];
assign f = state[5];
assign g = state[6];
assign h = state[7];

assign direction = ((a | e | f) & s1)
                 | (((a & s0) | b | c | (e & s0) | f | g | h) & s2)
                 | ((d | (e & (~s1) & (~s0))) & (~s2))
                 | (g & (~s1));
endmodule

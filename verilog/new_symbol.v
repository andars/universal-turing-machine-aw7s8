`default_nettype none
module new_symbol_PROJECT_ID(
    input [7:0] state_in,
    input s2,
    input s1,
    input s0,
    output z2,
    output z1,
    output z0
);

wire a,b,c,d,e,f,g,h;

assign a = state_in[0];
assign b = state_in[1];
assign c = state_in[2];
assign d = state_in[3];
assign e = state_in[4];
assign f = state_in[5];
assign g = state_in[6];
assign h = state_in[7];

assign z2 = ((~s2) & b) | (d & s0) | c | (e & (s0 | s1)) | (f & (~(s2 | s1)));
assign z1 = (a & (~s2)) | (d & (s2 | s1) & (~s0)) | (e & s2 & (~s0));
assign z0 = (s0 & ((a & s2) | (~a))) | (h & s1);

endmodule

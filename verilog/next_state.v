`default_nettype none
module next_state_PROJECT_ID(
    input [7:0] state_in,
    input s2,
    input s1,
    input s0,
    output [7:0] state_out
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

wire sym_0;
assign sym_0 = (~s2) & (~s1) & (~s0);

// next H
assign state_out[7] = s2 & ((s0 & (b | c)) | h);

// next G
assign state_out[6] = (s2 & ( ((b | c) & (~s0)) | g)) | (f & s1);

// next F
assign state_out[5] = (e & (~s2) & s0) | (f & (~(s2 | s1))) | (s1 & (g | h));

// next E
assign state_out[4] = (a & s2 & (~s0)) | (d & (~s2) & s0) | (e & (s1 | (s2 & s0)));

// next D
assign state_out[3] = (b & s1) | (d & s2) | (e & (~s1) & (~s0));

// next C
assign state_out[2] = (a & (~s2) & s0) | (c & (~(s2 | s1))) | (d & sym_0);

// next B
assign state_out[1] = (a & sym_0) | (b & (~(s2 | s1))) | (c & s1) | (f & s2);

// next A
assign state_out[0] = (a & (s1 | (s2 & s0))) | (d & s1) | ((g | h) & (~(s2 | s1)));

endmodule

`default_nettype none
module direction_PROJECT_ID(
    input [7:0] state,
    input s2,
    input s1,
    input s0,
    // 0 = left, 1 = right
    output direction
);

wire [7:0] state_in;
assign state_in = state;

wire [2:0] sym_in;
assign sym_in = {s2, s1, s0};

reg dir;
assign direction = dir;

always @(*) begin
    /* verilator lint_off CASEINCOMPLETE */
    case (state_in)
        8'h01: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 1;
            end
            3'b100: begin
                dir = 0;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 1;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
        8'h02: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 0;
            end
            endcase
        end
        8'h04: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 0;
            end
            endcase
        end
        8'h08: begin
            case (sym_in)
            3'b000: begin
                dir = 1;
            end
            3'b001: begin
                dir = 1;
            end
            3'b010: begin
                dir = 1;
            end
            3'b100: begin
                dir = 0;
            end
            3'b101: begin
                dir = 0;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 0;
            end
            endcase
        end
        8'h10: begin
            case (sym_in)
            3'b000: begin
                dir = 1;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 1;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
        8'h20: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
        8'h40: begin
            case (sym_in)
            3'b000: begin
                dir = 1;
            end
            3'b001: begin
                dir = 1;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 1;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
        8'h80: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 1;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
    endcase
    /* verilator lint_on CASEINCOMPLETE */
end
endmodule

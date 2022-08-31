`default_nettype none
module next_state_PROJECT_ID(
    input [7:0] state_in,
    input s2,
    input s1,
    input s0,
    output [7:0] state_out
);

reg [7:0] next_state;
assign state_out = next_state;

wire [2:0] sym_in;
assign sym_in = {s2, s1, s0};

always @(*) begin
    /* verilator lint_off CASEINCOMPLETE */
    case (state_in)
        8'h01: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h02;
            end
            3'b001: begin
                next_state = 8'h04;
            end
            3'b010: begin
                next_state = 8'h01;
            end
            3'b100: begin
                next_state = 8'h10;
            end
            3'b101: begin
                next_state = 8'h01;
            end
            3'b110: begin
                next_state = 8'h01;
            end
            3'b111: begin
                next_state = 8'h01;
            end
            endcase
        end
        8'h02: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h02;
            end
            3'b001: begin
                next_state = 8'h02;
            end
            3'b010: begin
                next_state = 8'h08;
            end
            3'b100: begin
                next_state = 8'h40;
            end
            3'b101: begin
                next_state = 8'h80;
            end
            3'b110: begin
                next_state = 8'h02;
            end
            3'b111: begin
                next_state = 8'h02;
            end
            endcase
        end
        8'h04: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h04;
            end
            3'b001: begin
                next_state = 8'h04;
            end
            3'b010: begin
                next_state = 8'h02;
            end
            3'b100: begin
                next_state = 8'h40;
            end
            3'b101: begin
                next_state = 8'h80;
            end
            3'b110: begin
                next_state = 8'h04;
            end
            3'b111: begin
                next_state = 8'h04;
            end
            endcase
        end
        8'h08: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h04;
            end
            3'b001: begin
                next_state = 8'h10;
            end
            3'b010: begin
                next_state = 8'h01;
            end
            3'b100: begin
                next_state = 8'h08;
            end
            3'b101: begin
                next_state = 8'h08;
            end
            3'b110: begin
                next_state = 8'h08;
            end
            3'b111: begin
                next_state = 8'h08;
            end
            endcase
        end
        8'h10: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h08;
            end
            3'b001: begin
                next_state = 8'h20;
            end
            3'b010: begin
                next_state = 8'h10;
            end
            3'b100: begin
                next_state = 8'h10;
            end
            3'b101: begin
                next_state = 8'h10;
            end
            3'b110: begin
                next_state = 8'h08;
            end
            3'b111: begin
                next_state = 8'h10;
            end
            endcase
        end
        8'h20: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h20;
            end
            3'b001: begin
                next_state = 8'h20;
            end
            3'b010: begin
                next_state = 8'h20;
            end
            3'b100: begin
                next_state = 8'h02;
            end
            3'b101: begin
                next_state = 8'h02;
            end
            3'b110: begin
                next_state = 8'h20;
            end
            3'b111: begin
                next_state = 8'h40;
            end
            endcase
        end
        8'h40: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h01;
            end
            3'b001: begin
                next_state = 8'h01;
            end
            3'b010: begin
                next_state = 8'h20;
            end
            3'b100: begin
                next_state = 8'h40;
            end
            3'b101: begin
                next_state = 8'h40;
            end
            3'b110: begin
                next_state = 8'h40;
            end
            3'b111: begin
                next_state = 8'h40;
            end
            endcase
        end
        8'h80: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h01;
            end
            3'b001: begin
                next_state = 8'h01;
            end
            3'b010: begin
                next_state = 8'h20;
            end
            3'b100: begin
                next_state = 8'h80;
            end
            3'b101: begin
                next_state = 8'h80;
            end
            3'b110: begin
                next_state = 8'h80;
            end
            3'b111: begin
                next_state = 8'h80;
            end
            endcase
        end
    endcase
    /* verilator lint_on CASEINCOMPLETE */
end

endmodule

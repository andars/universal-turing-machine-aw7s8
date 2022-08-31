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

wire [2:0] sym_in;
assign sym_in = {s2, s1, s0};

reg [2:0] new_symbol;

always @(*) begin
    new_symbol = 3'b000;
    /* verilator lint_off CASEINCOMPLETE */
    case (state_in)
        8'h01: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b010;
            end
            3'b001: begin
                new_symbol = 3'b010;
            end
            3'b010: begin
                new_symbol = 3'b010;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b001;
            end
            3'b111: begin
                new_symbol = 3'b111;
            end
            endcase
        end
        8'h02: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b100;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b100;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b110;
            end
            endcase
        end
        8'h04: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b100;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b100;
            end
            3'b100: begin
                new_symbol = 3'b100;
            end
            3'b101: begin
                new_symbol = 3'b101;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b110;
            end
            endcase
        end
        8'h08: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b000;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b010;
            end
            3'b100: begin
                new_symbol = 3'b010;
            end
            3'b101: begin
                new_symbol = 3'b101;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b111;
            end
            endcase
        end
        8'h10: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b000;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b100;
            end
            3'b100: begin
                new_symbol = 3'b100;
            end
            3'b101: begin
                new_symbol = 3'b101;
            end
            3'b110: begin
                new_symbol = 3'b111;
            end
            3'b111: begin
                new_symbol = 3'b111;
            end
            endcase
        end
        8'h20: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b100;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b100;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b110;
            end
            endcase
        end
        8'h40: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b000;
            end
            3'b001: begin
                new_symbol = 3'b001;
            end
            3'b010: begin
                new_symbol = 3'b000;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b111;
            end
            endcase
        end
        8'h80: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b000;
            end
            3'b001: begin
                new_symbol = 3'b001;
            end
            3'b010: begin
                new_symbol = 3'b001;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b001;
            end
            endcase
        end
    endcase
    /* verilator lint_on CASEINCOMPLETE */
end

assign z2 = new_symbol[2];
assign z1 = new_symbol[1];
assign z0 = new_symbol[0];

endmodule

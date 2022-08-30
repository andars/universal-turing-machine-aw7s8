module tape_interface(
    input clock,
    input reset,
    input direction,
    input [2:0] new_sym,
    output [2:0] sym,
    output reg sym_valid
);

reg [2:0] tape[511:0];

reg [8:0] position;

reg [1:0] seq;
reg write_enable;
reg move_enable;

initial begin
    $readmemb("bb2.tape", tape);
end

always @(posedge clock) begin
    if (reset) begin
        position <= 332;
    end
    else begin
        if (move_enable) begin
            if (direction) begin
                position <= position + 1;
            end
            else begin
                position <= position - 1;
            end
        end
    end
end

integer i;
always @(posedge clock) begin
    if (reset) begin
        /*
        for (i = 0; i < 512; i = i + 1) begin
            tape[i] <= 0;
        end
        */
    end
    else begin
        if (write_enable) begin
            tape[position] <= new_sym;
        end
    end
end
assign sym = tape[position];

always @(posedge clock) begin
    if (reset) begin
        seq <= 0;
    end
    else begin
        if (seq == 2'b00) begin
            seq <= 2'b01;
        end
        else if (seq == 2'b01) begin
            seq <= 2'b10;

        end
        else if (seq == 2'b10) begin
            seq <= 2'b00;
        end
        else if (seq == 2'b11) begin
            seq <= 2'b11;
        end
    end
end

always @(*) begin
    if (seq == 2'b00) begin
        sym_valid = 1;
        write_enable = 0;
        move_enable = 0;
    end
    else if (seq == 2'b01) begin
        sym_valid = 0;
        write_enable = 1;
        move_enable = 0;
    end
    else if (seq == 2'b10) begin
        sym_valid = 0;
        write_enable = 0;
        move_enable = 1;
    end
    else if (seq == 2'b11) begin
        sym_valid = 0;
        write_enable = 0;
        move_enable = 0;
    end
end

endmodule

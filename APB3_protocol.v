# AMBA-APB-Protocol-using-basys3
`timescale 1ns / 1ps

module capstone_project(
    input clk,
    input preset,
    input psel,
    input penable,
    input pready,
    input [7:0] paddr,

    output reg [1:0] state,
    output reg pslverr
);

parameter idle   = 2'b00;
parameter setup  = 2'b01;
parameter access = 2'b10;

reg [1:0] ns;
wire error_condition;

assign error_condition = (paddr > 8'h0F);

always @(posedge clk or posedge preset)
begin
    if (preset)
        state <= idle;
    else
        state <= ns;
end

always @(*)
begin
    ns = state;

    case(state)

        idle:
        begin
            if (psel && !penable)
                ns = setup;
            else
                ns = idle;
        end

        setup:
        begin
            if (!psel)
                ns = idle;
            else if (penable)
                ns = access;
            else
                ns = setup;
        end

        access:
        begin
            if (!pready)
                ns = access;
            else if (psel)
                ns = setup;
            else
                ns = idle;
        end

        default:
            ns = idle;

    endcase
end

always @(*)
begin
    pslverr = 1'b0;

    if (state == access && psel && penable && pready && error_condition)
        pslverr = 1'b1;
end

endmodule

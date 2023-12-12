/*

In digital design, a counter can be implemented using flip-flops and some
combinational logic. Below is a parametrizable Verilog RTL (Register-Transfer
Level) code for an n-bit counter with an "Enable" input and an "Up/Down"
control input.

    - n is a parameter that specifies the number of bits for the counter.
    - The enable input allows the counter to increment or decrement only when
    it is high.
    - The up_down input controls whether the counter should increment
    (up_down = 1) or decrement (up_down = 0).

*/

module counter #(parameter n = 8)(
    input clk,
    input rst_n,
    input enable,
    input up_down,
    output reg [n-1:0] count
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        count <= 0;
    else if (enable) begin
        if (up_down)
            count <= count + 1;
        else
            count <= count - 1;
    end
end

endmodule

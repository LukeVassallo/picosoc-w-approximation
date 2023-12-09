module ctrl ( 
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif    


    // input  [7:0] nc_in,
    // output [7:0] nc_out,
    // output [7:0] nc_oeb,

    input [1:0] ctrl_in,
    output [1:0] ctrl_out,
    output [1:0] ctrl_oeb,

    output resetn,
    output reset
);

wire clk, arstn;
assign {arstn, clk} = ctrl_in;    
assign ctrl_out = 2'b0;
assign ctrl_oeb = 2'b11;    // inputs

// lower 8 IOs
// assign nc_out = 8'b0;
// assign nc_oeb = 8'b1111_1111;

rst_sync #(
    .SYNC_DEPTH(5)
) rst_sync_0 (
    .clk(clk),
    .arstn(arstn),
    .sync_rst(reset),
    .sync_rstn(resetn)
);


endmodule


//This code defines a reset synchronizer module with a parameter for synchronization depth (SYNC_DEPTH).
//The depth controls the number of flip-flops used for synchronizing the asynchronous reset signal to the system clock. 
module rst_sync (
  input wire  clk,          // System clock
  input wire  arstn,  // Asynchronous reset
  output sync_rst,    // Synchronized reset
  output sync_rstn
);

parameter SYNC_DEPTH = 2;   // Adjustable synchronization depth

reg [SYNC_DEPTH-1:0] sync_reg;

always @(posedge clk or negedge arstn) begin
  if (~arstn) begin
    // Asynchronous reset asserted
    sync_reg <= {SYNC_DEPTH{1'b1}};
  end else begin
    // Synchronize reset using shift register
    sync_reg <= {sync_reg[SYNC_DEPTH-2:0], 1'b0};
  end
end

assign sync_rst = sync_reg[SYNC_DEPTH-1];  
assign sync_rstn = ~sync_reg[SYNC_DEPTH-1];

endmodule


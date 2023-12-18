module tb();

reg clk;
reg aresetn;
wire clock;
wire arst_n;

always #5 clk <= (clk === 1'b0);

initial begin
    clk = 0;
end

initial begin
    aresetn <= 0;
    #10
    $display("Releasing reset ... ");
    aresetn <= 1;
end

assign clock = clk;
assign arst_n = aresetn;

//wire flash_clk;
//wire flash_csb;
//wire [3:0] flash_io;
wire ser_tx;

wire generated_clk_12p5;
wire generated_resetn;

arty_35t arty_35t_inst_0 (
    .clk(clock),                            // board clock - 100MHz
    .aresetn(arst_n),                       // board active-low reset - RESET
    .design_clk_12p5(generated_clk_12p5),   // design 12.5MHz input clock 
    .design_aresetn(generated_resetn),      // design asynchronous active low reset
//    .flash_clk(flash_clk),
//    .flash_csb(flash_csb),
//    .flash_io(flash_io),
    .ser_tx(ser_tx),
    
    .clk_12p5(generated_clk_12p5),          // Generated 12.5MHz clock
    .locked(generated_resetn)               // Generated active low resetn
);

//w25q128 #(
//    .firmware("firmware.hex") 
//) w25q128_inst_0 (
//    .csb(flash_csb),
//    .clk(flash_clk),
//    .io0(flash_io[0]),
//    .io1(flash_io[1]),
//    .io2(flash_io[2]),
//    .io3(flash_io[3])
//);

localparam ser_half_period = 53;
event ser_sample;
reg [7:0] buffer;

always begin
    @(negedge ser_tx);

    repeat (ser_half_period) @(posedge clock);
    -> ser_sample; // start bit

    repeat (8) begin
        repeat (ser_half_period) @(posedge clock);
        repeat (ser_half_period) @(posedge clock);
        buffer = {ser_tx, buffer[7:1]};
        -> ser_sample; // data bit
    end

    repeat (ser_half_period) @(posedge clock);
    repeat (ser_half_period) @(posedge clock);
    -> ser_sample; // stop bit

    if (buffer < 32 || buffer >= 127)
        $display("Serial data: %d", buffer);
    else
        $display("Serial data: '%c'", buffer);
end

endmodule
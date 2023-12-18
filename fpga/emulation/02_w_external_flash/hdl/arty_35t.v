module arty_35t (
    input clk,
    input aresetn,
    inout design_clk_12p5,
    inout design_aresetn,
    inout flash_clk,
    inout flash_csb,
    inout [3:0] flash_io,
    inout ser_tx,
    inout ser_rx,
    
    output clk_12p5,
    output locked
);

wire [37:0] io_in;
wire [37:0] io_out;
wire [37:0] io_oeb;


wire clk_12p5, locked;

clk_wiz_0 clk_wiz_0_inst_0
(
  // Clock out ports
  .clk_out1(clk_12p5),     // output clk_out1
  // Status and control signals
  .resetn(aresetn), // input resetn
  .locked(locked),       // output locked
  // Clock in ports
  .clk_in1(clk)      // input clk_in1
);

user_project_wrapper user_project_wrapper_inst_0 (
    .wb_clk_i(wb_clk),
    .wb_rst_i(wb_rst),
    .wbs_stb_i(1'b0),
    .wbs_cyc_i(1'b0),
    .wbs_we_i(1'b0),
    .wbs_sel_i(4'b0),
    .wbs_dat_i(32'b0),
    .wbs_adr_i(32'b0),
    // .wbs_ack_o(),
    // .wbs_dat_o(),
    
    .la_data_in(64'b0),
    // .la_data_out(),
    .la_oenb(64'hFFFF_FFFF_FFFF_FFFF),

    .io_in(io_in),
    .io_out(io_out),
    .io_oeb(io_oeb),

    .user_clock2(1'b0)
    // .user_irq()
);

`ifdef SYNTHESIS
   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_8 (
      .O(io_in[8]),     // Buffer output
      .IO(design_clk_12p5),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[8]),     // Buffer input
      .T(io_oeb[8])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation

   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_9 (
      .O(io_in[9]),     // Buffer output
      .IO(design_aresetn),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[9]),     // Buffer input
      .T(io_oeb[9])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation   

   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_10 (
      .O(io_in[10]),     // Buffer output
      .IO(flash_csb),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[10]),     // Buffer input
      .T(io_oeb[10])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation

   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_11 (
      .O(io_in[11]),     // Buffer output
      .IO(flash_clk),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[11]),     // Buffer input
      .T(io_oeb[11])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation

   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_12 (
      .O(io_in[12]),     // Buffer output
      .IO(flash_io[0]),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[12]),     // Buffer input
      .T(io_oeb[12])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation

   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_13 (
      .O(io_in[13]),     // Buffer output
      .IO(flash_io[1]),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[13]),     // Buffer input
      .T(io_oeb[13])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation

   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_14 (
      .O(io_in[14]),     // Buffer output
      .IO(flash_io[2]),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[14]),     // Buffer input
      .T(io_oeb[14])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation

   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_15 (
      .O(io_in[15]),     // Buffer output
      .IO(flash_io[3]),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[15]),     // Buffer input
      .T(io_oeb[15])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation

   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_16 (
      .O(io_in[16]),     // Buffer output
      .IO(ser_tx),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[16]),     // Buffer input
      .T(io_oeb[16])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation


   // IOBUF: Single-ended Bi-directional Buffer
   //        All devices
   // Xilinx HDL Language Template, version 2023.2

   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) IOBUF_inst_17 (
      .O(io_in[17]),     // Buffer output
      .IO(ser_rx),   // Buffer inout port (connect directly to top-level port)
      .I(io_out[17]),     // Buffer input
      .T(io_oeb[17])      // 3-state enable input, high=input, low=output
   );

   // End of IOBUF_inst instantiation

  `else
    wire [37:0] io_oe;
    assign io_oe = ~io_oeb;
    bidirec bidirec_inst_8 (.oe(io_oe[8]), .inp(io_out[8]), .outp(io_in[8]), .bidir(design_clk_12p5) );
    bidirec bidirec_inst_9 (.oe(io_oe[9]), .inp(io_out[9]), .outp(io_in[9]), .bidir(design_aresetn) );
    bidirec bidirec_inst_10 (.oe(io_oe[10]), .inp(io_out[10]), .outp(io_in[10]), .bidir(flash_csb) );
    bidirec bidirec_inst_11 (.oe(io_oe[11]), .inp(io_out[11]), .outp(io_in[11]), .bidir(flash_clk) );
    bidirec bidirec_inst_12 (.oe(io_oe[12]), .inp(io_out[12]), .outp(io_in[12]), .bidir(flash_io[0]) );
    bidirec bidirec_inst_13 (.oe(io_oe[13]), .inp(io_out[13]), .outp(io_in[13]), .bidir(flash_io[1]) );
    bidirec bidirec_inst_14 (.oe(io_oe[14]), .inp(io_out[14]), .outp(io_in[14]), .bidir(flash_io[2]) );
    bidirec bidirec_inst_15 (.oe(io_oe[15]), .inp(io_out[15]), .outp(io_in[15]), .bidir(flash_io[3]) );
    bidirec bidirec_inst_16 (.oe(io_oe[16]), .inp(io_out[16]), .outp(io_in[16]), .bidir(ser_tx) );
    bidirec bidirec_inst_17 (.oe(io_oe[17]), .inp(io_out[17]), .outp(io_in[17]), .bidir(ser_rx) );    
  `endif



endmodule

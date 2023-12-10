module user_project_wrapper (user_clock2,
    vdd,
    vss,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vdd;
 input vss;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [63:0] la_data_in;
 output [63:0] la_data_out;
 input [63:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire \mem_addr[0] ;
 wire \mem_addr[10] ;
 wire \mem_addr[11] ;
 wire \mem_addr[12] ;
 wire \mem_addr[13] ;
 wire \mem_addr[14] ;
 wire \mem_addr[15] ;
 wire \mem_addr[16] ;
 wire \mem_addr[17] ;
 wire \mem_addr[18] ;
 wire \mem_addr[19] ;
 wire \mem_addr[1] ;
 wire \mem_addr[20] ;
 wire \mem_addr[21] ;
 wire \mem_addr[22] ;
 wire \mem_addr[23] ;
 wire \mem_addr[24] ;
 wire \mem_addr[25] ;
 wire \mem_addr[26] ;
 wire \mem_addr[27] ;
 wire \mem_addr[28] ;
 wire \mem_addr[29] ;
 wire \mem_addr[2] ;
 wire \mem_addr[30] ;
 wire \mem_addr[31] ;
 wire \mem_addr[3] ;
 wire \mem_addr[4] ;
 wire \mem_addr[5] ;
 wire \mem_addr[6] ;
 wire \mem_addr[7] ;
 wire \mem_addr[8] ;
 wire \mem_addr[9] ;
 wire mem_instr;
 wire \mem_rdata[0] ;
 wire \mem_rdata[10] ;
 wire \mem_rdata[11] ;
 wire \mem_rdata[12] ;
 wire \mem_rdata[13] ;
 wire \mem_rdata[14] ;
 wire \mem_rdata[15] ;
 wire \mem_rdata[16] ;
 wire \mem_rdata[17] ;
 wire \mem_rdata[18] ;
 wire \mem_rdata[19] ;
 wire \mem_rdata[1] ;
 wire \mem_rdata[20] ;
 wire \mem_rdata[21] ;
 wire \mem_rdata[22] ;
 wire \mem_rdata[23] ;
 wire \mem_rdata[24] ;
 wire \mem_rdata[25] ;
 wire \mem_rdata[26] ;
 wire \mem_rdata[27] ;
 wire \mem_rdata[28] ;
 wire \mem_rdata[29] ;
 wire \mem_rdata[2] ;
 wire \mem_rdata[30] ;
 wire \mem_rdata[31] ;
 wire \mem_rdata[3] ;
 wire \mem_rdata[4] ;
 wire \mem_rdata[5] ;
 wire \mem_rdata[6] ;
 wire \mem_rdata[7] ;
 wire \mem_rdata[8] ;
 wire \mem_rdata[9] ;
 wire mem_ready;
 wire mem_valid;
 wire \mem_wdata[0] ;
 wire \mem_wdata[10] ;
 wire \mem_wdata[11] ;
 wire \mem_wdata[12] ;
 wire \mem_wdata[13] ;
 wire \mem_wdata[14] ;
 wire \mem_wdata[15] ;
 wire \mem_wdata[16] ;
 wire \mem_wdata[17] ;
 wire \mem_wdata[18] ;
 wire \mem_wdata[19] ;
 wire \mem_wdata[1] ;
 wire \mem_wdata[20] ;
 wire \mem_wdata[21] ;
 wire \mem_wdata[22] ;
 wire \mem_wdata[23] ;
 wire \mem_wdata[24] ;
 wire \mem_wdata[25] ;
 wire \mem_wdata[26] ;
 wire \mem_wdata[27] ;
 wire \mem_wdata[28] ;
 wire \mem_wdata[29] ;
 wire \mem_wdata[2] ;
 wire \mem_wdata[30] ;
 wire \mem_wdata[31] ;
 wire \mem_wdata[3] ;
 wire \mem_wdata[4] ;
 wire \mem_wdata[5] ;
 wire \mem_wdata[6] ;
 wire \mem_wdata[7] ;
 wire \mem_wdata[8] ;
 wire \mem_wdata[9] ;
 wire \mem_wstrb[0] ;
 wire \mem_wstrb[1] ;
 wire \mem_wstrb[2] ;
 wire \mem_wstrb[3] ;
 wire \pcpi_approx_mul_rd[0] ;
 wire \pcpi_approx_mul_rd[10] ;
 wire \pcpi_approx_mul_rd[11] ;
 wire \pcpi_approx_mul_rd[12] ;
 wire \pcpi_approx_mul_rd[13] ;
 wire \pcpi_approx_mul_rd[14] ;
 wire \pcpi_approx_mul_rd[15] ;
 wire \pcpi_approx_mul_rd[16] ;
 wire \pcpi_approx_mul_rd[17] ;
 wire \pcpi_approx_mul_rd[18] ;
 wire \pcpi_approx_mul_rd[19] ;
 wire \pcpi_approx_mul_rd[1] ;
 wire \pcpi_approx_mul_rd[20] ;
 wire \pcpi_approx_mul_rd[21] ;
 wire \pcpi_approx_mul_rd[22] ;
 wire \pcpi_approx_mul_rd[23] ;
 wire \pcpi_approx_mul_rd[24] ;
 wire \pcpi_approx_mul_rd[25] ;
 wire \pcpi_approx_mul_rd[26] ;
 wire \pcpi_approx_mul_rd[27] ;
 wire \pcpi_approx_mul_rd[28] ;
 wire \pcpi_approx_mul_rd[29] ;
 wire \pcpi_approx_mul_rd[2] ;
 wire \pcpi_approx_mul_rd[30] ;
 wire \pcpi_approx_mul_rd[31] ;
 wire \pcpi_approx_mul_rd[3] ;
 wire \pcpi_approx_mul_rd[4] ;
 wire \pcpi_approx_mul_rd[5] ;
 wire \pcpi_approx_mul_rd[6] ;
 wire \pcpi_approx_mul_rd[7] ;
 wire \pcpi_approx_mul_rd[8] ;
 wire \pcpi_approx_mul_rd[9] ;
 wire pcpi_approx_mul_ready;
 wire pcpi_approx_mul_wait;
 wire pcpi_approx_mul_wr;
 wire \pcpi_div_rd[0] ;
 wire \pcpi_div_rd[10] ;
 wire \pcpi_div_rd[11] ;
 wire \pcpi_div_rd[12] ;
 wire \pcpi_div_rd[13] ;
 wire \pcpi_div_rd[14] ;
 wire \pcpi_div_rd[15] ;
 wire \pcpi_div_rd[16] ;
 wire \pcpi_div_rd[17] ;
 wire \pcpi_div_rd[18] ;
 wire \pcpi_div_rd[19] ;
 wire \pcpi_div_rd[1] ;
 wire \pcpi_div_rd[20] ;
 wire \pcpi_div_rd[21] ;
 wire \pcpi_div_rd[22] ;
 wire \pcpi_div_rd[23] ;
 wire \pcpi_div_rd[24] ;
 wire \pcpi_div_rd[25] ;
 wire \pcpi_div_rd[26] ;
 wire \pcpi_div_rd[27] ;
 wire \pcpi_div_rd[28] ;
 wire \pcpi_div_rd[29] ;
 wire \pcpi_div_rd[2] ;
 wire \pcpi_div_rd[30] ;
 wire \pcpi_div_rd[31] ;
 wire \pcpi_div_rd[3] ;
 wire \pcpi_div_rd[4] ;
 wire \pcpi_div_rd[5] ;
 wire \pcpi_div_rd[6] ;
 wire \pcpi_div_rd[7] ;
 wire \pcpi_div_rd[8] ;
 wire \pcpi_div_rd[9] ;
 wire pcpi_div_ready;
 wire pcpi_div_wait;
 wire pcpi_div_wr;
 wire \pcpi_exact_mul_rd[0] ;
 wire \pcpi_exact_mul_rd[10] ;
 wire \pcpi_exact_mul_rd[11] ;
 wire \pcpi_exact_mul_rd[12] ;
 wire \pcpi_exact_mul_rd[13] ;
 wire \pcpi_exact_mul_rd[14] ;
 wire \pcpi_exact_mul_rd[15] ;
 wire \pcpi_exact_mul_rd[16] ;
 wire \pcpi_exact_mul_rd[17] ;
 wire \pcpi_exact_mul_rd[18] ;
 wire \pcpi_exact_mul_rd[19] ;
 wire \pcpi_exact_mul_rd[1] ;
 wire \pcpi_exact_mul_rd[20] ;
 wire \pcpi_exact_mul_rd[21] ;
 wire \pcpi_exact_mul_rd[22] ;
 wire \pcpi_exact_mul_rd[23] ;
 wire \pcpi_exact_mul_rd[24] ;
 wire \pcpi_exact_mul_rd[25] ;
 wire \pcpi_exact_mul_rd[26] ;
 wire \pcpi_exact_mul_rd[27] ;
 wire \pcpi_exact_mul_rd[28] ;
 wire \pcpi_exact_mul_rd[29] ;
 wire \pcpi_exact_mul_rd[2] ;
 wire \pcpi_exact_mul_rd[30] ;
 wire \pcpi_exact_mul_rd[31] ;
 wire \pcpi_exact_mul_rd[3] ;
 wire \pcpi_exact_mul_rd[4] ;
 wire \pcpi_exact_mul_rd[5] ;
 wire \pcpi_exact_mul_rd[6] ;
 wire \pcpi_exact_mul_rd[7] ;
 wire \pcpi_exact_mul_rd[8] ;
 wire \pcpi_exact_mul_rd[9] ;
 wire pcpi_exact_mul_ready;
 wire pcpi_exact_mul_wait;
 wire pcpi_exact_mul_wr;
 wire \pcpi_insn[0] ;
 wire \pcpi_insn[10] ;
 wire \pcpi_insn[11] ;
 wire \pcpi_insn[12] ;
 wire \pcpi_insn[13] ;
 wire \pcpi_insn[14] ;
 wire \pcpi_insn[15] ;
 wire \pcpi_insn[16] ;
 wire \pcpi_insn[17] ;
 wire \pcpi_insn[18] ;
 wire \pcpi_insn[19] ;
 wire \pcpi_insn[1] ;
 wire \pcpi_insn[20] ;
 wire \pcpi_insn[21] ;
 wire \pcpi_insn[22] ;
 wire \pcpi_insn[23] ;
 wire \pcpi_insn[24] ;
 wire \pcpi_insn[25] ;
 wire \pcpi_insn[26] ;
 wire \pcpi_insn[27] ;
 wire \pcpi_insn[28] ;
 wire \pcpi_insn[29] ;
 wire \pcpi_insn[2] ;
 wire \pcpi_insn[30] ;
 wire \pcpi_insn[31] ;
 wire \pcpi_insn[3] ;
 wire \pcpi_insn[4] ;
 wire \pcpi_insn[5] ;
 wire \pcpi_insn[6] ;
 wire \pcpi_insn[7] ;
 wire \pcpi_insn[8] ;
 wire \pcpi_insn[9] ;
 wire \pcpi_mul_rd[0] ;
 wire \pcpi_mul_rd[10] ;
 wire \pcpi_mul_rd[11] ;
 wire \pcpi_mul_rd[12] ;
 wire \pcpi_mul_rd[13] ;
 wire \pcpi_mul_rd[14] ;
 wire \pcpi_mul_rd[15] ;
 wire \pcpi_mul_rd[16] ;
 wire \pcpi_mul_rd[17] ;
 wire \pcpi_mul_rd[18] ;
 wire \pcpi_mul_rd[19] ;
 wire \pcpi_mul_rd[1] ;
 wire \pcpi_mul_rd[20] ;
 wire \pcpi_mul_rd[21] ;
 wire \pcpi_mul_rd[22] ;
 wire \pcpi_mul_rd[23] ;
 wire \pcpi_mul_rd[24] ;
 wire \pcpi_mul_rd[25] ;
 wire \pcpi_mul_rd[26] ;
 wire \pcpi_mul_rd[27] ;
 wire \pcpi_mul_rd[28] ;
 wire \pcpi_mul_rd[29] ;
 wire \pcpi_mul_rd[2] ;
 wire \pcpi_mul_rd[30] ;
 wire \pcpi_mul_rd[31] ;
 wire \pcpi_mul_rd[3] ;
 wire \pcpi_mul_rd[4] ;
 wire \pcpi_mul_rd[5] ;
 wire \pcpi_mul_rd[6] ;
 wire \pcpi_mul_rd[7] ;
 wire \pcpi_mul_rd[8] ;
 wire \pcpi_mul_rd[9] ;
 wire pcpi_mul_ready;
 wire pcpi_mul_wait;
 wire pcpi_mul_wr;
 wire \pcpi_rs1[0] ;
 wire \pcpi_rs1[10] ;
 wire \pcpi_rs1[11] ;
 wire \pcpi_rs1[12] ;
 wire \pcpi_rs1[13] ;
 wire \pcpi_rs1[14] ;
 wire \pcpi_rs1[15] ;
 wire \pcpi_rs1[16] ;
 wire \pcpi_rs1[17] ;
 wire \pcpi_rs1[18] ;
 wire \pcpi_rs1[19] ;
 wire \pcpi_rs1[1] ;
 wire \pcpi_rs1[20] ;
 wire \pcpi_rs1[21] ;
 wire \pcpi_rs1[22] ;
 wire \pcpi_rs1[23] ;
 wire \pcpi_rs1[24] ;
 wire \pcpi_rs1[25] ;
 wire \pcpi_rs1[26] ;
 wire \pcpi_rs1[27] ;
 wire \pcpi_rs1[28] ;
 wire \pcpi_rs1[29] ;
 wire \pcpi_rs1[2] ;
 wire \pcpi_rs1[30] ;
 wire \pcpi_rs1[31] ;
 wire \pcpi_rs1[3] ;
 wire \pcpi_rs1[4] ;
 wire \pcpi_rs1[5] ;
 wire \pcpi_rs1[6] ;
 wire \pcpi_rs1[7] ;
 wire \pcpi_rs1[8] ;
 wire \pcpi_rs1[9] ;
 wire \pcpi_rs2[0] ;
 wire \pcpi_rs2[10] ;
 wire \pcpi_rs2[11] ;
 wire \pcpi_rs2[12] ;
 wire \pcpi_rs2[13] ;
 wire \pcpi_rs2[14] ;
 wire \pcpi_rs2[15] ;
 wire \pcpi_rs2[16] ;
 wire \pcpi_rs2[17] ;
 wire \pcpi_rs2[18] ;
 wire \pcpi_rs2[19] ;
 wire \pcpi_rs2[1] ;
 wire \pcpi_rs2[20] ;
 wire \pcpi_rs2[21] ;
 wire \pcpi_rs2[22] ;
 wire \pcpi_rs2[23] ;
 wire \pcpi_rs2[24] ;
 wire \pcpi_rs2[25] ;
 wire \pcpi_rs2[26] ;
 wire \pcpi_rs2[27] ;
 wire \pcpi_rs2[28] ;
 wire \pcpi_rs2[29] ;
 wire \pcpi_rs2[2] ;
 wire \pcpi_rs2[30] ;
 wire \pcpi_rs2[31] ;
 wire \pcpi_rs2[3] ;
 wire \pcpi_rs2[4] ;
 wire \pcpi_rs2[5] ;
 wire \pcpi_rs2[6] ;
 wire \pcpi_rs2[7] ;
 wire \pcpi_rs2[8] ;
 wire \pcpi_rs2[9] ;
 wire pcpi_valid;
 wire \ram_gwenb[0] ;
 wire \ram_gwenb[1] ;
 wire \ram_gwenb[2] ;
 wire \ram_gwenb[3] ;
 wire \ram_rdata[0] ;
 wire \ram_rdata[10] ;
 wire \ram_rdata[11] ;
 wire \ram_rdata[12] ;
 wire \ram_rdata[13] ;
 wire \ram_rdata[14] ;
 wire \ram_rdata[15] ;
 wire \ram_rdata[16] ;
 wire \ram_rdata[17] ;
 wire \ram_rdata[18] ;
 wire \ram_rdata[19] ;
 wire \ram_rdata[1] ;
 wire \ram_rdata[20] ;
 wire \ram_rdata[21] ;
 wire \ram_rdata[22] ;
 wire \ram_rdata[23] ;
 wire \ram_rdata[24] ;
 wire \ram_rdata[25] ;
 wire \ram_rdata[26] ;
 wire \ram_rdata[27] ;
 wire \ram_rdata[28] ;
 wire \ram_rdata[29] ;
 wire \ram_rdata[2] ;
 wire \ram_rdata[30] ;
 wire \ram_rdata[31] ;
 wire \ram_rdata[3] ;
 wire \ram_rdata[4] ;
 wire \ram_rdata[5] ;
 wire \ram_rdata[6] ;
 wire \ram_rdata[7] ;
 wire \ram_rdata[8] ;
 wire \ram_rdata[9] ;
 wire \ram_wenb[0] ;
 wire \ram_wenb[10] ;
 wire \ram_wenb[11] ;
 wire \ram_wenb[12] ;
 wire \ram_wenb[13] ;
 wire \ram_wenb[14] ;
 wire \ram_wenb[15] ;
 wire \ram_wenb[16] ;
 wire \ram_wenb[17] ;
 wire \ram_wenb[18] ;
 wire \ram_wenb[19] ;
 wire \ram_wenb[1] ;
 wire \ram_wenb[20] ;
 wire \ram_wenb[21] ;
 wire \ram_wenb[22] ;
 wire \ram_wenb[23] ;
 wire \ram_wenb[24] ;
 wire \ram_wenb[25] ;
 wire \ram_wenb[26] ;
 wire \ram_wenb[27] ;
 wire \ram_wenb[28] ;
 wire \ram_wenb[29] ;
 wire \ram_wenb[2] ;
 wire \ram_wenb[30] ;
 wire \ram_wenb[31] ;
 wire \ram_wenb[3] ;
 wire \ram_wenb[4] ;
 wire \ram_wenb[5] ;
 wire \ram_wenb[6] ;
 wire \ram_wenb[7] ;
 wire \ram_wenb[8] ;
 wire \ram_wenb[9] ;
 wire reset;
 wire resetn;
 wire simpleuart_dat_re;
 wire simpleuart_dat_we;
 wire \simpleuart_div_we[0] ;
 wire \simpleuart_div_we[1] ;
 wire \simpleuart_div_we[2] ;
 wire \simpleuart_div_we[3] ;
 wire \simpleuart_reg_dat_do[0] ;
 wire \simpleuart_reg_dat_do[10] ;
 wire \simpleuart_reg_dat_do[11] ;
 wire \simpleuart_reg_dat_do[12] ;
 wire \simpleuart_reg_dat_do[13] ;
 wire \simpleuart_reg_dat_do[14] ;
 wire \simpleuart_reg_dat_do[15] ;
 wire \simpleuart_reg_dat_do[16] ;
 wire \simpleuart_reg_dat_do[17] ;
 wire \simpleuart_reg_dat_do[18] ;
 wire \simpleuart_reg_dat_do[19] ;
 wire \simpleuart_reg_dat_do[1] ;
 wire \simpleuart_reg_dat_do[20] ;
 wire \simpleuart_reg_dat_do[21] ;
 wire \simpleuart_reg_dat_do[22] ;
 wire \simpleuart_reg_dat_do[23] ;
 wire \simpleuart_reg_dat_do[24] ;
 wire \simpleuart_reg_dat_do[25] ;
 wire \simpleuart_reg_dat_do[26] ;
 wire \simpleuart_reg_dat_do[27] ;
 wire \simpleuart_reg_dat_do[28] ;
 wire \simpleuart_reg_dat_do[29] ;
 wire \simpleuart_reg_dat_do[2] ;
 wire \simpleuart_reg_dat_do[30] ;
 wire \simpleuart_reg_dat_do[31] ;
 wire \simpleuart_reg_dat_do[3] ;
 wire \simpleuart_reg_dat_do[4] ;
 wire \simpleuart_reg_dat_do[5] ;
 wire \simpleuart_reg_dat_do[6] ;
 wire \simpleuart_reg_dat_do[7] ;
 wire \simpleuart_reg_dat_do[8] ;
 wire \simpleuart_reg_dat_do[9] ;
 wire simpleuart_reg_dat_wait;
 wire \simpleuart_reg_div_do[0] ;
 wire \simpleuart_reg_div_do[10] ;
 wire \simpleuart_reg_div_do[11] ;
 wire \simpleuart_reg_div_do[12] ;
 wire \simpleuart_reg_div_do[13] ;
 wire \simpleuart_reg_div_do[14] ;
 wire \simpleuart_reg_div_do[15] ;
 wire \simpleuart_reg_div_do[16] ;
 wire \simpleuart_reg_div_do[17] ;
 wire \simpleuart_reg_div_do[18] ;
 wire \simpleuart_reg_div_do[19] ;
 wire \simpleuart_reg_div_do[1] ;
 wire \simpleuart_reg_div_do[20] ;
 wire \simpleuart_reg_div_do[21] ;
 wire \simpleuart_reg_div_do[22] ;
 wire \simpleuart_reg_div_do[23] ;
 wire \simpleuart_reg_div_do[24] ;
 wire \simpleuart_reg_div_do[25] ;
 wire \simpleuart_reg_div_do[26] ;
 wire \simpleuart_reg_div_do[27] ;
 wire \simpleuart_reg_div_do[28] ;
 wire \simpleuart_reg_div_do[29] ;
 wire \simpleuart_reg_div_do[2] ;
 wire \simpleuart_reg_div_do[30] ;
 wire \simpleuart_reg_div_do[31] ;
 wire \simpleuart_reg_div_do[3] ;
 wire \simpleuart_reg_div_do[4] ;
 wire \simpleuart_reg_div_do[5] ;
 wire \simpleuart_reg_div_do[6] ;
 wire \simpleuart_reg_div_do[7] ;
 wire \simpleuart_reg_div_do[8] ;
 wire \simpleuart_reg_div_do[9] ;
 wire \spimem_rdata[0] ;
 wire \spimem_rdata[10] ;
 wire \spimem_rdata[11] ;
 wire \spimem_rdata[12] ;
 wire \spimem_rdata[13] ;
 wire \spimem_rdata[14] ;
 wire \spimem_rdata[15] ;
 wire \spimem_rdata[16] ;
 wire \spimem_rdata[17] ;
 wire \spimem_rdata[18] ;
 wire \spimem_rdata[19] ;
 wire \spimem_rdata[1] ;
 wire \spimem_rdata[20] ;
 wire \spimem_rdata[21] ;
 wire \spimem_rdata[22] ;
 wire \spimem_rdata[23] ;
 wire \spimem_rdata[24] ;
 wire \spimem_rdata[25] ;
 wire \spimem_rdata[26] ;
 wire \spimem_rdata[27] ;
 wire \spimem_rdata[28] ;
 wire \spimem_rdata[29] ;
 wire \spimem_rdata[2] ;
 wire \spimem_rdata[30] ;
 wire \spimem_rdata[31] ;
 wire \spimem_rdata[3] ;
 wire \spimem_rdata[4] ;
 wire \spimem_rdata[5] ;
 wire \spimem_rdata[6] ;
 wire \spimem_rdata[7] ;
 wire \spimem_rdata[8] ;
 wire \spimem_rdata[9] ;
 wire spimem_ready;
 wire spimem_valid;
 wire \spimemio_cfgreg_do[0] ;
 wire \spimemio_cfgreg_do[10] ;
 wire \spimemio_cfgreg_do[11] ;
 wire \spimemio_cfgreg_do[12] ;
 wire \spimemio_cfgreg_do[13] ;
 wire \spimemio_cfgreg_do[14] ;
 wire \spimemio_cfgreg_do[15] ;
 wire \spimemio_cfgreg_do[16] ;
 wire \spimemio_cfgreg_do[17] ;
 wire \spimemio_cfgreg_do[18] ;
 wire \spimemio_cfgreg_do[19] ;
 wire \spimemio_cfgreg_do[1] ;
 wire \spimemio_cfgreg_do[20] ;
 wire \spimemio_cfgreg_do[21] ;
 wire \spimemio_cfgreg_do[22] ;
 wire \spimemio_cfgreg_do[23] ;
 wire \spimemio_cfgreg_do[24] ;
 wire \spimemio_cfgreg_do[25] ;
 wire \spimemio_cfgreg_do[26] ;
 wire \spimemio_cfgreg_do[27] ;
 wire \spimemio_cfgreg_do[28] ;
 wire \spimemio_cfgreg_do[29] ;
 wire \spimemio_cfgreg_do[2] ;
 wire \spimemio_cfgreg_do[30] ;
 wire \spimemio_cfgreg_do[31] ;
 wire \spimemio_cfgreg_do[3] ;
 wire \spimemio_cfgreg_do[4] ;
 wire \spimemio_cfgreg_do[5] ;
 wire \spimemio_cfgreg_do[6] ;
 wire \spimemio_cfgreg_do[7] ;
 wire \spimemio_cfgreg_do[8] ;
 wire \spimemio_cfgreg_do[9] ;
 wire \spimemio_cfgreg_we[0] ;
 wire \spimemio_cfgreg_we[1] ;
 wire \spimemio_cfgreg_we[2] ;
 wire \spimemio_cfgreg_we[3] ;

 cpu cpu_inst_0 (.clk(io_in[8]),
    .mem_instr(mem_instr),
    .mem_ready(mem_ready),
    .mem_valid(mem_valid),
    .pcpi_approx_mul_ready(pcpi_approx_mul_ready),
    .pcpi_approx_mul_wait(pcpi_approx_mul_wait),
    .pcpi_approx_mul_wr(pcpi_approx_mul_wr),
    .pcpi_div_ready(pcpi_div_ready),
    .pcpi_div_wait(pcpi_div_wait),
    .pcpi_div_wr(pcpi_div_wr),
    .pcpi_exact_mul_ready(pcpi_exact_mul_ready),
    .pcpi_exact_mul_wait(pcpi_exact_mul_wait),
    .pcpi_exact_mul_wr(pcpi_exact_mul_wr),
    .pcpi_mul_ready(pcpi_mul_ready),
    .pcpi_mul_wait(pcpi_mul_wait),
    .pcpi_mul_wr(pcpi_mul_wr),
    .pcpi_valid(pcpi_valid),
    .resetn(resetn),
    .vdd(vdd),
    .vss(vss),
    .irq_in({io_in[21],
    io_in[20],
    io_in[19],
    io_in[18]}),
    .irq_oeb({io_oeb[21],
    io_oeb[20],
    io_oeb[19],
    io_oeb[18]}),
    .irq_out({io_out[21],
    io_out[20],
    io_out[19],
    io_out[18]}),
    .mem_addr({\mem_addr[31] ,
    \mem_addr[30] ,
    \mem_addr[29] ,
    \mem_addr[28] ,
    \mem_addr[27] ,
    \mem_addr[26] ,
    \mem_addr[25] ,
    \mem_addr[24] ,
    \mem_addr[23] ,
    \mem_addr[22] ,
    \mem_addr[21] ,
    \mem_addr[20] ,
    \mem_addr[19] ,
    \mem_addr[18] ,
    \mem_addr[17] ,
    \mem_addr[16] ,
    \mem_addr[15] ,
    \mem_addr[14] ,
    \mem_addr[13] ,
    \mem_addr[12] ,
    \mem_addr[11] ,
    \mem_addr[10] ,
    \mem_addr[9] ,
    \mem_addr[8] ,
    \mem_addr[7] ,
    \mem_addr[6] ,
    \mem_addr[5] ,
    \mem_addr[4] ,
    \mem_addr[3] ,
    \mem_addr[2] ,
    \mem_addr[1] ,
    \mem_addr[0] }),
    .mem_rdata({\mem_rdata[31] ,
    \mem_rdata[30] ,
    \mem_rdata[29] ,
    \mem_rdata[28] ,
    \mem_rdata[27] ,
    \mem_rdata[26] ,
    \mem_rdata[25] ,
    \mem_rdata[24] ,
    \mem_rdata[23] ,
    \mem_rdata[22] ,
    \mem_rdata[21] ,
    \mem_rdata[20] ,
    \mem_rdata[19] ,
    \mem_rdata[18] ,
    \mem_rdata[17] ,
    \mem_rdata[16] ,
    \mem_rdata[15] ,
    \mem_rdata[14] ,
    \mem_rdata[13] ,
    \mem_rdata[12] ,
    \mem_rdata[11] ,
    \mem_rdata[10] ,
    \mem_rdata[9] ,
    \mem_rdata[8] ,
    \mem_rdata[7] ,
    \mem_rdata[6] ,
    \mem_rdata[5] ,
    \mem_rdata[4] ,
    \mem_rdata[3] ,
    \mem_rdata[2] ,
    \mem_rdata[1] ,
    \mem_rdata[0] }),
    .mem_wdata({\mem_wdata[31] ,
    \mem_wdata[30] ,
    \mem_wdata[29] ,
    \mem_wdata[28] ,
    \mem_wdata[27] ,
    \mem_wdata[26] ,
    \mem_wdata[25] ,
    \mem_wdata[24] ,
    \mem_wdata[23] ,
    \mem_wdata[22] ,
    \mem_wdata[21] ,
    \mem_wdata[20] ,
    \mem_wdata[19] ,
    \mem_wdata[18] ,
    \mem_wdata[17] ,
    \mem_wdata[16] ,
    \mem_wdata[15] ,
    \mem_wdata[14] ,
    \mem_wdata[13] ,
    \mem_wdata[12] ,
    \mem_wdata[11] ,
    \mem_wdata[10] ,
    \mem_wdata[9] ,
    \mem_wdata[8] ,
    \mem_wdata[7] ,
    \mem_wdata[6] ,
    \mem_wdata[5] ,
    \mem_wdata[4] ,
    \mem_wdata[3] ,
    \mem_wdata[2] ,
    \mem_wdata[1] ,
    \mem_wdata[0] }),
    .mem_wstrb({\mem_wstrb[3] ,
    \mem_wstrb[2] ,
    \mem_wstrb[1] ,
    \mem_wstrb[0] }),
    .pcpi_approx_mul_rd({\pcpi_approx_mul_rd[31] ,
    \pcpi_approx_mul_rd[30] ,
    \pcpi_approx_mul_rd[29] ,
    \pcpi_approx_mul_rd[28] ,
    \pcpi_approx_mul_rd[27] ,
    \pcpi_approx_mul_rd[26] ,
    \pcpi_approx_mul_rd[25] ,
    \pcpi_approx_mul_rd[24] ,
    \pcpi_approx_mul_rd[23] ,
    \pcpi_approx_mul_rd[22] ,
    \pcpi_approx_mul_rd[21] ,
    \pcpi_approx_mul_rd[20] ,
    \pcpi_approx_mul_rd[19] ,
    \pcpi_approx_mul_rd[18] ,
    \pcpi_approx_mul_rd[17] ,
    \pcpi_approx_mul_rd[16] ,
    \pcpi_approx_mul_rd[15] ,
    \pcpi_approx_mul_rd[14] ,
    \pcpi_approx_mul_rd[13] ,
    \pcpi_approx_mul_rd[12] ,
    \pcpi_approx_mul_rd[11] ,
    \pcpi_approx_mul_rd[10] ,
    \pcpi_approx_mul_rd[9] ,
    \pcpi_approx_mul_rd[8] ,
    \pcpi_approx_mul_rd[7] ,
    \pcpi_approx_mul_rd[6] ,
    \pcpi_approx_mul_rd[5] ,
    \pcpi_approx_mul_rd[4] ,
    \pcpi_approx_mul_rd[3] ,
    \pcpi_approx_mul_rd[2] ,
    \pcpi_approx_mul_rd[1] ,
    \pcpi_approx_mul_rd[0] }),
    .pcpi_div_rd({\pcpi_div_rd[31] ,
    \pcpi_div_rd[30] ,
    \pcpi_div_rd[29] ,
    \pcpi_div_rd[28] ,
    \pcpi_div_rd[27] ,
    \pcpi_div_rd[26] ,
    \pcpi_div_rd[25] ,
    \pcpi_div_rd[24] ,
    \pcpi_div_rd[23] ,
    \pcpi_div_rd[22] ,
    \pcpi_div_rd[21] ,
    \pcpi_div_rd[20] ,
    \pcpi_div_rd[19] ,
    \pcpi_div_rd[18] ,
    \pcpi_div_rd[17] ,
    \pcpi_div_rd[16] ,
    \pcpi_div_rd[15] ,
    \pcpi_div_rd[14] ,
    \pcpi_div_rd[13] ,
    \pcpi_div_rd[12] ,
    \pcpi_div_rd[11] ,
    \pcpi_div_rd[10] ,
    \pcpi_div_rd[9] ,
    \pcpi_div_rd[8] ,
    \pcpi_div_rd[7] ,
    \pcpi_div_rd[6] ,
    \pcpi_div_rd[5] ,
    \pcpi_div_rd[4] ,
    \pcpi_div_rd[3] ,
    \pcpi_div_rd[2] ,
    \pcpi_div_rd[1] ,
    \pcpi_div_rd[0] }),
    .pcpi_exact_mul_rd({\pcpi_exact_mul_rd[31] ,
    \pcpi_exact_mul_rd[30] ,
    \pcpi_exact_mul_rd[29] ,
    \pcpi_exact_mul_rd[28] ,
    \pcpi_exact_mul_rd[27] ,
    \pcpi_exact_mul_rd[26] ,
    \pcpi_exact_mul_rd[25] ,
    \pcpi_exact_mul_rd[24] ,
    \pcpi_exact_mul_rd[23] ,
    \pcpi_exact_mul_rd[22] ,
    \pcpi_exact_mul_rd[21] ,
    \pcpi_exact_mul_rd[20] ,
    \pcpi_exact_mul_rd[19] ,
    \pcpi_exact_mul_rd[18] ,
    \pcpi_exact_mul_rd[17] ,
    \pcpi_exact_mul_rd[16] ,
    \pcpi_exact_mul_rd[15] ,
    \pcpi_exact_mul_rd[14] ,
    \pcpi_exact_mul_rd[13] ,
    \pcpi_exact_mul_rd[12] ,
    \pcpi_exact_mul_rd[11] ,
    \pcpi_exact_mul_rd[10] ,
    \pcpi_exact_mul_rd[9] ,
    \pcpi_exact_mul_rd[8] ,
    \pcpi_exact_mul_rd[7] ,
    \pcpi_exact_mul_rd[6] ,
    \pcpi_exact_mul_rd[5] ,
    \pcpi_exact_mul_rd[4] ,
    \pcpi_exact_mul_rd[3] ,
    \pcpi_exact_mul_rd[2] ,
    \pcpi_exact_mul_rd[1] ,
    \pcpi_exact_mul_rd[0] }),
    .pcpi_insn({\pcpi_insn[31] ,
    \pcpi_insn[30] ,
    \pcpi_insn[29] ,
    \pcpi_insn[28] ,
    \pcpi_insn[27] ,
    \pcpi_insn[26] ,
    \pcpi_insn[25] ,
    \pcpi_insn[24] ,
    \pcpi_insn[23] ,
    \pcpi_insn[22] ,
    \pcpi_insn[21] ,
    \pcpi_insn[20] ,
    \pcpi_insn[19] ,
    \pcpi_insn[18] ,
    \pcpi_insn[17] ,
    \pcpi_insn[16] ,
    \pcpi_insn[15] ,
    \pcpi_insn[14] ,
    \pcpi_insn[13] ,
    \pcpi_insn[12] ,
    \pcpi_insn[11] ,
    \pcpi_insn[10] ,
    \pcpi_insn[9] ,
    \pcpi_insn[8] ,
    \pcpi_insn[7] ,
    \pcpi_insn[6] ,
    \pcpi_insn[5] ,
    \pcpi_insn[4] ,
    \pcpi_insn[3] ,
    \pcpi_insn[2] ,
    \pcpi_insn[1] ,
    \pcpi_insn[0] }),
    .pcpi_mul_rd({\pcpi_mul_rd[31] ,
    \pcpi_mul_rd[30] ,
    \pcpi_mul_rd[29] ,
    \pcpi_mul_rd[28] ,
    \pcpi_mul_rd[27] ,
    \pcpi_mul_rd[26] ,
    \pcpi_mul_rd[25] ,
    \pcpi_mul_rd[24] ,
    \pcpi_mul_rd[23] ,
    \pcpi_mul_rd[22] ,
    \pcpi_mul_rd[21] ,
    \pcpi_mul_rd[20] ,
    \pcpi_mul_rd[19] ,
    \pcpi_mul_rd[18] ,
    \pcpi_mul_rd[17] ,
    \pcpi_mul_rd[16] ,
    \pcpi_mul_rd[15] ,
    \pcpi_mul_rd[14] ,
    \pcpi_mul_rd[13] ,
    \pcpi_mul_rd[12] ,
    \pcpi_mul_rd[11] ,
    \pcpi_mul_rd[10] ,
    \pcpi_mul_rd[9] ,
    \pcpi_mul_rd[8] ,
    \pcpi_mul_rd[7] ,
    \pcpi_mul_rd[6] ,
    \pcpi_mul_rd[5] ,
    \pcpi_mul_rd[4] ,
    \pcpi_mul_rd[3] ,
    \pcpi_mul_rd[2] ,
    \pcpi_mul_rd[1] ,
    \pcpi_mul_rd[0] }),
    .pcpi_rs1({\pcpi_rs1[31] ,
    \pcpi_rs1[30] ,
    \pcpi_rs1[29] ,
    \pcpi_rs1[28] ,
    \pcpi_rs1[27] ,
    \pcpi_rs1[26] ,
    \pcpi_rs1[25] ,
    \pcpi_rs1[24] ,
    \pcpi_rs1[23] ,
    \pcpi_rs1[22] ,
    \pcpi_rs1[21] ,
    \pcpi_rs1[20] ,
    \pcpi_rs1[19] ,
    \pcpi_rs1[18] ,
    \pcpi_rs1[17] ,
    \pcpi_rs1[16] ,
    \pcpi_rs1[15] ,
    \pcpi_rs1[14] ,
    \pcpi_rs1[13] ,
    \pcpi_rs1[12] ,
    \pcpi_rs1[11] ,
    \pcpi_rs1[10] ,
    \pcpi_rs1[9] ,
    \pcpi_rs1[8] ,
    \pcpi_rs1[7] ,
    \pcpi_rs1[6] ,
    \pcpi_rs1[5] ,
    \pcpi_rs1[4] ,
    \pcpi_rs1[3] ,
    \pcpi_rs1[2] ,
    \pcpi_rs1[1] ,
    \pcpi_rs1[0] }),
    .pcpi_rs2({\pcpi_rs2[31] ,
    \pcpi_rs2[30] ,
    \pcpi_rs2[29] ,
    \pcpi_rs2[28] ,
    \pcpi_rs2[27] ,
    \pcpi_rs2[26] ,
    \pcpi_rs2[25] ,
    \pcpi_rs2[24] ,
    \pcpi_rs2[23] ,
    \pcpi_rs2[22] ,
    \pcpi_rs2[21] ,
    \pcpi_rs2[20] ,
    \pcpi_rs2[19] ,
    \pcpi_rs2[18] ,
    \pcpi_rs2[17] ,
    \pcpi_rs2[16] ,
    \pcpi_rs2[15] ,
    \pcpi_rs2[14] ,
    \pcpi_rs2[13] ,
    \pcpi_rs2[12] ,
    \pcpi_rs2[11] ,
    \pcpi_rs2[10] ,
    \pcpi_rs2[9] ,
    \pcpi_rs2[8] ,
    \pcpi_rs2[7] ,
    \pcpi_rs2[6] ,
    \pcpi_rs2[5] ,
    \pcpi_rs2[4] ,
    \pcpi_rs2[3] ,
    \pcpi_rs2[2] ,
    \pcpi_rs2[1] ,
    \pcpi_rs2[0] }));
 ctrl ctrl_inst_0 (.reset(reset),
    .resetn(resetn),
    .vdd(vdd),
    .vss(vss),
    .ctrl_in({io_in[9],
    io_in[8]}),
    .ctrl_oeb({io_oeb[9],
    io_oeb[8]}),
    .ctrl_out({io_out[9],
    io_out[8]}));
 pcpi_approx_mul pcpi_approx_mul_inst_0 (.clk(io_in[8]),
    .pcpi_ready(pcpi_approx_mul_ready),
    .pcpi_valid(pcpi_valid),
    .pcpi_wait(pcpi_approx_mul_wait),
    .pcpi_wr(pcpi_approx_mul_wr),
    .resetn(resetn),
    .vdd(vdd),
    .vss(vss),
    .pcpi_insn({\pcpi_insn[31] ,
    \pcpi_insn[30] ,
    \pcpi_insn[29] ,
    \pcpi_insn[28] ,
    \pcpi_insn[27] ,
    \pcpi_insn[26] ,
    \pcpi_insn[25] ,
    \pcpi_insn[24] ,
    \pcpi_insn[23] ,
    \pcpi_insn[22] ,
    \pcpi_insn[21] ,
    \pcpi_insn[20] ,
    \pcpi_insn[19] ,
    \pcpi_insn[18] ,
    \pcpi_insn[17] ,
    \pcpi_insn[16] ,
    \pcpi_insn[15] ,
    \pcpi_insn[14] ,
    \pcpi_insn[13] ,
    \pcpi_insn[12] ,
    \pcpi_insn[11] ,
    \pcpi_insn[10] ,
    \pcpi_insn[9] ,
    \pcpi_insn[8] ,
    \pcpi_insn[7] ,
    \pcpi_insn[6] ,
    \pcpi_insn[5] ,
    \pcpi_insn[4] ,
    \pcpi_insn[3] ,
    \pcpi_insn[2] ,
    \pcpi_insn[1] ,
    \pcpi_insn[0] }),
    .pcpi_rd({\pcpi_approx_mul_rd[31] ,
    \pcpi_approx_mul_rd[30] ,
    \pcpi_approx_mul_rd[29] ,
    \pcpi_approx_mul_rd[28] ,
    \pcpi_approx_mul_rd[27] ,
    \pcpi_approx_mul_rd[26] ,
    \pcpi_approx_mul_rd[25] ,
    \pcpi_approx_mul_rd[24] ,
    \pcpi_approx_mul_rd[23] ,
    \pcpi_approx_mul_rd[22] ,
    \pcpi_approx_mul_rd[21] ,
    \pcpi_approx_mul_rd[20] ,
    \pcpi_approx_mul_rd[19] ,
    \pcpi_approx_mul_rd[18] ,
    \pcpi_approx_mul_rd[17] ,
    \pcpi_approx_mul_rd[16] ,
    \pcpi_approx_mul_rd[15] ,
    \pcpi_approx_mul_rd[14] ,
    \pcpi_approx_mul_rd[13] ,
    \pcpi_approx_mul_rd[12] ,
    \pcpi_approx_mul_rd[11] ,
    \pcpi_approx_mul_rd[10] ,
    \pcpi_approx_mul_rd[9] ,
    \pcpi_approx_mul_rd[8] ,
    \pcpi_approx_mul_rd[7] ,
    \pcpi_approx_mul_rd[6] ,
    \pcpi_approx_mul_rd[5] ,
    \pcpi_approx_mul_rd[4] ,
    \pcpi_approx_mul_rd[3] ,
    \pcpi_approx_mul_rd[2] ,
    \pcpi_approx_mul_rd[1] ,
    \pcpi_approx_mul_rd[0] }),
    .pcpi_rs1({\pcpi_rs1[31] ,
    \pcpi_rs1[30] ,
    \pcpi_rs1[29] ,
    \pcpi_rs1[28] ,
    \pcpi_rs1[27] ,
    \pcpi_rs1[26] ,
    \pcpi_rs1[25] ,
    \pcpi_rs1[24] ,
    \pcpi_rs1[23] ,
    \pcpi_rs1[22] ,
    \pcpi_rs1[21] ,
    \pcpi_rs1[20] ,
    \pcpi_rs1[19] ,
    \pcpi_rs1[18] ,
    \pcpi_rs1[17] ,
    \pcpi_rs1[16] ,
    \pcpi_rs1[15] ,
    \pcpi_rs1[14] ,
    \pcpi_rs1[13] ,
    \pcpi_rs1[12] ,
    \pcpi_rs1[11] ,
    \pcpi_rs1[10] ,
    \pcpi_rs1[9] ,
    \pcpi_rs1[8] ,
    \pcpi_rs1[7] ,
    \pcpi_rs1[6] ,
    \pcpi_rs1[5] ,
    \pcpi_rs1[4] ,
    \pcpi_rs1[3] ,
    \pcpi_rs1[2] ,
    \pcpi_rs1[1] ,
    \pcpi_rs1[0] }),
    .pcpi_rs2({\pcpi_rs2[31] ,
    \pcpi_rs2[30] ,
    \pcpi_rs2[29] ,
    \pcpi_rs2[28] ,
    \pcpi_rs2[27] ,
    \pcpi_rs2[26] ,
    \pcpi_rs2[25] ,
    \pcpi_rs2[24] ,
    \pcpi_rs2[23] ,
    \pcpi_rs2[22] ,
    \pcpi_rs2[21] ,
    \pcpi_rs2[20] ,
    \pcpi_rs2[19] ,
    \pcpi_rs2[18] ,
    \pcpi_rs2[17] ,
    \pcpi_rs2[16] ,
    \pcpi_rs2[15] ,
    \pcpi_rs2[14] ,
    \pcpi_rs2[13] ,
    \pcpi_rs2[12] ,
    \pcpi_rs2[11] ,
    \pcpi_rs2[10] ,
    \pcpi_rs2[9] ,
    \pcpi_rs2[8] ,
    \pcpi_rs2[7] ,
    \pcpi_rs2[6] ,
    \pcpi_rs2[5] ,
    \pcpi_rs2[4] ,
    \pcpi_rs2[3] ,
    \pcpi_rs2[2] ,
    \pcpi_rs2[1] ,
    \pcpi_rs2[0] }));
 pcpi_div pcpi_div_inst_0 (.clk(io_in[8]),
    .pcpi_div_ready(pcpi_div_ready),
    .pcpi_div_valid(pcpi_valid),
    .pcpi_div_wait(pcpi_div_wait),
    .pcpi_div_wr(pcpi_div_wr),
    .resetn(resetn),
    .vdd(vdd),
    .vss(vss),
    .pcpi_div_rd({\pcpi_div_rd[31] ,
    \pcpi_div_rd[30] ,
    \pcpi_div_rd[29] ,
    \pcpi_div_rd[28] ,
    \pcpi_div_rd[27] ,
    \pcpi_div_rd[26] ,
    \pcpi_div_rd[25] ,
    \pcpi_div_rd[24] ,
    \pcpi_div_rd[23] ,
    \pcpi_div_rd[22] ,
    \pcpi_div_rd[21] ,
    \pcpi_div_rd[20] ,
    \pcpi_div_rd[19] ,
    \pcpi_div_rd[18] ,
    \pcpi_div_rd[17] ,
    \pcpi_div_rd[16] ,
    \pcpi_div_rd[15] ,
    \pcpi_div_rd[14] ,
    \pcpi_div_rd[13] ,
    \pcpi_div_rd[12] ,
    \pcpi_div_rd[11] ,
    \pcpi_div_rd[10] ,
    \pcpi_div_rd[9] ,
    \pcpi_div_rd[8] ,
    \pcpi_div_rd[7] ,
    \pcpi_div_rd[6] ,
    \pcpi_div_rd[5] ,
    \pcpi_div_rd[4] ,
    \pcpi_div_rd[3] ,
    \pcpi_div_rd[2] ,
    \pcpi_div_rd[1] ,
    \pcpi_div_rd[0] }),
    .pcpi_insn({\pcpi_insn[31] ,
    \pcpi_insn[30] ,
    \pcpi_insn[29] ,
    \pcpi_insn[28] ,
    \pcpi_insn[27] ,
    \pcpi_insn[26] ,
    \pcpi_insn[25] ,
    \pcpi_insn[24] ,
    \pcpi_insn[23] ,
    \pcpi_insn[22] ,
    \pcpi_insn[21] ,
    \pcpi_insn[20] ,
    \pcpi_insn[19] ,
    \pcpi_insn[18] ,
    \pcpi_insn[17] ,
    \pcpi_insn[16] ,
    \pcpi_insn[15] ,
    \pcpi_insn[14] ,
    \pcpi_insn[13] ,
    \pcpi_insn[12] ,
    \pcpi_insn[11] ,
    \pcpi_insn[10] ,
    \pcpi_insn[9] ,
    \pcpi_insn[8] ,
    \pcpi_insn[7] ,
    \pcpi_insn[6] ,
    \pcpi_insn[5] ,
    \pcpi_insn[4] ,
    \pcpi_insn[3] ,
    \pcpi_insn[2] ,
    \pcpi_insn[1] ,
    \pcpi_insn[0] }),
    .pcpi_rs1({\pcpi_rs1[31] ,
    \pcpi_rs1[30] ,
    \pcpi_rs1[29] ,
    \pcpi_rs1[28] ,
    \pcpi_rs1[27] ,
    \pcpi_rs1[26] ,
    \pcpi_rs1[25] ,
    \pcpi_rs1[24] ,
    \pcpi_rs1[23] ,
    \pcpi_rs1[22] ,
    \pcpi_rs1[21] ,
    \pcpi_rs1[20] ,
    \pcpi_rs1[19] ,
    \pcpi_rs1[18] ,
    \pcpi_rs1[17] ,
    \pcpi_rs1[16] ,
    \pcpi_rs1[15] ,
    \pcpi_rs1[14] ,
    \pcpi_rs1[13] ,
    \pcpi_rs1[12] ,
    \pcpi_rs1[11] ,
    \pcpi_rs1[10] ,
    \pcpi_rs1[9] ,
    \pcpi_rs1[8] ,
    \pcpi_rs1[7] ,
    \pcpi_rs1[6] ,
    \pcpi_rs1[5] ,
    \pcpi_rs1[4] ,
    \pcpi_rs1[3] ,
    \pcpi_rs1[2] ,
    \pcpi_rs1[1] ,
    \pcpi_rs1[0] }),
    .pcpi_rs2({\pcpi_rs2[31] ,
    \pcpi_rs2[30] ,
    \pcpi_rs2[29] ,
    \pcpi_rs2[28] ,
    \pcpi_rs2[27] ,
    \pcpi_rs2[26] ,
    \pcpi_rs2[25] ,
    \pcpi_rs2[24] ,
    \pcpi_rs2[23] ,
    \pcpi_rs2[22] ,
    \pcpi_rs2[21] ,
    \pcpi_rs2[20] ,
    \pcpi_rs2[19] ,
    \pcpi_rs2[18] ,
    \pcpi_rs2[17] ,
    \pcpi_rs2[16] ,
    \pcpi_rs2[15] ,
    \pcpi_rs2[14] ,
    \pcpi_rs2[13] ,
    \pcpi_rs2[12] ,
    \pcpi_rs2[11] ,
    \pcpi_rs2[10] ,
    \pcpi_rs2[9] ,
    \pcpi_rs2[8] ,
    \pcpi_rs2[7] ,
    \pcpi_rs2[6] ,
    \pcpi_rs2[5] ,
    \pcpi_rs2[4] ,
    \pcpi_rs2[3] ,
    \pcpi_rs2[2] ,
    \pcpi_rs2[1] ,
    \pcpi_rs2[0] }));
 pcpi_exact_mul pcpi_exact_mul_inst_0 (.clk(io_in[8]),
    .pcpi_ready(pcpi_exact_mul_ready),
    .pcpi_valid(pcpi_valid),
    .pcpi_wait(pcpi_exact_mul_wait),
    .pcpi_wr(pcpi_exact_mul_wr),
    .resetn(resetn),
    .vdd(vdd),
    .vss(vss),
    .pcpi_insn({\pcpi_insn[31] ,
    \pcpi_insn[30] ,
    \pcpi_insn[29] ,
    \pcpi_insn[28] ,
    \pcpi_insn[27] ,
    \pcpi_insn[26] ,
    \pcpi_insn[25] ,
    \pcpi_insn[24] ,
    \pcpi_insn[23] ,
    \pcpi_insn[22] ,
    \pcpi_insn[21] ,
    \pcpi_insn[20] ,
    \pcpi_insn[19] ,
    \pcpi_insn[18] ,
    \pcpi_insn[17] ,
    \pcpi_insn[16] ,
    \pcpi_insn[15] ,
    \pcpi_insn[14] ,
    \pcpi_insn[13] ,
    \pcpi_insn[12] ,
    \pcpi_insn[11] ,
    \pcpi_insn[10] ,
    \pcpi_insn[9] ,
    \pcpi_insn[8] ,
    \pcpi_insn[7] ,
    \pcpi_insn[6] ,
    \pcpi_insn[5] ,
    \pcpi_insn[4] ,
    \pcpi_insn[3] ,
    \pcpi_insn[2] ,
    \pcpi_insn[1] ,
    \pcpi_insn[0] }),
    .pcpi_rd({\pcpi_exact_mul_rd[31] ,
    \pcpi_exact_mul_rd[30] ,
    \pcpi_exact_mul_rd[29] ,
    \pcpi_exact_mul_rd[28] ,
    \pcpi_exact_mul_rd[27] ,
    \pcpi_exact_mul_rd[26] ,
    \pcpi_exact_mul_rd[25] ,
    \pcpi_exact_mul_rd[24] ,
    \pcpi_exact_mul_rd[23] ,
    \pcpi_exact_mul_rd[22] ,
    \pcpi_exact_mul_rd[21] ,
    \pcpi_exact_mul_rd[20] ,
    \pcpi_exact_mul_rd[19] ,
    \pcpi_exact_mul_rd[18] ,
    \pcpi_exact_mul_rd[17] ,
    \pcpi_exact_mul_rd[16] ,
    \pcpi_exact_mul_rd[15] ,
    \pcpi_exact_mul_rd[14] ,
    \pcpi_exact_mul_rd[13] ,
    \pcpi_exact_mul_rd[12] ,
    \pcpi_exact_mul_rd[11] ,
    \pcpi_exact_mul_rd[10] ,
    \pcpi_exact_mul_rd[9] ,
    \pcpi_exact_mul_rd[8] ,
    \pcpi_exact_mul_rd[7] ,
    \pcpi_exact_mul_rd[6] ,
    \pcpi_exact_mul_rd[5] ,
    \pcpi_exact_mul_rd[4] ,
    \pcpi_exact_mul_rd[3] ,
    \pcpi_exact_mul_rd[2] ,
    \pcpi_exact_mul_rd[1] ,
    \pcpi_exact_mul_rd[0] }),
    .pcpi_rs1({\pcpi_rs1[31] ,
    \pcpi_rs1[30] ,
    \pcpi_rs1[29] ,
    \pcpi_rs1[28] ,
    \pcpi_rs1[27] ,
    \pcpi_rs1[26] ,
    \pcpi_rs1[25] ,
    \pcpi_rs1[24] ,
    \pcpi_rs1[23] ,
    \pcpi_rs1[22] ,
    \pcpi_rs1[21] ,
    \pcpi_rs1[20] ,
    \pcpi_rs1[19] ,
    \pcpi_rs1[18] ,
    \pcpi_rs1[17] ,
    \pcpi_rs1[16] ,
    \pcpi_rs1[15] ,
    \pcpi_rs1[14] ,
    \pcpi_rs1[13] ,
    \pcpi_rs1[12] ,
    \pcpi_rs1[11] ,
    \pcpi_rs1[10] ,
    \pcpi_rs1[9] ,
    \pcpi_rs1[8] ,
    \pcpi_rs1[7] ,
    \pcpi_rs1[6] ,
    \pcpi_rs1[5] ,
    \pcpi_rs1[4] ,
    \pcpi_rs1[3] ,
    \pcpi_rs1[2] ,
    \pcpi_rs1[1] ,
    \pcpi_rs1[0] }),
    .pcpi_rs2({\pcpi_rs2[31] ,
    \pcpi_rs2[30] ,
    \pcpi_rs2[29] ,
    \pcpi_rs2[28] ,
    \pcpi_rs2[27] ,
    \pcpi_rs2[26] ,
    \pcpi_rs2[25] ,
    \pcpi_rs2[24] ,
    \pcpi_rs2[23] ,
    \pcpi_rs2[22] ,
    \pcpi_rs2[21] ,
    \pcpi_rs2[20] ,
    \pcpi_rs2[19] ,
    \pcpi_rs2[18] ,
    \pcpi_rs2[17] ,
    \pcpi_rs2[16] ,
    \pcpi_rs2[15] ,
    \pcpi_rs2[14] ,
    \pcpi_rs2[13] ,
    \pcpi_rs2[12] ,
    \pcpi_rs2[11] ,
    \pcpi_rs2[10] ,
    \pcpi_rs2[9] ,
    \pcpi_rs2[8] ,
    \pcpi_rs2[7] ,
    \pcpi_rs2[6] ,
    \pcpi_rs2[5] ,
    \pcpi_rs2[4] ,
    \pcpi_rs2[3] ,
    \pcpi_rs2[2] ,
    \pcpi_rs2[1] ,
    \pcpi_rs2[0] }));
 pcpi_mul pcpi_mul_inst_0 (.clk(io_in[8]),
    .pcpi_mul_ready(pcpi_mul_ready),
    .pcpi_mul_valid(pcpi_valid),
    .pcpi_mul_wait(pcpi_mul_wait),
    .pcpi_mul_wr(pcpi_mul_wr),
    .resetn(resetn),
    .vdd(vdd),
    .vss(vss),
    .pcpi_insn({\pcpi_insn[31] ,
    \pcpi_insn[30] ,
    \pcpi_insn[29] ,
    \pcpi_insn[28] ,
    \pcpi_insn[27] ,
    \pcpi_insn[26] ,
    \pcpi_insn[25] ,
    \pcpi_insn[24] ,
    \pcpi_insn[23] ,
    \pcpi_insn[22] ,
    \pcpi_insn[21] ,
    \pcpi_insn[20] ,
    \pcpi_insn[19] ,
    \pcpi_insn[18] ,
    \pcpi_insn[17] ,
    \pcpi_insn[16] ,
    \pcpi_insn[15] ,
    \pcpi_insn[14] ,
    \pcpi_insn[13] ,
    \pcpi_insn[12] ,
    \pcpi_insn[11] ,
    \pcpi_insn[10] ,
    \pcpi_insn[9] ,
    \pcpi_insn[8] ,
    \pcpi_insn[7] ,
    \pcpi_insn[6] ,
    \pcpi_insn[5] ,
    \pcpi_insn[4] ,
    \pcpi_insn[3] ,
    \pcpi_insn[2] ,
    \pcpi_insn[1] ,
    \pcpi_insn[0] }),
    .pcpi_mul_rd({\pcpi_mul_rd[31] ,
    \pcpi_mul_rd[30] ,
    \pcpi_mul_rd[29] ,
    \pcpi_mul_rd[28] ,
    \pcpi_mul_rd[27] ,
    \pcpi_mul_rd[26] ,
    \pcpi_mul_rd[25] ,
    \pcpi_mul_rd[24] ,
    \pcpi_mul_rd[23] ,
    \pcpi_mul_rd[22] ,
    \pcpi_mul_rd[21] ,
    \pcpi_mul_rd[20] ,
    \pcpi_mul_rd[19] ,
    \pcpi_mul_rd[18] ,
    \pcpi_mul_rd[17] ,
    \pcpi_mul_rd[16] ,
    \pcpi_mul_rd[15] ,
    \pcpi_mul_rd[14] ,
    \pcpi_mul_rd[13] ,
    \pcpi_mul_rd[12] ,
    \pcpi_mul_rd[11] ,
    \pcpi_mul_rd[10] ,
    \pcpi_mul_rd[9] ,
    \pcpi_mul_rd[8] ,
    \pcpi_mul_rd[7] ,
    \pcpi_mul_rd[6] ,
    \pcpi_mul_rd[5] ,
    \pcpi_mul_rd[4] ,
    \pcpi_mul_rd[3] ,
    \pcpi_mul_rd[2] ,
    \pcpi_mul_rd[1] ,
    \pcpi_mul_rd[0] }),
    .pcpi_rs1({\pcpi_rs1[31] ,
    \pcpi_rs1[30] ,
    \pcpi_rs1[29] ,
    \pcpi_rs1[28] ,
    \pcpi_rs1[27] ,
    \pcpi_rs1[26] ,
    \pcpi_rs1[25] ,
    \pcpi_rs1[24] ,
    \pcpi_rs1[23] ,
    \pcpi_rs1[22] ,
    \pcpi_rs1[21] ,
    \pcpi_rs1[20] ,
    \pcpi_rs1[19] ,
    \pcpi_rs1[18] ,
    \pcpi_rs1[17] ,
    \pcpi_rs1[16] ,
    \pcpi_rs1[15] ,
    \pcpi_rs1[14] ,
    \pcpi_rs1[13] ,
    \pcpi_rs1[12] ,
    \pcpi_rs1[11] ,
    \pcpi_rs1[10] ,
    \pcpi_rs1[9] ,
    \pcpi_rs1[8] ,
    \pcpi_rs1[7] ,
    \pcpi_rs1[6] ,
    \pcpi_rs1[5] ,
    \pcpi_rs1[4] ,
    \pcpi_rs1[3] ,
    \pcpi_rs1[2] ,
    \pcpi_rs1[1] ,
    \pcpi_rs1[0] }),
    .pcpi_rs2({\pcpi_rs2[31] ,
    \pcpi_rs2[30] ,
    \pcpi_rs2[29] ,
    \pcpi_rs2[28] ,
    \pcpi_rs2[27] ,
    \pcpi_rs2[26] ,
    \pcpi_rs2[25] ,
    \pcpi_rs2[24] ,
    \pcpi_rs2[23] ,
    \pcpi_rs2[22] ,
    \pcpi_rs2[21] ,
    \pcpi_rs2[20] ,
    \pcpi_rs2[19] ,
    \pcpi_rs2[18] ,
    \pcpi_rs2[17] ,
    \pcpi_rs2[16] ,
    \pcpi_rs2[15] ,
    \pcpi_rs2[14] ,
    \pcpi_rs2[13] ,
    \pcpi_rs2[12] ,
    \pcpi_rs2[11] ,
    \pcpi_rs2[10] ,
    \pcpi_rs2[9] ,
    \pcpi_rs2[8] ,
    \pcpi_rs2[7] ,
    \pcpi_rs2[6] ,
    \pcpi_rs2[5] ,
    \pcpi_rs2[4] ,
    \pcpi_rs2[3] ,
    \pcpi_rs2[2] ,
    \pcpi_rs2[1] ,
    \pcpi_rs2[0] }));
 simple_interconnect simple_interconnect_inst_0 (.clk(io_in[8]),
    .mem_instr(mem_instr),
    .mem_ready(mem_ready),
    .mem_valid(mem_valid),
    .resetn(resetn),
    .simpleuart_dat_re(simpleuart_dat_re),
    .simpleuart_dat_we(simpleuart_dat_we),
    .simpleuart_reg_dat_wait(simpleuart_reg_dat_wait),
    .spimem_ready(spimem_ready),
    .spimem_valid(spimem_valid),
    .vdd(vdd),
    .vss(vss),
    .gpio_in({io_in[37],
    io_in[36],
    io_in[35],
    io_in[34],
    io_in[33],
    io_in[32],
    io_in[31],
    io_in[30],
    io_in[29],
    io_in[28],
    io_in[27],
    io_in[26],
    io_in[25],
    io_in[24],
    io_in[23],
    io_in[22]}),
    .gpio_oeb({io_oeb[37],
    io_oeb[36],
    io_oeb[35],
    io_oeb[34],
    io_oeb[33],
    io_oeb[32],
    io_oeb[31],
    io_oeb[30],
    io_oeb[29],
    io_oeb[28],
    io_oeb[27],
    io_oeb[26],
    io_oeb[25],
    io_oeb[24],
    io_oeb[23],
    io_oeb[22]}),
    .gpio_out({io_out[37],
    io_out[36],
    io_out[35],
    io_out[34],
    io_out[33],
    io_out[32],
    io_out[31],
    io_out[30],
    io_out[29],
    io_out[28],
    io_out[27],
    io_out[26],
    io_out[25],
    io_out[24],
    io_out[23],
    io_out[22]}),
    .mem_addr({\mem_addr[31] ,
    \mem_addr[30] ,
    \mem_addr[29] ,
    \mem_addr[28] ,
    \mem_addr[27] ,
    \mem_addr[26] ,
    \mem_addr[25] ,
    \mem_addr[24] ,
    \mem_addr[23] ,
    \mem_addr[22] ,
    \mem_addr[21] ,
    \mem_addr[20] ,
    \mem_addr[19] ,
    \mem_addr[18] ,
    \mem_addr[17] ,
    \mem_addr[16] ,
    \mem_addr[15] ,
    \mem_addr[14] ,
    \mem_addr[13] ,
    \mem_addr[12] ,
    \mem_addr[11] ,
    \mem_addr[10] ,
    \mem_addr[9] ,
    \mem_addr[8] ,
    \mem_addr[7] ,
    \mem_addr[6] ,
    \mem_addr[5] ,
    \mem_addr[4] ,
    \mem_addr[3] ,
    \mem_addr[2] ,
    \mem_addr[1] ,
    \mem_addr[0] }),
    .mem_rdata({\mem_rdata[31] ,
    \mem_rdata[30] ,
    \mem_rdata[29] ,
    \mem_rdata[28] ,
    \mem_rdata[27] ,
    \mem_rdata[26] ,
    \mem_rdata[25] ,
    \mem_rdata[24] ,
    \mem_rdata[23] ,
    \mem_rdata[22] ,
    \mem_rdata[21] ,
    \mem_rdata[20] ,
    \mem_rdata[19] ,
    \mem_rdata[18] ,
    \mem_rdata[17] ,
    \mem_rdata[16] ,
    \mem_rdata[15] ,
    \mem_rdata[14] ,
    \mem_rdata[13] ,
    \mem_rdata[12] ,
    \mem_rdata[11] ,
    \mem_rdata[10] ,
    \mem_rdata[9] ,
    \mem_rdata[8] ,
    \mem_rdata[7] ,
    \mem_rdata[6] ,
    \mem_rdata[5] ,
    \mem_rdata[4] ,
    \mem_rdata[3] ,
    \mem_rdata[2] ,
    \mem_rdata[1] ,
    \mem_rdata[0] }),
    .mem_wdata({\mem_wdata[31] ,
    \mem_wdata[30] ,
    \mem_wdata[29] ,
    \mem_wdata[28] ,
    \mem_wdata[27] ,
    \mem_wdata[26] ,
    \mem_wdata[25] ,
    \mem_wdata[24] ,
    \mem_wdata[23] ,
    \mem_wdata[22] ,
    \mem_wdata[21] ,
    \mem_wdata[20] ,
    \mem_wdata[19] ,
    \mem_wdata[18] ,
    \mem_wdata[17] ,
    \mem_wdata[16] ,
    \mem_wdata[15] ,
    \mem_wdata[14] ,
    \mem_wdata[13] ,
    \mem_wdata[12] ,
    \mem_wdata[11] ,
    \mem_wdata[10] ,
    \mem_wdata[9] ,
    \mem_wdata[8] ,
    \mem_wdata[7] ,
    \mem_wdata[6] ,
    \mem_wdata[5] ,
    \mem_wdata[4] ,
    \mem_wdata[3] ,
    \mem_wdata[2] ,
    \mem_wdata[1] ,
    \mem_wdata[0] }),
    .mem_wstrb({\mem_wstrb[3] ,
    \mem_wstrb[2] ,
    \mem_wstrb[1] ,
    \mem_wstrb[0] }),
    .ram_gwenb({\ram_gwenb[3] ,
    \ram_gwenb[2] ,
    \ram_gwenb[1] ,
    \ram_gwenb[0] }),
    .ram_rdata({\ram_rdata[31] ,
    \ram_rdata[30] ,
    \ram_rdata[29] ,
    \ram_rdata[28] ,
    \ram_rdata[27] ,
    \ram_rdata[26] ,
    \ram_rdata[25] ,
    \ram_rdata[24] ,
    \ram_rdata[23] ,
    \ram_rdata[22] ,
    \ram_rdata[21] ,
    \ram_rdata[20] ,
    \ram_rdata[19] ,
    \ram_rdata[18] ,
    \ram_rdata[17] ,
    \ram_rdata[16] ,
    \ram_rdata[15] ,
    \ram_rdata[14] ,
    \ram_rdata[13] ,
    \ram_rdata[12] ,
    \ram_rdata[11] ,
    \ram_rdata[10] ,
    \ram_rdata[9] ,
    \ram_rdata[8] ,
    \ram_rdata[7] ,
    \ram_rdata[6] ,
    \ram_rdata[5] ,
    \ram_rdata[4] ,
    \ram_rdata[3] ,
    \ram_rdata[2] ,
    \ram_rdata[1] ,
    \ram_rdata[0] }),
    .ram_wenb({\ram_wenb[31] ,
    \ram_wenb[30] ,
    \ram_wenb[29] ,
    \ram_wenb[28] ,
    \ram_wenb[27] ,
    \ram_wenb[26] ,
    \ram_wenb[25] ,
    \ram_wenb[24] ,
    \ram_wenb[23] ,
    \ram_wenb[22] ,
    \ram_wenb[21] ,
    \ram_wenb[20] ,
    \ram_wenb[19] ,
    \ram_wenb[18] ,
    \ram_wenb[17] ,
    \ram_wenb[16] ,
    \ram_wenb[15] ,
    \ram_wenb[14] ,
    \ram_wenb[13] ,
    \ram_wenb[12] ,
    \ram_wenb[11] ,
    \ram_wenb[10] ,
    \ram_wenb[9] ,
    \ram_wenb[8] ,
    \ram_wenb[7] ,
    \ram_wenb[6] ,
    \ram_wenb[5] ,
    \ram_wenb[4] ,
    \ram_wenb[3] ,
    \ram_wenb[2] ,
    \ram_wenb[1] ,
    \ram_wenb[0] }),
    .simpleuart_div_we({\simpleuart_div_we[3] ,
    \simpleuart_div_we[2] ,
    \simpleuart_div_we[1] ,
    \simpleuart_div_we[0] }),
    .simpleuart_reg_dat_do({\simpleuart_reg_dat_do[31] ,
    \simpleuart_reg_dat_do[30] ,
    \simpleuart_reg_dat_do[29] ,
    \simpleuart_reg_dat_do[28] ,
    \simpleuart_reg_dat_do[27] ,
    \simpleuart_reg_dat_do[26] ,
    \simpleuart_reg_dat_do[25] ,
    \simpleuart_reg_dat_do[24] ,
    \simpleuart_reg_dat_do[23] ,
    \simpleuart_reg_dat_do[22] ,
    \simpleuart_reg_dat_do[21] ,
    \simpleuart_reg_dat_do[20] ,
    \simpleuart_reg_dat_do[19] ,
    \simpleuart_reg_dat_do[18] ,
    \simpleuart_reg_dat_do[17] ,
    \simpleuart_reg_dat_do[16] ,
    \simpleuart_reg_dat_do[15] ,
    \simpleuart_reg_dat_do[14] ,
    \simpleuart_reg_dat_do[13] ,
    \simpleuart_reg_dat_do[12] ,
    \simpleuart_reg_dat_do[11] ,
    \simpleuart_reg_dat_do[10] ,
    \simpleuart_reg_dat_do[9] ,
    \simpleuart_reg_dat_do[8] ,
    \simpleuart_reg_dat_do[7] ,
    \simpleuart_reg_dat_do[6] ,
    \simpleuart_reg_dat_do[5] ,
    \simpleuart_reg_dat_do[4] ,
    \simpleuart_reg_dat_do[3] ,
    \simpleuart_reg_dat_do[2] ,
    \simpleuart_reg_dat_do[1] ,
    \simpleuart_reg_dat_do[0] }),
    .simpleuart_reg_div_do({\simpleuart_reg_div_do[31] ,
    \simpleuart_reg_div_do[30] ,
    \simpleuart_reg_div_do[29] ,
    \simpleuart_reg_div_do[28] ,
    \simpleuart_reg_div_do[27] ,
    \simpleuart_reg_div_do[26] ,
    \simpleuart_reg_div_do[25] ,
    \simpleuart_reg_div_do[24] ,
    \simpleuart_reg_div_do[23] ,
    \simpleuart_reg_div_do[22] ,
    \simpleuart_reg_div_do[21] ,
    \simpleuart_reg_div_do[20] ,
    \simpleuart_reg_div_do[19] ,
    \simpleuart_reg_div_do[18] ,
    \simpleuart_reg_div_do[17] ,
    \simpleuart_reg_div_do[16] ,
    \simpleuart_reg_div_do[15] ,
    \simpleuart_reg_div_do[14] ,
    \simpleuart_reg_div_do[13] ,
    \simpleuart_reg_div_do[12] ,
    \simpleuart_reg_div_do[11] ,
    \simpleuart_reg_div_do[10] ,
    \simpleuart_reg_div_do[9] ,
    \simpleuart_reg_div_do[8] ,
    \simpleuart_reg_div_do[7] ,
    \simpleuart_reg_div_do[6] ,
    \simpleuart_reg_div_do[5] ,
    \simpleuart_reg_div_do[4] ,
    \simpleuart_reg_div_do[3] ,
    \simpleuart_reg_div_do[2] ,
    \simpleuart_reg_div_do[1] ,
    \simpleuart_reg_div_do[0] }),
    .spimem_rdata({\spimem_rdata[31] ,
    \spimem_rdata[30] ,
    \spimem_rdata[29] ,
    \spimem_rdata[28] ,
    \spimem_rdata[27] ,
    \spimem_rdata[26] ,
    \spimem_rdata[25] ,
    \spimem_rdata[24] ,
    \spimem_rdata[23] ,
    \spimem_rdata[22] ,
    \spimem_rdata[21] ,
    \spimem_rdata[20] ,
    \spimem_rdata[19] ,
    \spimem_rdata[18] ,
    \spimem_rdata[17] ,
    \spimem_rdata[16] ,
    \spimem_rdata[15] ,
    \spimem_rdata[14] ,
    \spimem_rdata[13] ,
    \spimem_rdata[12] ,
    \spimem_rdata[11] ,
    \spimem_rdata[10] ,
    \spimem_rdata[9] ,
    \spimem_rdata[8] ,
    \spimem_rdata[7] ,
    \spimem_rdata[6] ,
    \spimem_rdata[5] ,
    \spimem_rdata[4] ,
    \spimem_rdata[3] ,
    \spimem_rdata[2] ,
    \spimem_rdata[1] ,
    \spimem_rdata[0] }),
    .spimemio_cfgreg_do({\spimemio_cfgreg_do[31] ,
    \spimemio_cfgreg_do[30] ,
    \spimemio_cfgreg_do[29] ,
    \spimemio_cfgreg_do[28] ,
    \spimemio_cfgreg_do[27] ,
    \spimemio_cfgreg_do[26] ,
    \spimemio_cfgreg_do[25] ,
    \spimemio_cfgreg_do[24] ,
    \spimemio_cfgreg_do[23] ,
    \spimemio_cfgreg_do[22] ,
    \spimemio_cfgreg_do[21] ,
    \spimemio_cfgreg_do[20] ,
    \spimemio_cfgreg_do[19] ,
    \spimemio_cfgreg_do[18] ,
    \spimemio_cfgreg_do[17] ,
    \spimemio_cfgreg_do[16] ,
    \spimemio_cfgreg_do[15] ,
    \spimemio_cfgreg_do[14] ,
    \spimemio_cfgreg_do[13] ,
    \spimemio_cfgreg_do[12] ,
    \spimemio_cfgreg_do[11] ,
    \spimemio_cfgreg_do[10] ,
    \spimemio_cfgreg_do[9] ,
    \spimemio_cfgreg_do[8] ,
    \spimemio_cfgreg_do[7] ,
    \spimemio_cfgreg_do[6] ,
    \spimemio_cfgreg_do[5] ,
    \spimemio_cfgreg_do[4] ,
    \spimemio_cfgreg_do[3] ,
    \spimemio_cfgreg_do[2] ,
    \spimemio_cfgreg_do[1] ,
    \spimemio_cfgreg_do[0] }),
    .spimemio_cfgreg_we({\spimemio_cfgreg_we[3] ,
    \spimemio_cfgreg_we[2] ,
    \spimemio_cfgreg_we[1] ,
    \spimemio_cfgreg_we[0] }));
 simpleuart simpleuart (.clk(io_in[8]),
    .reg_dat_re(simpleuart_dat_re),
    .reg_dat_wait(simpleuart_reg_dat_wait),
    .reg_dat_we(simpleuart_dat_we),
    .resetn(resetn),
    .vdd(vdd),
    .vss(vss),
    .reg_dat_di({\mem_wdata[31] ,
    \mem_wdata[30] ,
    \mem_wdata[29] ,
    \mem_wdata[28] ,
    \mem_wdata[27] ,
    \mem_wdata[26] ,
    \mem_wdata[25] ,
    \mem_wdata[24] ,
    \mem_wdata[23] ,
    \mem_wdata[22] ,
    \mem_wdata[21] ,
    \mem_wdata[20] ,
    \mem_wdata[19] ,
    \mem_wdata[18] ,
    \mem_wdata[17] ,
    \mem_wdata[16] ,
    \mem_wdata[15] ,
    \mem_wdata[14] ,
    \mem_wdata[13] ,
    \mem_wdata[12] ,
    \mem_wdata[11] ,
    \mem_wdata[10] ,
    \mem_wdata[9] ,
    \mem_wdata[8] ,
    \mem_wdata[7] ,
    \mem_wdata[6] ,
    \mem_wdata[5] ,
    \mem_wdata[4] ,
    \mem_wdata[3] ,
    \mem_wdata[2] ,
    \mem_wdata[1] ,
    \mem_wdata[0] }),
    .reg_dat_do({\simpleuart_reg_dat_do[31] ,
    \simpleuart_reg_dat_do[30] ,
    \simpleuart_reg_dat_do[29] ,
    \simpleuart_reg_dat_do[28] ,
    \simpleuart_reg_dat_do[27] ,
    \simpleuart_reg_dat_do[26] ,
    \simpleuart_reg_dat_do[25] ,
    \simpleuart_reg_dat_do[24] ,
    \simpleuart_reg_dat_do[23] ,
    \simpleuart_reg_dat_do[22] ,
    \simpleuart_reg_dat_do[21] ,
    \simpleuart_reg_dat_do[20] ,
    \simpleuart_reg_dat_do[19] ,
    \simpleuart_reg_dat_do[18] ,
    \simpleuart_reg_dat_do[17] ,
    \simpleuart_reg_dat_do[16] ,
    \simpleuart_reg_dat_do[15] ,
    \simpleuart_reg_dat_do[14] ,
    \simpleuart_reg_dat_do[13] ,
    \simpleuart_reg_dat_do[12] ,
    \simpleuart_reg_dat_do[11] ,
    \simpleuart_reg_dat_do[10] ,
    \simpleuart_reg_dat_do[9] ,
    \simpleuart_reg_dat_do[8] ,
    \simpleuart_reg_dat_do[7] ,
    \simpleuart_reg_dat_do[6] ,
    \simpleuart_reg_dat_do[5] ,
    \simpleuart_reg_dat_do[4] ,
    \simpleuart_reg_dat_do[3] ,
    \simpleuart_reg_dat_do[2] ,
    \simpleuart_reg_dat_do[1] ,
    \simpleuart_reg_dat_do[0] }),
    .reg_div_di({\mem_wdata[31] ,
    \mem_wdata[30] ,
    \mem_wdata[29] ,
    \mem_wdata[28] ,
    \mem_wdata[27] ,
    \mem_wdata[26] ,
    \mem_wdata[25] ,
    \mem_wdata[24] ,
    \mem_wdata[23] ,
    \mem_wdata[22] ,
    \mem_wdata[21] ,
    \mem_wdata[20] ,
    \mem_wdata[19] ,
    \mem_wdata[18] ,
    \mem_wdata[17] ,
    \mem_wdata[16] ,
    \mem_wdata[15] ,
    \mem_wdata[14] ,
    \mem_wdata[13] ,
    \mem_wdata[12] ,
    \mem_wdata[11] ,
    \mem_wdata[10] ,
    \mem_wdata[9] ,
    \mem_wdata[8] ,
    \mem_wdata[7] ,
    \mem_wdata[6] ,
    \mem_wdata[5] ,
    \mem_wdata[4] ,
    \mem_wdata[3] ,
    \mem_wdata[2] ,
    \mem_wdata[1] ,
    \mem_wdata[0] }),
    .reg_div_do({\simpleuart_reg_div_do[31] ,
    \simpleuart_reg_div_do[30] ,
    \simpleuart_reg_div_do[29] ,
    \simpleuart_reg_div_do[28] ,
    \simpleuart_reg_div_do[27] ,
    \simpleuart_reg_div_do[26] ,
    \simpleuart_reg_div_do[25] ,
    \simpleuart_reg_div_do[24] ,
    \simpleuart_reg_div_do[23] ,
    \simpleuart_reg_div_do[22] ,
    \simpleuart_reg_div_do[21] ,
    \simpleuart_reg_div_do[20] ,
    \simpleuart_reg_div_do[19] ,
    \simpleuart_reg_div_do[18] ,
    \simpleuart_reg_div_do[17] ,
    \simpleuart_reg_div_do[16] ,
    \simpleuart_reg_div_do[15] ,
    \simpleuart_reg_div_do[14] ,
    \simpleuart_reg_div_do[13] ,
    \simpleuart_reg_div_do[12] ,
    \simpleuart_reg_div_do[11] ,
    \simpleuart_reg_div_do[10] ,
    \simpleuart_reg_div_do[9] ,
    \simpleuart_reg_div_do[8] ,
    \simpleuart_reg_div_do[7] ,
    \simpleuart_reg_div_do[6] ,
    \simpleuart_reg_div_do[5] ,
    \simpleuart_reg_div_do[4] ,
    \simpleuart_reg_div_do[3] ,
    \simpleuart_reg_div_do[2] ,
    \simpleuart_reg_div_do[1] ,
    \simpleuart_reg_div_do[0] }),
    .reg_div_we({\simpleuart_div_we[3] ,
    \simpleuart_div_we[2] ,
    \simpleuart_div_we[1] ,
    \simpleuart_div_we[0] }),
    .uart_in({io_in[17],
    io_in[16]}),
    .uart_oeb({io_oeb[17],
    io_oeb[16]}),
    .uart_out({io_out[17],
    io_out[16]}));
 spimemio spimemio (.clk(io_in[8]),
    .ready(spimem_ready),
    .resetn(resetn),
    .valid(spimem_valid),
    .vdd(vdd),
    .vss(vss),
    .addr({\mem_addr[23] ,
    \mem_addr[22] ,
    \mem_addr[21] ,
    \mem_addr[20] ,
    \mem_addr[19] ,
    \mem_addr[18] ,
    \mem_addr[17] ,
    \mem_addr[16] ,
    \mem_addr[15] ,
    \mem_addr[14] ,
    \mem_addr[13] ,
    \mem_addr[12] ,
    \mem_addr[11] ,
    \mem_addr[10] ,
    \mem_addr[9] ,
    \mem_addr[8] ,
    \mem_addr[7] ,
    \mem_addr[6] ,
    \mem_addr[5] ,
    \mem_addr[4] ,
    \mem_addr[3] ,
    \mem_addr[2] ,
    \mem_addr[1] ,
    \mem_addr[0] }),
    .cfgreg_di({\mem_wdata[31] ,
    \mem_wdata[30] ,
    \mem_wdata[29] ,
    \mem_wdata[28] ,
    \mem_wdata[27] ,
    \mem_wdata[26] ,
    \mem_wdata[25] ,
    \mem_wdata[24] ,
    \mem_wdata[23] ,
    \mem_wdata[22] ,
    \mem_wdata[21] ,
    \mem_wdata[20] ,
    \mem_wdata[19] ,
    \mem_wdata[18] ,
    \mem_wdata[17] ,
    \mem_wdata[16] ,
    \mem_wdata[15] ,
    \mem_wdata[14] ,
    \mem_wdata[13] ,
    \mem_wdata[12] ,
    \mem_wdata[11] ,
    \mem_wdata[10] ,
    \mem_wdata[9] ,
    \mem_wdata[8] ,
    \mem_wdata[7] ,
    \mem_wdata[6] ,
    \mem_wdata[5] ,
    \mem_wdata[4] ,
    \mem_wdata[3] ,
    \mem_wdata[2] ,
    \mem_wdata[1] ,
    \mem_wdata[0] }),
    .cfgreg_do({\spimemio_cfgreg_do[31] ,
    \spimemio_cfgreg_do[30] ,
    \spimemio_cfgreg_do[29] ,
    \spimemio_cfgreg_do[28] ,
    \spimemio_cfgreg_do[27] ,
    \spimemio_cfgreg_do[26] ,
    \spimemio_cfgreg_do[25] ,
    \spimemio_cfgreg_do[24] ,
    \spimemio_cfgreg_do[23] ,
    \spimemio_cfgreg_do[22] ,
    \spimemio_cfgreg_do[21] ,
    \spimemio_cfgreg_do[20] ,
    \spimemio_cfgreg_do[19] ,
    \spimemio_cfgreg_do[18] ,
    \spimemio_cfgreg_do[17] ,
    \spimemio_cfgreg_do[16] ,
    \spimemio_cfgreg_do[15] ,
    \spimemio_cfgreg_do[14] ,
    \spimemio_cfgreg_do[13] ,
    \spimemio_cfgreg_do[12] ,
    \spimemio_cfgreg_do[11] ,
    \spimemio_cfgreg_do[10] ,
    \spimemio_cfgreg_do[9] ,
    \spimemio_cfgreg_do[8] ,
    \spimemio_cfgreg_do[7] ,
    \spimemio_cfgreg_do[6] ,
    \spimemio_cfgreg_do[5] ,
    \spimemio_cfgreg_do[4] ,
    \spimemio_cfgreg_do[3] ,
    \spimemio_cfgreg_do[2] ,
    \spimemio_cfgreg_do[1] ,
    \spimemio_cfgreg_do[0] }),
    .cfgreg_we({\spimemio_cfgreg_we[3] ,
    \spimemio_cfgreg_we[2] ,
    \spimemio_cfgreg_we[1] ,
    \spimemio_cfgreg_we[0] }),
    .flash_in({io_in[15],
    io_in[14],
    io_in[13],
    io_in[12],
    io_in[11],
    io_in[10]}),
    .flash_oeb({io_oeb[15],
    io_oeb[14],
    io_oeb[13],
    io_oeb[12],
    io_oeb[11],
    io_oeb[10]}),
    .flash_out({io_out[15],
    io_out[14],
    io_out[13],
    io_out[12],
    io_out[11],
    io_out[10]}),
    .rdata({\spimem_rdata[31] ,
    \spimem_rdata[30] ,
    \spimem_rdata[29] ,
    \spimem_rdata[28] ,
    \spimem_rdata[27] ,
    \spimem_rdata[26] ,
    \spimem_rdata[25] ,
    \spimem_rdata[24] ,
    \spimem_rdata[23] ,
    \spimem_rdata[22] ,
    \spimem_rdata[21] ,
    \spimem_rdata[20] ,
    \spimem_rdata[19] ,
    \spimem_rdata[18] ,
    \spimem_rdata[17] ,
    \spimem_rdata[16] ,
    \spimem_rdata[15] ,
    \spimem_rdata[14] ,
    \spimem_rdata[13] ,
    \spimem_rdata[12] ,
    \spimem_rdata[11] ,
    \spimem_rdata[10] ,
    \spimem_rdata[9] ,
    \spimem_rdata[8] ,
    \spimem_rdata[7] ,
    \spimem_rdata[6] ,
    \spimem_rdata[5] ,
    \spimem_rdata[4] ,
    \spimem_rdata[3] ,
    \spimem_rdata[2] ,
    \spimem_rdata[1] ,
    \spimem_rdata[0] }));
 gf180_ram_512x8x1 sram512x8_0 (.VDD(vdd),
    .VSS(vss),
    .cen(reset),
    .clk(io_in[8]),
    .gwen(\ram_gwenb[0] ),
    .addr({\mem_addr[10] ,
    \mem_addr[9] ,
    \mem_addr[8] ,
    \mem_addr[7] ,
    \mem_addr[6] ,
    \mem_addr[5] ,
    \mem_addr[4] ,
    \mem_addr[3] ,
    \mem_addr[2] }),
    .rdata({\ram_rdata[7] ,
    \ram_rdata[6] ,
    \ram_rdata[5] ,
    \ram_rdata[4] ,
    \ram_rdata[3] ,
    \ram_rdata[2] ,
    \ram_rdata[1] ,
    \ram_rdata[0] }),
    .wdata({\mem_wdata[7] ,
    \mem_wdata[6] ,
    \mem_wdata[5] ,
    \mem_wdata[4] ,
    \mem_wdata[3] ,
    \mem_wdata[2] ,
    \mem_wdata[1] ,
    \mem_wdata[0] }),
    .wen({\ram_wenb[7] ,
    \ram_wenb[6] ,
    \ram_wenb[5] ,
    \ram_wenb[4] ,
    \ram_wenb[3] ,
    \ram_wenb[2] ,
    \ram_wenb[1] ,
    \ram_wenb[0] }));
 gf180_ram_512x8x1 sram512x8_1 (.VDD(vdd),
    .VSS(vss),
    .cen(reset),
    .clk(io_in[8]),
    .gwen(\ram_gwenb[1] ),
    .addr({\mem_addr[10] ,
    \mem_addr[9] ,
    \mem_addr[8] ,
    \mem_addr[7] ,
    \mem_addr[6] ,
    \mem_addr[5] ,
    \mem_addr[4] ,
    \mem_addr[3] ,
    \mem_addr[2] }),
    .rdata({\ram_rdata[15] ,
    \ram_rdata[14] ,
    \ram_rdata[13] ,
    \ram_rdata[12] ,
    \ram_rdata[11] ,
    \ram_rdata[10] ,
    \ram_rdata[9] ,
    \ram_rdata[8] }),
    .wdata({\mem_wdata[15] ,
    \mem_wdata[14] ,
    \mem_wdata[13] ,
    \mem_wdata[12] ,
    \mem_wdata[11] ,
    \mem_wdata[10] ,
    \mem_wdata[9] ,
    \mem_wdata[8] }),
    .wen({\ram_wenb[15] ,
    \ram_wenb[14] ,
    \ram_wenb[13] ,
    \ram_wenb[12] ,
    \ram_wenb[11] ,
    \ram_wenb[10] ,
    \ram_wenb[9] ,
    \ram_wenb[8] }));
 gf180_ram_512x8x1 sram512x8_2 (.VDD(vdd),
    .VSS(vss),
    .cen(reset),
    .clk(io_in[8]),
    .gwen(\ram_gwenb[2] ),
    .addr({\mem_addr[10] ,
    \mem_addr[9] ,
    \mem_addr[8] ,
    \mem_addr[7] ,
    \mem_addr[6] ,
    \mem_addr[5] ,
    \mem_addr[4] ,
    \mem_addr[3] ,
    \mem_addr[2] }),
    .rdata({\ram_rdata[23] ,
    \ram_rdata[22] ,
    \ram_rdata[21] ,
    \ram_rdata[20] ,
    \ram_rdata[19] ,
    \ram_rdata[18] ,
    \ram_rdata[17] ,
    \ram_rdata[16] }),
    .wdata({\mem_wdata[23] ,
    \mem_wdata[22] ,
    \mem_wdata[21] ,
    \mem_wdata[20] ,
    \mem_wdata[19] ,
    \mem_wdata[18] ,
    \mem_wdata[17] ,
    \mem_wdata[16] }),
    .wen({\ram_wenb[23] ,
    \ram_wenb[22] ,
    \ram_wenb[21] ,
    \ram_wenb[20] ,
    \ram_wenb[19] ,
    \ram_wenb[18] ,
    \ram_wenb[17] ,
    \ram_wenb[16] }));
 gf180_ram_512x8x1 sram512x8_3 (.VDD(vdd),
    .VSS(vss),
    .cen(reset),
    .clk(io_in[8]),
    .gwen(\ram_gwenb[3] ),
    .addr({\mem_addr[10] ,
    \mem_addr[9] ,
    \mem_addr[8] ,
    \mem_addr[7] ,
    \mem_addr[6] ,
    \mem_addr[5] ,
    \mem_addr[4] ,
    \mem_addr[3] ,
    \mem_addr[2] }),
    .rdata({\ram_rdata[31] ,
    \ram_rdata[30] ,
    \ram_rdata[29] ,
    \ram_rdata[28] ,
    \ram_rdata[27] ,
    \ram_rdata[26] ,
    \ram_rdata[25] ,
    \ram_rdata[24] }),
    .wdata({\mem_wdata[31] ,
    \mem_wdata[30] ,
    \mem_wdata[29] ,
    \mem_wdata[28] ,
    \mem_wdata[27] ,
    \mem_wdata[26] ,
    \mem_wdata[25] ,
    \mem_wdata[24] }),
    .wen({\ram_wenb[31] ,
    \ram_wenb[30] ,
    \ram_wenb[29] ,
    \ram_wenb[28] ,
    \ram_wenb[27] ,
    \ram_wenb[26] ,
    \ram_wenb[25] ,
    \ram_wenb[24] }));
 user_proj_example user_proj_example_inst_0 (.vdd(vdd),
    .vss(vss),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .io_in({io_in[7],
    io_in[6],
    io_in[5],
    io_in[4],
    io_in[3],
    io_in[2],
    io_in[1],
    io_in[0]}),
    .io_oeb({io_oeb[7],
    io_oeb[6],
    io_oeb[5],
    io_oeb[4],
    io_oeb[3],
    io_oeb[2],
    io_oeb[1],
    io_oeb[0]}),
    .io_out({io_out[7],
    io_out[6],
    io_out[5],
    io_out[4],
    io_out[3],
    io_out[2],
    io_out[1],
    io_out[0]}),
    .irq({user_irq[2],
    user_irq[1],
    user_irq[0]}),
    .la_data_in({la_data_in[63],
    la_data_in[62],
    la_data_in[61],
    la_data_in[60],
    la_data_in[59],
    la_data_in[58],
    la_data_in[57],
    la_data_in[56],
    la_data_in[55],
    la_data_in[54],
    la_data_in[53],
    la_data_in[52],
    la_data_in[51],
    la_data_in[50],
    la_data_in[49],
    la_data_in[48],
    la_data_in[47],
    la_data_in[46],
    la_data_in[45],
    la_data_in[44],
    la_data_in[43],
    la_data_in[42],
    la_data_in[41],
    la_data_in[40],
    la_data_in[39],
    la_data_in[38],
    la_data_in[37],
    la_data_in[36],
    la_data_in[35],
    la_data_in[34],
    la_data_in[33],
    la_data_in[32],
    la_data_in[31],
    la_data_in[30],
    la_data_in[29],
    la_data_in[28],
    la_data_in[27],
    la_data_in[26],
    la_data_in[25],
    la_data_in[24],
    la_data_in[23],
    la_data_in[22],
    la_data_in[21],
    la_data_in[20],
    la_data_in[19],
    la_data_in[18],
    la_data_in[17],
    la_data_in[16],
    la_data_in[15],
    la_data_in[14],
    la_data_in[13],
    la_data_in[12],
    la_data_in[11],
    la_data_in[10],
    la_data_in[9],
    la_data_in[8],
    la_data_in[7],
    la_data_in[6],
    la_data_in[5],
    la_data_in[4],
    la_data_in[3],
    la_data_in[2],
    la_data_in[1],
    la_data_in[0]}),
    .la_data_out({la_data_out[63],
    la_data_out[62],
    la_data_out[61],
    la_data_out[60],
    la_data_out[59],
    la_data_out[58],
    la_data_out[57],
    la_data_out[56],
    la_data_out[55],
    la_data_out[54],
    la_data_out[53],
    la_data_out[52],
    la_data_out[51],
    la_data_out[50],
    la_data_out[49],
    la_data_out[48],
    la_data_out[47],
    la_data_out[46],
    la_data_out[45],
    la_data_out[44],
    la_data_out[43],
    la_data_out[42],
    la_data_out[41],
    la_data_out[40],
    la_data_out[39],
    la_data_out[38],
    la_data_out[37],
    la_data_out[36],
    la_data_out[35],
    la_data_out[34],
    la_data_out[33],
    la_data_out[32],
    la_data_out[31],
    la_data_out[30],
    la_data_out[29],
    la_data_out[28],
    la_data_out[27],
    la_data_out[26],
    la_data_out[25],
    la_data_out[24],
    la_data_out[23],
    la_data_out[22],
    la_data_out[21],
    la_data_out[20],
    la_data_out[19],
    la_data_out[18],
    la_data_out[17],
    la_data_out[16],
    la_data_out[15],
    la_data_out[14],
    la_data_out[13],
    la_data_out[12],
    la_data_out[11],
    la_data_out[10],
    la_data_out[9],
    la_data_out[8],
    la_data_out[7],
    la_data_out[6],
    la_data_out[5],
    la_data_out[4],
    la_data_out[3],
    la_data_out[2],
    la_data_out[1],
    la_data_out[0]}),
    .la_oenb({la_oenb[63],
    la_oenb[62],
    la_oenb[61],
    la_oenb[60],
    la_oenb[59],
    la_oenb[58],
    la_oenb[57],
    la_oenb[56],
    la_oenb[55],
    la_oenb[54],
    la_oenb[53],
    la_oenb[52],
    la_oenb[51],
    la_oenb[50],
    la_oenb[49],
    la_oenb[48],
    la_oenb[47],
    la_oenb[46],
    la_oenb[45],
    la_oenb[44],
    la_oenb[43],
    la_oenb[42],
    la_oenb[41],
    la_oenb[40],
    la_oenb[39],
    la_oenb[38],
    la_oenb[37],
    la_oenb[36],
    la_oenb[35],
    la_oenb[34],
    la_oenb[33],
    la_oenb[32],
    la_oenb[31],
    la_oenb[30],
    la_oenb[29],
    la_oenb[28],
    la_oenb[27],
    la_oenb[26],
    la_oenb[25],
    la_oenb[24],
    la_oenb[23],
    la_oenb[22],
    la_oenb[21],
    la_oenb[20],
    la_oenb[19],
    la_oenb[18],
    la_oenb[17],
    la_oenb[16],
    la_oenb[15],
    la_oenb[14],
    la_oenb[13],
    la_oenb[12],
    la_oenb[11],
    la_oenb[10],
    la_oenb[9],
    la_oenb[8],
    la_oenb[7],
    la_oenb[6],
    la_oenb[5],
    la_oenb[4],
    la_oenb[3],
    la_oenb[2],
    la_oenb[1],
    la_oenb[0]}),
    .wbs_adr_i({wbs_adr_i[31],
    wbs_adr_i[30],
    wbs_adr_i[29],
    wbs_adr_i[28],
    wbs_adr_i[27],
    wbs_adr_i[26],
    wbs_adr_i[25],
    wbs_adr_i[24],
    wbs_adr_i[23],
    wbs_adr_i[22],
    wbs_adr_i[21],
    wbs_adr_i[20],
    wbs_adr_i[19],
    wbs_adr_i[18],
    wbs_adr_i[17],
    wbs_adr_i[16],
    wbs_adr_i[15],
    wbs_adr_i[14],
    wbs_adr_i[13],
    wbs_adr_i[12],
    wbs_adr_i[11],
    wbs_adr_i[10],
    wbs_adr_i[9],
    wbs_adr_i[8],
    wbs_adr_i[7],
    wbs_adr_i[6],
    wbs_adr_i[5],
    wbs_adr_i[4],
    wbs_adr_i[3],
    wbs_adr_i[2],
    wbs_adr_i[1],
    wbs_adr_i[0]}),
    .wbs_dat_i({wbs_dat_i[31],
    wbs_dat_i[30],
    wbs_dat_i[29],
    wbs_dat_i[28],
    wbs_dat_i[27],
    wbs_dat_i[26],
    wbs_dat_i[25],
    wbs_dat_i[24],
    wbs_dat_i[23],
    wbs_dat_i[22],
    wbs_dat_i[21],
    wbs_dat_i[20],
    wbs_dat_i[19],
    wbs_dat_i[18],
    wbs_dat_i[17],
    wbs_dat_i[16],
    wbs_dat_i[15],
    wbs_dat_i[14],
    wbs_dat_i[13],
    wbs_dat_i[12],
    wbs_dat_i[11],
    wbs_dat_i[10],
    wbs_dat_i[9],
    wbs_dat_i[8],
    wbs_dat_i[7],
    wbs_dat_i[6],
    wbs_dat_i[5],
    wbs_dat_i[4],
    wbs_dat_i[3],
    wbs_dat_i[2],
    wbs_dat_i[1],
    wbs_dat_i[0]}),
    .wbs_dat_o({wbs_dat_o[31],
    wbs_dat_o[30],
    wbs_dat_o[29],
    wbs_dat_o[28],
    wbs_dat_o[27],
    wbs_dat_o[26],
    wbs_dat_o[25],
    wbs_dat_o[24],
    wbs_dat_o[23],
    wbs_dat_o[22],
    wbs_dat_o[21],
    wbs_dat_o[20],
    wbs_dat_o[19],
    wbs_dat_o[18],
    wbs_dat_o[17],
    wbs_dat_o[16],
    wbs_dat_o[15],
    wbs_dat_o[14],
    wbs_dat_o[13],
    wbs_dat_o[12],
    wbs_dat_o[11],
    wbs_dat_o[10],
    wbs_dat_o[9],
    wbs_dat_o[8],
    wbs_dat_o[7],
    wbs_dat_o[6],
    wbs_dat_o[5],
    wbs_dat_o[4],
    wbs_dat_o[3],
    wbs_dat_o[2],
    wbs_dat_o[1],
    wbs_dat_o[0]}),
    .wbs_sel_i({wbs_sel_i[3],
    wbs_sel_i[2],
    wbs_sel_i[1],
    wbs_sel_i[0]}));
endmodule

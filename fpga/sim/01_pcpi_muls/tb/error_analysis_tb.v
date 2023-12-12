module testbench;
    reg clk;
    reg rst_n;
    wire [15:0] count;
    
    wire [15:0] exact_result;
    wire [15:0] scdm_51_resultx;
    wire [15:0] scdm_73_resultx;
    wire [15:0] scdm_95_resultx;
    
    // Clock generation
    initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle every 5ns for 100MHz frequency
    end
    
    // Reset generation
    initial begin
    rst_n = 0; // Initialize reset to active-low
    #10 rst_n = 1; // Release reset after 10ns
    end
    
    counter # ( 
        .n(16) 
    ) counter_inst_0 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(1'b1),
        .up_down(1'b1),
        .count(count)
    );
        
    S_Exact8 S_Exact8_inst_0 (
        .c(count[15:8]),
        .d(count[7:0]),
        .result(exact_result)
        );        
        
    SCDM8_51 SCDM8_51_inst_0 (
        .c(count[15:8]),
        .d(count[7:0]),
        .resultX(scdm_51_resultx)
        );  
        
    SCDM8_73 SCDM8_73_inst_0 (
        .c(count[15:8]),
        .d(count[7:0]),
        .resultX(scdm_73_resultx)
        );  
        
    SCDM8_95 SCDM8_95_inst_0 (
        .c(count[15:8]),
        .d(count[7:0]),
        .resultX(scdm_95_resultx)
        );                          
    // File handle
    integer file;
	
    // Open a file
    initial begin   
    // Open the text file for writing
    file = $fopen("output.txt", "w");

        // Check if the file is opened successfully
        if (file == 0) begin
            $display("Error opening file.");
            $finish; // Terminate simulation
        end
    end

    // File handling every clock cycle
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            // Reset state
            $fwrite(file, "Time: %0t - Reset Asserted\n", $time);
            $fwrite(file, "time,c,d,exact,scdm_51,scdm_73,scdm_95\n");
        end else begin
            // Write data to the text file
            $fwrite(file, "%0t,%d,%d,%d,%d,%d,%d\n", $time, count[15:8], count[7:0], exact_result, scdm_51_resultx, scdm_73_resultx, scdm_95_resultx);
        end
    end

    // Simulation termination
    initial begin
    #655370 
    $finish; // Terminate simulation after 200ns
    $fclose(file);
    end

endmodule

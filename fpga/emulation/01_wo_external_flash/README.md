# Emulation with Pre-Intialised SoC Memory
This project instantiates the `user_project_wrapper` design in prepatation for an FPGA test. The GF180 SRAM macros cannot be simulated inside vivado, thus they are replaced with a generic memory model that is initialised with a simple program that prints hello world to the serial console. The project also includes an MMCM that divdes the 100MHz board clock to 12.5MHz and generates a reset signal. These signals are routed to external pins and requires the user to connect them to the DUT's inputs accordingly. 

Function simulation is partly working and needs attention. 

To run the design on the ARTY A7 35T development board, please carry out the following:
- Connect a jumper wire from JC1 to JB1 - The will connect a 12.5MHz clock signal to the design's clock input.
- Connect a jumper wire from JC2 to JB2 - The will connect the MMCM locked signal to the design's aresetn.
- Open a serial terminal (typ. /dev/ttyUSB1) with configuration of, 115200baud, 8-bit data, no parity, no flow control and one stop bit.
- Program the FPGA and watch the text on the serial console. The TX led on the left hand side of the board should also blink during serial activity. Press the RESET button, red push button switch on the top right of the board, to restart the demo. 


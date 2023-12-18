# Emulation with External SPI Flash
This project instantiates the `user_project_wrapper` design in prepatation for an FPGA test. The GF180 SRAM macros cannot be simulated inside vivado, thus they are replaced with a block memory of equivalent size (512 32-bits, therefore 2kB). The project also includes an MMCM that divdes the 100MHz board clock to 12.5MHz and generates a reset signal. These signals are routed to external pins and requires the user to connect them to the DUT's inputs accordingly. 

The spi flash controller pins are routed to PMOD JA and requires the user to hook up an SPI Flash memory. The SPI Flash memory used in these tests is by Winbond and has the following part number: W25Q128JV-DTR ([Datasheet](https://wiki.lukevassallo.com/lib/exe/fetch.php?media=w25q128jv_dtr_revb_11042016.pdf)). The user is required to pre-program the SPI Flash with the binary file `../fw/app_2/bin/firmware.bin`. 

Function simulation is not working and needs attention. 

To run the design on the ARTY A7 35T development board, please carry out the following:
- Connect a jumper wire from JC1 to JB1 - The will connect a 12.5MHz clock signal to the design's clock input.
- Connect a jumper wire from JC2 to JB2 - The will connect the MMCM locked signal to the design's aresetn.
- Connect the SPI Flash according the FPGA to FLash connectivity table below. 
- Open a serial terminal (typ. /dev/ttyUSB1) with configuration of, 115200baud, 8-bit data, no parity, no flow control and one stop bit.
- Program the FPGA and watch the text on the serial console. The TX led on the left hand side of the board should also blink during serial activity. Press the RESET button, red push button switch on the top right of the board, to restart the demo. 

## SPI Flash 
| PMOD Pin    | Flash Pin     |
| --- | --- | 
| JA0 | flash_clk |
| JA1 | flash_csb |
| JA\[10:7\] | flash_io\[3:0\] |

Table: Flash to FPGA connectivity

# Programming SPI Flash
To program the SPI Flash, the IC was placed in a socket for 200mil wide SOICs and the binary was downloaded by means of an FT232H device. All modules are available from Adafruit.
- [SMT Test Socket - Medium SOIC-8 (200mil)](https://www.adafruit.com/product/1796)
- [FT232H](https://www.adafruit.com/product/2264)


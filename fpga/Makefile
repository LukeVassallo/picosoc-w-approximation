CROSS=riscv32-unknown-elf-
VIVADO=vivado

all: clean simulation emulation

simulation:
	make VIVADO=${VIVADO} -C simulation/01_pcpi_muls all
	make VIVADO=${VIVADO} -C simulation/02_error_analysis all
	
emulation:
	make CROSS=${CROSS} VIVADO=${VIVADO} -C emulation/01_wo_external_flash all
	make CROSS=${CROSS} VIVADO=${VIVADO} -C emulation/02_w_external_flash all

clean:
	make -C simulation/01_pcpi_muls clean
	make -C simulation/02_error_analysis clean
	make -C emulation/01_wo_external_flash clean
	make -C emulation/02_w_external_flash clean


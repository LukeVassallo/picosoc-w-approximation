CROSS=riscv32-unknown-elf-
src=../..
CFLAGS=

all: clean firmware simulation check

app: build/app/app.elf

build/app/app.elf: src/app.c src/app.lds src/memory_map.lds
	@echo "Making the original firmware bundled with the project"
	@if [ ! -d "build/app" ]; then \
		echo -n "Directory build/app not found. Creating ... "; \
		mkdir -p build/app; \
		echo "OK"; \
	else \
		echo "Directory build/app existing. Not re-creating."; \
	fi
	
	$(CROSS)gcc -c ./src/app.c -mabi=ilp32 -march=rv32im -Os -o ./build/app/app.o -nostdlib
	$(CROSS)gcc -c ./src/start.S -mabi=ilp32 -march=rv32im -Os -o build/app/start.o
	# $(CROSS)gcc -mabi=ilp32 -march=rv32im -o build/app/app.elf -Wl,-Bstatic,-T,./src/app.lds,-Map,build/app/app.map,--strip-debug -ffreestanding -nostdlib build/app/start.o build/app/app.o
	# The following line is peformed this way because app.lds includes memory_map.lds
	cd src && $(CROSS)gcc -mabi=ilp32 -march=rv32i -o ../build/app/app.elf -Wl,-Bstatic,-T,app.lds,-Map,../build/app/app.map,--strip-debug -ffreestanding -nostdlib ../build/app/start.o ../build/app/app.o

bootloader: build/bootloader/bootloader.elf

build/bootloader/bootloader.elf : src/bootloader.c src/memory_map.h src/bootloader.lds src/memory_map.lds
	@echo "Making the original firmware bundled with the project"
	@if [ ! -d "build/bootloader" ]; then \
		echo -n "Directory build/bootloader not found. Creating ... "; \
		mkdir -p build/bootloader; \
		echo "OK"; \
	else \
		echo "Directory build/bootloader existing. Not re-creating."; \
	fi
	
	$(CROSS)gcc -c ./src/bootloader.c -mabi=ilp32 -march=rv32i -Os -o ./build/bootloader/bootloader.o -nostdlib
	# $(CROSS)gcc -mabi=ilp32 -march=rv32i -o build/bootloader/bootloader.elf -Wl,-Bstatic,-T,./src/bootloader.lds,-Map,build/bootloader/bootloader.map,--strip-debug -ffreestanding -nostdlib build/bootloader/bootloader.o
	# The following line is peformed this way because bootloader.lds includes memory_map.lds
	cd src && $(CROSS)gcc -mabi=ilp32 -march=rv32i -o ../build/bootloader/bootloader.elf -Wl,-Bstatic,-T,bootloader.lds,-Map,../build/bootloader/bootloader.map,--strip-debug -ffreestanding -nostdlib ../build/bootloader/bootloader.o

firmware: build/bootloader/bootloader.elf build/app/app.elf
	@if [ ! -d "bin" ]; then \
		echo -n "Directory build not found. Creating ... "; \
		mkdir -p bin; \
		echo "OK"; \
	else \
		echo "Directory bin existing. Not re-creating."; \
	fi
	
	$(CROSS)objcopy build/bootloader/bootloader.elf --pad-to=0x4000 --gap-fill=0x00 -O verilog ./bin/bootloader.hex
	$(CROSS)objcopy build/app/app.elf -O verilog ./bin/app.hex
	@cat bin/bootloader.hex bin/app.hex > bin/firmware.hex

	$(CROSS)objcopy build/bootloader/bootloader.elf --pad-to=0x4000 --gap-fill=0x00 -O binary ./bin/bootloader.bin
	$(CROSS)objcopy build/app/app.elf -O binary ./bin/app.bin
	@cat bin/bootloader.bin bin/app.bin > bin/firmware.bin

	# TODO: TEST ON FPGA!

simulation: ./bin/firmware.hex build-simulation run-simulation

build-simulation:
	@if [ -z $(src) ]; then \
		echo -n "No hardware path specified. Compile terminating."; \
		exit 1; \
	else \
		echo "src found pointing to ${src}"; \
	fi

	@if [ ! -d "sim" ]; then \
		echo -n "Directory sim not found. Creating ... "; \
		mkdir -p sim; \
		echo "OK"; \
	else \
		echo "Directory sim existing. Not re-creating."; \
	fi

	iverilog -s testbench -o sim/testbench.vvp $(src)/tb/top_tb.v $(src)/hdl/top.v $(src)/hdl/spimemio.v $(src)/hdl/simpleuart.v $(src)/hdl/picosoc.v $(src)/hdl/picorv32.v $(src)/tb/spiflash.v # complile the hardware
	
run-simulation: sim/testbench.vcd
sim/testbench.vcd: sim/testbench.vvp ./bin/firmware.hex
	vvp -N sim/testbench.vvp ./bin/firmware.hex +firmware=./bin/firmware.hex # run the simulation

view-simulation: sim/testbench.vcd
	gtkwave $<

# Generic rule (Makefile function) to check for file existence
define check_files
	@$(foreach var,$1,\
		echo -n "Checking for ${var} ... "; \
		if [ ! -f $(var) ]; then \
			echo "Not found"; \
		else \
			echo "OK"; \
		fi; \
	)
endef

check-firmware: PREREQS_SIM = build/app/app.elf build/bootloader/bootloader.elf bin/app.hex bin/app.bin bin/bootloader.hex bin/bootloader.bin bin/firmware.hex bin/firmware.bin
check-firmware: $(PREREQS_SIM)
	@echo ""
	@echo "Checking for expected simulation output files."
	$(call check_files,$(PREREQS_SIM))

# Target for checking simulation files
check-simulation: PREREQS_SIM = sim/ice.vvp sim/testbench.vcd
check-simulation: $(PREREQS_SIM)
	@echo ""
	@echo "Checking for expected simulation output files."
	$(call check_files,$(PREREQS_SIM))

# Target for checking both simulation and synthesis files
check: check-firmware check-simulation 

clean:
	@echo -n "Attempting to clean the build directory ... "
	@if [ ! -d "build" ]; then \
		echo "Not found, therefore nothing to clean."; \
 	else \
 		echo "Found, deleting."; \
 		rm -vr ./build ; \
 	fi

	@echo -n "Attempting to clean the bin directory ... "
	@if [ ! -d "bin" ]; then \
		echo "Not found, therefore nothing to clean."; \
 	else \
 		echo "Found, deleting."; \
 		rm -vr ./bin ; \
 	fi

	@echo -n "Attempting to clean the sim directory ... "
	@if [ ! -d "sim" ]; then \
		echo "Not found, therefore nothing to clean."; \
 	else \
 		echo "Found, deleting."; \
 		rm -vr ./sim ; \
 	fi

desc: 
	@echo "================================================================================"
	@echo "Author:     Luke Vassallo"
	@echo "Created on: 2023-11-25T15:14:37+01:00"
	@echo "Created at: Weisenbach Löwen"
	@echo "Desc:       This is a bootloader example application designed for the picosoc" 
	@echo "            platform. The project involves compiling the C source code,"
	@echo "            performing simulation, and constructing the hardware platform."
	@echo "================================================================================"

help:
	@echo "Usage:"
	@echo "  make <target>"
	@echo ""
	@echo "Available Targets:"
	@echo "  all                  : Perform clean, firmware, simulation and check."
	@echo "  firmware             : Compiles the source code and generates simulation hex and programming binary."
	@echo "  simulation           : Run behavioral simulation and generate the simulation waveform file for gtkwave."
	@echo "  view-simulation      : Open behavioral simulation waveform (requires 'make simulation')."
	@echo "  check                : Check for all the expected output files."
	@echo "  check-firmware       : Check for the expected firmware output files."
	@echo "  check-simulation     : Check for the expected synthesis output files."
	@echo "  clean                : Cleans build outputs."
	@echo "  help                 : Display this help message."
	@echo ""
	@echo "Note:"
	@echo "  'make all' is equivalent to running 'make clean firmware sim check' in sequence."


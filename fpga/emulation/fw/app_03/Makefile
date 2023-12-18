CROSS=riscv32-unknown-elf-
src=../..
CFLAGS=

all: clean firmware simulation check

app: build/firmware.elf
build/firmware.elf: src/hello_world.c src/start.S src/sections.lds
	@echo "Making the original firmware bundled with the project"
	@if [ ! -d "build" ]; then \
		echo -n "Directory build not found. Creating ... "; \
		mkdir -p build; \
		echo "OK"; \
	else \
		echo "Directory build existing. Not re-creating."; \
	fi

	$(CROSS)gcc -c ./src/hello_world.c -mabi=ilp32 -march=rv32i -Os -o ./build/hello_world.o -nostdlib
	$(CROSS)gcc -c ./src/start.S -mabi=ilp32 -march=rv32i -Os -o build/start.o
	$(CROSS)gcc -mabi=ilp32 -march=rv32i -o build/firmware.elf -Wl,-Bstatic,-T,src/sections.lds,-Map,build/firmware.map,--strip-debug -ffreestanding -nostdlib build/start.o build/hello_world.o    
    
firmware: build/firmware.elf
	@if [ ! -d "bin" ]; then \
		echo -n "Directory build not found. Creating ... "; \
		mkdir -p bin; \
		echo "OK"; \
	else \
		echo "Directory bin existing. Not re-creating."; \
	fi
	
	$(CROSS)objcopy build/firmware.elf -O binary bin/firmware.bin
	#$(CROSS)objcopy build/firmware.elf -O verilog bin/firmware.hex
	python3 ./utils/makehex.py bin/firmware.bin 512 > bin/firmware.hex
simulation: bin/firmware.hex build-simulation run-simulation

build-simulation:
	@if [ -z $(src) ]; then \
		echo -n "No hardware path specified. Compile terminating."; \
		exit 1; \
	else \
		echo "src found pointing to ${src}"; \
	fi

	@if [ -z ${YOSYS_ROOT} ]; then \
		echo -n "YOSYS_ROOT is not specified specified. Technology library required for simulation. Compile terminating."; \
		exit 1; \
	else \
		echo "YOSYS_ROOT found at ${YOSYS_ROOT}"; \
	fi

	@if [ ! -d "sim" ]; then \
		echo -n "Directory sim not found. Creating ... "; \
		mkdir -p sim; \
		echo "OK"; \
	else \
		echo "Directory sim existing. Not re-creating."; \
	fi

	iverilog -s testbench -o sim/ice.vvp  $(src)/tb/icebreaker_tb.v $(src)/hdl/icebreaker.v $(src)/hdl/ice40up5k_spram.v $(src)/hdl/spimemio.v $(src)/hdl/simpleuart.v $(src)/hdl/picosoc.v $(src)/hdl/picorv32.v $(src)/tb/spiflash.v -DNO_ICE40_DEFAULT_ASSIGNMENTS ${YOSYS_ROOT}/techlibs/ice40/cells_sim.v # complile the hardware
	
run-simulation: sim/ice.vvp ./bin/firmware.hex
	vvp -N sim/ice.vvp ./bin/firmware.hex +firmware=./bin/firmware.hex # run the simulation

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

check-firmware: PREREQS_SIM = build/firmware.elf bin/firmware.hex bin/firmware.bin
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
	@echo "Created on: 2023-11-25T15:10:06+01:00"
	@echo "Created at: Weisenbach Löwen"
	@echo "Desc:       This is a Hello World example application designed for the picosoc" 
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

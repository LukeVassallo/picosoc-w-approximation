VIVADO ?= vivado
XSCT ?= xsct 
JOBS ?= 6

CROSS=riscv32-unknown-elf-
APP = ../fw/app_03

all: clean firmware proj

firmware: ./hdl/firmware.hex

hdl/firmware.hex:
	make CROSS=${CROSS} -C $(APP) clean firmware
	cp -v $(APP)/bin/firmware.hex ./hdl/ 

proj: ./scripts/build_hw.tcl ./hdl/firmware.hex
	@echo "Starting Vivado"
	${VIVADO} -nojournal -nolog -mode batch -source scripts/build_hw.tcl -tclargs ${JOBS}

prog: ./hw/system.bit
	${VIVADO} -nojournal -nolog -mode batch -source scripts/prog_fpga.tcl

open_proj:
	${VIVADO} -nojournal -nolog work/work.xpr &

clean: 
	make -C $(APP) clean
	
	@echo -n "Attempting to clean hdl/firmware.hex ... "
	@if [ ! -f "hdl/firmware.hex" ]; then \
		echo "Not found, therefore nothing to clean."; \
 	else \
 		echo "Found, deleting."; \
 		rm -vr ./hdl/firmware.hex ; \
 	fi
 	
	@echo -n "Attempting to clean the work directory ... "
	@if [ ! -d "work" ]; then \
		echo "Not found, therefore nothing to clean."; \
 	else \
 		echo "Found, deleting."; \
 		rm -vr ./work ; \
 	fi
 
	@echo -n "Attempting to clean the hw directory ... "
	@if [ ! -d "hw" ]; then \
		echo "Not found, therefore nothing to clean."; \
 	else \
 		echo "Found, deleting."; \
 		rm -vr ./hw ; \
 	fi

	@echo -n "Attempting to clean the .Xil directory ... "
	@if [ ! -d ".Xil" ]; then \
		echo "Not found, therefore nothing to clean."; \
 	else \
 		echo "Found, deleting."; \
 		rm -vr ./.Xil ; \
 	fi		

desc: 
	@echo "================================================================================"
	@echo "Author:     Luke Vassallo"
	@echo "Created on: 2023-12-18T08:13:21+01:00"
	@echo "Created at: Heidelberg Universität"
	@echo "Desc:       This project instantiates two SIMD multipliers with varying degree" 
	@echo "            of computational accuracy in a user project and perofoms a hardware"
	@echo "            test."
	@echo "================================================================================"

help:
	@echo "Usage:"
	@echo "  make <target>"
	@echo ""
	@echo "Available Targets:"
	@echo "  all                  : Perform clean followed by building the firmware and the" 
	@echo "                         hardware platform."
	@echo "  proj                 : Creates a project, loads all sources and generates"
	@echo                           bitstream."
	@echo "  prog                 : Programs the Arty 35T with the bitstream (hw/system.bit)."
	@echo "  open_proj            : Opens the project in the background"
	@echo "  clean                : Cleans build outputs."
	@echo "  help                 : Display this help message."
	@echo ""
	@echo "Note:"
	@echo "  'make all' is equivalent to running 'make clean firmware proj' in sequence."

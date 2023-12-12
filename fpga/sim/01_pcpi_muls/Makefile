VIVADO ?= vivado
XSCT ?= xsct 
JOBS ?= 4

all: clean proj

proj: ./scripts/build_hw.tcl ./scripts/build_bd.tcl
	@echo "Starting Vivado"
	${VIVADO} -nojournal -nolog -mode batch -source scripts/build_hw.tcl -tclargs ${JOBS}

open_proj: 
	${VIVADO} -nojournal -nolog work/work.xpr &

clean: 
	@echo -n "Attempting to clean the bd directory ... "
	@if [ ! -d "bd" ]; then \
		echo "Not found, therefore nothing to clean."; \
 	else \
 		echo "Found, deleting."; \
 		rm -vr ./bd ; \
 	fi	

	@echo -n "Attempting to clean the work directory ... "
	@if [ ! -d "work" ]; then \
		echo "Not found, therefore nothing to clean."; \
 	else \
 		echo "Found, deleting."; \
 		rm -vr ./work ; \
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
	@echo "Created on: 2023-12-12T14:28:35+01:00"
	@echo "Created at: Heidelberg Universität"
	@echo "Desc:       This project instantiates four SIMD multipliers with varying degree" 
	@echo "            of computational accuracy and runs a simulation."
	@echo "================================================================================"

help:
	@echo "Usage:"
	@echo "  make <target>"
	@echo ""
	@echo "Available Targets:"
	@echo "  all                  : Perform clean, and proj."
	@echo "  proj                 : Creates a project, loads all sources and populates"
	@echo                           block diagram."
	@echo "  open_proj            : Opens the project in the background"
	@echo "  clean                : Cleans build outputs."
	@echo "  help                 : Display this help message."
	@echo ""
	@echo "Note:"
	@echo "  'make all' is equivalent to running 'make clean proj' in sequence."

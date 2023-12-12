all: clean simulation emulation

simulation:
	make -C sim/01_pcpi_muls all
	make -C sim/02_error_analysis all
	
emulation:
	@echo "Coming soon!"

clean:
	make -C sim/01_pcpi_muls clean
	make -C sim/02_error_analysis clean

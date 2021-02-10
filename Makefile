PROJ=blinky
TRELLIS?=/usr/share/trellis

all: ${PROJ}.bit

%.json: %.v
	yosys -p "synth_ecp5 -json $@" $<

%_out.config: %.json
	nextpnr-ecp5 --json $< --textcfg $@ --um5g-85k --package CABGA554 --lpf ecpix5.lpf

%.bit: %_out.config
	ecppack --svf ${PROJ}.svf $< $@

${PROJ}.svf : ${PROJ}.bit

prog: ${PROJ}.bit
	openocd -f openocd-ecpix5.cfg -c "transport select jtag; init; svf $<; exit"

load: ${PROJ}.bit
	openFPGALoader -b ecpix5 $<

clean:
	rm -f *.svf *.bit *.config *.json

.PHONY: prog clean

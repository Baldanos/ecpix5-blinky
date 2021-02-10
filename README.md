# ECPIX-5 Blinky

This is a simple blinky program for the [ECPIX-5 85F](https://shop.lambdaconcept.com/home/46-2-ecpix-5.html#/2-ecpix_5_fpga-ecpix_5_85f).

Contrary to the official documentation, this one is made in pure Verilog instead of using nMigen.

The [ecpix5.lpf](ecpix5.lpf) file has been created from scratch, and only provides the LEDs, PMOD0 and the UART for the moment.

## Prerequisites

For building :

 - [yosys](https://github.com/YosysHQ/yosys/)
 - [nextpnr-ecp5](https://github.com/YosysHQ/nextpnr)

For uploading, either :

 - [openocd](http://openocd.org/)
 - [openFPGALoader](https://github.com/trabucayre/openFPGALoader)

## Building

Just type `make` to build the project.

## Flashing

Flashing can be done using two different tools

### OpenOCD

Run `make prog`

### openFPGALoader

Run `make load`

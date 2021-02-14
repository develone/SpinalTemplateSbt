////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	helloworld_tb.cpp
//
// Project:	Verilog Tutorial Example file
//
// Purpose:	To demonstrate a Verilog main() program that calls a local
//		serial port co-simulator.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Written and distributed by Gisselquist Technology, LLC
//
// This program is hereby granted to the public domain.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.
//
////////////////////////////////////////////////////////////////////////////////
//
//
#include <verilatedos.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <sys/types.h>
#include <signal.h>
#include "verilated.h"
#include "VMyTopLevel.h"
#include "testb.h"


int	main(int argc, char **argv) {
	Verilated::commandArgs(argc, argv);
	TESTB<VMyTopLevel>	*tb
		= new TESTB<VMyTopLevel>;

	Verilated::traceEverOn(true);    // Verilator must compute traced signals
    VL_PRINTF("Enabling waves...\n");



	tb->opentrace("MyTopLevel.vcd");
	tb->m_core->reset = 0;
	for(unsigned clocks=0;
		clocks < 1000;
		 clocks++) {
		if (clocks==10) tb->m_core->reset = 1;
		tb->tick();
		
	}
	
	printf("\n\nSimulation complete\n");
}

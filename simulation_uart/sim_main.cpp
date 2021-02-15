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
#include "VUartCtrlUsageExample.h"
#include "testb.h"


int	main(int argc, char **argv) {
	Verilated::commandArgs(argc, argv);
	TESTB<VUartCtrlUsageExample>	*tb
		= new TESTB<VUartCtrlUsageExample>;

	Verilated::traceEverOn(true);    // Verilator must compute traced signals
    VL_PRINTF("Enabling waves...\n");



	tb->opentrace("UartCtrlUsageExample.vcd");
	//tb->m_core->reset = 0;
	for(unsigned clocks=0;clocks < 10000;clocks++) {
		/*
		if (clocks==10) tb->m_core->reset = 1;
		if (clocks==30) tb->m_core->io_cond0 = 1;
		if (clocks==40)	tb->m_core->io_cond1 = 1;
		if (clocks==50)	tb->m_core->reset = 0;
		*/
		
		
		
		tb->tick();
		
	}
	
	printf("\n\nSimulation complete\n");
}

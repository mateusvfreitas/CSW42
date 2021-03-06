#include <stdio.h>
#include <system.h>
#include "io.h"

#define LUT_SIZE 16
#define OPERATION_OFFSET 30
#define ADDRESS_OFFSET 16


int main()
{ 
	int sine_lut[LUT_SIZE] = {
		0x8000,0xb0fb,0xda82,0xf641,0xffff,0xf641,0xda82,0xb0fb,
		0x8000,0x4f04,0x257d,0x09be,0x0000,0x09be,0x257d,0x4f04,
	};
	int atual, i=0;
	int sleep;
	for(i=0;i<LUT_SIZE;i++) {
		IOWR(TOP_AVALON_0_BASE, 0, (2 << OPERATION_OFFSET) + (i << ADDRESS_OFFSET) + sine_lut[i]);
	}

	IOWR(TOP_AVALON_0_BASE, 0, (0 << OPERATION_OFFSET));
	IOWR(TOP_AVALON_0_BASE, 0, ((0 << OPERATION_OFFSET) + 1));
	// delay
	IORD(TOP_AVALON_0_BASE, 0);
	IORD(TOP_AVALON_0_BASE, 0);
	IORD(TOP_AVALON_0_BASE, 0);
	// end of delay
	IOWR(TOP_AVALON_0_BASE, 0, (0 << OPERATION_OFFSET));

	// Gera 5 ciclos
	IOWR(TOP_AVALON_0_BASE, 0, (1 << OPERATION_OFFSET) + 5);

	//	atual = IORD(TOP_AVALON_0_BASE, 0);
	return 0;
}

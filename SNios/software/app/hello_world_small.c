#include <stdio.h>
#include <system.h>
#include "io.h"

int main()
{ 
	int atual, i=0;
	while(i++ < 50) {
		atual = IORD(TOP_AVALON_0_BASE, 0);
		IOWR(TOP_AVALON_0_BASE, 0, 0x12345678);
		atual = IORD(TOP_AVALON_0_BASE, 1);
		IOWR(TOP_AVALON_0_BASE, 1, 0xFAFAFAFA);
	}
	return 0;
}

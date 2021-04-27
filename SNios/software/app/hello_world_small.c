#include <stdio.h>
#include <system.h>
#include "io.h"

int main()
{ 
	int atual, i=0;
	while(i++ < 50) {
		IOWR(TOP_AVALON_0_BASE, 0, i%4<<30);
		atual = IORD(TOP_AVALON_0_BASE, 0);
	}
	return 0;
}

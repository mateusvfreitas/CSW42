#include <stdio.h>
#include <system.h>

int main()
{ 
	int atual, i=0;
	int *pWr, *pRd;
	while(i++ < 50) {
		pRd = TOP_AVALON_0_BASE;
		pWr = TOP_AVALON_0_BASE;
		atual = *pRd;
		*(pWr + 0) = 0x12345678;
		*(pWr + 1) = 0xFAFAFAFA;
	}
	return 0;
}

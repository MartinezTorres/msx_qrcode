#include "common.h"


void generateQR() {
	
	qrcodegen("http://www.msx.org");
}
	
union {
	struct {
		uint8_t x,y;
	};
	uint16_t xy;
} coords;

void printQR() {

	for (coords.x=0; coords.x<QRSIZE+2; coords.x++) {
		for (coords.y=0; coords.y<QRSIZE+2; coords.y++) {
			if (qr(coords.xy)) {                        
				setPointFG(coords.xy);
			}
		}
	}
}


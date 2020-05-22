#include "common.h"

uint8_t scratchpad[256];



int main(void) {

    // Normal initialization routine
    msxhal_init(); // Bare minimum initialization of the msx support 
    DI(); // This game has normally disabled interrupts. 

    //msxhal_request60Hz();

    msxhal_enableR800();

    mapper_load_module(graphics, PAGE_C);
    mapper_load_module(qrcodegen, PAGE_D);
    initCanvas();

    rectangle(0, 0, 255, 191, 0x00, FWhite+BTransparent);

	generateQR();
	printQR();
    
    while (true) wait_frame();
    
    return 0;
}

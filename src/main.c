#include "common.h"

uint8_t scratchpad[256];


char msg[80];
uint8_t msg_sz;

int main(void) {

    // Normal initialization routine
    msxhal_init(); // Bare minimum initialization of the msx support 
    DI(); // This game has normally disabled interrupts. 

    //msxhal_request60Hz();

    msxhal_enableR800();

    mapper_load_module(graphics, PAGE_C);
    mapper_load_module(qrcodegen, PAGE_D);
    initCanvas();

	generateQR();
    
    
	enable_keyboard_routine = true;
    
    while (true) {
		
		rectangle(0, 0, 255, 63, 0x00, FWhite+BTransparent);
		rectangle(0, 64, 255, 191, 0x00, FLightGreen+BTransparent);
		printQR();

		textProperties.color = FLightGreen + BTransparent;
		textProperties.x = 0; textProperties.y = 64;
		writeText("Enter Text:");

		textProperties.x = 0; textProperties.y = 72;
		
		msg_sz = 0;

		while (msxhal_getch()!=0);

		while (true) {
			wait_frame();
			uint8_t c = msxhal_getch();
			if (c==0) continue;
			if (c=='\r') {
				qrcodegen(msg);
				break;
			}
			if (c==0x08) {
				if (msg_sz) {
					msg[--msg_sz]=0;
					rectangle(0, 72, 255, 79, 0x00, FLightGreen+BTransparent);
					textProperties.x = 0; textProperties.y = 72;
					writeText(msg);
				}
				continue;
			}
			if (c<32) {
				char tmp[4];
				tmp[0] = 'h';
				tmp[1] = (c>>4)["0123456789ABCDEF"];
				tmp[2] = (c&0xF)["0123456789ABCDEF"];
				tmp[3] = 0;
				
				uint8_t oldx = textProperties.x;
				
				textProperties.x = oldx; textProperties.y = 80;
				rectangle(0, 80, 255, 87, 0x00, FLightGreen+BTransparent);
				writeText(tmp);
				
				textProperties.x = oldx; textProperties.y = 72;
				continue;
			}

			msg[msg_sz]=c;
			msg[msg_sz+1]=0;
			writeText(&msg[msg_sz]);
			msg_sz++;
		}
	}
    
    return 0;
}

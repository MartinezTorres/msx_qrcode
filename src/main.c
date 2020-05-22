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
    uint8_t *v = qrcodegen("http:\\www.msx.org");
    initCanvas();

    rectangle(9, 19, 9+QRSIZE+1, 19+QRSIZE+1, 0xFF, FWhite+BTransparent);
    for (int j=0; j<QRSIZE; j++) {
        if (((j+10)&7)==0 && j+7<QRSIZE) {
            for (int i=0; i<QRSIZE; i++) {
                uint8_t v = 0;
                v |= !qr_get(j+0,i); v<<=1;
                v |= !qr_get(j+1,i); v<<=1;
                v |= !qr_get(j+2,i); v<<=1;
                v |= !qr_get(j+3,i); v<<=1;

                v |= !qr_get(j+4,i); v<<=1;
                v |= !qr_get(j+5,i); v<<=1;
                v |= !qr_get(j+6,i); v<<=1;
                v |= !qr_get(j+7,i);
                setPoints_v8(j+10,i+20,v);
            }
            j+=7;
        } else {
            for (int i=0; i<QRSIZE; i++) {
                if (qr_get(j,i)) {                        
                    setPointBG(((j+10)<<8)+ i+20);
                }
            }
        }
    }
    
    while (true) wait_frame();
    
    return 0;
}

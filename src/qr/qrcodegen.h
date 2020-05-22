#pragma once

#define QRVERSION 3
#define QRECL qrcodegen_Ecc_LOW
#define QRSIZE (QRVERSION * 4 + 17)
#define QRPAD 32

USING_MODULE(qrcodegen, PAGE_D);

uint8_t *qrcodegen(const char *text) __z88dk_fastcall;
bool qr(uint16_t xy) __z88dk_fastcall;

bool qr_get(uint8_t x, uint8_t y);
uint8_t qr_get8(uint8_t x, uint8_t y);


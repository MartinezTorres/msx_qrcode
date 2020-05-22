;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
	.module qrcodegen
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TMS99X8_status
	.globl _TMS99X8
	.globl _qr_get
	.globl _qr_get8
	.globl _qrcodegen
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_VDP0	=	0x0098
_VDP1	=	0x0099
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_TMS99X8	=	0xf3df
_TMS99X8_status	=	0xf3e7
_TMPBUFFER:
	.ds 116
_QRCODE:
	.ds 116
_rs_y:
	.ds 1
_rsdiv:
	.ds 30
_rsremainder:
	.ds 30
_rsdata:
	.ds 2
_dc_i:
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src//qr/qrcodegen.c:160: static void setModuleStatic(uint8_t qrcode[], uint8_t x, uint8_t y, bool isBlack) { setModule(qrcode, x, y, isBlack); }
;	---------------------------------
; Function setModuleStatic
; ---------------------------------
_setModuleStatic:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	a, 8 (ix)
	ld	-2 (ix), a
	ld	l, 7 (ix)
	ld	a, 6 (ix)
	ld	-1 (ix), a
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;src//qr/qrcodegen.c:155: uint8_t v =  qrcode[y * (QRPAD>>3) + (x>>3)];
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, -1 (ix)
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	e, a
	ld	d, #0x00
	add	hl, de
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	ld	c, a
;src//qr/qrcodegen.c:156: v = (v & ~qr_bitmask[x]) | (((uint8_t)((uint8_t)0)-(!!isBlack)) & qr_bitmask[x]);
	ld	hl, #_qr_bitmask+0
	ld	a, -1 (ix)
	add	a, l
	ld	l, a
	ld	a, #0x00
	adc	a, h
	ld	h, a
	ld	b, (hl)
	ld	a, b
	cpl
	and	a, c
	ld	c, a
	ld	a, -2 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	neg
	and	a, b
	or	a, c
;src//qr/qrcodegen.c:157: qrcode[y * (QRPAD>>3) + (x>>3)] = v;
	ld	(de), a
;src//qr/qrcodegen.c:160: static void setModuleStatic(uint8_t qrcode[], uint8_t x, uint8_t y, bool isBlack) { setModule(qrcode, x, y, isBlack); }
	ld	sp, ix
	pop	ix
	ret
_qr_bitmask:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
;src//qr/qrcodegen.c:161: bool qr_get(uint8_t x, uint8_t y) { return getModule(QRCODE,x,y); }
;	---------------------------------
; Function qr_get
; ---------------------------------
_qr_get::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, 5 (ix)
	ld	e, 4 (ix)
;src//qr/qrcodegen.c:151: return qrcode[y * (QRPAD>>3) + (x>>3)] & qr_bitmask[x];
	ld	h, #0x00
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	a, e
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	c, a
	ld	b, #0x00
	add	hl, bc
	ld	bc, #_QRCODE
	add	hl, bc
	ld	c, (hl)
	ld	hl, #_qr_bitmask+0
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	and	a, c
;src//qr/qrcodegen.c:161: bool qr_get(uint8_t x, uint8_t y) { return getModule(QRCODE,x,y); }
	ld	l, a
	pop	ix
	ret
;src//qr/qrcodegen.c:162: static void setModuleBounded(uint8_t qrcode[], int x, int y, bool isBlack) {
;	---------------------------------
; Function setModuleBounded
; ---------------------------------
_setModuleBounded:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src//qr/qrcodegen.c:163: if (0 <= x && x < QRSIZE && 0 <= y && y < QRSIZE)
	bit	7, 7 (ix)
	jr	NZ,00107$
	ld	a, 6 (ix)
	sub	a, #0x1d
	ld	a, 7 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00107$
	bit	7, 9 (ix)
	jr	NZ,00107$
	ld	a, 8 (ix)
	sub	a, #0x1d
	ld	a, 9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00107$
;src//qr/qrcodegen.c:164: setModule(qrcode, x, y, isBlack);
	ld	a, 10 (ix)
	ld	-2 (ix), a
	ld	l, 8 (ix)
	ld	a, 6 (ix)
	ld	-1 (ix), a
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;src//qr/qrcodegen.c:155: uint8_t v =  qrcode[y * (QRPAD>>3) + (x>>3)];
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, -1 (ix)
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	e, a
	ld	d, #0x00
	add	hl, de
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	ld	c, a
;src//qr/qrcodegen.c:156: v = (v & ~qr_bitmask[x]) | (((uint8_t)((uint8_t)0)-(!!isBlack)) & qr_bitmask[x]);
	ld	hl, #_qr_bitmask+0
	ld	a, -1 (ix)
	add	a, l
	ld	l, a
	ld	a, #0x00
	adc	a, h
	ld	h, a
	ld	b, (hl)
	ld	a, b
	cpl
	and	a, c
	ld	c, a
	ld	a, -2 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	neg
	and	a, b
	or	a, c
;src//qr/qrcodegen.c:157: qrcode[y * (QRPAD>>3) + (x>>3)] = v;
	ld	(de), a
;src//qr/qrcodegen.c:164: setModule(qrcode, x, y, isBlack);
00107$:
;src//qr/qrcodegen.c:165: }
	ld	sp, ix
	pop	ix
	ret
;src//qr/qrcodegen.c:170: uint8_t qr_get8(uint8_t x, uint8_t y) { return getModule8(QRCODE,x,y); }
;	---------------------------------
; Function qr_get8
; ---------------------------------
_qr_get8::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	d, 5 (ix)
	ld	e, 4 (ix)
	ld	bc, #_QRCODE+0
;src//qr/qrcodegen.c:168: INLINE uint8_t getModule8(const uint8_t qrcode[], uint8_t x, uint8_t y) { return qrcode[y * (QRPAD>>3) + (x>>3)]; }
	ld	l, d
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	srl	e
	srl	e
	srl	e
	ld	d, #0x00
	add	hl, de
	add	hl, bc
	ld	l, (hl)
;src//qr/qrcodegen.c:170: uint8_t qr_get8(uint8_t x, uint8_t y) { return getModule8(QRCODE,x,y); }
	pop	ix
	ret
;src//qr/qrcodegen.c:217: static uint8_t reedSolomonMultiply(uint8_t x_) __z88dk_fastcall {
;	---------------------------------
; Function reedSolomonMultiply
; ---------------------------------
_reedSolomonMultiply:
	ld	e, l
;src//qr/qrcodegen.c:219: uint8_t x=x_, y=rs_y, z=0;
	ld	c, e
	ld	iy, #_rs_y
	ld	b, 0 (iy)
;src//qr/qrcodegen.c:220: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	ld	h, #0x00
;src//qr/qrcodegen.c:221: if (y & 0x80) z ^= x;
	bit	7, b
	jr	Z,00105$
	ld	h, e
00105$:
;src//qr/qrcodegen.c:222: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	ld	a, h
	add	a, a
	add	hl, hl
	jr	NC,00107$
	ld	e, a
	rla
	sbc	a, a
	ld	a, e
	xor	a, #0x1d
	ld	h, a
	jr	00108$
00107$:
	ld	h, a
00108$:
;src//qr/qrcodegen.c:223: if (y & 0x40) z ^= x;
	bit	6, b
	jr	Z,00110$
	ld	a, h
	xor	a, c
	ld	h, a
00110$:
;src//qr/qrcodegen.c:222: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	ld	a, h
	add	a, a
;src//qr/qrcodegen.c:224: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	add	hl, hl
	jr	NC,00112$
	ld	e, a
	rla
	sbc	a, a
	ld	a, e
	xor	a, #0x1d
	ld	h, a
	jr	00113$
00112$:
	ld	h, a
00113$:
;src//qr/qrcodegen.c:225: if (y & 0x20) z ^= x;
	bit	5, b
	jr	Z,00115$
	ld	a, h
	xor	a, c
	ld	h, a
00115$:
;src//qr/qrcodegen.c:222: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	ld	a, h
	add	a, a
;src//qr/qrcodegen.c:226: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	add	hl, hl
	jr	NC,00117$
	ld	e, a
	rla
	sbc	a, a
	ld	a, e
	xor	a, #0x1d
	ld	h, a
	jr	00118$
00117$:
	ld	h, a
00118$:
;src//qr/qrcodegen.c:227: if (y & 0x10) z ^= x;
	bit	4, b
	jr	Z,00120$
	ld	a, h
	xor	a, c
	ld	h, a
00120$:
;src//qr/qrcodegen.c:222: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	ld	a, h
	add	a, a
;src//qr/qrcodegen.c:228: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	add	hl, hl
	jr	NC,00122$
	ld	e, a
	rla
	sbc	a, a
	ld	a, e
	xor	a, #0x1d
	ld	h, a
	jr	00123$
00122$:
	ld	h, a
00123$:
;src//qr/qrcodegen.c:229: if (y & 0x08) z ^= x;
	bit	3, b
	jr	Z,00125$
	ld	a, h
	xor	a, c
	ld	h, a
00125$:
;src//qr/qrcodegen.c:222: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	ld	a, h
	add	a, a
;src//qr/qrcodegen.c:230: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	add	hl, hl
	jr	NC,00127$
	ld	e, a
	rla
	sbc	a, a
	ld	a, e
	xor	a, #0x1d
	ld	h, a
	jr	00128$
00127$:
	ld	h, a
00128$:
;src//qr/qrcodegen.c:231: if (y & 0x04) z ^= x;
	bit	2, b
	jr	Z,00130$
	ld	a, h
	xor	a, c
	ld	h, a
00130$:
;src//qr/qrcodegen.c:222: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	ld	a, h
	add	a, a
;src//qr/qrcodegen.c:232: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	add	hl, hl
	jr	NC,00132$
	ld	e, a
	rla
	sbc	a, a
	ld	a, e
	xor	a, #0x1d
	ld	h, a
	jr	00133$
00132$:
	ld	h, a
00133$:
;src//qr/qrcodegen.c:233: if (y & 0x02) z ^= x;
	bit	1, b
	jr	Z,00135$
	ld	a, h
	xor	a, c
	ld	h, a
00135$:
;src//qr/qrcodegen.c:222: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	ld	a, h
	add	a, a
;src//qr/qrcodegen.c:234: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	add	hl, hl
	jr	NC,00137$
	ld	e, a
	rla
	sbc	a, a
	ld	a, e
	xor	a, #0x1d
00137$:
;src//qr/qrcodegen.c:235: if (y & 0x01) z ^= x;
	bit	0, b
	jr	Z,00140$
	xor	a, c
00140$:
;src//qr/qrcodegen.c:236: return z;
	ld	l, a
;src//qr/qrcodegen.c:237: }
	ret
;src//qr/qrcodegen.c:239: static uint8_t reedSolomonMultiply02(uint8_t x_) __z88dk_fastcall {
;	---------------------------------
; Function reedSolomonMultiply02
; ---------------------------------
_reedSolomonMultiply02:
	ld	c, l
;src//qr/qrcodegen.c:256: if (z & 0x80) { z = ((z << 1) ^ 0x1D); } else { z = (z << 1); }
	ld	a, c
	add	a, a
	bit	7, c
	jr	Z,00137$
	ld	b, a
	rla
	sbc	a, a
	ld	a, b
	xor	a, #0x1d
	ld	l, a
	ret
00137$:
	ld	l, a
;src//qr/qrcodegen.c:257: if (y & 0x01) z ^= x;
;src//qr/qrcodegen.c:258: return z;
;src//qr/qrcodegen.c:259: }
	ret
;src//qr/qrcodegen.c:267: static void reedSolomonComputeRemainder(const uint8_t data_[], uint8_t dataLen) {
;	---------------------------------
; Function reedSolomonComputeRemainder
; ---------------------------------
_reedSolomonComputeRemainder:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src//qr/qrcodegen.c:269: rsdata = data_;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	(_rsdata), hl
;src//qr/qrcodegen.c:270: memset(rsremainder,0,RSDegree);
	ld	hl, #_rsremainder
	ld	(hl), #0x00
	ld	e, l
	ld	d, h
	inc	de
	ld	bc, #0x000e
	ldir
;src//qr/qrcodegen.c:272: for (uint8_t i = 0; i < dataLen; i++) {  // Polynomial division
	ld	-1 (ix), #0x00
00107$:
	ld	a, -1 (ix)
	sub	a, 6 (ix)
	jr	NC,00109$
;src//qr/qrcodegen.c:273: rs_y = (*rsdata++) ^ rsremainder[0];
	ld	hl, (_rsdata)
	ld	c, (hl)
	ld	hl, (_rsdata)
	inc	hl
	ld	(_rsdata), hl
	ld	a, (#_rsremainder + 0)
	xor	a, c
	ld	(#_rs_y + 0),a
;src//qr/qrcodegen.c:275: for (uint8_t j = 0; j < RSDegree-1; j++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x0e
	jr	NC,00101$
;src//qr/qrcodegen.c:276: rsremainder[j] =  reedSolomonMultiply(rsdiv[j])^rsremainder[j+1];
	ld	a, #<(_rsremainder)
	add	a, c
	ld	e, a
	ld	a, #>(_rsremainder)
	adc	a, #0x00
	ld	d, a
	ld	hl, #_rsdiv
	ld	b, #0x00
	add	hl, bc
	ld	l, (hl)
	push	bc
	push	de
	call	_reedSolomonMultiply
	ld	b, l
	pop	de
	ld	a, b
	pop	bc
	ld	b, a
	ld	a, c
	inc	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	push	de
	ld	de, #_rsremainder
	add	hl, de
	pop	de
	ld	a, (hl)
	xor	a, b
	ld	(de), a
;src//qr/qrcodegen.c:275: for (uint8_t j = 0; j < RSDegree-1; j++)
	inc	c
	jr	00104$
00101$:
;src//qr/qrcodegen.c:278: rsremainder[RSDegree - 1] = reedSolomonMultiply(rsdiv[RSDegree - 1]);
	ld	hl, #_rsdiv + 14
	ld	l, (hl)
	call	_reedSolomonMultiply
	ld	a, l
	ld	(#(_rsremainder + 0x000e)),a
;src//qr/qrcodegen.c:272: for (uint8_t i = 0; i < dataLen; i++) {  // Polynomial division
	inc	-1 (ix)
	jr	00107$
00109$:
;src//qr/qrcodegen.c:281: }
	inc	sp
	pop	ix
	ret
;src//qr/qrcodegen.c:284: static void reedSolomonComputeDivisor() {
;	---------------------------------
; Function reedSolomonComputeDivisor
; ---------------------------------
_reedSolomonComputeDivisor:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src//qr/qrcodegen.c:286: memset(rsdiv,0,RSDegree);
	ld	hl, #_rsdiv
	ld	(hl), #0x00
	ld	e, l
	ld	d, h
	inc	de
	ld	bc, #0x000e
	ldir
;src//qr/qrcodegen.c:288: rsdiv[RSDegree - 1] = 1;  // Start off with the monomial x^0
	ld	hl, #(_rsdiv + 0x000e)
	ld	(hl), #0x01
;src//qr/qrcodegen.c:290: rs_y = 1;
	ld	hl,#_rs_y + 0
	ld	(hl), #0x01
;src//qr/qrcodegen.c:291: for (uint8_t i = 0; i < RSDegree; i++) {
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x0f
	jr	NC,00111$
;src//qr/qrcodegen.c:292: for (uint8_t j = 0; j < RSDegree; j++) {
	ld	b, #0x00
00106$:
	ld	a, b
	sub	a, #0x0f
	jr	NC,00103$
;src//qr/qrcodegen.c:293: rsdiv[j] = reedSolomonMultiply(rsdiv[j]);
	ld	a, #<(_rsdiv)
	add	a, b
	ld	e, a
	ld	a, #>(_rsdiv)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	l, a
	push	bc
	push	de
	call	_reedSolomonMultiply
	ld	a, l
	pop	de
	pop	bc
	ld	(de), a
;src//qr/qrcodegen.c:294: if (j + 1 < RSDegree)
	ld	l, b
	ld	h, #0x00
	inc	hl
	ld	a, l
	sub	a, #0x0f
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00107$
;src//qr/qrcodegen.c:295: rsdiv[j] ^= rsdiv[j + 1];
	ld	a, (de)
	ld	-1 (ix), a
	ld	a, b
	inc	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	push	de
	ld	de, #_rsdiv
	add	hl, de
	pop	de
	ld	a, (hl)
	xor	a, -1 (ix)
	ld	(de), a
00107$:
;src//qr/qrcodegen.c:292: for (uint8_t j = 0; j < RSDegree; j++) {
	inc	b
	jr	00106$
00103$:
;src//qr/qrcodegen.c:297: rs_y = reedSolomonMultiply02(rs_y);
	push	bc
	ld	iy, #_rs_y
	ld	l, 0 (iy)
	call	_reedSolomonMultiply02
	pop	bc
	ld	iy, #_rs_y
	ld	0 (iy), l
;src//qr/qrcodegen.c:291: for (uint8_t i = 0; i < RSDegree; i++) {
	inc	c
	jr	00109$
00111$:
;src//qr/qrcodegen.c:299: }
	inc	sp
	pop	ix
	ret
;src//qr/qrcodegen.c:309: static void addEccAndInterleave(uint8_t data[], uint8_t result[]) {
;	---------------------------------
; Function addEccAndInterleave
; ---------------------------------
_addEccAndInterleave:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:319: reedSolomonComputeDivisor();
	call	_reedSolomonComputeDivisor
;src//qr/qrcodegen.c:320: const uint8_t *dat = data;
	ld	a, 4 (ix)
	ld	-4 (ix), a
	ld	a, 5 (ix)
	ld	-3 (ix), a
;src//qr/qrcodegen.c:321: for (int i = 0; i < numBlocks; i++) {
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
00124$:
	ld	a, -2 (ix)
	sub	a, #0x01
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	ld	a, #0x00
	rla
	or	a, a
	jp	Z, 00126$
;src//qr/qrcodegen.c:322: int datLen = shortBlockDataLen + (i < numShortBlocks ? 0 : 1);
	or	a, a
	jr	Z,00130$
	ld	bc, #0x0000
	jr	00131$
00130$:
	ld	bc, #0x0001
00131$:
	ld	hl, #0x0037
	add	hl, bc
	ex	(sp), hl
;src//qr/qrcodegen.c:323: reedSolomonComputeRemainder(dat, datLen);
	ld	a, -6 (ix)
	push	af
	inc	sp
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	_reedSolomonComputeRemainder
	pop	af
	inc	sp
;src//qr/qrcodegen.c:324: for (int j = 0, k = i; j < datLen; j++, k += numBlocks) {  // Copy data
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	bc, #0x0000
00118$:
	ld	a, c
	sub	a, -6 (ix)
	ld	a, b
	sbc	a, -5 (ix)
	jp	PO, 00177$
	xor	a, #0x80
00177$:
	jp	P, 00103$
;src//qr/qrcodegen.c:325: if (j == shortBlockDataLen)
	ld	a, c
	sub	a, #0x37
	or	a, b
	jr	NZ,00102$
;src//qr/qrcodegen.c:326: k -= numShortBlocks;
	dec	de
00102$:
;src//qr/qrcodegen.c:327: result[k] = dat[j];
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	pop	iy
	pop	hl
	add	iy, de
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, bc
	ld	a, (hl)
	ld	0 (iy), a
;src//qr/qrcodegen.c:324: for (int j = 0, k = i; j < datLen; j++, k += numBlocks) {  // Copy data
	inc	bc
	inc	de
	jr	00118$
00103$:
;src//qr/qrcodegen.c:329: for (int j = 0, k = dataLen + i; j < blockEccLen; j++, k += numBlocks)  // Copy ECC
	ld	a, -2 (ix)
	add	a, #0x37
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, #0x0000
00121$:
	ld	a, e
	sub	a, #0x0f
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00104$
;src//qr/qrcodegen.c:330: result[k] = rsremainder[j];
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	pop	iy
	pop	hl
	add	iy, bc
	ld	hl, #_rsremainder
	add	hl, de
	ld	a, (hl)
	ld	0 (iy), a
;src//qr/qrcodegen.c:329: for (int j = 0, k = dataLen + i; j < blockEccLen; j++, k += numBlocks)  // Copy ECC
	inc	de
	inc	bc
	jr	00121$
00104$:
;src//qr/qrcodegen.c:331: dat += datLen;
	ld	a, -6 (ix)
	add	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, -3 (ix)
	ld	-3 (ix), a
;src//qr/qrcodegen.c:321: for (int i = 0; i < numBlocks; i++) {
	inc	-2 (ix)
	jp	NZ,00124$
	inc	-1 (ix)
	jp	00124$
00126$:
;src//qr/qrcodegen.c:333: }
	ld	sp, ix
	pop	ix
	ret
;src//qr/qrcodegen.c:344: static int getAlignmentPatternPositions(uint8_t result[7]) {
;	---------------------------------
; Function getAlignmentPatternPositions
; ---------------------------------
_getAlignmentPatternPositions:
	push	ix
	ld	ix,#0
	add	ix,sp
;src//qr/qrcodegen.c:349: for (int i = (QRVERSION / 7 + 2) - 1, pos = QRVERSION * 4 + 10; i >= 1; i--, pos -= step)
	ld	bc, #0x0001
	ld	de, #0x0016
00105$:
	ld	a, c
	sub	a, #0x01
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00103$
;src//qr/qrcodegen.c:350: result[i] = (uint8_t)pos;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	add	hl, bc
	ld	(hl), e
;src//qr/qrcodegen.c:349: for (int i = (QRVERSION / 7 + 2) - 1, pos = QRVERSION * 4 + 10; i >= 1; i--, pos -= step)
	dec	bc
	ld	a, e
	add	a, #0xf0
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	jr	00105$
00103$:
;src//qr/qrcodegen.c:351: result[0] = 6;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	(hl), #0x06
;src//qr/qrcodegen.c:352: return (QRVERSION / 7 + 2);
	ld	hl, #0x0002
;src//qr/qrcodegen.c:353: }
	pop	ix
	ret
;src//qr/qrcodegen.c:357: static void fillRectangle(int left, int top, int width, int height, uint8_t qrcode[]) {
;	---------------------------------
; Function fillRectangle
; ---------------------------------
_fillRectangle:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src//qr/qrcodegen.c:358: for (int dy = 0; dy < height; dy++) {
	ld	bc, #0x0000
00107$:
	ld	a, c
	sub	a, 10 (ix)
	ld	a, b
	sbc	a, 11 (ix)
	jp	PO, 00133$
	xor	a, #0x80
00133$:
	jp	P, 00109$
;src//qr/qrcodegen.c:359: for (int dx = 0; dx < width; dx++)
	ld	de, #0x0000
00104$:
	ld	a, e
	sub	a, 8 (ix)
	ld	a, d
	sbc	a, 9 (ix)
	jp	PO, 00134$
	xor	a, #0x80
00134$:
	jp	P, 00108$
;src//qr/qrcodegen.c:360: setModuleStatic(qrcode, left + dx, top + dy, true);
	ld	l, 6 (ix)
	ld	a, c
	add	a, l
	ld	h, a
	ld	l, 4 (ix)
	ld	a, e
	add	a, l
	ld	-1 (ix), a
	push	bc
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	hl
	inc	sp
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	l, 12 (ix)
	ld	h, 13 (ix)
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
;src//qr/qrcodegen.c:359: for (int dx = 0; dx < width; dx++)
	inc	de
	jr	00104$
00108$:
;src//qr/qrcodegen.c:358: for (int dy = 0; dy < height; dy++) {
	inc	bc
	jr	00107$
00109$:
;src//qr/qrcodegen.c:362: }
	inc	sp
	pop	ix
	ret
;src//qr/qrcodegen.c:367: static void initializeFunctionModules(int version, uint8_t qrcode[]) {
;	---------------------------------
; Function initializeFunctionModules
; ---------------------------------
_initializeFunctionModules:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-22
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:369: memset(qrcode, 0, (size_t)qrcodegen_BUFFER_SZ * sizeof(qrcode[0]));
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	b, #0x3a
00162$:
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	djnz	00162$
;src//qr/qrcodegen.c:372: fillRectangle(6, 0, 1, QRSIZE, qrcode);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	hl, #0x001d
	push	hl
	ld	l, #0x01
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x06
	push	hl
	call	_fillRectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:373: fillRectangle(0, 6, QRSIZE, 1, qrcode);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	l, #0x1d
	push	hl
	ld	l, #0x06
	push	hl
	ld	l, #0x00
	push	hl
	call	_fillRectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:376: fillRectangle(0, 0, 9, 9, qrcode);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	hl, #0x0009
	push	hl
	ld	l, #0x09
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	_fillRectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:377: fillRectangle(QRSIZE - 8, 0, 8, 9, qrcode);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	hl, #0x0009
	push	hl
	ld	l, #0x08
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x15
	push	hl
	call	_fillRectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:378: fillRectangle(0, QRSIZE - 8, 9, 8, qrcode);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	hl, #0x0008
	push	hl
	ld	l, #0x09
	push	hl
	ld	l, #0x15
	push	hl
	ld	l, #0x00
	push	hl
	call	_fillRectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:382: int numAlign = getAlignmentPatternPositions(alignPatPos);
	ld	hl, #0
	add	hl, sp
	ld	-15 (ix), l
	ld	-14 (ix), h
	push	hl
	call	_getAlignmentPatternPositions
	pop	af
;src//qr/qrcodegen.c:383: for (int i = 0; i < numAlign; i++) {
	ld	-13 (ix), l
	ld	-12 (ix), h
	ex	de,hl
	dec	de
	ld	-11 (ix), e
	ld	-10 (ix), d
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
00116$:
	ld	a, -2 (ix)
	sub	a, -13 (ix)
	ld	a, -1 (ix)
	sbc	a, -12 (ix)
	jp	PO, 00164$
	xor	a, #0x80
00164$:
	jp	P, 00109$
;src//qr/qrcodegen.c:384: for (int j = 0; j < numAlign; j++) {
	ld	a, e
	sub	a, -2 (ix)
	jr	NZ,00165$
	ld	a, d
	sub	a, -1 (ix)
	jr	NZ, 00165$
	ld	a, #0x01
	.db	#0x20
00165$:
	xor	a, a
00166$:
	ld	-9 (ix), a
	ld	a, -15 (ix)
	add	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -14 (ix)
	adc	a, -1 (ix)
	ld	-7 (ix), a
	ld	bc, #0x0000
00113$:
	ld	a, c
	sub	a, -13 (ix)
	ld	a, b
	sbc	a, -12 (ix)
	jp	PO, 00167$
	xor	a, #0x80
00167$:
	jp	P, 00117$
;src//qr/qrcodegen.c:386: if (!((i == 0 && j == 0) || (i == 0 && j == numAlign - 1) || (i == numAlign - 1 && j == 0)))
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	NZ,00105$
	ld	a, b
	or	a, c
	jr	Z,00114$
00105$:
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	NZ,00107$
	ld	a, -11 (ix)
	sub	a, c
	jr	NZ,00168$
	ld	a, -10 (ix)
	sub	a, b
	jr	Z,00114$
00168$:
00107$:
	ld	a, -9 (ix)
	or	a, a
	jr	Z,00101$
	ld	a, b
	or	a, c
	jr	Z,00114$
00101$:
;src//qr/qrcodegen.c:387: fillRectangle(alignPatPos[i] - 2, alignPatPos[j] - 2, 5, 5, qrcode);
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	ld	a, l
	add	a, #0xfe
	ld	-6 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-5 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	l, (hl)
	ld	h, #0x00
	ld	a, l
	add	a, #0xfe
	ld	-4 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-3 (ix), a
	push	bc
	push	de
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	l, #0x05
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	_fillRectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
00114$:
;src//qr/qrcodegen.c:384: for (int j = 0; j < numAlign; j++) {
	inc	bc
	jp	00113$
00117$:
;src//qr/qrcodegen.c:383: for (int i = 0; i < numAlign; i++) {
	inc	-2 (ix)
	jp	NZ,00116$
	inc	-1 (ix)
	jp	00116$
00109$:
;src//qr/qrcodegen.c:392: if (version >= 7) {
	ld	a, 4 (ix)
	sub	a, #0x07
	ld	a, 5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00118$
;src//qr/qrcodegen.c:393: fillRectangle(QRSIZE - 11, 0, 3, 6, qrcode);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	l, #0x03
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x12
	push	hl
	call	_fillRectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:394: fillRectangle(0, QRSIZE - 11, 6, 3, qrcode);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	l, #0x06
	push	hl
	ld	l, #0x12
	push	hl
	ld	l, #0x00
	push	hl
	call	_fillRectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
00118$:
;src//qr/qrcodegen.c:396: }
	ld	sp, ix
	pop	ix
	ret
;src//qr/qrcodegen.c:402: static void drawWhiteFunctionModules() {
;	---------------------------------
; Function drawWhiteFunctionModules
; ---------------------------------
_drawWhiteFunctionModules:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-28
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:405: for (i = 7; i < QRSIZE - 7; i += 2) {
	ld	bc, #0x0007
00126$:
;src//qr/qrcodegen.c:406: setModuleStatic(QRCODE, 6, i, false);
	ld	d, c
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	ld	a, #0x06
	push	af
	inc	sp
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	de
	xor	a, a
	ld	b,a
	ld	c,#0x06
	push	bc
	push	de
	inc	sp
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
;src//qr/qrcodegen.c:405: for (i = 7; i < QRSIZE - 7; i += 2) {
	inc	bc
	inc	bc
	ld	a, c
	sub	a, #0x16
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00126$
;src//qr/qrcodegen.c:411: for (int dy = -4; dy <= 4; dy++) {
	ld	-4 (ix), #0xfc
	ld	-3 (ix), #0xff
00132$:
	ld	a, #0x04
	cp	a, -4 (ix)
	ld	a, #0x00
	sbc	a, -3 (ix)
	jp	PO, 00290$
	xor	a, #0x80
00290$:
	jp	M, 00108$
;src//qr/qrcodegen.c:412: for (int dx = -4; dx <= 4; dx++) {
	ld	a, -3 (ix)
	rlca
	and	a,#0x01
	ld	-15 (ix), a
	xor	a, a
	sub	a, -4 (ix)
	ld	-14 (ix), a
	ld	a, #0x00
	sbc	a, -3 (ix)
	ld	-13 (ix), a
	ld	a, -14 (ix)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	ld	-11 (ix), a
	ld	a, -4 (ix)
	add	a, #0x03
	ld	-10 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	a, -4 (ix)
	add	a, #0x19
	ld	-8 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	-2 (ix), #0xfc
	ld	-1 (ix), #0xff
00129$:
	ld	a, #0x04
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00291$
	xor	a, #0x80
00291$:
	jp	M, 00133$
;src//qr/qrcodegen.c:413: int dist = abs(dx);
	bit	7, -1 (ix)
	jr	NZ,00155$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	jr	00156$
00155$:
	xor	a, a
	sub	a, -2 (ix)
	ld	c, a
	ld	a, #0x00
	sbc	a, -1 (ix)
	ld	b, a
00156$:
	ld	-6 (ix), c
	ld	-5 (ix), b
;src//qr/qrcodegen.c:414: if (abs(dy) > dist)
	bit	0, -15 (ix)
	jr	NZ,00157$
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	jr	00158$
00157$:
	ld	c, -14 (ix)
	ld	b, -13 (ix)
00158$:
	ld	a, -6 (ix)
	sub	a, c
	ld	a, -5 (ix)
	sbc	a, b
	jp	PO, 00292$
	xor	a, #0x80
00292$:
	jp	P, 00103$
;src//qr/qrcodegen.c:415: dist = abs(dy);
	bit	0, -15 (ix)
	jr	NZ,00159$
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	jr	00160$
00159$:
	ld	a, -12 (ix)
	ld	-6 (ix), a
	ld	a, -11 (ix)
	ld	-5 (ix), a
00160$:
00103$:
;src//qr/qrcodegen.c:416: if (dist == 2 || dist == 4) {
	ld	a, -6 (ix)
	sub	a, #0x02
	or	a, -5 (ix)
	jr	Z,00104$
	ld	a, -6 (ix)
	sub	a, #0x04
	or	a, -5 (ix)
	jr	NZ,00130$
00104$:
;src//qr/qrcodegen.c:417: setModuleBounded(QRCODE, 3 + dx, 3 + dy, false);
	ld	a, -2 (ix)
	add	a, #0x03
	ld	-6 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	xor	a, a
	push	af
	inc	sp
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleBounded
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:418: setModuleBounded(QRCODE, QRSIZE - 4 + dx, 3 + dy, false);
	ld	a, -2 (ix)
	add	a, #0x19
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	push	af
	inc	sp
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	push	bc
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleBounded
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:419: setModuleBounded(QRCODE, 3 + dx, QRSIZE - 4 + dy, false);
	xor	a, a
	push	af
	inc	sp
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleBounded
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
00130$:
;src//qr/qrcodegen.c:412: for (int dx = -4; dx <= 4; dx++) {
	inc	-2 (ix)
	jp	NZ,00129$
	inc	-1 (ix)
	jp	00129$
00133$:
;src//qr/qrcodegen.c:411: for (int dy = -4; dy <= 4; dy++) {
	inc	-4 (ix)
	jp	NZ,00132$
	inc	-3 (ix)
	jp	00132$
00108$:
;src//qr/qrcodegen.c:426: int numAlign = getAlignmentPatternPositions(alignPatPos);
	ld	hl, #0
	add	hl, sp
	ld	-21 (ix), l
	ld	-20 (ix), h
	push	hl
	call	_getAlignmentPatternPositions
	pop	af
	ld	-19 (ix), l
	ld	-18 (ix), h
;src//qr/qrcodegen.c:427: for (i = 0; i < numAlign; i++) {
	ld	a, -19 (ix)
	add	a, #0xff
	ld	-17 (ix), a
	ld	a, -18 (ix)
	adc	a, #0xff
	ld	-16 (ix), a
	ld	a, -17 (ix)
	ld	-15 (ix), a
	ld	a, -16 (ix)
	ld	-14 (ix), a
	ld	-8 (ix), #0x00
	ld	-7 (ix), #0x00
00143$:
	ld	a, -8 (ix)
	sub	a, -19 (ix)
	ld	a, -7 (ix)
	sbc	a, -18 (ix)
	jp	PO, 00298$
	xor	a, #0x80
00298$:
	jp	P, 00153$
;src//qr/qrcodegen.c:428: for (int j = 0; j < numAlign; j++) {
	ld	a, -17 (ix)
	sub	a, -8 (ix)
	jr	NZ,00299$
	ld	a, -16 (ix)
	sub	a, -7 (ix)
	jr	NZ, 00299$
	ld	a, #0x01
	.db	#0x20
00299$:
	xor	a, a
00300$:
	ld	-13 (ix), a
	ld	a, -21 (ix)
	add	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -20 (ix)
	adc	a, -7 (ix)
	ld	-11 (ix), a
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
00141$:
	ld	a, -6 (ix)
	sub	a, -19 (ix)
	ld	a, -5 (ix)
	sbc	a, -18 (ix)
	jp	PO, 00301$
	xor	a, #0x80
00301$:
	jp	P, 00144$
;src//qr/qrcodegen.c:429: if ((i == 0 && j == 0) || (i == 0 && j == numAlign - 1) || (i == numAlign - 1 && j == 0))
	ld	a, -7 (ix)
	or	a, -8 (ix)
	jr	NZ,00113$
	ld	a, -5 (ix)
	or	a, -6 (ix)
	jp	Z, 00118$
00113$:
	ld	a, -7 (ix)
	or	a, -8 (ix)
	jr	NZ,00115$
	ld	a, -15 (ix)
	sub	a, -6 (ix)
	jr	NZ,00302$
	ld	a, -14 (ix)
	sub	a, -5 (ix)
	jp	Z,00118$
00302$:
00115$:
	ld	a, -13 (ix)
	or	a, a
	jr	Z,00184$
	ld	a, -5 (ix)
	or	a, -6 (ix)
	jp	Z, 00118$
;src//qr/qrcodegen.c:431: for (int dy = -1; dy <= 1; dy++) {
00184$:
	ld	a, -21 (ix)
	add	a, -6 (ix)
	ld	-10 (ix), a
	ld	a, -20 (ix)
	adc	a, -5 (ix)
	ld	-9 (ix), a
	ld	-4 (ix), #0xff
	ld	-3 (ix), #0xff
00138$:
	ld	a, #0x01
	cp	a, -4 (ix)
	ld	a, #0x00
	sbc	a, -3 (ix)
	jp	PO, 00303$
	xor	a, #0x80
00303$:
	jp	M, 00118$
;src//qr/qrcodegen.c:432: for (int dx = -1; dx <= 1; dx++)
	ld	-2 (ix), #0xff
	ld	-1 (ix), #0xff
00135$:
	ld	a, #0x01
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00304$
	xor	a, #0x80
00304$:
	jp	M, 00139$
;src//qr/qrcodegen.c:433: setModuleStatic(QRCODE, alignPatPos[i] + dx, alignPatPos[j] + dy, dx == 0 && dy == 0);
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	NZ,00161$
	ld	a, -3 (ix)
	or	a, -4 (ix)
	jr	Z,00162$
00161$:
	xor	a, a
	jr	00163$
00162$:
	ld	a, #0x01
00163$:
	ld	e, a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	c, (hl)
	ld	a, -4 (ix)
	add	a, c
	ld	b, a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	c, (hl)
	ld	a, -2 (ix)
	add	a, c
	ld	c, a
	ld	a, e
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
;src//qr/qrcodegen.c:432: for (int dx = -1; dx <= 1; dx++)
	inc	-2 (ix)
	jr	NZ,00135$
	inc	-1 (ix)
	jr	00135$
00139$:
;src//qr/qrcodegen.c:431: for (int dy = -1; dy <= 1; dy++) {
	inc	-4 (ix)
	jr	NZ,00138$
	inc	-3 (ix)
	jp	00138$
00118$:
;src//qr/qrcodegen.c:428: for (int j = 0; j < numAlign; j++) {
	inc	-6 (ix)
	jp	NZ,00141$
	inc	-5 (ix)
	jp	00141$
00144$:
;src//qr/qrcodegen.c:427: for (i = 0; i < numAlign; i++) {
	inc	-8 (ix)
	jp	NZ,00143$
	inc	-7 (ix)
	jp	00143$
;src//qr/qrcodegen.c:448: for (i = 0; i < 6; i++) {
00153$:
;src//qr/qrcodegen.c:457: }
	ld	sp, ix
	pop	ix
	ret
;src//qr/qrcodegen.c:461: static void drawFormatBitsCopy0(uint16_t bits) __z88dk_fastcall {
;	---------------------------------
; Function drawFormatBitsCopy0
; ---------------------------------
_drawFormatBitsCopy0:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	-2 (ix), l
	ld	-1 (ix), h
;src//qr/qrcodegen.c:463: uint8_t b = bits&0xFF;
	ld	c, -2 (ix)
;src//qr/qrcodegen.c:464: setModuleStatic(QRCODE, 8, 0, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x08
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:465: setModuleStatic(QRCODE, 8, 1, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0108
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:466: setModuleStatic(QRCODE, 8, 2, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0208
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:467: setModuleStatic(QRCODE, 8, 3, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0308
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:468: setModuleStatic(QRCODE, 8, 4, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0408
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:469: setModuleStatic(QRCODE, 8, 5, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0508
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:471: setModuleStatic(QRCODE, 8, 7, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0708
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	ld	a, c
	srl	a
;src//qr/qrcodegen.c:472: setModuleStatic(QRCODE, 8, 8, b&1);
	and	a, #0x01
	ld	b, a
	push	bc
	inc	sp
	ld	de, #0x0808
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
;src//qr/qrcodegen.c:474: b = bits>>8;
	ld	c, -1 (ix)
;src//qr/qrcodegen.c:475: setModuleStatic(QRCODE, 7, 8, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0807
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:477: setModuleStatic(QRCODE, 14 -  9, 8, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0805
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:478: setModuleStatic(QRCODE, 14 - 10, 8, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0804
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:479: setModuleStatic(QRCODE, 14 - 11, 8, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0803
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:480: setModuleStatic(QRCODE, 14 - 12, 8, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0802
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	srl	c
;src//qr/qrcodegen.c:481: setModuleStatic(QRCODE, 14 - 13, 8, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	de, #0x0801
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	ld	a, c
	srl	a
;src//qr/qrcodegen.c:482: setModuleStatic(QRCODE, 14 - 14, 8, b&1);
	and	a, #0x01
	ld	b, a
	push	bc
	inc	sp
	ld	a, #0x08
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
;src//qr/qrcodegen.c:483: }
	ld	sp,ix
	pop	ix
	ret
;src//qr/qrcodegen.c:485: static void drawFormatBitsCopy1(uint16_t bits) __z88dk_fastcall {
;	---------------------------------
; Function drawFormatBitsCopy1
; ---------------------------------
_drawFormatBitsCopy1:
	ld	c, l
	ld	b, h
;src//qr/qrcodegen.c:487: uint8_t b = bits&0xFF;
	ld	d, c
;src//qr/qrcodegen.c:489: for (i = 0; i < 8; i++) {
	ld	l, #0x00
00103$:
;src//qr/qrcodegen.c:490: setModuleStatic(QRCODE, QRSIZE - 1 - i, 8, b&1); b>>=1;
	ld	a, d
	and	a, #0x01
	ld	h, a
	ld	e, l
	ld	a, #0x1c
	sub	a, e
	ld	e, a
	push	hl
	push	bc
	push	de
	push	hl
	inc	sp
	ld	d,#0x08
	push	de
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
	pop	hl
	srl	d
;src//qr/qrcodegen.c:489: for (i = 0; i < 8; i++) {
	inc	l
	ld	a, l
	sub	a, #0x08
	jr	C,00103$
;src//qr/qrcodegen.c:492: b = bits>>8;
	ld	c, b
	ld	b, #0x00
;src//qr/qrcodegen.c:493: for (i = 8; i < 15; i++) {
	ld	l, #0x08
00105$:
;src//qr/qrcodegen.c:494: setModuleStatic(QRCODE, 8, QRSIZE - 15 + i, b&1); b>>=1;
	ld	a, c
	and	a, #0x01
	ld	h, a
	ld	a, l
	add	a, #0x0e
	ld	e, a
	push	hl
	push	bc
	push	hl
	inc	sp
	ld	d, e
	ld	e,#0x08
	push	de
	ld	de, #_QRCODE
	push	de
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
	pop	bc
	pop	hl
	srl	c
;src//qr/qrcodegen.c:493: for (i = 8; i < 15; i++) {
	inc	l
	ld	a, l
	sub	a, #0x0f
	jr	C,00105$
;src//qr/qrcodegen.c:496: setModuleStatic(QRCODE, 8, QRSIZE - 8, true);  // Always black
	ld	de, #0x0115
	push	de
	ld	a, #0x08
	push	af
	inc	sp
	ld	hl, #_QRCODE
	push	hl
	call	_setModuleStatic
	pop	af
	pop	af
	inc	sp
;src//qr/qrcodegen.c:498: }
	ret
;src//qr/qrcodegen.c:499: static void drawFormatBits() {
;	---------------------------------
; Function drawFormatBits
; ---------------------------------
_drawFormatBits:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src//qr/qrcodegen.c:502: int data = table[QRECL] << 3 | (int)MASK;  // errCorrLvl is uint2, mask is uint3
	ld	hl, (#_drawFormatBits_table_65536_303 + 0)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	(sp), hl
;src//qr/qrcodegen.c:503: int rem = data;
	pop	de
	push	de
;src//qr/qrcodegen.c:504: for (uint8_t i = 0; i < 10; i++)
	ld	-1 (ix), #0x00
00103$:
	ld	a, -1 (ix)
	sub	a, #0x0a
	jr	NC,00101$
;src//qr/qrcodegen.c:505: rem = (rem << 1) ^ ((rem >> 9) * 0x537);
	ld	c, e
	ld	b, d
	sla	c
	rl	b
	ld	a, d
	sra	a
	ld	e,a
	rlc	a
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	a, c
	xor	a, l
	ld	e, a
	ld	a, b
	xor	a, h
	ld	d, a
;src//qr/qrcodegen.c:504: for (uint8_t i = 0; i < 10; i++)
	inc	-1 (ix)
	jr	00103$
00101$:
;src//qr/qrcodegen.c:506: uint16_t bits = (data << 10 | rem) ^ 0x5412;  // uint15
	ld	a, -3 (ix)
	add	a, a
	add	a, a
	ld	b, a
	ld	a, #0x00
	or	a, e
	ld	c, a
	ld	a, b
	or	a, d
	ld	b, a
	ld	a, c
	xor	a, #0x12
	ld	l, a
	ld	a, b
	xor	a, #0x54
	ld	h, a
;src//qr/qrcodegen.c:508: drawFormatBitsCopy0(bits);
	push	hl
	call	_drawFormatBitsCopy0
	pop	hl
;src//qr/qrcodegen.c:509: drawFormatBitsCopy1(bits);
	call	_drawFormatBitsCopy1
;src//qr/qrcodegen.c:510: }
	ld	sp, ix
	pop	ix
	ret
_drawFormatBits_table_65536_303:
	.dw #0x0001
	.dw #0x0000
	.dw #0x0003
	.dw #0x0002
;src//qr/qrcodegen.c:518: static void drawCodewordsLR(uint8_t x) __z88dk_fastcall {
;	---------------------------------
; Function drawCodewordsLR
; ---------------------------------
_drawCodewordsLR:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	push	af
	ld	c, l
;src//qr/qrcodegen.c:520: while (y<QRSIZE) {
	ld	a, c
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	-6 (ix), a
	ld	a, c
	add	a, #<(_qr_bitmask)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_qr_bitmask)
	ld	d, a
	ld	-1 (ix), #0x00
00105$:
	ld	a, -1 (ix)
	sub	a, #0x1d
	jp	NC, 00114$
;src//qr/qrcodegen.c:521: if (!getModule(QRCODE, x, y)) {
;src//qr/qrcodegen.c:151: return qrcode[y * (QRPAD>>3) + (x>>3)] & qr_bitmask[x];
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	b, -6 (ix)
	ld	l, #0x00
	ld	a, -5 (ix)
	add	a, b
	ld	-8 (ix), a
	ld	a, -4 (ix)
	adc	a, l
	ld	-7 (ix), a
	ld	a, -8 (ix)
	add	a, #<(_QRCODE)
	ld	l, a
	ld	a, -7 (ix)
	adc	a, #>(_QRCODE)
	ld	h, a
	ld	a, (hl)
	push	af
	ld	a, (de)
	ld	b, a
	pop	af
;src//qr/qrcodegen.c:521: if (!getModule(QRCODE, x, y)) {
	and	a,b
	jp	NZ, 00102$
;src//qr/qrcodegen.c:522: setModule(QRCODE, x, y, getBit(TMPBUFFER[dc_i >> 3], 7 - (dc_i & 7)));
	ld	a,(#_dc_i + 0)
	and	a, #0x07
	ld	l, a
	ld	h, #0x00
	ld	a, #0x07
	sub	a, l
	ld	-3 (ix), a
	ld	a, #0x00
	sbc	a, h
	ld	-2 (ix), a
	ld	hl, (_dc_i)
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	push	de
	ld	de, #_TMPBUFFER
	add	hl, de
	pop	de
	ld	l, (hl)
	ld	h, #0x00
;src//qr/qrcodegen.c:146: return ((x >> i) & 1) != 0;
	ld	a, -3 (ix)
	inc	a
	jr	00138$
00137$:
	sra	h
	rr	l
00138$:
	dec	a
	jr	NZ, 00137$
	ld	a, l
	and	a, #0x01
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	a, #0x00
	or	a, -3 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	-3 (ix), a
;src//qr/qrcodegen.c:522: setModule(QRCODE, x, y, getBit(TMPBUFFER[dc_i >> 3], 7 - (dc_i & 7)));
;src//qr/qrcodegen.c:155: uint8_t v =  qrcode[y * (QRPAD>>3) + (x>>3)];
	ld	iy, #_QRCODE
	push	bc
	ld	c, -8 (ix)
	ld	b, -7 (ix)
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	ld	-2 (ix), a
;src//qr/qrcodegen.c:156: v = (v & ~qr_bitmask[x]) | (((uint8_t)((uint8_t)0)-(!!isBlack)) & qr_bitmask[x]);
	ld	a, b
	cpl
	and	a, -2 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	neg
	and	a, b
	ld	l, a
	ld	a, -2 (ix)
	or	a, l
;src//qr/qrcodegen.c:157: qrcode[y * (QRPAD>>3) + (x>>3)] = v;
	ld	0 (iy), a
;src//qr/qrcodegen.c:523: dc_i++;
	ld	hl, (_dc_i)
	inc	hl
	ld	(_dc_i), hl
00102$:
;src//qr/qrcodegen.c:525: if (!getModule(QRCODE, x-1, y)) {
	ld	a, c
	add	a, #0xff
	ld	-3 (ix), a
;src//qr/qrcodegen.c:151: return qrcode[y * (QRPAD>>3) + (x>>3)] & qr_bitmask[x];
	ld	b,a
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	l, a
	ld	h, #0x00
	ld	a, l
	add	a, -5 (ix)
	ld	l, a
	ld	a, h
	adc	a, -4 (ix)
	ld	h, a
	push	de
	ld	de, #_QRCODE
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, b
	add	a, #<(_qr_bitmask)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_qr_bitmask)
	ld	h, a
	ld	a, (hl)
	and	a, -2 (ix)
;src//qr/qrcodegen.c:525: if (!getModule(QRCODE, x-1, y)) {
	ld	-2 (ix), a
	or	a, a
	jp	NZ, 00104$
;src//qr/qrcodegen.c:526: setModule(QRCODE, x-1, y, getBit(TMPBUFFER[dc_i >> 3], 7 - (dc_i & 7)));
	ld	a,(#_dc_i + 0)
	and	a, #0x07
	ld	b, a
	ld	l, #0x00
	ld	a, #0x07
	sub	a, b
	ld	-8 (ix), a
	ld	a, #0x00
	sbc	a, l
	ld	-7 (ix), a
	ld	hl, (_dc_i)
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	ld	a, #<(_TMPBUFFER)
	add	a, l
	ld	l, a
	ld	a, #>(_TMPBUFFER)
	adc	a, h
	ld	h, a
	ld	l, (hl)
	ld	h, #0x00
;src//qr/qrcodegen.c:146: return ((x >> i) & 1) != 0;
	ld	b, -8 (ix)
	inc	b
	jr	00140$
00139$:
	sra	h
	rr	l
00140$:
	djnz	00139$
	ld	a, l
	and	a, #0x01
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	ld	a, #0x00
	or	a, -8 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	-2 (ix), a
;src//qr/qrcodegen.c:526: setModule(QRCODE, x-1, y, getBit(TMPBUFFER[dc_i >> 3], 7 - (dc_i & 7)));
	ld	iy, #_QRCODE
	ld	a, -3 (ix)
;src//qr/qrcodegen.c:155: uint8_t v =  qrcode[y * (QRPAD>>3) + (x>>3)];
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	b, a
	ld	h, #0x00
	ld	a, -5 (ix)
	add	a, b
	ld	l, a
	ld	a, -4 (ix)
	adc	a, h
	ld	b, a
	push	bc
	ld	c, l
	add	iy, bc
	pop	bc
	ld	b, 0 (iy)
;src//qr/qrcodegen.c:156: v = (v & ~qr_bitmask[x]) | (((uint8_t)((uint8_t)0)-(!!isBlack)) & qr_bitmask[x]);
	ld	a, #<(_qr_bitmask)
	add	a, -3 (ix)
	ld	l, a
	ld	a, #>(_qr_bitmask)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	-3 (ix), a
	cpl
	and	a, b
	ld	b, a
	ld	a, -2 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	neg
	ld	l, a
	ld	a, -3 (ix)
	and	a, l
	or	a, b
;src//qr/qrcodegen.c:157: qrcode[y * (QRPAD>>3) + (x>>3)] = v;
	ld	0 (iy), a
;src//qr/qrcodegen.c:527: dc_i++;
	ld	hl, (_dc_i)
	inc	hl
	ld	(_dc_i), hl
00104$:
;src//qr/qrcodegen.c:529: y++;
	inc	-1 (ix)
	jp	00105$
00114$:
;src//qr/qrcodegen.c:531: }
	ld	sp, ix
	pop	ix
	ret
;src//qr/qrcodegen.c:533: static void drawCodewordsRL(uint8_t x) __z88dk_fastcall {
;	---------------------------------
; Function drawCodewordsRL
; ---------------------------------
_drawCodewordsRL:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
;src//qr/qrcodegen.c:535: while (y) {
	ld	-2 (ix), l
	ld	a, l
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	-8 (ix), a
	ld	a, -2 (ix)
	add	a, #<(_qr_bitmask)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_qr_bitmask)
	ld	d, a
	ld	-1 (ix), #0x1d
00105$:
	ld	a, -1 (ix)
	or	a, a
	jp	Z, 00114$
;src//qr/qrcodegen.c:536: y--;
	dec	-1 (ix)
;src//qr/qrcodegen.c:537: if (!getModule(QRCODE, x, y)) {
	ld	bc, #_QRCODE
;src//qr/qrcodegen.c:151: return qrcode[y * (QRPAD>>3) + (x>>3)] & qr_bitmask[x];
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	l, -8 (ix)
	ld	h, #0x00
	ld	a, -7 (ix)
	add	a, l
	ld	-10 (ix), a
	ld	a, -6 (ix)
	adc	a, h
	ld	-9 (ix), a
	pop	hl
	push	hl
	add	hl, bc
	ld	c, (hl)
	ld	a, (de)
	ld	-5 (ix), a
	ld	a, c
	and	a, -5 (ix)
;src//qr/qrcodegen.c:537: if (!getModule(QRCODE, x, y)) {
	or	a, a
	jr	NZ,00102$
;src//qr/qrcodegen.c:538: setModule(QRCODE, x, y, getBit(TMPBUFFER[dc_i >> 3], 7 - (dc_i & 7)));
	ld	a,(#_dc_i + 0)
	and	a, #0x07
	ld	c, a
	ld	b, #0x00
	ld	a, #0x07
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	hl, (_dc_i)
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	push	de
	ld	de, #_TMPBUFFER
	add	hl, de
	pop	de
	ld	l, (hl)
	ld	h, #0x00
;src//qr/qrcodegen.c:146: return ((x >> i) & 1) != 0;
	inc	c
	jr	00138$
00137$:
	sra	h
	rr	l
00138$:
	dec	c
	jr	NZ, 00137$
	ld	a, l
	and	a, #0x01
	or	a,#0x00
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	-4 (ix), a
;src//qr/qrcodegen.c:538: setModule(QRCODE, x, y, getBit(TMPBUFFER[dc_i >> 3], 7 - (dc_i & 7)));
;src//qr/qrcodegen.c:155: uint8_t v =  qrcode[y * (QRPAD>>3) + (x>>3)];
	ld	a, #<(_QRCODE)
	add	a, -10 (ix)
	ld	c, a
	ld	a, #>(_QRCODE)
	adc	a, -9 (ix)
	ld	b, a
	ld	a, (bc)
	ld	-3 (ix), a
;src//qr/qrcodegen.c:156: v = (v & ~qr_bitmask[x]) | (((uint8_t)((uint8_t)0)-(!!isBlack)) & qr_bitmask[x]);
	ld	a, -5 (ix)
	cpl
	and	a, -3 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	neg
	ld	l, a
	ld	a, -5 (ix)
	and	a, l
	ld	l, a
	ld	a, -3 (ix)
	or	a, l
;src//qr/qrcodegen.c:157: qrcode[y * (QRPAD>>3) + (x>>3)] = v;
	ld	(bc), a
;src//qr/qrcodegen.c:539: dc_i++;
	ld	hl, (_dc_i)
	inc	hl
	ld	(_dc_i), hl
00102$:
;src//qr/qrcodegen.c:541: if (!getModule(QRCODE, x-1, y)) {
	ld	a, -2 (ix)
	add	a, #0xff
	ld	-4 (ix), a
;src//qr/qrcodegen.c:151: return qrcode[y * (QRPAD>>3) + (x>>3)] & qr_bitmask[x];
	ld	c,a
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	h, #0x00
	add	a, -7 (ix)
	ld	l, a
	ld	a, h
	adc	a, -6 (ix)
	ld	h, a
	push	de
	ld	de, #_QRCODE
	add	hl, de
	pop	de
	ld	b, (hl)
	ld	a, c
	add	a, #<(_qr_bitmask)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_qr_bitmask)
	ld	h, a
	ld	a, (hl)
;src//qr/qrcodegen.c:541: if (!getModule(QRCODE, x-1, y)) {
	and	a,b
	jp	NZ, 00105$
;src//qr/qrcodegen.c:542: setModule(QRCODE, x-1, y, getBit(TMPBUFFER[dc_i >> 3], 7 - (dc_i & 7)));
	ld	a,(#_dc_i + 0)
	and	a, #0x07
	ld	c, a
	ld	b, #0x00
	ld	a, #0x07
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	hl, (_dc_i)
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	push	de
	ld	de, #_TMPBUFFER
	add	hl, de
	pop	de
	ld	l, (hl)
	ld	h, #0x00
;src//qr/qrcodegen.c:146: return ((x >> i) & 1) != 0;
	inc	c
	jr	00140$
00139$:
	sra	h
	rr	l
00140$:
	dec	c
	jr	NZ, 00139$
	ld	a, l
	and	a, #0x01
	or	a,#0x00
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	-3 (ix), a
;src//qr/qrcodegen.c:542: setModule(QRCODE, x-1, y, getBit(TMPBUFFER[dc_i >> 3], 7 - (dc_i & 7)));
	ld	a, -4 (ix)
;src//qr/qrcodegen.c:155: uint8_t v =  qrcode[y * (QRPAD>>3) + (x>>3)];
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	c, a
	ld	b, #0x00
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	add	hl, bc
	ld	a, l
	add	a, #<(_QRCODE)
	ld	-6 (ix), a
	ld	a, h
	adc	a, #>(_QRCODE)
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	c, (hl)
;src//qr/qrcodegen.c:156: v = (v & ~qr_bitmask[x]) | (((uint8_t)((uint8_t)0)-(!!isBlack)) & qr_bitmask[x]);
	ld	a, -4 (ix)
	add	a, #<(_qr_bitmask)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_qr_bitmask)
	ld	h, a
	ld	b, (hl)
	ld	a, b
	cpl
	and	a, c
	ld	c, a
	ld	a, -3 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	neg
	and	a, b
	or	a, c
;src//qr/qrcodegen.c:157: qrcode[y * (QRPAD>>3) + (x>>3)] = v;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), a
;src//qr/qrcodegen.c:543: dc_i++;
	ld	hl, (_dc_i)
	inc	hl
	ld	(_dc_i), hl
	jp	00105$
00114$:
;src//qr/qrcodegen.c:546: }
	ld	sp, ix
	pop	ix
	ret
;src//qr/qrcodegen.c:548: static void drawCodewords() {
;	---------------------------------
; Function drawCodewords
; ---------------------------------
_drawCodewords:
;src//qr/qrcodegen.c:550: dc_i=0;
	ld	hl, #0x0000
	ld	(_dc_i), hl
;src//qr/qrcodegen.c:554: drawCodewordsRL(x);
	ld	l, #0x1c
	call	_drawCodewordsRL
;src//qr/qrcodegen.c:555: x-=2;
	ld	c, #0x1a
;src//qr/qrcodegen.c:557: while(x>7) {
00101$:
	ld	a, #0x07
	sub	a, c
	jr	NC,00103$
;src//qr/qrcodegen.c:559: drawCodewordsLR(x);
	push	bc
	ld	l, c
	call	_drawCodewordsLR
	pop	bc
;src//qr/qrcodegen.c:560: x-=2;
	dec	c
	dec	c
;src//qr/qrcodegen.c:561: drawCodewordsRL(x);
	push	bc
	ld	l, c
	call	_drawCodewordsRL
	pop	bc
;src//qr/qrcodegen.c:562: x-=2;
	dec	c
	dec	c
	jr	00101$
00103$:
;src//qr/qrcodegen.c:566: drawCodewordsLR(x);
	ld	l, #0x05
	call	_drawCodewordsLR
;src//qr/qrcodegen.c:569: drawCodewordsRL(x);
	ld	l, #0x03
	call	_drawCodewordsRL
;src//qr/qrcodegen.c:572: drawCodewordsLR(x);
	ld	l, #0x01
;src//qr/qrcodegen.c:573: }
	jp  _drawCodewordsLR
;src//qr/qrcodegen.c:575: static void applyMask0() {
;	---------------------------------
; Function applyMask0
; ---------------------------------
_applyMask0:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src//qr/qrcodegen.c:577: for (uint8_t y = 0; y < QRSIZE; y++) {
	ld	c, #0x00
00110$:
	ld	a, c
	sub	a, #0x1d
	jr	NC,00112$
;src//qr/qrcodegen.c:578: invert = ((y&1)?0xAA:~0xAA);
	bit	0, c
	jr	Z,00114$
	ld	de, #0x00aa
	jr	00115$
00114$:
	ld	de, #0x0055
00115$:
	ld	-2 (ix), e
;src//qr/qrcodegen.c:579: for (uint8_t x = 0; x < QRSIZE; x+=8) {
	ld	b, #0x00
00107$:
	ld	a, b
	sub	a, #0x1d
	jr	NC,00111$
;src//qr/qrcodegen.c:580: uint8_t tmp = invert & ~getModule8(TMPBUFFER, x, y);
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, b
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ex	de, hl
	ld	hl, #_TMPBUFFER
	add	hl, de
	ld	a, (hl)
	cpl
	and	a, -2 (ix)
	ld	-1 (ix), a
;src//qr/qrcodegen.c:582: setModule8(QRCODE, x, y,  getModule8(QRCODE, x, y) ^ tmp);
;src//qr/qrcodegen.c:168: INLINE uint8_t getModule8(const uint8_t qrcode[], uint8_t x, uint8_t y) { return qrcode[y * (QRPAD>>3) + (x>>3)]; }
	ld	hl, #_QRCODE
	add	hl, de
	ld	a, (hl)
;src//qr/qrcodegen.c:582: setModule8(QRCODE, x, y,  getModule8(QRCODE, x, y) ^ tmp);
	xor	a, -1 (ix)
	ld	-1 (ix), a
;src//qr/qrcodegen.c:169: INLINE void setModule8(uint8_t qrcode[], uint8_t x, uint8_t y, uint8_t value) { qrcode[y * (QRPAD>>3) + (x>>3)] = value; }
	ld	hl, #_QRCODE
	add	hl, de
	ld	a, -1 (ix)
	ld	(hl), a
;src//qr/qrcodegen.c:579: for (uint8_t x = 0; x < QRSIZE; x+=8) {
	ld	a, b
	add	a, #0x08
	ld	b, a
	jr	00107$
00111$:
;src//qr/qrcodegen.c:577: for (uint8_t y = 0; y < QRSIZE; y++) {
	inc	c
	jr	00110$
00112$:
;src//qr/qrcodegen.c:585: }
	ld	sp, ix
	pop	ix
	ret
;src//qr/qrcodegen.c:618: uint8_t *qrcodegen(const char *text) {
;	---------------------------------
; Function qrcodegen
; ---------------------------------
_qrcodegen::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
;src//qr/qrcodegen.c:622: while (text[len]!=0) len++;
	ld	c, #0x00
00101$:
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z,00188$
	inc	c
	jr	00101$
00188$:
	ld	-14 (ix), c
;src//qr/qrcodegen.c:624: const uint8_t *data = (const uint8_t *)text;
	ld	a, 4 (ix)
	ld	-13 (ix), a
	ld	a, 5 (ix)
	ld	-12 (ix), a
;src//qr/qrcodegen.c:628: memset(QRCODE, 0, (size_t)qrcodegen_BUFFER_SZ * sizeof(QRCODE[0]));
	ld	hl, #_QRCODE
	ld	b, #0x3a
00259$:
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	djnz	00259$
;src//qr/qrcodegen.c:629: int bitLen = 0;
	ld	hl, #0x0000
	ex	(sp), hl
;src//qr/qrcodegen.c:630: appendBitsToBuffer((unsigned int)MODE, 4, QRCODE, &bitLen);
	ld	hl, #0
	add	hl, sp
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, -11 (ix)
	ld	-3 (ix), a
	ld	a, -10 (ix)
	ld	-2 (ix), a
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	ld	bc, #0x0003
00148$:
	bit	7, b
	jr	NZ,00131$
;src//qr/qrcodegen.c:606: buffer[*bitLen >> 3] |= ((val >> i) & 1) << (7 - (*bitLen & 7));
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy, #_QRCODE
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	ld	-1 (ix), a
	ld	a, c
	push	af
	ld	hl, #0x0004
	pop	af
	inc	a
	jr	00262$
00261$:
	srl	h
	rr	l
00262$:
	dec	a
	jr	NZ, 00261$
	ld	a, l
	and	a, #0x01
	ld	l, a
	ld	a, e
	and	a, #0x07
	ld	e, a
	ld	a, #0x07
	sub	a, e
	inc	a
	jr	00264$
00263$:
	sla	l
00264$:
	dec	a
	jr	NZ,00263$
	ld	a, l
	or	a, -1 (ix)
	ld	0 (iy), a
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	dec	bc
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jr	00148$
;src//qr/qrcodegen.c:630: appendBitsToBuffer((unsigned int)MODE, 4, QRCODE, &bitLen);
00131$:
;src//qr/qrcodegen.c:631: appendBitsToBuffer((unsigned int)len, numCharCountBits(), QRCODE, &bitLen);
	ld	c, -11 (ix)
	ld	b, -10 (ix)
	push	bc
	pop	iy
	ld	a, -14 (ix)
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	ld	de, #0x0007
00151$:
	bit	7, d
	jr	NZ,00133$
;src//qr/qrcodegen.c:606: buffer[*bitLen >> 3] |= ((val >> i) & 1) << (7 - (*bitLen & 7));
	ld	a, 0 (iy)
	ld	-3 (ix), a
	ld	a, 1 (iy)
	ld	-2 (ix), a
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_QRCODE
	add	hl, bc
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, e
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	inc	a
	jr	00266$
00265$:
	srl	b
	rr	c
00266$:
	dec	a
	jr	NZ, 00265$
	ld	a, c
	and	a, #0x01
	ld	c, a
	ld	a, -3 (ix)
	and	a, #0x07
	ld	b, a
	ld	a, #0x07
	sub	a, b
	inc	a
	jr	00268$
00267$:
	sla	c
00268$:
	dec	a
	jr	NZ,00267$
	ld	a, c
	or	a, -1 (ix)
	ld	(hl), a
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	dec	de
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	bc
	ld	0 (iy), c
	ld	1 (iy), b
	jr	00151$
;src//qr/qrcodegen.c:631: appendBitsToBuffer((unsigned int)len, numCharCountBits(), QRCODE, &bitLen);
00133$:
;src//qr/qrcodegen.c:632: for (int j = 0; j < len*8; j++) {
	ld	a, -11 (ix)
	ld	-9 (ix), a
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	de, #0x0000
00157$:
	ld	l, -14 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00269$
	xor	a, #0x80
00269$:
	jp	P, 00104$
;src//qr/qrcodegen.c:633: int bit = (data[j >> 3] >> (7 - (j & 7))) & 1;
	ld	c, e
	ld	b, d
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	add	hl, bc
	ld	c, (hl)
	ld	a, e
	and	a, #0x07
	ld	b, a
	ld	a, #0x07
	sub	a, b
	inc	a
	jr	00271$
00270$:
	srl	c
00271$:
	dec	a
	jr	NZ, 00270$
	ld	a, c
	and	a, #0x01
	ld	c, a
	ld	b, #0x00
;src//qr/qrcodegen.c:634: appendBitsToBuffer((unsigned int)bit, 1, QRCODE, &bitLen);
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), c
	ld	-4 (ix), b
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
00154$:
	bit	7, -1 (ix)
	jr	NZ,00136$
;src//qr/qrcodegen.c:606: buffer[*bitLen >> 3] |= ((val >> i) & 1) << (7 - (*bitLen & 7));
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
	ld	h, b
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy, #_QRCODE
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	ld	-3 (ix), a
	ld	a, -2 (ix)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	inc	a
	jr	00273$
00272$:
	srl	h
	rr	l
00273$:
	dec	a
	jr	NZ, 00272$
	ld	a, l
	and	a, #0x01
	ld	l, a
	ld	a, c
	and	a, #0x07
	ld	c, a
	ld	a, #0x07
	sub	a, c
	inc	a
	jr	00275$
00274$:
	sla	l
00275$:
	dec	a
	jr	NZ,00274$
	ld	a, l
	or	a, -3 (ix)
	ld	0 (iy), a
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	dec	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jr	00154$
;src//qr/qrcodegen.c:634: appendBitsToBuffer((unsigned int)bit, 1, QRCODE, &bitLen);
00136$:
;src//qr/qrcodegen.c:632: for (int j = 0; j < len*8; j++) {
	inc	de
	jp	00157$
00104$:
;src//qr/qrcodegen.c:638: appendBitsToBuffer(0, 4, QRCODE, &bitLen);
	ld	c, -11 (ix)
	ld	b, -10 (ix)
	ld	-4 (ix), c
	ld	-3 (ix), b
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	ld	-2 (ix), #0x03
	ld	-1 (ix), #0x00
00160$:
	bit	7, -1 (ix)
	jr	NZ,00138$
;src//qr/qrcodegen.c:606: buffer[*bitLen >> 3] |= ((val >> i) & 1) << (7 - (*bitLen & 7));
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	c, e
	ld	b, d
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	iy, #_QRCODE
	add	iy, bc
	ld	c, 0 (iy)
	ld	b, -2 (ix)
	ld	hl, #0x0000
	inc	b
	jr	00277$
00276$:
	srl	h
	rr	l
00277$:
	djnz	00276$
	ld	a, l
	and	a, #0x01
	ld	l, a
	ld	a, e
	and	a, #0x07
	ld	b, a
	ld	a, #0x07
	sub	a, b
	inc	a
	jr	00279$
00278$:
	sla	l
00279$:
	dec	a
	jr	NZ,00278$
	ld	a, l
	or	a, c
	ld	0 (iy), a
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	dec	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jr	00160$
;src//qr/qrcodegen.c:638: appendBitsToBuffer(0, 4, QRCODE, &bitLen);
00138$:
;src//qr/qrcodegen.c:643: for (uint8_t padByte = 0xEC; bitLen < dataCapacityBits; padByte ^= 0xEC ^ 0x11)
	ld	-1 (ix), #0xec
	ld	a, -11 (ix)
	ld	-5 (ix), a
	ld	a, -10 (ix)
	ld	-4 (ix), a
00166$:
	ld	a, -16 (ix)
	sub	a, #0xb8
	ld	a, -15 (ix)
	rla
	ccf
	rra
	sbc	a, #0x81
	jp	NC, 00106$
;src//qr/qrcodegen.c:644: appendBitsToBuffer(padByte, 8, QRCODE, &bitLen);
	ld	a, -5 (ix)
	ld	-13 (ix), a
	ld	a, -4 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
	ld	-10 (ix), #0x00
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	ld	-3 (ix), #0x07
	ld	-2 (ix), #0x00
00163$:
	bit	7, -2 (ix)
	jp	NZ, 00146$
;src//qr/qrcodegen.c:606: buffer[*bitLen >> 3] |= ((val >> i) & 1) << (7 - (*bitLen & 7));
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	sra	-6 (ix)
	rr	-7 (ix)
	sra	-6 (ix)
	rr	-7 (ix)
	sra	-6 (ix)
	rr	-7 (ix)
	ld	a, #<(_QRCODE)
	add	a, -7 (ix)
	ld	l, a
	ld	a, #>(_QRCODE)
	adc	a, -6 (ix)
	ld	h, a
	ld	c, (hl)
	ld	b, -3 (ix)
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	inc	b
	jr	00281$
00280$:
	srl	d
	rr	e
00281$:
	djnz	00280$
	ld	a, e
	and	a, #0x01
	ld	b, a
	ld	a, -9 (ix)
	and	a, #0x07
	ld	e, a
	ld	a, #0x07
	sub	a, e
	inc	a
	jr	00283$
00282$:
	sla	b
00283$:
	dec	a
	jr	NZ,00282$
	ld	a, b
	or	a, c
	ld	(hl), a
;src//qr/qrcodegen.c:605: for (int i = numBits - 1; i >= 0; i--, (*bitLen)++)
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	dec	hl
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00163$
;src//qr/qrcodegen.c:644: appendBitsToBuffer(padByte, 8, QRCODE, &bitLen);
00146$:
;src//qr/qrcodegen.c:643: for (uint8_t padByte = 0xEC; bitLen < dataCapacityBits; padByte ^= 0xEC ^ 0x11)
	ld	a, -1 (ix)
	xor	a, #0xfd
	ld	-1 (ix), a
	jp	00166$
;src//qr/qrcodegen.c:647: debugBorder(BWhite);
00106$:
	ld	a, #0x0f
	out	(_VDP1), a
	ld	a, #0x87
	out	(_VDP1), a
;src//qr/qrcodegen.c:648: addEccAndInterleave(QRCODE, TMPBUFFER);
	ld	hl, #_TMPBUFFER
	push	hl
	ld	hl, #_QRCODE
	push	hl
	call	_addEccAndInterleave
	pop	af
	pop	af
;src//qr/qrcodegen.c:649: debugBorder(BLightBlue);
	ld	a, #0x05
	out	(_VDP1), a
	ld	a, #0x87
	out	(_VDP1), a
;src//qr/qrcodegen.c:650: initializeFunctionModules(QRVERSION, QRCODE);
	ld	hl, #_QRCODE
	push	hl
	ld	hl, #0x0003
	push	hl
	call	_initializeFunctionModules
	pop	af
	pop	af
;src//qr/qrcodegen.c:651: debugBorder(BLightGreen); //***
	ld	a, #0x03
	out	(_VDP1), a
	ld	a, #0x87
	out	(_VDP1), a
;src//qr/qrcodegen.c:652: drawCodewords();
	call	_drawCodewords
;src//qr/qrcodegen.c:653: debugBorder(BLightRed);
	ld	a, #0x09
	out	(_VDP1), a
	ld	a, #0x87
	out	(_VDP1), a
;src//qr/qrcodegen.c:654: drawWhiteFunctionModules();
	call	_drawWhiteFunctionModules
;src//qr/qrcodegen.c:655: debugBorder(BLightYellow);
	ld	a, #0x0b
	out	(_VDP1), a
	ld	a, #0x87
	out	(_VDP1), a
;src//qr/qrcodegen.c:656: initializeFunctionModules(QRVERSION, TMPBUFFER);
	ld	hl, #_TMPBUFFER
	push	hl
	ld	hl, #0x0003
	push	hl
	call	_initializeFunctionModules
	pop	af
	pop	af
;src//qr/qrcodegen.c:657: debugBorder(BDarkRed); 
	ld	a, #0x06
	out	(_VDP1), a
	ld	a, #0x87
	out	(_VDP1), a
;src//qr/qrcodegen.c:658: applyMask0();
	call	_applyMask0
;src//qr/qrcodegen.c:659: debugBorder(BDarkYellow);
	ld	a, #0x0a
	out	(_VDP1), a
	ld	a, #0x87
	out	(_VDP1), a
;src//qr/qrcodegen.c:660: drawFormatBits();
	call	_drawFormatBits
;src//qr/qrcodegen.c:661: debugBorder(BBlack);
	ld	a, #0x01
	out	(_VDP1), a
	ld	a, #0x87
	out	(_VDP1), a
;src//qr/qrcodegen.c:663: return QRCODE;
	ld	hl, #_QRCODE
;src//qr/qrcodegen.c:664: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

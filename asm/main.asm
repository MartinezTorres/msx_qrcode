;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _printQR
	.globl _generateQR
	.globl _qrcodegen
	.globl _writeText
	.globl _rectangle
	.globl _initCanvas
	.globl _msxhal_init
	.globl _msxhal_getch
	.globl _msg_sz
	.globl _msg
	.globl _scratchpad
	.globl _TMS99X8_status
	.globl _TMS99X8
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
_scratchpad::
	.ds 256
_msg::
	.ds 80
_msg_sz::
	.ds 1
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
;src//main.c:9: int main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src//main.c:12: msxhal_init(); // Bare minimum initialization of the msx support 
	call	_msxhal_init
;src//main.c:13: DI(); // This game has normally disabled interrupts. 
	di	
;sdcc_msx/inc/msxhal.h:363: __endasm; 
	ld	A,(#0x0180) ; CHGCPU
	cp	#0xC3
	ld	a,#0x81 ; can be ld a,81h for R800 ROM if you wish
	call	z,#0x0180
;src//main.c:19: mapper_load_module(graphics, PAGE_C);
	ld	c, #<(_MAPPER_MODULE_graphics_PAGE_C)
;sdcc_msx/inc/msxhal.h:200: if (page == PAGE_C) *(uint8_t *)PAGE_C_ADDRESS = mapper_current_segments[PAGE_C] = segment;
	ld	hl, #(_mapper_current_segments + 0x0002)
	ld	(hl), c
	ld	hl, #0x9000
	ld	(hl), c
;src//main.c:20: mapper_load_module(qrcodegen, PAGE_D);
	ld	c, #<(_MAPPER_MODULE_qrcodegen_PAGE_D)
;sdcc_msx/inc/msxhal.h:201: if (page == PAGE_D) *(uint8_t *)PAGE_D_ADDRESS = mapper_current_segments[PAGE_D] = segment;
	ld	hl, #(_mapper_current_segments + 0x0003)
	ld	(hl), c
	ld	hl, #0xb000
	ld	(hl), c
;src//main.c:21: initCanvas();
	call	_initCanvas
;src//main.c:23: generateQR();
	call	_generateQR
;src//main.c:26: enable_keyboard_routine = true;
	ld	hl,#_enable_keyboard_routine + 0
	ld	(hl), #0x01
;src//main.c:28: while (true) {
00121$:
;src//main.c:30: rectangle(0, 0, 255, 63, 0x00, FWhite+BTransparent);
	ld	a, #0xf0
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x003f
	push	hl
	ld	l, #0xff
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	_rectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src//main.c:31: rectangle(0, 64, 255, 191, 0x00, FLightGreen+BTransparent);
	ld	a, #0x30
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x00bf
	push	hl
	ld	l, #0xff
	push	hl
	ld	l, #0x40
	push	hl
	ld	l, #0x00
	push	hl
	call	_rectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src//main.c:32: printQR();
	call	_printQR
;src//main.c:34: textProperties.color = FLightGreen + BTransparent;
	ld	hl, #(_textProperties + 0x000c)
	ld	(hl), #0x30
;src//main.c:35: textProperties.x = 0; textProperties.y = 64;
	ld	hl, #0x0000
	ld	((_textProperties + 0x0007)), hl
	ld	l, #0x40
	ld	((_textProperties + 0x0009)), hl
;src//main.c:36: writeText("Enter Text:");
	ld	hl, #___str_0
	push	hl
	call	_writeText
	pop	af
;src//main.c:38: textProperties.x = 0; textProperties.y = 72;
	ld	hl, #0x0000
	ld	((_textProperties + 0x0007)), hl
	ld	l, #0x48
	ld	((_textProperties + 0x0009)), hl
;src//main.c:40: msg_sz = 0;
	ld	hl,#_msg_sz + 0
	ld	(hl), #0x00
;src//main.c:42: while (msxhal_getch()!=0);
00104$:
	call	_msxhal_getch
	ld	a, l
	or	a, a
	jr	NZ,00104$
;src//main.c:44: while (true) {
00118$:
;sdcc_msx/inc/msxhal.h:113: __endasm;
	ei
	nop
	halt
	di
;src//main.c:46: uint8_t c = msxhal_getch();
	call	_msxhal_getch
	ld	c, l
;src//main.c:47: if (c==0) continue;
	ld	a, c
	or	a, a
	jr	Z,00118$
;src//main.c:48: if (c=='\r') {
	ld	a, c
	sub	a, #0x0d
	jr	NZ,00110$
;src//main.c:49: qrcodegen(msg);
	ld	hl, #_msg
	call	_qrcodegen
;src//main.c:50: break;
	jp	00121$
00110$:
;src//main.c:52: if (c==0x08) {
	ld	a, c
	sub	a, #0x08
	jr	NZ,00114$
;src//main.c:53: if (msg_sz) {
	ld	iy, #_msg_sz
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00118$
;src//main.c:54: msg[--msg_sz]=0;
	dec	0 (iy)
	ld	a, #<(_msg)
	ld	hl, #_msg_sz
	add	a, (hl)
	ld	c, a
	ld	a, #>(_msg)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
;src//main.c:55: rectangle(0, 72, 255, 79, 0x00, FLightGreen+BTransparent);
	ld	a, #0x30
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x004f
	push	hl
	ld	l, #0xff
	push	hl
	ld	l, #0x48
	push	hl
	ld	l, #0x00
	push	hl
	call	_rectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src//main.c:56: textProperties.x = 0; textProperties.y = 72;
	ld	hl, #0x0000
	ld	((_textProperties + 0x0007)), hl
	ld	l, #0x48
	ld	((_textProperties + 0x0009)), hl
;src//main.c:57: writeText(msg);
	ld	hl, #_msg
	push	hl
	call	_writeText
	pop	af
;src//main.c:59: continue;
	jr	00118$
00114$:
;src//main.c:61: if (c<32) {
	ld	a, c
	sub	a, #0x20
	jr	NC,00116$
;src//main.c:63: tmp[0] = 'h';
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	a, #0x68
	ld	(de), a
;src//main.c:64: tmp[1] = (c>>4)["0123456789ABCDEF"];
	push	de
	pop	iy
	inc	iy
	ld	a, c
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	add	a, #<(___str_1)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(___str_1)
	ld	h, a
	ld	a, (hl)
	ld	0 (iy), a
;src//main.c:65: tmp[2] = (c&0xF)["0123456789ABCDEF"];
	push	de
	pop	iy
	inc	iy
	inc	iy
	ld	a, c
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	hl, #___str_1
	add	hl, bc
	ld	a, (hl)
	ld	0 (iy), a
;src//main.c:66: tmp[3] = 0;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;src//main.c:68: uint8_t oldx = textProperties.x;
	ld	a, (#(_textProperties + 0x0007) + 0)
;src//main.c:70: textProperties.x = oldx; textProperties.y = 80;
	ld	c, a
	ld	b, #0x00
	ld	((_textProperties + 0x0007)), bc
	ld	hl, #0x0050
	ld	((_textProperties + 0x0009)), hl
;src//main.c:71: rectangle(0, 80, 255, 87, 0x00, FLightGreen+BTransparent);
	push	bc
	push	de
	ld	a, #0x30
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	l, #0x57
	push	hl
	ld	l, #0xff
	push	hl
	ld	l, #0x50
	push	hl
	ld	l, #0x00
	push	hl
	call	_rectangle
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	call	_writeText
	pop	af
	pop	bc
;src//main.c:74: textProperties.x = oldx; textProperties.y = 72;
	ld	((_textProperties + 0x0007)), bc
	ld	hl, #0x0048
	ld	((_textProperties + 0x0009)), hl
;src//main.c:75: continue;
	jp	00118$
00116$:
;src//main.c:78: msg[msg_sz]=c;
	ld	a, #<(_msg)
	ld	hl, #_msg_sz
	add	a, (hl)
	ld	e, a
	ld	a, #>(_msg)
	adc	a, #0x00
	ld	d, a
	ld	a, c
	ld	(de), a
;src//main.c:79: msg[msg_sz+1]=0;
	ld	a,(#_msg_sz + 0)
	inc	a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_msg
	add	hl, bc
	ld	(hl), #0x00
;src//main.c:80: writeText(&msg[msg_sz]);
	ld	a, #<(_msg)
	ld	hl, #_msg_sz
	add	a, (hl)
	ld	c, a
	ld	a, #>(_msg)
	adc	a, #0x00
	ld	b, a
	push	bc
	call	_writeText
	pop	af
;src//main.c:81: msg_sz++;
	ld	iy, #_msg_sz
	inc	0 (iy)
;src//main.c:85: return 0;
;src//main.c:86: }
	jp	00118$
___str_0:
	.ascii "Enter Text:"
	.db 0x00
___str_1:
	.ascii "0123456789ABCDEF"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

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
	.globl _rectangle
	.globl _initCanvas
	.globl _msxhal_init
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
;src//main.c:7: int main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src//main.c:10: msxhal_init(); // Bare minimum initialization of the msx support 
	call	_msxhal_init
;src//main.c:11: DI(); // This game has normally disabled interrupts. 
	di	
;sdcc_msx/inc/msxhal.h:363: __endasm; 
	ld	A,(#0x0180) ; CHGCPU
	cp	#0xC3
	ld	a,#0x81 ; can be ld a,81h for R800 ROM if you wish
	call	z,#0x0180
;src//main.c:17: mapper_load_module(graphics, PAGE_C);
	ld	c, #<(_MAPPER_MODULE_graphics_PAGE_C)
;sdcc_msx/inc/msxhal.h:200: if (page == PAGE_C) *(uint8_t *)PAGE_C_ADDRESS = mapper_current_segments[PAGE_C] = segment;
	ld	hl, #(_mapper_current_segments + 0x0002)
	ld	(hl), c
	ld	hl, #0x9000
	ld	(hl), c
;src//main.c:18: mapper_load_module(qrcodegen, PAGE_D);
	ld	c, #<(_MAPPER_MODULE_qrcodegen_PAGE_D)
;sdcc_msx/inc/msxhal.h:201: if (page == PAGE_D) *(uint8_t *)PAGE_D_ADDRESS = mapper_current_segments[PAGE_D] = segment;
	ld	hl, #(_mapper_current_segments + 0x0003)
	ld	(hl), c
	ld	hl, #0xb000
	ld	(hl), c
;src//main.c:19: initCanvas();
	call	_initCanvas
;src//main.c:21: rectangle(0, 0, 255, 191, 0x00, FWhite+BTransparent);
	ld	a, #0xf0
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x00bf
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
;src//main.c:23: generateQR();
	call	_generateQR
;src//main.c:24: printQR();
	call	_printQR
;src//main.c:26: while (true) wait_frame();
00105$:
;sdcc_msx/inc/msxhal.h:113: __endasm;
	ei
	nop
	halt
	di
;src//main.c:26: while (true) wait_frame();
;src//main.c:28: return 0;
;src//main.c:29: }
	jr	00105$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

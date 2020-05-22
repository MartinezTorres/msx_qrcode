;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
	.module qr_example
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _qr
	.globl _qrcodegen
	.globl _setPointFG
	.globl _coords
	.globl _TMS99X8_status
	.globl _TMS99X8
	.globl _generateQR
	.globl _printQR
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
_coords::
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
;src//qr_example.c:4: void generateQR() {
;	---------------------------------
; Function generateQR
; ---------------------------------
_generateQR::
;src//qr_example.c:6: qrcodegen("http://www.msx.org");
	ld	hl, #___str_0
;src//qr_example.c:7: }
	jp  _qrcodegen
___str_0:
	.ascii "http://www.msx.org"
	.db 0x00
;src//qr_example.c:16: void printQR() {
;	---------------------------------
; Function printQR
; ---------------------------------
_printQR::
;src//qr_example.c:18: for (coords.x=0; coords.x<QRSIZE+2; coords.x++) {
	ld	bc, #_coords+0
	xor	a, a
	ld	(bc), a
00109$:
	ld	a, (bc)
	sub	a, #0x1f
	ret	NC
;src//qr_example.c:19: for (coords.y=0; coords.y<QRSIZE+2; coords.y++) {
	ld	de, #_coords + 1
	xor	a, a
	ld	(de), a
00106$:
	ld	a, (de)
	sub	a, #0x1f
	jr	NC,00110$
;src//qr_example.c:20: if (qr(coords.xy)) {                        
	ld	hl, (#_coords + 0)
	push	bc
	push	de
	call	_qr
	ld	a, l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00107$
;src//qr_example.c:21: setPointFG(coords.xy);
	ld	hl, (#_coords + 0)
	push	bc
	push	de
	call	_setPointFG
	pop	de
	pop	bc
00107$:
;src//qr_example.c:19: for (coords.y=0; coords.y<QRSIZE+2; coords.y++) {
	ld	a, (de)
	inc	a
	ld	(de), a
	jr	00106$
00110$:
;src//qr_example.c:18: for (coords.x=0; coords.x<QRSIZE+2; coords.x++) {
	ld	a, (#_coords + 0)
	inc	a
	ld	(#_coords),a
;src//qr_example.c:25: }
	jr	00109$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

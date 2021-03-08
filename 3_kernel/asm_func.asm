extern	cstart

[section .text]		; オブジェクトファイルではこれを書いてからプログラムを書く

global io_hlt			; このプログラムに含まれる関数名
global _start

io_hlt:	; void io_hlt(void);
	HLT
	RET
_start:
	call cstart

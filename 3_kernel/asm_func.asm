extern	cstart

[section .text]

global _start
global io_hlt, write_mem8

_start:
	call cstart

io_hlt:	; void io_hlt(void);
	HLT
	RET
	
write_mem8:
	mov ecx, [esp+4]
	mov al, [esp+8]
	mov [ecx], al
	ret

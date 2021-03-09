[SECTION .text]

global _io_hlt, _io_cli
global _io_out8
global _io_load_eflags
global _io_store_eflags

; void io_hlt(void);
_io_hlt:
    HLT
    RET

; void io_cli(void);
_io_cli:
    CLI
    RET

; int io_in8(int port);
_io_in8:
    MOV EDX,[ESP+4] ; port
    MOV EAX,0
    IN  AL,DX
    RET

; void io_out8(int port, int data);
    MOV EDX, [ESP+4]
    MOV AL, [ESP+8]
    OUT DX, AL
    RET

; int io_load_eflags(void);
_io_load_eflags:
		PUSHFD		; PUSH EFLAGS
		POP		EAX
		RET

; void io_store_eflags(int eflags);
_io_store_eflags:	
		MOV		EAX,[ESP+4]
		PUSH	EAX
		POPFD		; POP EFLAGS
		RET
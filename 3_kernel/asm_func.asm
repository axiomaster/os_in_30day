extern	cstart

[section .text]		; �I�u�W�F�N�g�t�@�C���ł͂���������Ă���v���O����������

global io_hlt			; ���̃v���O�����Ɋ܂܂��֐���
global _start

io_hlt:	; void io_hlt(void);
	HLT
	RET
_start:
	call cstart

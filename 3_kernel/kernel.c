void io_hlt(void);
void write_mem8(int addr, int data);

void cstart(void)
{
	int i;
	for(i=0xa0000;i<=0xaffff;i++){
		write_mem8(i,15);
	}

fin:
	io_hlt();
	goto fin;
}

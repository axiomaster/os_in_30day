void io_hlt(void);

void cstart(void)
{

fin:
	io_hlt();
	goto fin;
}

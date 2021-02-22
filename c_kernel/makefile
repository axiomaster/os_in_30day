addr=0x7c00
OBJDIR=.

CFLAGS := $(CFLAGS) -O1 -fno-builtin -I$(OBJDIR) -MD                                                                                        
CFLAGS += -fno-omit-frame-pointer
CFLAGS += -Wall -Wno-format -Wno-unused -Werror -gstabs -m32


LDFLAGS=-m elf_i386

all:img
boot:
	nasm -o bootloader ipl.nas
	nasm -o vos.bin vos.nas
img:boot
	dd if=bootloader of=vos.img count=1 bs=512
	dd if=/dev/zero of=vos.img bs=512 seek=1 skip=1 count=2879
kernel:entry.o main.o
	ld $(LDFLAGS) -N -e start -Ttext $(addr) -o $@.out $^
	objdump -S $@.out >$@.asm
	objcopy -S -O binary -j .text $@.out $@
entry.o:asmhead.nas
	gcc -nostdinc $(CFLAGS) -c -o $@ $<
main.o:main.c
	gcc -nostdinc $(CFLAGS) -Os -c -o $@ $<
copy:
	mkdir -p /tmp/floppy
	sudo mount -o loop vos.img /tmp/floppy -o fat=12
	sleep 1
	sudo cp kernel /tmp/floppy
	sleep 1
	sudo umount /tmp/floppy
run:img
	qemu-system-i386 -drive file=vos.img,if=floppy
clean:
	rm bootloader vos.img vos.bin *.o

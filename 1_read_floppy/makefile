all:img
boot:
	nasm -o bootloader ipl.nas
img:boot
	dd if=bootloader of=vos.img count=1 bs=512
	dd if=/dev/zero of=vos.img bs=512 seek=1 skip=1 count=2879
run:img
	qemu-system-i386 -drive file=vos.img,if=floppy
clean:
	rm bootloader vos.img

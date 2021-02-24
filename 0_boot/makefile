all:img
boot:
	nasm boot.asm -o boot.bin
img:boot
	dd if=boot.bin of=a.img count=1 bs=512 conv=notrunc
	dd if=/dev/zero of=a.img bs=512 seek=1 skip=1 count=2879
run:img
	#qemu-system-i386 -drive file=a.img,if=floppy
	bochs
clean:
	rm boot.bin a.img

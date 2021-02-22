all:img
boot:
	nasm boot.asm -o boot.bin
loader:
	nasm loader.asm -o loader.bin
kernel:
	nasm -f elf kernel.asm -o kernel.o
	ld -s kernel.o -o kernel.bin
img:boot loader
	dd if=boot.bin of=a.img count=1 bs=512
	dd if=/dev/zero of=a.img bs=512 seek=1 skip=1 count=2879
copy:img loader kernel
	sudo mount -o loop a.img /mnt/floppy -o fat=12
	sleep 1
	sudo cp loader.bin /mnt/floppy
	sudo cp kernel.bin /mnt/floppy
	sleep 1
	sudo umount /mnt/floppy
run:copy
	#qemu-system-i386 -drive file=a.img,if=floppy
	bochs
clean:
	rm boot.bin loader.bin a.img

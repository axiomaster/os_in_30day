all:img
boot:
	nasm -o bootloader ipl.nas
	nasm -o kernel vos.nas
img:boot
	dd if=bootloader of=vos.img count=1 bs=512
	dd if=/dev/zero of=vos.img bs=512 seek=1 skip=1 count=2879
copy:img boot
	mkdir -p /tmp/floppy
	sudo mount -o loop vos.img /tmp/floppy -o fat=12
	sleep 1
	sudo cp kernel /tmp/floppy
	sleep 1
	sudo umount /tmp/floppy
run:copy
	qemu-system-i386 -drive file=vos.img,if=floppy
clean:
	rm bootloader vos.img vos.bin

subdir=./kernel
all:img
boot:
	nasm boot.asm -o boot.bin
	@cd $(subdir);make clean;make addr=0xc400
img:boot
	dd if=boot.bin of=a.img count=1 bs=512
	dd if=/dev/zero of=a.img bs=512 seek=1 skip=1 count=2879
copy:img
	mkdir -p /tmp/floppy
	sudo mount -o loop a.img /tmp/floppy -o fat=12
	sleep 1
	sudo cp $(subdir)/kernel /tmp/floppy
	sleep 1
	sudo umount /tmp/floppy
run:copy
	bochs
clean:
	rm boot.bin a.img
	@cd $(subdir);make clean;

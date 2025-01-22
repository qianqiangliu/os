CROSS_COMPILE ?= i386-jos-elf-

AS := $(CROSS_COMPILE)as --32
LD := $(CROSS_COMPILE)ld -m elf_i386

LDFLAG := -Ttext 0x0 -s --oformat binary

image : linux.img

linux.img : tools/build bootsect setup kernel/system
	./tools/build bootsect setup kernel/system > $@

tools/build : tools/build.c
	$(CC) -o $@ $<

bootsect : bootsect.o
	$(LD) $(LDFLAG) -o $@ $<

bootsect.o : bootsect.S
	$(AS) -o $@ $<

setup : setup.o
	$(LD) $(LDFLAG) -e _start_setup -o $@ $<

setup.o : setup.S
	$(AS) -o $@ $<

kernel/system:
	cd kernel; make system; cd ..

run: linux.img
	qemu-system-i386 -boot a -fda linux.img

clean:
	rm -f bootsect.o setup.o bootsect setup linux.img
	rm -f tools/build
	cd kernel; make clean; cd ..

AS := as --32
LD := ld -m elf_i386

LDFLAG := -Ttext 0x0 -s --oformat binary

image : linux.img

linux.img : tools/build bootsect setup
	./tools/build bootsect setup > $@

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

run:
	qemu-system-i386 -boot a -fda linux.img

clean:
	rm -f *.o bootsect setup tools/build linux.img

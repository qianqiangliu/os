CROSS_COMPILE ?= i386-jos-elf-

GCC := $(CROSS_COMPILE)gcc -m32
LD := $(CROSS_COMPILE)ld -m elf_i386

CCFLAG := -mcpu=i386 -I../include -nostdinc -Wall -fomit-frame-pointer -c
LDFLAG := -Ttext 0x0 -s --oformat binary

OBJS := head.o

system: $(OBJS)
	$(LD) $(LDFLAG) -e startup_32 -o $@ $^

head.o: head.S
	$(GCC) -traditional -c -o $@ $<

clean:
	rm -f head.o system

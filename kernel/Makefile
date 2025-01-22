COMPILE_PREFIX ?= i386-jos-elf-

GCC := $(COMPILE_PREFIX)gcc -m32
LD := $(COMPILE_PREFIX)ld -m elf_i386

CCFLAG := -I../include -nostdinc -fno-pic -Wall -fomit-frame-pointer
LDFLAG := -Ttext 0x0 -s --oformat binary

OBJS := head.o main.o sched.o chr_drv/chr_drv.a

system: $(OBJS)
	$(LD) $(LDFLAG) -e startup_32 -o $@ $^

head.o: head.S
	$(GCC) -traditional -c -o $@ $<

main.o: main.c
	$(GCC) $(CCFLAG) -c -o $@ $<

sched.o: sched.c
	$(GCC) $(CCFLAG) -c -o $@ $<

chr_drv/chr_drv.a: chr_drv/*.c
	cd chr_drv; make chr_drv.a; cd ..

clean:
	rm -f head.o main.o sched.o system
	cd chr_drv; make clean; cd ..

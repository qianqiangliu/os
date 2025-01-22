COMPILE_PREFIX ?= i386-jos-elf-

AR  := $(COMPILE_PREFIX)ar
LD  := $(COMPILE_PREFIX)ld
GCC := $(COMPILE_PREFIX)gcc

CCFLAG := -m32 -I../../include -nostdinc -ffreestanding -fno-pic -Wall -fomit-frame-pointer -fno-stack-protector
OBJS   := tty_io.o console.o

tty_io.o : tty_io.c
	$(GCC) $(CCFLAG) -c -o $@ $<

console.o : console.c
	$(GCC) $(CCFLAG) -c -o $@ $<

chr_drv.a : $(OBJS)
	$(AR) rcs $@ $^

clean : 
	rm -f *.o chr_drv.a

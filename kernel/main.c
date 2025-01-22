#include <linux/tty.h>

#define __LIBRARY__

int main(void)
{
	tty_init();
	__asm__ __volatile__(
		"int $0x80\n\r"
		"sti\n\r"
		"loop:\n\r"
		"jmp loop"
		::);
	return 0;
}

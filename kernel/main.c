#define __LIBRARY__

int main(void)
{
	__asm__ __volatile__(
		"int $0x80\n\r"
		"sti\n\r"
		"loop:\n\r"
		"jmp loop"
		::);
	return 0;
}

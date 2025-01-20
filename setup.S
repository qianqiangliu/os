.code16
.text
.globl _start_setup

_start_setup:
  movw %cs, %ax
  movw %ax, %ds
  movw %ax, %es

  movw $msg, %ax
  movw %ax, %bp
  movw $0x01301, %ax
  movw $0x0c, %bx
  movw $16, %cx
  movb $0, %dl
  movb $1, %dh
  int  $0x10

loop:
  jmp loop

msg:
  .ascii "setup is running"

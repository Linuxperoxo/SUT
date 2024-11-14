%include "../include/write.asm"

section .data
  _msg db "Hello, World!", 0x0A

section .text
_start:
  printf _msg, 19

  mov rax, 60
  mov rdi, 0
  syscall
  

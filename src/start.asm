%include "../include/syscall.asm"

section .data
  _msg db "Hello, World!", 0x0A

section .text
_start:
  sys_write STDOUT_FILENO, _msg, 14
  sys_exit 0


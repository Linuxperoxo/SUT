%include "../include/syscall.asm"

extern _test
extern _test_size

section .text
_start:
  sys_write STDOUT_FILENO, _test, _test_size
  sys_exit 0


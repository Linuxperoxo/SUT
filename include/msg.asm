section .rodata
  global _connect_msg
  global _connect_size
  global _brk_ln

  _connect_msg db "Type session num: ", 0x00
  _connect_size equ 18
  _brk_ln db 0x0A



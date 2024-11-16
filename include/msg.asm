;
;
;
;    /--------------------------------------------O
;    |                                            |
;    |  COPYRIGHT : (c) 2024 per Linuxperoxo.     |
;    |  AUTHOR    : Linuxperoxo                   |
;    |  FILE      : msg.asm                       |
;    |  SRC MOD   : 15/11/2024                    |
;    |                                            |
;    O--------------------------------------------/
;    
;
;

section .rodata
  global __connect_msg
  global __connect_str_size
  global __brk_ln
  global __open_error
  global __open_str_size

  __connect_msg db "Type session num: "
  __connect_str_size equ 18
  __brk_ln db 0x0A
  __open_error db "Error to open file " 
  __open_str_size equ 19


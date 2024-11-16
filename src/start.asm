;
;
;
;    /--------------------------------------------O
;    |                                            |
;    |  COPYRIGHT : (c) 2024 per Linuxperoxo.     |
;    |  AUTHOR    : Linuxperoxo                   |
;    |  FILE      : start.asm                     |
;    |  SRC MOD   : 15/11/2024                    |
;    |                                            |
;    O--------------------------------------------/
;    
;
;

%include "../include/syscall.asm"

extern __connect_msg
extern __connect_str_size
extern __brk_ln
extern __open_error
extern __open_str_size

section .data
  
  ;
  ; O primeiro 0x00 serve para a definir no pts 
  ; e o segundo é para o open funciona bem
  ;

  __section_file db "/dev/pts/", 0x00, 0x00
  __section_str_size equ 11

section .bss
  __input_buffer resd 1

section .text
_start:
  
  ;
  ; argc está em rdi
  ; argv está em rsi
  ;

  ;
  ; Pegando o input
  ; 

  sys_write STDOUT_FILENO, __connect_msg, __connect_str_size  
  sys_read STDIN_FILENO, __input_buffer, 4 

  mov al, byte [__input_buffer]
  mov [__section_file + __section_str_size - 2], byte al
  
  sys_open __section_file, O_WRONLY
  test rax, rax ; Fazendo operação and para ver se a operação deu certo
  js _open_failed ; Pulando caso seja signed 

  sys_exit 0

_open_failed:
  sys_write STDOUT_FILENO, __open_error, __open_str_size
  sys_write STDOUT_FILENO, __section_file, __section_str_size
  sys_write STDOUT_FILENO, __brk_ln, 1
  sys_exit 1



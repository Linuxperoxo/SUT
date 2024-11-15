%include "../include/syscall.asm"

extern _connect_msg
extern _connect_size
extern _brk_ln

section .bss
  _input_buffer resb 1

section .text
_start:

  ;
  ; Pegando o input
  ; 

  sys_write STDOUT_FILENO, _connect_msg, _connect_size  
  sys_read STDIN_FILENO, _input_buffer, 1 
  

  ;
  ; Apenas imprimindo o input como teste
  ;

  sys_write STDOUT_FILENO, _input_buffer, 1
  
  ;
  ; Quebrando linha
  ;

  sys_write STDOUT_FILENO, _brk_ln, 1
  
  sys_exit 0


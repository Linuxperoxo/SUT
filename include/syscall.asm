/*
 *
 * Syscall codes 
 *
 */

%define SYS_WRITE 1

/*
 *
 * File desc para o /dev/pts/ atual 
 *
 */

%define STDOUT_FILENO 1
%define STDIN_FILENO 0

/*
 *
 * SYS_WRITE:
 *
 * rdi - File desc para escrita
 * rsi - Ponteiro para o dado a ser escrito
 * rdx - Bytes a ser escritos
 *
 */

%macro printf 2
  mov rax, SYS_WRITE
  mov rdi, STDOUT_FILENO
  mov rsi, %1
  mov rdx, %2
  syscall 
%endmacro


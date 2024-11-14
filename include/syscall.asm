;
; Syscall codes 
;

%define SYS_READ  0
%define SYS_WRITE 1
%define SYS_OPEN  2
%define SYS_CLOSE 3
%define SYS_EXIT  60

;
; File desc para o /dev/pts/ atual 
;

%define STDOUT_FILENO 1
%define STDIN_FILENO  0

;
; Permissões flags
;

%define O_WRONLY 0x01
%define O_RDWR   0x02
%define O_RDONLY 0x00
%define O_CREAT  0x40
%define O_TRUC   0x200


; SYS_READ: 
; rdi - File desc para leitura
; rsi - Endereço do buffer de leitura
; rdx - Bytes a ser lidos

%macro sys_read 3
  mov rax, SYS_READ
  mov rdi, %1
  mov rsi, %2
  mov rdx, %3
  syscall
%endmacro

; SYS_WRITE:
;
; rdi - File desc para escrita
; rsi - Ponteiro para o dado a ser escrito
; rdx - Bytes a ser escritos

%macro sys_write 3
  mov rax, SYS_WRITE
  mov rdi, %1
  mov rsi, %2
  mov rdx, %3
  syscall 
%endmacro

; SYS_OPEN
;
; rdi - Nome do arquivo (caminho completo)
; rsi - Flags de abertura 
; rdx - Permissão do arquivo (apenas relevante para criação do arquivo)
;
; return : Retorno pelo rax, -1 em caso de falha, em caso de sucesso retorna um positivo

%macro sys_open 3
  mov rax, SYS_OPEN
  mov rdi, %1
  mov rsi, %2
  mov rdx, %3
  syscall
%endmacro

; SYS_CLOSE:
;  
; rdi - descritor do arquivo a ser fechado

%macro sys_close 1
  mov rax, SYS_CLOSE
  mov rdi, %1
%endmacro

; SYS_EXIT:
;  
; rdi - Status de saída

%macro sys_exit 1
  mov rax, SYS_EXIT
  mov rdi, %1
  syscall
%endmacro 

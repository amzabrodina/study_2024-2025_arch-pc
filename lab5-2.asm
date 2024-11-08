%include 'in_out.asm'             ; подключение внешнего файла
SECTION .data ; Секция инициированных данных 
msg: DB 'Введите строку: ',0h ; сообщение
SECTION .bss
 buf1: RESB 80
SECTION .text 
GLOBAL _start
 _start:
 mov   eax, msg
call  sprint  
mov   ecx, buf1  
mov   edx, 80
    call  sread     
   call  quit      


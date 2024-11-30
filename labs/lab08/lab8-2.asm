%include 'in_out.asm'
SECTION .text
global _start
_start:
pop ecx ;
pop edx ; Извлекаем из стека в `edx` имя программы
sub ecx, 1 ; Уменьшаем `ecx` на 1 
next:
cmp ecx, 0 ; проверяем, есть ли еще аргументы
jz _end ; если аргументов нет выходим из цикла
; (переход на метку `_end`)
pop eax ; иначе извлекаем аргумент из стека
call sprintLF ; вызываем функцию печати
loop next ; переход к обработке следующего
_end:
call quit

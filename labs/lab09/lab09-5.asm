%include 'in_out.asm'
SECTION .data
div: DB 'Результат: ', 0
SECTION .text
GLOBAL _start

_start:
; ---- Вычисление выражения (3+2)*4+5
mov eax, 3       ; Устанавливаем eax = 3
add eax, 2       ; eax = 3 + 2 = 5
mov ecx, 4       ; Устанавливаем ecx = 4
imul eax, ecx    ; eax = 5 * 4 = 20 (используя imul для знакового умножения)
add eax, 5       ; eax = 20 + 5 = 25

; ---- Вывод результата на экран
mov edi, eax     ; Перемещаем результат в edi для вывода
mov eax, div     ; Указываем строку для вывода
call sprint      ; Печатаем строку
mov eax, edi     ; Загружаем результат для вывода
call iprintLF    ; Печать результата
call quit        ; Завершение программы

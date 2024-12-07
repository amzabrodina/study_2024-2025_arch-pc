%include 'in_out.asm'
SECTION .data
msg: DB 'Введите x: ',0
result: DB 'f(g(x))=',0
SECTION .bss
x: RESB 80
res: RESB 80
SECTION .text
GLOBAL _start
_start:
;------------------------------------------
; Основная программа
;------------------------------------------
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x
call atoi
call _calcul ; Вызов подпрограммы _calcul
mov eax,result
call sprint
mov eax,[res]
call iprintLF
call quit
;------------------------------------------
; Подпрограмма вычисления выражения f(x)="2x+7" и g(x) = 3x - 1
_calcul:
push eax          ; Сохраняем значение x на стек
call _subcalcul   ; Вызываем подпрограмму для вычисления g(x)
mov ebx, 2
mul ebx           ; Умножаем g(x) на 2
add eax, 7        ; Прибавляем 7
mov [res], eax    ; Сохраняем результат в res
pop eax           ; Восстанавливаем значение x с стека
ret               ; Возврат в основную программу
;------------------------------------------
; Подпрограмма вычисления g(x) = 3x - 1
;------------------------------------------
_subcalcul:
mov ebx, 3        ; Устанавливаем множитель 3
mul ebx           ; Умножаем x на 3
sub eax, 1        ; Вычитаем 1
ret               ; Возврат в _calcul




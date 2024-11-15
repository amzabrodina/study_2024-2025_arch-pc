%include 'in_out.asm' 
SECTION .data
msg: DB 'x=: ',0 
rem: DB 'y=: ',0
SECTION .bss 
x: RESB 80
SECTION .text 
GLOBAL _start
_start:
mov eax, msg
call sprint 
  mov ecx, x 
  mov edx, 80 
  call sread 
  mov eax, x 
  call atoi 
  mov ebx, 8 
  mul ebx 
  sub eax, 6 
  xor edx, edx 
  mov ecx, 2 
  div ecx 
  mov edi, eax 
  mov eax,rem 
  call sprint 
  mov eax,edi 
  call iprintLF 
 call quit

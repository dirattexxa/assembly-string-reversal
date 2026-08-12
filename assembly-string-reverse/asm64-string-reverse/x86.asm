section .data
  string_to_reverse db "Hello world", 0
  len equ $ - string_to_reverse

section .text 
global _start

_start:

lea rax, [string_to_reverse]
mov rbx, rax
find_end:
.loop:
cmp byte [rbx], 0
je found
inc rbx 
jmp .loop
.found:
dec rbx 


.reverse_loop:
cmp rax, rbx
jge .done

mov dl, byte[rax]
mov cl, byte[rbx]

mov [rax], cl
mov [rbx], dl

inc rax
dec rbx

jmp .reverse_loop

.done:
mov rax, 1
mov rdi, 1
mov rsi, string_to_reverse
mov rdx, len - 1
syscall

mov eax, 1
xor ebx, ebx
syscall

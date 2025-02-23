section .data
    array dw 10, 20, 30, 40, 50 ; Example array
    array_size equ ($ - array) / 2 ; Size of the array

section .text
    global _start

_start:
    ; ... other code ...

    mov ebx, array ; Base address of the array
    mov ecx, 2    ; Index into the array (0-based)

    ; Add bounds checking
    cmp ecx, array_size
    jge error_handler ; Handle out-of-bounds access
    cmp ecx, 0
    jl error_handler ; Handle negative index

    mov eax, [ebx + ecx*2] ; Access array element; each element is 2 bytes (dw)

    ; ... rest of your code
    jmp exit_program

error_handler:
    ; Handle the error appropriately (e.g., exit with an error code)
    mov eax, 1 ; sys_exit
    mov ebx, 1 ; exit code 1
    int 0x80

exit_program:
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80
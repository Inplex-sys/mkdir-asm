section .data
    pathname db 'directory_name', 0
    null db 0

section .text
    global _start

_start:
    call create_dir
    jmp exit_program

create_dir:
    ; Load the pathname string into rdi
    mov rdi, pathname

    ; Set rax to 83 for mkdir system call
    mov eax, 83

    ; Trigger the system call
    syscall

exit_program:
    ; Exit the program
    mov eax, 60
    xor edi, edi
    syscall
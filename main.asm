section .data
    pathname db 'pathname', 0
    message db 'Directory created successfully', 0
    prompt db 'create a directory [enter pathname]> ', 0
    null db 0

section .text
    global _start

_start:
    call read_pathname
    call create_dir
    jmp exit_program

read_pathname:
    ; Print prompt
    mov eax, 1 ; sys_write system call
    mov edi, 1 ; file descriptor 1 (stdout)
    mov rsi, prompt ; address of the hello string
    mov rdx, 37 ; number of bytes to write
    syscall ; invoke the system call    

    ; Read the pathname from stdin
    mov eax, 0 ; sys_read system call
    mov rdi, 0 ; file descriptor 0 (stdin)
    mov rsi, pathname ; address of the pathname buffer
    mov rdx, 256 ; number of bytes to read
    syscall ; invoke the system call
    ret

create_dir:
    mov rdi, pathname ; Load the pathname string into rdi
    mov eax, 83 ; Set rax to 83 for mkdir system call
    syscall ; Trigger the system call

    ; Print 'Directory created successfully'
    mov eax, 1 ; sys_write system call
    mov rdi, 1 ; file descriptor 1 (stdout)
    mov rsi, message ; address of the hello string
    mov rdx, 30 ; number of bytes to write
    syscall ; invoke the system call    

exit_program:
    ; Exit the program
    mov eax, 60 ; sys_exit system call
    xor edi, edi ; exit code 0
    syscall ; invoke the system call

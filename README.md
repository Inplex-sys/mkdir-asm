# mkdir-asm
Creating a directory with ASM


See [fs/namei.c](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/fs/namei.c)

|  syscall_id: 83    |   sys_mkdir  |
| :------ | :-------- |
| %rdi | %rsi |
| const char __user * pathname | umode_t mode |

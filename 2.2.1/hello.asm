global _start

section .data
message: db 'Hello, world!', 10

section .text
_start:
  ;; number 1 in rax stands for write syscall
  ;; 
  ;; you can check it executing this
  ;; 
  ;; tcc -run /dev/stdin <<EOF
  ;;   #include <sys/syscall.h>
  ;;   #include <stdio.h>
  ;;   int main() {
  ;;     printf("%d\n", SYS_write);
  ;;     return 0;
  ;;   }
  ;;   EOF
  ;; 
  ;; > 1

  mov   rax, 1
  mov   rdi, 1
  mov   rsi, message
  mov   rdx, 14
  syscall

  ;;
  ;; we can't finish adequatelly without exit syscall
  ;; thus we need to call the system again
  ;;
  ;; 60 stands for SYS_exit
  ;;
  ;; tcc -run /dev/stdin <<EOF
  ;;   #include <sys/syscall.h>
  ;;   #include <stdio.h>
  ;;   int main() {
  ;;     printf("%d\n", SYS_exit);
  ;;     return 0;
  ;;   }
  ;;   EOF
  ;; 
  ;; > 60
  ;; 
  mov rax, 60
  mov rdi, 0
  syscall

  ;; finally compile and link
  ;; 
  ;; nasm -f elf64 hello.asm -o hello.o
  ;; ld hello.o -o hello
  ;; ./hello
  ;; 
  ;; > Hello, world!
  ;; 

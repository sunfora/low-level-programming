# low-level-programming

## What this log is about?

This is my personal blog for the quite amazing and practical book written by Igor Zhirkov.  
I have found it by meticilously querieing Gemini 3.1 Pro (thank you google) to give me some nice book on fundamentals.  
What a suprise it was that there exist this book written by people from my alma-mater: ITMO University.  
Which actually covers many topics I wanted to study all the time.  
  
Here you would find my answers to the questions in the book on recap sections.  
And some more fun as I would go through.  
  
Listings would contain my personal comments. For example hello.asm currently discusses how to find out if 1 is really the SYS_write on your linux. I am very thorough in that regard. I like getting answers. So yeah.  
 
## EXTRAS

I have an amazing script to just run and to just debug.  
On modern linux systems. Check it out.  
  
```bash  
. env.sh  
run:asm   2.2.1/hello.asm  
# > Hello, world!  
debug:asm 2.2.1/hello.asm  
# > ┌─Register group: general─────────────────────────────────────────┐  
#   │rax            0x0                 0                             │  
#   │rbx            0x0                 0                             │  
#   │rcx            0x0                 0                             │  
#   │rdx            0x0                 0                             │  
#   │rsi            0x0                 0                             │  
#   │rdi            0x0                 0                             │  
#   │rbp            0x0                 0x0                           │  
#   │rsp            0x7fffffffb380      0x7fffffffb380                │  
#   │r8             0x0                 0                             │  
#   │r9             0x0                 0                             │  
#   ┌─────────────────────────────────────────────────────────────────┐  
#   │B+>0x401000 <_start>       movabs rax,0x1                        │  
#   │   0x40100a <_start+10>    movabs rdi,0x1                        │  
#   │   0x401014 <_start+20>    movabs rsi,0x402000                   │  
#   │   0x40101e <_start+30>    movabs rdx,0xe                        │  
#   │   0x401028 <_start+40>    syscall                               │  
#   │   0x40102a <_start+42>    movabs rax,0x3c                       │  
#   │   0x401034 <_start+52>    movabs rdi,0x0                        │  
#   │   0x40103e <_start+62>    syscall                               │  
#   │   0x401040                add    BYTE PTR [rax],al              │  
#   │   0x401042                add    BYTE PTR [rax],al              │  
#   └─────────────────────────────────────────────────────────────────┘  
#   native process 89542 (asm) In: _start           L??   PC: 0x401000  
#   Starting program: /dev/shm/hello  
#  
#   Breakpoint 1, 0x0000000000401000 in _star  
#   t ()  
#   (gdb)  
```

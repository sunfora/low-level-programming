**Question 1**

> It is time to do preliminary research based on the documentation [15]. refer to section 3.4.3
of the first volume to learn about register rflags. What is the meaning of flags CF, AF, ZF, OF, SF? What is the
difference between OF and CF?

1.  
  1. CF stands for carry flag, indicates carry or borrow for unsigned integers.  
  2. AF stands for Auxiliary Carry Flag and indicates whether 4bit nibble addition overflowed  
     for example: 0b...0000_1111 + 0b...0000_0001  
  3. ZF indicates if result of the previous operation is exactly zero  
  4. OF indicates if signed overflow happened  
  5. SF gives out the sign, 0 if positive, 1 if negative  
2. The difference between OF and CF is that CF is for unsigned and OF is for signed.  
  
   But! That is not the only thing. We can manipulate, clear, set CF.  
   We can't do it with OF. And also adc, sbb are the operations which work with CF.  
   While OF only work with generic CMOVcc, SETcc, JMPcc operations  
   and is not intended for usage say in bigarith implementation.

@ magicSquare.s
@ Written by Kate Gerhardt 8/2021

.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2
.global magicSquare
.type magicSquare, %function

magicSquare:
    push {r10, fp, lr}
    add fp, sp, #4


    @ r0 = array
    @ r1 = size n

    @ r10 = i
    @ r9 = j

    



    @bl printSquare

    sub sp, fp, #4
    pop {r10, fp, pc}

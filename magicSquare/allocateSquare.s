@ allocateSquare.s
@ Allocates in dynamic memory a 2D square array and fills with 0s
@ Written by Kate Gerhardt 8/2021

.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2
.global allocateSquare
.type allocateSquare, %function

allocateSquare:
    push {fp, lr}
    add fp, sp, #4

    @ r0 = n (size of array)
    mul r0, r0, r0  @ n*n
    mov r0, r0, LSL #2

    bl malloc


    sub sp, fp, #4
    pop {fp, pc}

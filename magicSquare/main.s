@ main.s
@
@ Written by Kate Gerhardt 8/2021

.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2
.global main
.type main, %function

main:
    push {fp, lr}
    add fp, sp, #4

    @ Get n from "get input"
    bl getinput
    mov r10, r0  @ store n in r10

    @ if n is odd, make and print magic square
    mov r1, #2
    bl mod

    cmp r0, #0
    beq skip

    @ allocate array
    mov r0, r10
    bl allocateSquare

    @ store address of array on stack
    sub sp, sp, #4
    str r0, [sp]

    @ initialize array with 0s
    ldr r0, [sp]
    mov r1, r10
    bl initializeArray

    @ fill array with numbers
    ldr r0, [sp]
    mov r1, r10
    bl magicSquare

    @ print array
    ldr r0, [sp]
    mov r1, r10
    bl printSquare

skip:
    sub sp, fp, #4
    pop {fp, pc}

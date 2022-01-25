@ getinput.s
@ Takes in as an input a number n
@ Written by Kate Gerhardt 8/2021

.cpu cortex-a72
.fpu neon-fp-armv8

.data
instruction:    .asciz  "Please enter an odd integer: "
getinput:       .asciz  "%d"

.text
.align 2
.global getinput
.type getinput, %function

getinput:
    push {fp, lr}
    add fp, sp, #4

    @ print instructions
    ldr r0, =instruction
    bl printf

    @ get input
    sub sp, sp, #4
    ldr r0, =getinput
    mov r1, sp
    bl scanf

    @ load user input into r0
    ldr r0, [sp]


    sub sp, fp, #4
    pop {fp, pc}

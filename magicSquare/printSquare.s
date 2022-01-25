@ printSquare.s
@ Written by Kate Gerhardt 8/2021

.cpu cortex-a72
.fpu neon-fp-armv8

.data
output:    .asciz "%d"
return:    .asciz "\n"

.text
.align 2
.global printSquare
.type printSquare, %function

printSquare:
    push {fp, lr}
    add fp, sp, #4

    @ r0 = array
    @ r1 = size n

    push {r0, r1}   @ save r0 and r1 on stack

    @ r10 = i
    @ r9 = j

    mov r10, #0
    outer_loop:
        ldr r0, [sp]
        cmp r10, r0
        bge end_outerloop

        mov r9, #0
        inner_loop:
            ldr r0, [sp]
            cmp r9, r0
            bge end_outer_loop

            @ calculate offset = r10*n*4 + r9 * 4
            ldr r0, [sp]
            mul r0, r0, r10
            mov r0, r0, LSL #2
            add r0, r0, r9, LSL #2

            @ r0 = offset
            ldr r2, [sp, #4]
            ldr r1, [r2, r0]

            ldr r0, =output
            bl printf

            add r9, r9, #1
            b inner_loop

    end_outer_loop:
        add r10, r10, #1

        ldr r0, =return
        bl printf

        b outer_loop

    sub sp, fp, #4
    pop {fp, pc}

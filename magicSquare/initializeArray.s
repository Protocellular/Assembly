@ initalizeArray.s
@ Fills an array with 0s
@ Written by Kate Gerhardt 8/2021

.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2
.global initializeArray
.type initializeArray, %function

initializeArray:
    push {r10, fp, lr}
    add fp, sp, #4

    @ r0 = contains array
    @ r1 = size n

    @ r10 = i
    @ r9 = j

    mov r10, #0
    fill_outer:
        cmp r10, r1
        bge end_fill_outer


        mov r9, #0
        fill_inner:
            cmp r9, r1
            bge end_fill_inner

            @ calculate offset, store in r2
            ldr r2, r1
            mul r2, r2, r10
            mov r2, r2, LSL #2
            add r2, r2, r9, LSL #2

            mul r4, r9, r10
            str r4, [r0, r2]

            add r9, r9, #1
            b fill_inner


        end_fill_inner:
            add r10, r10, #1
            b fill_outer

    end_fill_outer:
    sub sp, fp, #4
    pop {r10, fp, pc}

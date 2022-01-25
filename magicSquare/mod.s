.cpu cortex-a72
.fpu neon-fp-armv8
.data
.text
.align 2
.global mod
.type mod, %function

mod:
    @ mod(n, p) --> r0 = n, r1 = p
    push {fp, lr}   @ store value of fp and lr on stack
    add fp, sp, #4  @ reset the fp

    @ implement mod operation
    @ div r2, r0, r1
    udiv r2, r0, r1   @ n/p = q
    mul r2, r2, r1   @ p * q = r
    sub r2, r0, r2    @ n - r = answer

    @ return r2
    mov r0, r2      @ move value in r2 to r0

    @ restore sp
    sub sp, fp, #4
    pop {fp, pc}   @ once pc has address of line it needs to return to, program can continue

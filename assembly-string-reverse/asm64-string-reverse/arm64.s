
.section .data

msg:
    .asciz "Hello world"

.set msg_len, . - msg


.section .text

.global _start

_start:
    ldr x0, =msg

    ldr x1, =(msg + msg_len - 2)


reverse_loop:
    cmp x0, x1
    b.ge done

    //swap 
    ldrb w3, [x0]
    ldrb w4, [x1]

    strb w4, [x0]
    strb w3, [x1]

    add x0, x0, #1
    sub x1, x1, #1

    b reverse_loop


done:
    // write
    mov x0, #1
    ldr x1, =msg
    mov x2, #msg_len - 1
    mov x8, #64
    svc #0

    // exit(0)
    mov x0, #0
    mov x8, #93
    svc #0

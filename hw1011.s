.text

    .globl sum_positive_ints
    .type sum_positive_ints, @function
sum_positive_ints:
    # TODO: Problem 1
    movq $0, %rax
    cmpq $0, %rsi
    je end_case
repeate_case:
    cmpq $0, %rsi
    je end_case
    subq $1, %rsi
    movslq (%rdi), %rdx
    addq $4, %rdi
    cmpq $0, %rdx
    jg positive_int
    jmp repeate_case
positive_int:
    addq %rdx, %rax
    jmp repeate_case
end_case:
    ret 

    .globl reverse_longs
    .type reverse_longs, @function
reverse_longs:
    # TODO: Problem 2
    cmpq $0, %rsi
    je end_case_rl
    movq $0, %rcx
    movq $0, %r8
    movq $0, %r9
    imulq $8, %rsi
    subq $8, %rsi
    movq %rdi, %rcx
    addq %rsi, %rcx
repeat_case_rl:
    cmpq %rdi, %rcx
    jle end_case_rl
    movq (%rdi), %r8
    movq (%rcx), %r9
    movq %r9, (%rdi)
    movq %r8, (%rcx)
    addq $8, %rdi
    subq $8, %rcx
    jmp repeat_case_rl
end_case_rl:
    ret

    .globl sensor_score
    .type sensor_score, @function
sensor_score:
    # TODO: Problem 3
    movq $0, %rax
    movq $0, %rsi
    movq 8(%rdi), %rax
    movslq 16(%rdi), %rsi
    imulq %rsi, %rax
    movslq (%rdi), %rsi
    addq %rsi, %rax
    ret

    .globl sensor_array_total
    .type sensor_array_total, @function
sensor_array_total:
    # TODO: Problem 4
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movq $0, %rax
    movq %rax, -8(%rbp)
    movq %rdi, -16(%rbp)
    movq %rsi, -24(%rbp)
    cmpq $0, %rsi
    je end_case_sat
repeate_case_sat:
    cmpq $0, -24(%rbp)
    je end_case_sat
    movq -16(%rbp), %rdi
    call sensor_score
    addq %rax, -8(%rbp)
    addq $24, -16(%rbp)
    subq $1, -24(%rbp)
    jmp repeate_case_sat
end_case_sat:
    movq -8(%rbp), %rax
    leave
    ret

    .globl make_arithmetic_sequence
    .type make_arithmetic_sequence, @function
make_arithmetic_sequence:
    # TODO: Problem 5
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movq %rdi, -8(%rbp)
    movq %rsi, -16(%rbp)
    movq %rdx, -24(%rbp)
    movq $0, %rax
    cmpq $0, %rdx
    jle end_case_mas
    imulq $8, %rdx, %rdi
    call malloc
    cmpq $0, %rax
    je end_case_mas
    movq $0, %rdi
    movq %rax, %rsi
    movq $0, %rcx
repeate_case_mas:
    cmpq -24(%rbp), %rdi
    je end_case_mas
    movq -16(%rbp), %rcx
    imulq %rdi, %rcx
    movq %rcx, (%rsi)
    movq -8(%rbp), %rcx
    addq %rcx, (%rsi)
    addq $1, %rdi
    addq $8, %rsi
    jmp repeate_case_mas
end_case_mas:
    leave
    ret

    .globl make_sensor
    .type make_sensor, @function
make_sensor:
    # TODO: Problem 6A
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movl %edi, -4(%rbp)
    movq %rsi, -12(%rbp)
    movl %edx, -16(%rbp)
    movq $0, %rax
    movq $24, %rdi
    call malloc
    cmpq $0, %rax
    je end_case_ms
    movl -4(%rbp), %ecx
    movl %ecx, (%rax)
    movq -12(%rbp), %rcx
    movq %rcx, 8(%rax)
    movl -16(%rbp), %ecx
    movl %ecx, 16(%rax)
end_case_ms:
    leave
    ret

    .globl sensor_destroy
    .type sensor_destroy, @function
sensor_destroy:
    # TODO: Problem 6B
    pushq %rbp
    movq %rsp, %rbp
    movq $0, %rax
    cmpq $0, %rdi
    je end_case_sd
    call free
end_case_sd:
    leave
    ret

    .section .note.GNU-stack,"",@progbits

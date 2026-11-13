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
    movq $0, %rax

    ret

    .globl make_arithmetic_sequence
    .type make_arithmetic_sequence, @function
make_arithmetic_sequence:
    # TODO: Problem 5
    movq $0, %rax
    ret

    .globl make_sensor
    .type make_sensor, @function
make_sensor:
    # TODO: Problem 6A
    movq $0, %rax
    ret

    .globl sensor_destroy
    .type sensor_destroy, @function
sensor_destroy:
    # TODO: Problem 6B
    ret

    .section .note.GNU-stack,"",@progbits

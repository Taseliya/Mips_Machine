.data
x_value:    .asciiz "Enter the value of x: "
y_value:    .asciiz "Enter the value of y: "
result:      .asciiz "%d raýsed power %d is %d,(x,y,power(x,y)(The result of x^y is): "
newline:     .asciiz "\n"

.text
.globl main

main:
    # Print value for x
    li $v0, 4
    la $a0, x_value
    syscall

    # Read x
    li $v0, 5
    syscall
    move $s0, $v0    # Store x in $s0

    # Print value for y
    li $v0, 4
    la $a0, y_value
    syscall

    # Read y
    li $v0, 5
    syscall
    move $s1, $v0    # Store y in $s1

    # Call power function
    move $a0, $s0    # Move x to $a0
    move $a1, $s1    # Move y to $a1
    jal power        # Call power function
    move $t0, $v0    # Store result in $t0

    # Print result string
    li $v0, 4
    la $a0, result
    syscall

    # Print the result
    li $v0, 1
    move $a0, $t0    # Pass result
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall

# Power function: int power(int b, int e)
# Arguments: $a0 = base (b), $a1 = exponent (e)
# Return value: $v0

power:
    beq $a1, $zero, base_case    # if e == 0, return 1

    addi $sp, $sp, -8   # Make space on stack for 2 items
    sw $ra, 4($sp)       # Save return address
    sw $a0, 0($sp)       # Save base

    addi $a1, $a1, -1    # e = e - 1
    jal power            # Recursive call: power(b, e-1)
    lw $a0, 0($sp)       # Restore base
    mul $v0, $a0, $v0    # Return b * power(b, e-1)

    lw $ra, 4($sp)       # Restore return address
    addi $sp, $sp, 8     # Restore stack pointer
    jr $ra               # Return to caller

base_case:
    li $v0, 1            # Return 1
    jr $ra               # Return to caller

addi $1, $0, 0x7f00

ori $2, $0, 1
sw $2, 0($1)
lw $3, 0($1)

addi $1, $1, 4
ori $2, $0, 3
sw $2, 0($1)
lw $3, 0($1)

addi $1, $1, 4
ori $2, $0, 3
sw $2, 0($1)
lw $3, 0($1)

.ktext 0x4180
addi $29, $29, 4 
mtc0 $29, $14
eret
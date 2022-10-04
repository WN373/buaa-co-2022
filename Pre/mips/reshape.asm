.data
mat: .space 1024
space: .asciiz " "
enter: .asciiz "\n"
.text

input:
	li $v0, 5
	syscall
	move $s0, $v0	
	li $v0, 5
	syscall
	move $s1, $v0	
	j store
	
store:
	mult $s0, $s1
	mflo $t0
	li $t1, 0
	bgez $t0, for_loop0
	
for_loop0:
	li $v0, 5
	syscall
	sw $v0, mat($t1)
	addi $t1, $t1, 4
	subi $t0, $t0, 1
	bgtz $t0, for_loop0
	
for_end0:
	mflo $t0
	subi $t1, $t1, 4
	move $s2, $s1
	j for_loop2
	

for_loop2:
	lw $t2, mat($t1)

	beqz $t2, for_end2
	
display0:
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, space
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	
	la $a0, space
	li $v0, 4
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	la $a0, enter
	li $v0, 4
	syscall
	
for_end2:
	subi $t1, $t1, 4
	subi $t0, $t0, 1 
	subi $s1, $s1, 1
	bnez $s1, if_end1
	
if_begin1:
	move $s1, $s2
	subi $s0, $s0, 1
	j if_end1
if_end1:

	bgtz $t0, for_loop2
	
	li $v0, 10
	syscall
	
	


.text

input:
	li $v0, 5
	syscall
	move $t0, $v0
	
calc:
	li $t1, 4
	div $t0, $t1
	mfhi $t1
	
	li $t2, 400
	div $t0, $t2
	mfhi $t2
	
	li $t3, 100
	div $t0, $t3
	mfhi $t3
	j if1
	
if1:
	bnez $t1, nleap
	beqz $t2, leap1
	beqz $t3, nleap
	j leap1
	
nleap:
	li $t0, 0
	j main_end
	
leap1:
	li $t0, 1
	j main_end
	
main_end:
	li $t1, 0
	sw $t0, 0($t1)
	lw $a0, 0($t1)
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

.data
	str0: .byte 40
	
.macro push(%src)
	sw %src, 0($sp)
	subi $sp, $sp, 4
.end_macro

.macro pop(%dst)
	addi $sp, $sp, 4
	lw $des, 0($sp)
.end_macro

.macro top(%dst)
	pop(%dst)
	subi $sp, $sp, 4
.end_macro

.macro print_int(%src) 
	move $a0, %src
	li $v0, 1
	syscall
.end_macro

.macro print_str(%src)
	la $a0, %src
	li $v0, 4
	syscall	
.end_macro

.macro read_int(%dst)
	li $v0, 5
	syscall
	move %dst, $v0
.end_macro

.macro read_char(%dst)
	li $v0, 12
	syscall
	move %dst, $v0
.end_macro

.macro end
	li $v0, 10
	syscall
.end_macro

.text
	read_int($s0) # s0 = n
	
	# for t0(i) : [0:n)
	li $t0, 0
	for_begin0:
		read_char($t1) # t1 as input char
		sb $t1, str0($t0)
		
		# if (i*2 >= s0)
		sll $t2, $t0, 1
		bge $t2, $s0, if_begin0
		j if_end0
		if_begin0:
			sub $t2, $s0, $t0
			subi $t2, $t2, 1
			lb $t3, str0($t2)
			bne $t3, $t1, end0
		if_end0:
		
		addi $t0, $t0, 1
		blt $t0, $s0, for_begin0
	for_end0:
	
	j end1
	
	end1:
	li $s0, 1
	print_int($s0)
	end
	
	end0:
	li $s0, 0
	print_int($s0)
	end
.data
	mat0: .space 4096
	kern: .space 4096
	space: .asciiz " "
	enter: .asciiz "\n"

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

.macro get_adr(%m, %n, %l, %dst) # s1 or s3
	mult %m, %l
	mflo %dst
	add %dst, %dst, %n
	sll %dst, %dst, 2
.end_macro

.text
	read_int($s0) # s0 -> m1
	read_int($s1) # s1 -> n1
	read_int($s2) # s2 -> m2
	read_int($s3) # s3 -> n2
	
## input
	# for t0 : [0, m1)
	li $t0, 0
	for_begin00:
		# for t1 : [0,n1)
		li $t1, 0
		for_begin01:
			get_adr($t0, $t1, $s1, $t2)
			read_int($t3)
			sw $t3, mat0($t2)
			
			addi $t1, $t1, 1
			blt $t1, $s1, for_begin01
		for_end01:
	
		addi $t0, $t0, 1
		blt $t0, $s0, for_begin00
	for_end00:
	
	# for t0 : [0, m2)
	li $t0, 0
	for_begin10:
		# for t1 : [0,n2)
		li $t1, 0
		for_begin11:
			get_adr($t0, $t1, $s3, $t2)
			read_int($t3)
			sw $t3, kern($t2)
			
			addi $t1, $t1, 1
			blt $t1, $s3, for_begin11
		for_end11:
	
		addi $t0, $t0, 1
		blt $t0, $s2, for_begin10
	for_end10:
	
## calculation & output

	# t9 temporary calculate value
	# for t0 : [0, m1-m2]
	li $t0, 0
	for_begin0:
		# for t1 : [0, n1-n2]
		li $t1, 0
		for_begin1:
			li $s4, 0 # s4 = total
			
			# for t2 : [0, m2)
			li $t2, 0
			for_begin2:
				#for t3 : [0, n2)
				li $t3, 0
				for_begin3:
					add $t4, $t0, $t2
					add $t5, $t1, $t3
					get_adr($t4,$t5,$s1,$t6)
					lw $t4, mat0($t6)
					
					get_adr($t2, $t3, $s3, $t6)
					lw $t5, kern($t6)
					
					mult $t4, $t5
					mflo $t4
					add $s4, $s4, $t4
					
					addi $t3, $t3, 1
					blt $t3, $s3, for_begin3
				for_end3:
			
			addi $t2, $t2, 1
			blt $t2, $s2, for_begin2
			for_end2:
			
			print_int($s4)
			print_str(space)
		
			addi $t1, $t1, 1
			sub $t9, $s1, $s3
			ble $t1, $t9, for_begin1
		for_end1:
		
		print_str(enter)
		
		addi $t0, $t0, 1
		sub $t9, $s0, $s2
		ble $t0, $t9, for_begin0
	for_end0:
	



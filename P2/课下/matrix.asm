.data
	mat1: .space 300
	mat2: .space 300
	blank: .asciiz " "
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

.macro end
	li $v0, 10
	syscall
.end_macro

.macro get_adr(%m, %n, %l, %dst)
	mult %m, %l
	mflo %dst
	add %dst, %dst, %n
	sll %dst, %dst, 2
.end_macro

.macro get_mat1(%src, %dst)
	lw %dst, mat1(%src)
.end_macro

.macro put_mat1(%dst, %src)
	sw %src, mat1(%dst)
.end_macro

.macro get_mat2(%src, %dst)
	lw %dst, mat2(%src)
.end_macro

.macro put_mat2(%dst, %src) # (address, data)
	sw %src, mat2(%dst)
.end_macro

.text
	read_int($s0) # s0 = n
	
	# for ($t0 = 0, $t0 < n, $t0 ++ )
	li $t0, 0
	for_begin0:
		# for ($t1 = 0, t1 < n, t1 ++ )
		li $t1, 0
		for_begin1:
			read_int($t2) # t2 input int
			get_adr($t0, $t1, $s0, $t3) # t3 temporary address
			put_mat1($t3, $t2)
			addi $t1, $t1, 1
			blt $t1, $s0, for_begin1
		for_end1:
		
		addi $t0, $t0, 1
		blt $t0, $s0, for_begin0
	for_end0:
	
	# for ($t0 = 0, $t0 < n, $t0 ++ )
	li $t0, 0
	for_begin2:
		# for ($t1 = 0, t1 < n, t1 ++ )
		li $t1, 0
		for_begin3:
			read_int($t2) # t2 input int
			get_adr($t0, $t1, $s0, $t3) # t3 temporary address
			put_mat2($t3, $t2)
			addi $t1, $t1, 1
			blt $t1, $s0, for_begin3
		for_end3:
		
		addi $t0, $t0, 1
		blt $t0, $s0, for_begin2
	for_end2:
	
	# for (t0 = 0, t0 < n, t0 ++)
	li $t0, 0
	for_begin4:
		#for (t1 = 0, t1 < n, t1 ++)
		li $t1, 0
		for_begin5:
			li $s1, 0 # s1 as tmp value
			# s2 as value in mat1, s3 as value in mat2
			
			#for t2 = 0, t2 < n, t2++
			li $t2, 0
			for_begin6:
				get_adr($t0, $t2, $s0, $t3)
				get_mat1($t3, $s2)
				get_adr($t2, $t1, $s0, $t3)
				get_mat2($t3, $s3)
				mult $s2, $s3
				mflo $s2
				add $s1, $s1, $s2
				
				addi $t2, $t2, 1
				blt $t2, $s0, for_begin6
			for_end6:
			
			print_int($s1)
			print_str(blank)
			
			addi $t1, $t1, 1
			blt $t1, $s0, for_begin5
		for_end5:
		
		print_str(enter)
	
		addi $t0, $t0, 1
		blt $t0, $s0, for_begin4
	for_end4:
	

	end
.data
	array: .space 40
	vis: .space 40
	space: .asciiz " "
	newline: .asciiz "\n"
	
.macro push(%src)
	sw %src, 0($sp)
	subi $sp, $sp, 4
.end_macro

.macro pop(%dst)
	addi $sp, $sp, 4
	lw %dst, 0($sp)
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

.macro get_adr(%m, %n, %l, %dst) 
	mult %m, %l
	mflo %dst
	add %dst, %dst, %n
	sll %dst, %dst, 2
.end_macro

.text
	read_int($s0)
	li $a0, 0
	jal full_array
	end

full_array:
	push($ra)
	push($a0)
	
	# if a0 >= n
	blt $a0, $s0, if_end0
	if_begin0:
		# for t0(i) : [0,n)
		li $t0, 0
		for_begin00:
			sll $t8, $t0, 2
			lw $a0, array($t8)
			li $v0, 1
			syscall
			print_str(space)
			
		for_end00:
			addi $t0, $t0, 1
			blt $t0, $s0, for_begin00
		
		print_str(newline)
		pop($a0)
		pop($ra)
		jr $ra
	
	if_end0:
	top($a0)
	
	#for t0(i) : [1,n]
	li $t0, 1
	for_begin1:
		sll $t8, $t0, 2
		lw $t9, vis($t8)
		bnez $t9, for_end1
		
		li $t9, 1
		sw $t9, vis($t8)
		sll $t8, $a0, 2
		sw $t0, array($t8)
		push($t0)
		addi $a0, $a0, 1
		jal full_array
		pop($t0)
		top($a0)
		sll $t8, $t0, 2
		sw $0, vis($t8)
		
	for_end1:
		addi $t0, $t0, 1
		ble $t0, $s0, for_begin1
	
	pop($a0)
	pop($ra)
	jr $ra


	

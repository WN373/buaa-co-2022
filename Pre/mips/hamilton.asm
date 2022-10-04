.data
	G: .space 500
	book: .space 50

.macro read_int(%wd)
	li $v0, 5
	syscall
	move %wd, $v0
.end_macro

.macro print_int(%wd)
	li $v0, 1
	move $a0, %wd
	syscall
.end_macro

.macro get_link(%x, %y)
	mult %x, $s0
	mflo $t7
	add $t7, $t7, %y
	sll $t7, $t7, 2
	lw $t5, G($t7)
.end_macro

.macro store_vis(%src, %dst)
	sll $t7, %src, 2
	sw %dst, G($t7)
.end_macro

.macro get_vis(%src)
	sll $t7, %src, 2
	lw $t5, G($t7)
.end_macro

.macro set_link(%x, %y, %z) 
	mult %x, $s0
	mflo $t7
	add $t7, $t7, %y
	sll $t7, $t7, 2
	sw %z, G($t7)
.end_macro

.macro push(%src)
	sw %src, 0($sp)
	subi $sp, $sp, 4
.end_macro

.macro pop(%des)
	addi $sp, $sp, 4
	lw %des, 0($sp)
.end_macro

.macro top(%des) 
	addi $sp, $sp, 4
	lw %des, 0($sp)
	subi $sp, $sp, 4
.end_macro

.macro exit_progt5m
	li $v0, 10
	syscall
.end_macro


	# i, x, y: s3, s4, s5
	# n: $s0
	# m: $s1
	# ans $s2
	
	# $t7 used for getlink

.text

input: 
	read_int($s0)
	read_int($s1)
	li $s2, 0	# clear s2
	li $t2, 1 	# use t2 as temp stot5ge
	move $s3, $s1	# s3 as loop element
	
for_loop0:
	read_int($t0)
	read_int($t1)
	subi $s3, $s3, 1
	set_link($t0, $t1, $t2)	#set link between t0, t1
	set_link($t1, $t0, $t2)
	bgtz $s3, for_loop0
for_end0:
	
	# s0, s1, s2 still in use
	# pushin 2 arguments every fuction 
	# use t6 as argument
	
	li $a0, 1
	jal dfs_begin
	move $s2, $v0
	print_int($s2)
	exit_progt5m

dfs_begin:
	# push($t0)
	move $t6, $a0
	push($ra)
	#push($t6)
	
	li $t0, 1
	store_vis($t6, $t6)
	
	for_begin1:
		get_vis($t0)
		addi $t0, $t0, 1
		beqz $t5, for_end1
		ble $t0, $s0, for_begin1
		
		li $t1, 1
		get_link($t6, $t1)
		bnez $t5, if_begin1
		j for_end1
		
		if_begin1:
			pop($ra)
			move $v0, $t5
			jr $ra
		
	for_end1:
	
	li $t0, 0
	for_begin2:
		addi $t0, $t0, 1
		bgt $t0, $s0, for_end2
		get_vis($t0)
		bnez $t5, for_begin2
		get_link($t0, $t6)
		beqz $t5, for_begin2
		
		move $a0, $t0
		push($t0)
		push($t6)
		jal dfs_begin
		pop($t6)
		pop($t0)
		beqz $v0, else1
		if1:
			pop($ra)
			jr $ra
		
		else1:
			blt $t0, $s0, for_begin2
		
	for_end2:
	
	store_vis($t6, $0)
	
	pop($ra)
	li $v0, 0
	jr $ra
	
dfs_end:
	

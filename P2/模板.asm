.data
	
	
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
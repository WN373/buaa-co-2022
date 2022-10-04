.text
li $t1, 100
li $t2, 0
for_begin1:
	slt $t3, $t2, $t1
	beq $t3, $0 , for_end1
	nop
	
	addi $t2, $t2, 1
	j for_begin1
	nop
for_end1:

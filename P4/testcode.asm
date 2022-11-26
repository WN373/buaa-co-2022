.data
arr:	.space 32
.text
ori $s0,10
ori $s7,$s0,10
loop:
	beq $t0,$s0,loopout
	lw $s1,arr($t1)
	add $t1,$t1,4
	lw $s2,arr($t1)
	add $s3,$s1,$s7
	add $s2,$s2,$s3
	sw $s2,arr($t1)
	add $t0,$t0,1
	jal loop
loopout:
beq $t0,$t0,loopout

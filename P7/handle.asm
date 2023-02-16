
ori $s0,$s0,0x8fff
ori $s1,$s1,0x3002
ori $s2,$s2,0x2ff8
ori $s3,$s3,0x77f8
la $s6,test_RI
la $s7,test_RI_1
mfc0 $k0,$14
mfc0 $k1,$13
mfc0 $s4,$12
sw $s4,($sp)
addi $sp,$sp,4
sw $k0,($sp)
addi $sp,$sp,4
sw $k1,($sp)
addi $sp,$sp,4
beq $k0,$s0,return0
nop
beq $k0,$s1,return1
nop
beq $k0,$s2,return2
nop
beq $k0,$s3,return3
nop
beq $k0,$s6,return4
nop
beq $k0,$s7,return5
add $k0,$k0,4
mtc0 $k0,$14
eret
ori $10,$10,5
return0:
la $s5,wPC2
mtc0 $s5,$14
eret
return1:
la $s5,wPC3
mtc0 $s5,$14
eret
return2:
la $s5,wPC4
mtc0 $s5,$14
eret
return3:
la $s5,test_wPC_end
mtc0 $s5,$14
eret
return4:
la $s5,test_RI_1
mtc0 $s5,$14
eret
return5:
la $s5,test_RI_End
mtc0 $s5,$14
eret
EndOfAll:
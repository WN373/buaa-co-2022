ori $28, $0, 0
ori $29, $0, 0
andi $6, $15, 10433
nor $22, $6, $6
bgez $15, label1
srlv $6, $6, $15
sra $22, $15, 26
label1: srlv $22, $15, $22
ori $6, $0, 0
sb $6, 15($6)
mtlo $15
andi $15, $22, 58837
ori $15, $15, 25487
ori $15, $15, 20041
ori $22, $22, 1
div $6, $22
blez $6, label2
ori $22, $6, 14631
addu $6, $15, $22
label2: sll $15, $6, 8
ori $22, $22, 1
divu $6, $22
addu $15, $15, $15
subu $15, $22, $15
nor $22, $6, $22
lui $15, 44774
ori $15, $0, 0
sh $22, 2($15)
addu $22, $6, $15
mfhi $6
slt $15, $15, $6
lui $15, 18969
blez $15, label3
add $15, $0, $6
ori $15, $0, 0
lhu $6, 8($15)
label3: or $22, $6, $6
ori $15, $0, 0
sh $6, 6($15)
srav $22, $15, $15
j label4
ori $22, $0, 0
lw $6, 12($22)
xori $22, $15, 8938
label4: ori $6, $0, 0
lw $22, 12($6)
sra $6, $22, 11
addu $22, $22, $6
and $22, $22, $6
beq $6, $15, label5
and $6, $22, $22
ori $15, $15, 1
div $15, $15
label5: mfhi $22
lui $22, 33560
andi $6, $15, 22163
sll $6, $15, 17
ori $15, $15, 1
div $6, $15
xor $6, $15, $22
ori $6, $0, 0
sb $22, 13($6)
ori $6, $0, 0
sh $6, 14($6)
addiu $6, $22, -24381
ori $22, $0, 0
lhu $6, 4($22)
bne $15, $15, label6
sllv $6, $22, $15
ori $22, $0, 0
sw $22, 0($22)
label6: lui $22, 44211
sra $6, $15, 9
mult $22, $6
bltz $15, label7
mult $15, $22
add $15, $0, $22
label7: srlv $22, $15, $15
sllv $22, $22, $15
beq $6, $22, label8
subu $15, $6, $22
sub $6, $15, $15
label8: andi $15, $6, 14791
and $22, $15, $22
sra $6, $15, 15
beq $6, $22, label9
sra $22, $6, 13
mflo $22
label9: andi $6, $15, 57983
addu $15, $22, $22
nor $22, $15, $22
mfhi $22
ori $15, $15, 1
divu $15, $15
ori $6, $0, 0
lhu $15, 8($6)
ori $6, $0, 0
lh $22, 0($6)
srav $15, $6, $6
sub $22, $15, $15
blez $6, label10
mfhi $15
addiu $22, $6, 10345
label10: mtlo $15
andi $22, $22, 26906
bgez $6, label11
ori $6, $0, 0
lbu $22, 8($6)
ori $22, $22, 1
div $22, $22
label11: mfhi $22
ori $22, $22, 28644
ori $22, $0, 0
lw $22, 0($22)
jal label12
ori $22, $0, 16
mflo $15
label12: addu $22, $22, $31
jr $22
nop
srav $6, $22, $6
ori $6, $0, 0
sb $22, 5($6)
andi $22, $6, 56848
sltu $6, $15, $22
xor $15, $15, $15
jal label13
ori $22, $0, 16
srlv $6, $15, $22
label13: addu $22, $22, $31
jr $22
nop
ori $6, $0, 0
lbu $22, 8($6)
sltu $6, $15, $6
sllv $22, $22, $22
mfhi $22
j label14
sllv $6, $15, $6
ori $15, $15, 1
divu $6, $15
label14: srlv $6, $22, $6
bgez $6, label15
mtlo $22
mflo $15
label15: ori $22, $22, 1
div $22, $22
ori $6, $0, 0
sb $15, 10($6)
srlv $6, $15, $22
addiu $22, $6, 4276
slti $6, $15, -1122
mthi $22
sllv $22, $22, $15
sll $15, $22, 9
or $22, $22, $15
addiu $6, $22, 26379
jal label16
ori $15, $0, 16
ori $22, $22, 30625
label16: addu $15, $15, $31
jr $15
nop
ori $15, $0, 0
lw $6, 4($15)
ori $22, $0, 0
lh $6, 0($22)
addiu $15, $15, -6301
beq $6, $6, label17
ori $22, $0, 0
lhu $15, 6($22)
ori $22, $0, 0
sw $22, 0($22)
label17: mthi $6
sra $22, $6, 31
ori $22, $0, 0
lh $6, 8($22)
ori $15, $0, 0
lbu $6, 13($15)
slti $6, $22, -2314
ori $15, $6, 15342
mult $22, $6
ori $22, $0, 0
sh $6, 10($22)
sub $6, $6, $6
bgez $22, label18
srl $22, $6, 25
ori $15, $15, 1
div $6, $15
label18: ori $6, $6, 1
div $15, $6
or $6, $22, $15
addiu $22, $15, -4334
addu $6, $6, $6
sllv $15, $6, $6
sllv $6, $15, $15
jal label19
ori $22, $0, 16
mthi $6
label19: addu $22, $22, $31
jalr $15, $22
nop
ori $6, $0, 0
lw $6, 4($6)
or $15, $15, $22
mthi $22
bgez $15, label20
mflo $6
nor $22, $15, $15
label20: add $15, $0, $6
sll $6, $6, 18
subu $15, $6, $6
or $22, $6, $15
ori $15, $0, 0
sw $15, 4($15)
bne $6, $15, label21
sltu $22, $6, $6
xori $6, $15, 1985
label21: slti $22, $15, 19240
mtlo $22
xor $6, $6, $15
multu $15, $22
subu $15, $15, $22
mflo $6
blez $22, label22
mflo $22
sltu $6, $6, $22
label22: ori $15, $22, 63315
sltu $15, $15, $22
srl $15, $6, 21
ori $22, $0, 0
lbu $15, 15($22)
bne $6, $22, label23
add $15, $0, $6
mult $6, $6
label23: mult $6, $15
mthi $15
or $15, $22, $6
andi $22, $15, 42023
ori $22, $22, 1
div $15, $22
mtlo $6
bltz $15, label24
sltiu $6, $15, 18173
sub $15, $6, $6
label24: mult $6, $15
ori $6, $0, 0
sw $6, 0($6)
addi $22, $15, 0
mthi $15
mfhi $22
bgtz $22, label25
ori $22, $0, 0
lw $15, 4($22)
addu $15, $6, $22
label25: ori $6, $6, 1
divu $22, $6
mfhi $6
subu $22, $22, $6
xor $22, $15, $6
srav $15, $15, $15
ori $22, $0, 0
lw $15, 8($22)
mthi $6
andi $15, $22, 27076
jal label26
ori $6, $0, 16
sllv $15, $15, $6
label26: addu $6, $6, $31
jalr $6, $6
nop
ori $6, $0, 0
lhu $15, 8($6)
lui $6, 41268
ori $22, $0, 0
sw $15, 4($22)
slt $15, $22, $15
ori $6, $0, 0
lbu $6, 11($6)
addu $15, $15, $15
bne $15, $22, label27
ori $22, $0, 0
lbu $22, 1($22)
addu $15, $22, $15
label27: sub $15, $15, $15
xori $6, $6, 49
sllv $15, $6, $6
slti $22, $6, -14117
jal label28
ori $15, $0, 16
mfhi $6
label28: addu $15, $15, $31
jr $15
nop
ori $22, $0, 0
lhu $22, 8($22)
srlv $6, $6, $15
nor $6, $15, $6
sltu $22, $15, $15
ori $15, $0, 0
lb $15, 3($15)
sra $6, $22, 9
sll $15, $15, 6
jal label29
ori $15, $0, 16
srav $15, $22, $22
label29: addu $15, $15, $31
jalr $6, $15
nop
andi $6, $6, 54797
srl $6, $22, 14
or $15, $22, $22
sllv $22, $22, $15
slt $22, $15, $6
j label30
sltu $15, $15, $6
mfhi $6
label30: sll $22, $22, 8
mtlo $22
srav $22, $6, $15
addu $15, $15, $6
jal label31
ori $22, $0, 16
srav $22, $15, $6
label31: addu $22, $22, $31
jalr $6, $22
nop
lui $22, 45287
sllv $6, $6, $22
slti $15, $6, -9829
ori $15, $0, 0
sw $15, 4($15)
sltu $22, $6, $15
ori $22, $0, 0
lw $22, 12($22)
nor $22, $6, $6
xor $15, $15, $6
ori $6, $0, 0
sb $15, 3($6)
bgtz $22, label32
addiu $15, $6, 14864
sltiu $22, $15, 13342
label32: sra $6, $15, 15
sllv $22, $15, $22
andi $15, $6, 26412
nor $6, $15, $6
ori $22, $0, 0
lhu $6, 12($22)
blez $22, label33
subu $6, $22, $15
ori $15, $0, 0
lbu $22, 13($15)
label33: subu $6, $15, $22
ori $22, $22, 1
divu $15, $22
sltiu $6, $6, -24402
j label34
and $22, $6, $22
slti $6, $6, 20178
label34: sltu $15, $6, $22
blez $22, label35
ori $15, $15, 1
divu $22, $15
sra $22, $6, 24
label35: sllv $6, $6, $6
srlv $15, $15, $6
add $15, $0, $22
ori $15, $0, 0
lh $22, 2($15)
j label36
ori $6, $0, 0
lh $15, 0($6)
ori $15, $0, 0
lh $22, 2($15)
label36: multu $15, $22
ori $6, $6, 1
div $6, $6
bgtz $22, label37
ori $22, $0, 0
lb $22, 6($22)
ori $22, $0, 0
sb $6, 2($22)
label37: mthi $15
addi $15, $15, 0
srav $22, $6, $15
addiu $6, $22, -31087
ori $6, $6, 1
divu $22, $6
bne $22, $15, label38
mfhi $15
ori $15, $0, 0
sw $22, 12($15)
label38: slt $6, $15, $22
addiu $15, $15, -20528
ori $6, $0, 0
lhu $15, 6($6)
blez $22, label39
mflo $15
addu $6, $15, $6
label39: sltu $22, $6, $6
sllv $15, $15, $15
subu $6, $22, $15
srav $22, $22, $22
slt $15, $15, $15
sll $6, $22, 27
sltiu $6, $6, -6389
mtlo $15
mflo $6
mfhi $22
ori $6, $6, 1
div $6, $6
nor $15, $15, $15
j label40
mult $22, $22
ori $15, $0, 0
lw $15, 12($15)
label40: xori $22, $15, 58548
lui $22, 44457
sllv $15, $15, $22
addu $22, $6, $22
bne $15, $15, label41
ori $22, $0, 0
sw $15, 12($22)
sra $22, $15, 26
label41: nor $22, $6, $15
mflo $22
addi $22, $6, 0
ori $6, $0, 0
lb $6, 14($6)
mfhi $6
sub $15, $22, $22
multu $6, $6
xor $6, $6, $6
beq $22, $15, label42
ori $6, $0, 0
lhu $22, 8($6)
multu $22, $22
label42: srlv $6, $6, $22
ori $6, $6, 1
div $22, $6
sub $15, $15, $15
sltu $15, $22, $6
ori $22, $0, 0
lbu $22, 13($22)
multu $6, $6
srl $15, $6, 25
addi $22, $22, 0
xori $6, $22, 58302
sltu $15, $15, $22
xori $15, $6, 3322
bne $15, $6, label43
srav $22, $15, $6
ori $22, $0, 0
lw $22, 0($22)
label43: xor $22, $22, $6
mflo $6
ori $22, $0, 0
lw $6, 4($22)
mtlo $22
slt $15, $6, $22
sub $15, $22, $22
add $6, $0, $6
slti $6, $15, 7871
sra $15, $15, 8
ori $22, $22, 1
divu $15, $22
nor $15, $22, $22
beq $22, $6, label44
or $6, $6, $15
addiu $15, $22, 22272
label44: slt $22, $6, $22
mtlo $22
mult $6, $15
or $22, $22, $15
xori $15, $22, 2691
slt $22, $6, $15
mfhi $6
bltz $22, label45
mtlo $22
ori $15, $0, 0
sb $22, 1($15)
label45: addiu $6, $6, -25810
sub $22, $6, $6
mfhi $6
ori $6, $0, 0
lh $22, 2($6)
blez $22, label46
sllv $15, $6, $15
nor $22, $6, $15
label46: ori $15, $0, 0
lw $15, 0($15)
ori $22, $0, 0
lb $15, 12($22)
srav $15, $6, $15
addiu $22, $15, -11848
ori $6, $0, 0
sb $6, 0($6)
ori $6, $0, 0
sw $6, 0($6)
jal label47
ori $22, $0, 16
lui $6, 53880
label47: addu $22, $22, $31
jalr $15, $22
nop
addu $22, $6, $6
slti $15, $22, 15962
ori $22, $22, 1
div $22, $22
mfhi $22
subu $15, $15, $22
subu $22, $6, $6
beq $22, $15, label48
xori $22, $15, 2905
and $22, $22, $6
label48: add $6, $0, $22
bne $6, $15, label49
slti $6, $6, 21990
add $22, $0, $6
label49: ori $22, $15, 48388
mult $6, $6
bgez $22, label50
ori $15, $22, 44407
subu $6, $6, $22
label50: slt $15, $6, $6
sllv $15, $15, $15
ori $15, $0, 0
lbu $22, 13($15)
beq $15, $6, label51
xor $6, $6, $6
nor $15, $15, $15
label51: slti $15, $15, -27755
sltiu $22, $15, 5716
ori $22, $0, 0
lbu $6, 11($22)
jal label52
ori $6, $0, 16
srav $22, $22, $6
label52: addu $6, $6, $31
jalr $6, $6
nop
addiu $6, $15, 544
slti $15, $6, -28696
sra $22, $6, 27
mtlo $15
andi $6, $22, 56969
xori $15, $22, 33755
ori $15, $0, 0
lbu $22, 15($15)
ori $15, $0, 0
sw $6, 12($15)
sll $15, $22, 7
mtlo $22
ori $15, $22, 26034
bltz $15, label53
add $15, $0, $22
ori $22, $22, 1
div $22, $22
label53: slt $6, $6, $22
mthi $15
mtlo $15
mflo $15
bltz $15, label54
lui $6, 59363
ori $22, $0, 0
lhu $15, 10($22)
label54: slt $15, $22, $22
ori $22, $0, 0
lhu $6, 12($22)
ori $6, $0, 0
lhu $22, 8($6)
ori $6, $6, 1
divu $15, $6
lui $15, 51363
ori $22, $0, 0
lb $15, 1($22)
mthi $22
or $22, $6, $15
addi $22, $22, 0
lui $22, 47954
subu $15, $6, $6
ori $15, $0, 0
lbu $22, 1($15)
add $22, $0, $6
srlv $15, $15, $6
ori $22, $0, 0
sb $6, 2($22)
sll $6, $15, 16
beq $22, $6, label55
srlv $6, $15, $15
ori $22, $0, 0
lh $22, 6($22)
label55: addiu $6, $22, 26596
sra $22, $22, 17
slti $15, $22, 6629
lui $22, 22524
mult $6, $6
jal label56
ori $22, $0, 16
mult $22, $15
label56: addu $22, $22, $31
jalr $6, $22
nop
bne $15, $22, label57
ori $6, $0, 0
lhu $15, 14($6)
sll $22, $22, 31
label57: ori $6, $22, 31749
ori $22, $15, 25116
ori $6, $0, 0
lb $6, 12($6)
mult $22, $22
ori $22, $22, 1
divu $6, $22

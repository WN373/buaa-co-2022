.ktext 0x4180
_entry:
    j _save_context
    nop

_main_handler:
    mfc0 $k0, $12
    mfc0 $k0, $14
    mfc0 $k0, $13
    ori $k1, $0, 0x7c
    and $k0, $k0, $k1

    beq $k0, $0, _restore_context
    nop
    
    mfc0 $k0, $14
    addi $k0, $k0, 4
    mtc0 $k0, $14
    j _restore_context
    nop

_exception_return:
    eret

_save_context:
    ori $k0, $0, 0x1000     
    addi $k0, $k0, -256
    sw $sp, 116($k0)       
    add $sp, $0, $k0

    sw $1, 4($sp)
    sw $2, 8($sp)
    sw $3, 12($sp)
    sw $4, 16($sp)
    sw $5, 20($sp)
    sw $6, 24($sp)
    sw $7, 28($sp)
    sw $8, 32($sp)
    sw $9, 36($sp)
    sw $10, 40($sp)
    sw $11, 44($sp)
    sw $12, 48($sp)
    sw $13, 52($sp)
    sw $14, 56($sp)
    sw $15, 60($sp)
    sw $16, 64($sp)
    sw $17, 68($sp)
    sw $18, 72($sp)
    sw $19, 76($sp)
    sw $20, 80($sp)
    sw $21, 84($sp)
    sw $22, 88($sp)
    sw $23, 92($sp)
    sw $24, 96($sp)
    sw $25, 100($sp)
    sw $26, 104($sp)
    sw $27, 108($sp)
    sw $28, 112($sp)
    sw $30, 120($sp)
    sw $31, 124($sp)
    mfhi $k0
    mflo $k1
    sw $k0, 128($sp)
    sw $k1, 132($sp)

    j _main_handler
    nop

_restore_context:

    lw $k0, 128($sp)
    lw $k1, 132($sp)
    mthi $k0
    mtlo $k1
    
    lw $1, 4($sp)
    lw $2, 8($sp)
    lw $3, 12($sp)
    lw $4, 16($sp)
    lw $5, 20($sp)
    lw $6, 24($sp)
    lw $7, 28($sp)
    lw $8, 32($sp)
    lw $9, 36($sp)
    lw $10, 40($sp)
    lw $11, 44($sp)
    lw $12, 48($sp)
    lw $13, 52($sp)
    lw $14, 56($sp)
    lw $15, 60($sp)
    lw $16, 64($sp)
    lw $17, 68($sp)
    lw $18, 72($sp)
    lw $19, 76($sp)
    lw $20, 80($sp)
    lw $21, 84($sp)
    lw $22, 88($sp)
    lw $23, 92($sp)
    lw $24, 96($sp)
    lw $25, 100($sp)
    lw $26, 104($sp)
    lw $27, 108($sp)
    lw $28, 112($sp)
    lw $30, 120($sp)
    lw $31, 124($sp)
  
    lw $sp, 116($sp)

    j _exception_return
    nop
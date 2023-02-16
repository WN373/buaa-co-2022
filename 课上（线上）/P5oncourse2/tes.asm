
ori $a0, $a0, 100
ori $a2, 5
ori $a1, $a1, 10

sw $a0, 0($a0)
lhogez $a1, 0($a0)
add $s0, $a0, $a1
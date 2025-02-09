.text

# Testando xor
li $t1, 1
li $t2, 1
xor $t0, $t1, $t2       # $t0 = $s2 XOR $t0

li $t1, 1
li $t2, 0
xor $t0, $t1, $t2       # $t0 = $s2 XOR $t0

exit:
    j exit

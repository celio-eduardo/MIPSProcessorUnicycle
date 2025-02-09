.text

# Testando nor
li $t1, 0
li $t2, 0
nor $t0, $t1, $t2       # $t0 = $t1 NOR $t0

li $t1, 1
li $t2, 0
nor $t0, $t1, $t2       # $t0 = $t1 NOR $t0

exit:
    j exit

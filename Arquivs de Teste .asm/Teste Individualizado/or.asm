.text

# Testando or
li $t1, 1
li $t2, 0
or $t0, $t1, $t2       # $t0 = $t1 OR $t0

li $t1, 0
li $t2, 0
or $t0, $t1, $t2       # $t0 = $t1 OR $t0

exit:
    j exit
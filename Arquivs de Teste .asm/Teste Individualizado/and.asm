.text

# Testando and
li $t1, 1
li $t2, 1
and $t0, $t1, $t2       # $t0 = $s2 AND $t0

li $t1, 1
li $t2, 0
and $t0, $t1, $t2       # $t0 = $s2 AND $t0

exit:
    j exit

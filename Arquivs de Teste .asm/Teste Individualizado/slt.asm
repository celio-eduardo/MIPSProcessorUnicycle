.text

# Testando slt
li $t2, 2
slt $t1, $t2, $t3       # $t1 = ($t2 < $t3) ? 1 : 0

# Testando slt
li $t3, 3
slt $t4, $t2, $t3       # $t1 = ($t2 < $t3) ? 1 : 0

exit:
	j exit

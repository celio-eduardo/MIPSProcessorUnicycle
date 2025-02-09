.text

# Testando sll, srl
sll $t2, $t3, 10        # $t2 = $t3 << 10
srl $t2, $t3, 10        # $t2 = $t3 >> 10

exit:
	j exit
.text

# Testando addu, subu
li  $t2, 0xFFFFFFFF
addu $t1, $t2, $t3      # $t1 = $t2 + $t3 (sem sinal)
subu $t1, $t2, $t3      # $t1 = $t2 - $t3 (sem sinal)

exit:
	j exit

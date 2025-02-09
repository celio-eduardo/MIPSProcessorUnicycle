.text

li $t1, 0xFFFFFFFF
li $t2, 0xFFFF
mul  $t0, $t1, $t2          # Multiplica $t1 por $t2
mfhi $t3                # Move o valor de HI para $t1
mflo $t4                # Move o valor de LO para $t1

exit:
    j exit

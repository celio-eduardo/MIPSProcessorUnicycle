.text

li $t1, 10
li $t2, 3
div $t1, $t2            # Divide $t1 por $t2
mfhi $t3                # Move o valor de HI para $t1
mflo $t4                # Move o valor de LO para $t1

exit:
    j exit

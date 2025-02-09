.text

# Testando addi, andi, ori, xori
addi $t2, $t3, -10      # $t2 = $t3 + (-10)
add $t2, $t3, $t3

andi $t2, $t3, 0xFF     # $t2 = $t3 AND 0xFF
add $t2, $t3, $t3

ori  $t2, $t3, 0xFF     # $t2 = $t3 OR 0xFF
add $t2, $t3, $t3

xori $t2, $t3, 0xFF     # $t2 = $t3 XOR 0xFF
add $t2, $t3, $t3

exit:
    j exit
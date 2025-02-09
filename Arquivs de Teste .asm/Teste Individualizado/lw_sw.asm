.data
array: .word 1, 2    # Array de dados

.text

# Testando lw e sw
la $s3, array           # Carrega o endereço base do array em $s3
lw $t0, 0($s3)          # Carrega o valor do primeiro elemento do array em $t0
addi $t0, $t0, 5        # Adiciona 5 ao valor de $t0
sw $t0, 4($s3)          # Armazena o valor de $t0 no segundo elemento do array

exit:
	j exit
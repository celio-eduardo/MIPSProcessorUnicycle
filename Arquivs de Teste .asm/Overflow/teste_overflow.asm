.text

li $t0, 0x7FFFFFFF  # Carrega o maior valor positivo de 32 bits em $t0
li $t1, 1           # Carrega o valor 1 em $t1
add $t2, $t0, $t1   # Adiciona $t0 e $t1, gerando um overflow

    # Loop infinito para parar a execução
loop:
    j loop
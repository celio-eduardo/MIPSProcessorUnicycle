.data
array: .word 1, 2, 3, 4, 5    # Array de dados
text:  .asciiz "Test MIPS Instructions\n"

.text
.globl main

main:
    # Testando lw e sw
    la $s3, array           # Carrega o endereço base do array em $s3
    lw $t0, 0($s3)          # Carrega o valor do primeiro elemento do array em $t0
    addi $t0, $t0, 5        # Adiciona 5 ao valor de $t0
    sw $t0, 4($s3)          # Armazena o valor de $t0 no segundo elemento do array

    # Testando add, sub, and, or, nor, xor
    li $s2, 10
    add $t0, $s2, $t0       # $t0 = $s2 + $t0
    sub $t0, $s2, $t0       # $t0 = $s2 - $t0
    and $t0, $s2, $t0       # $t0 = $s2 AND $t0
    or  $t0, $s2, $t0       # $t0 = $s2 OR $t0
    nor $t0, $s2, $t0       # $t0 = $s2 NOR $t0
    xor $t0, $s2, $t0       # $t0 = $s2 XOR $t0

    # Testando j, jr, jal
    jal jump_label          # Chama a função jump_label
    j end                   # Salta para o fim do programa

jump_label:
    lui $t1, 0x1234         # Carrega o valor 0x12340000 em $t1
    jr $ra                  # Retorna para a instrução seguinte após jal

end:
    # Testando beq, bne
    beq $t1, $zero, label_beq # Se $t1 == 0, salta para label_beq
    bne $t1, $zero, label_bne # Se $t1 != 0, salta para label_bne

label_beq:
    j end                   # Substitui nop por salto para end

label_bne:
    j end                   # Substitui nop por salto para end

    # Testando slt
    slt $t1, $t2, $t3       # $t1 = ($t2 < $t3) ? 1 : 0

    # Testando lui
    lui $t1, 0xFFFF         # Carrega o valor 0xFFFF0000 em $t1

    # Testando addu, subu
    addu $t1, $t2, $t3      # $t1 = $t2 + $t3 (sem sinal)
    subu $t1, $t2, $t3      # $t1 = $t2 - $t3 (sem sinal)

    # Testando sll, srl
    sll $t2, $t3, 10        # $t2 = $t3 << 10
    srl $t2, $t3, 10        # $t2 = $t3 >> 10

    # Testando addi, andi, ori, xori
    addi $t2, $t3, -10      # $t2 = $t3 + (-10)
    andi $t2, $t3, 0xFF     # $t2 = $t3 AND 0xFF
    ori  $t2, $t3, 0xFF     # $t2 = $t3 OR 0xFF
    xori $t2, $t3, 0xFF     # $t2 = $t3 XOR 0xFF

    # Testando mult, div, mfhi, mflo
    mult $t1, $t2           # Multiplica $t1 por $t2
    mfhi $t1                # Move o valor de HI para $t1
    mflo $t1                # Move o valor de LO para $t1

    div $t1, $t2            # Divide $t1 por $t2
    mfhi $t1                # Move o valor de HI para $t1
    mflo $t1                # Move o valor de LO para $t1

    # Finaliza o programa
    j exit                  # Substitui syscall por um salto para a label exit

exit:
    j exit                  # Loop infinito para simular a finalização do programa
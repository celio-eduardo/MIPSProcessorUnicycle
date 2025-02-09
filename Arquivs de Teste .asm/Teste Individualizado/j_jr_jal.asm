.text

# Testando j, jr, jal
jal jump_label          # Chama a função jump_label
j end                   # Salta para o fim do programa

jump_label:
    lui $t1, 0x1234         # Carrega o valor 0x12340000 em $t1
    jr $ra                  # Retorna para a instrução seguinte após jal

end:
    j end
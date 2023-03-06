  #nao sei o motivo mas quando imprime um numero alto de textos para de funcionar o print dos textos, mas a logica ta 100%  
          .data
  primeiro: .asciiz "\nDigite o primeiro numero:"
  segundo: .asciiz "\nDigite o segundo numero:"
  valor: .asciiz "\nO total de numeros copiados foi: "
        .text

lui $a1,0x1001
addi $a1,$a1,0x0040  #endereco de M1
lui $a2,0x1001 
addi $a2,$a2,0x0060   #endereco de M2	
addi $t4,$zero,4  
addi $s2,$zero,0  

loop:
li $v0, 4        # system call code for print_str
la $a0, primeiro      # address of string to print
syscall          # print the string
li $v0,5  #armazenar valor de n
syscall
add $s0,$zero,$v0 #valor de n no s0
li $v0, 4        # system call code for print_str
la $a0, segundo      # address of string to print
syscall          # print the string
li $v0,5  #armazenar valor de n
syscall
add $s1,$zero,$v0 #valor de n no s1
sw $s0,0($a1)    #salvar n no M1
sw $s1,0($a2)    #salvar n no M2
slti $t0,$s0,-1019 #s0 >-1020->t0=0
slti $t1,$s0,-5    #s0 <-5->t1=1
bne $t0,$t1,confimar1 #0=!1 ->confimar1
slti $t3,$s0,149   #s0>150->t3=0
beq $t3,$zero,confimar2
slti $t0,$s1,-1019 #s1 >-1020->t0=0
slti $t1,$s1,-5    #s1 <-5->t1=1
bne $t0,$t1,confimar1 #0=!1 ->confimar1
slti $t3,$s1,149   #s1>150->t3=0
beq $t3,$zero,confimar2
addi $s2,$s2,2  #adionar 2 do total de numeros
j loop

confimar1:
addi $t4,$zero,2
slti $t3,$s0,149   #s0>150->t3=0
beq $t3,$zero,confimar4
slti $t3,$s1,149   #s1>150->t3=0
beq $t3,$zero,confimar4
beq $t4,$t5,saida
addi $s2,$s2,2  #adionar 2 do total de numeros
j loop

confimar2:
addi $t5,$zero,2
slti $t0,$s1,-1019 #s1 >-1020->t0=0
slti $t1,$s1,-5    #s1 <-5->t1=1
bne $t0,$t1,confimar3 #0=!1 ->confimar1
slti $t0,$s0,-1019 #s0 >-1020->t0=0
slti $t1,$s0,-5    #s0 <-5->t1=1
bne $t0,$t1,confimar3 #0=!1 ->confimar1
beq $t4,$t5,saida
addi $s2,$s2,2  #adionar 2 do total de numeros
j loop

confimar3:
beq $t4,$t5,saida

confimar4:
beq $t4,$t5,saida

saida:
addi $s2,$s2,2  #adionar 2 do total de numeros
li $v0, 4        # system call code for print_str
la $a0, valor      # address of string to print
syscall          # print the string
li $v0, 1        # system call code for print_int
move $a0,$s2       # integer to print 
syscall          # print it
add $v0,$zero,$s2 #output v0=s2


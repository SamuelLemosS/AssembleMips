trocaNota:
  #nao sei o motivo mas quando imprime um numero alto de textos para de funcionar o print dos textos, mas a logica ta 100%
addi $sp,$sp,-32
sw $ra,0($sp)
sw $a0,4($sp)
sw $a1,8($sp)
sw $a2,12($sp)
sw $t0,16($sp)
sw $t1,20($sp)
sw $t2,24($sp)
sw $t3,28($sp)

          .data
  quantidade: .asciiz "Digite a quantidade de alunos(n):"
  arquitetura:  .asciiz "\nDigite a nota de aruitetura:"
  circuitos:  .asciiz "\nDigite a nota de ciruitos:"
  arquiteturaC:  .asciiz "\nNota correta de aruitetura:"
  circuitosC:  .asciiz "\nNota correta de circuitos:"
  space:  .asciiz " "
        .text
        li $v0, 4        # system call code for print_str
        la $a0, quantidade      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de n
	syscall
	add $t0,$zero,$v0 #valor de n no t0

lui $a1,0x1001
addi $a1,$a1,0x0040  #endereco de arquitetura
lui $a2,0x1001 
addi $a2,$a2,0x0060   #endereco de circuitos	

receberArquitetura:
li $v0, 4        # system call code for print_str
la $a0, arquitetura     # address of string to print
syscall          # print the string
li $v0,5        #armazenar valor
syscall
add $t2,$zero,$v0
sw $t2,0($a1)   #valor no array
addi $a1,$a1,4    #mudar bit do array 
addi $t1,$t1,1    
bne $t0,$t1,receberArquitetura   #quantidae de loop=t1 -> soma
addi $t1,$zero,0
j receberCircuito

receberCircuito:
li $v0, 4        # system call code for print_str
la $a0, circuitos     # address of string to print
syscall          # print the string
li $v0,5        #armazenar valor
syscall
add $t2,$zero,$v0
sw $t2,0($a2)   #valor no array
addi $a2,$a2,4    #mudar bit do array 
addi $t1,$t1,1    
bne $t0,$t1,receberCircuito   #quantidae de loop =t1 -> soma
add $s3,$zero,$t1  #n para s3
add $t1,$t1,$t1   #dobrar t1
add $t1,$t1,$t1   #t1 em bits
sub $a1,$a1,$t1   #voltar a1 para o primeiro termo
sub $a2,$a2,$t1   #voltar a2 para o primeiro termo
#addi $a2,$a2,-4  #apagar bit vazio
j trocar

trocar:
beq $t1,$zero,saida  #quantidade de loop=n ->saida
lw $t2,0($a1)    #valor de arquiitetura para t2
lw $t3,0($a2)    #valor de circuito para t3
sw $t3,0($a1)    #valor de circuiito para arquitetura
sw $t2,0($a2)    #valor de arquiitetura para circuito
slt $s5,$s6,$s7  #valor de a>=b ->0
add $a1,$a1,4    #proxima nota de arquitetura
add $a2,$a2,4    #proxima nota de circuito
addi $t1,$t1,-4  
j trocar

saida:
add $t0,$t0,$t0   #dobrar t0
add $t0,$t0,$t0   #t0 em bits
sub $a1,$a1,$t0   #voltar a1 para o primeiro termo
sub $a2,$a2,$t0   #voltar a2 para o primeiro termo
add $t1,$zero,$t0  
li $v0, 4        # system call code for print_str
la $a0, arquiteturaC      # address of string to print
syscall          # print the string
notaArquitetura:
lw $t2,0($a1)   #salvar valor de aruitetura em t2
li $v0, 1        # system call code for print_int
move $a0,$t2       # integer to print meida
syscall          # print it
li $v0, 4        # system call code for print_str
la $a0, space      # address of string to print
syscall          # print the string
addi $t0,$t0,-4 #loop -4 bits
addi $a1,$a1,4  #proxima nota de arquitetura
bne $t0,$zero,notaArquitetura
li $v0, 4        # system call code for print_str
la $a0, circuitosC      # address of string to print
syscall          # print the string
notaCircuito:
lw $t2,0($a2)   #salvar valor de circuitos em t2
li $v0, 1        # system call code for print_int
move $a0,$t2       # integer to print 
syscall          # print it
li $v0, 4        # system call code for print_str
la $a0, space      # address of string to print
syscall          # print the string
addi $t1,$t1,-4 #loop -4 bits
addi $a2,$a2,4  #proxima nota de arquitetura
bne $t1,$zero,notaCircuito

lw $ra,28($sp)
lw $a0,24($sp)
lw $a1,20($sp)
lw $a2,16($sp)
lw $t0,12($sp)
lw $t1,8($sp)
lw $t2,4($sp)
lw $t3,0($sp)
addi $sp,$sp,32
jr $ra



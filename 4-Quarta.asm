  #nao sei o motivo mas quando imprime um numero alto de textos para de funcionar o print dos textos, mas a logica ta 100%  
          .data
  quantidade: .asciiz "Digite a quantidade de numeros do arrray(n):"
  a:  .asciiz "\nDigite o valor do array A[]:"
  b:  .asciiz "\nDigite o valor do array B[]:"
  valor:  .asciiz "\nQuantidade de valores de C[]:"
  saidac:  .asciiz "\nOs valores do array C[] sao:"
  space:  .asciiz " "
        .text
        li $v0, 4        # system call code for print_str
        la $a0, quantidade      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de n
	syscall
	add $s0,$zero,$v0 #valor de n no s0

lui $a1,0x1001
addi $a1,$a1,0x0040  #endereco de A
lui $a2,0x1001 
addi $a2,$a2,0x0060   #endereco de B	
lui $a3,0x1001
addi $a3,$a3,0x0080   #endereco de C

receberA:
li $v0, 4        # system call code for print_str
la $a0, a     # address of string to print
syscall          # print the string
li $v0,5        #armazenar valor
syscall
add $s2,$zero,$v0
sw $s2,0($a1)   #valor no array
addi $a1,$a1,4    #mudar bit do array 
addi $s1,$s1,1    
bne $s0,$s1,receberA   #quantidae de numeros da media=s1 -> soma
addi $s1,$zero,0
j receberB

receberB:
li $v0, 4        # system call code for print_str
la $a0, b     # address of string to print
syscall          # print the string
li $v0,5        #armazenar valor
syscall
add $s2,$zero,$v0
sw $s2,0($a2)   #valor no array
addi $a2,$a2,4    #mudar bit do array 
addi $s1,$s1,1    
bne $s0,$s1,receberB   #quantidae de numeros da media=s1 -> soma
j copiarC

copiarC:
add $s3,$zero,$s1  #n para s3
add $s1,$s1,$s1   #dobrar s1
add $s1,$s1,$s1   #s1 em bits
sub $a1,$a1,$s1   #voltar a1 para o primeiro termo
addi $a2,$a2,-4  #apagar bit vazio
comparar:
beq $s3,$s4,saida  #quantidade de loop=n ->saida
beq $s4,5,saida  #quantidade de loop=5 ->saida
lw $s6,0($a1)    #valor de A[] para s6
lw $s7,0($a2)    #valor de B[] para s7
slt $s5,$s6,$s7  #valor de a>=b ->0
add $a1,$a1,4    #proximo bit de A
add $a2,$a2,-4    #antecessor bit de B
add $s4,$s4,1    #loop +1
beq $s5,0,addA
beq $s5,1,addB

addA:
sw $s6,0($a3)  #valor de A(s6) para C[]
addi $a3,$a3,4 #mudar bit de C
j comparar

addB:
sw $s7,0($a3)  #valor de B(s7) para C[]
addi $a3,$a3,4  #mudar bit de C
j comparar

saida:
addi $a3,$a3,-4  #apagar bit vazio
li $v0, 4        # system call code for print_str
la $a0, valor      # address of string to print
syscall          # print the string
li $v0, 1        # system call code for print_int
move $a0,$s4        # integer to print meida
syscall          # print it
li $v0, 4        # system call code for print_str
la $a0, saidac      # address of string to print
syscall          # print the string
imprimirC:
lw $t1,0($a3)   #salvar valor de C em t1
li $v0, 1        # system call code for print_int
move $a0,$t1       # integer to print meida
syscall          # print it
li $v0, 4        # system call code for print_str
la $a0, space      # address of string to print
syscall          # print the string
addi $s4,$s4,-1 #loop -1
addi $a3,$a3,-4  #antececor valor c
bne $s4,$zero,imprimirC



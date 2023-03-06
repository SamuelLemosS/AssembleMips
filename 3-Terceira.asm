    
          .data
  n:  .asciiz "Digite o valor de 'n':"
  x:  .asciiz "\nDigite o valor de 'x'(valor inicial):"
  y:  .asciiz "\nDigite o valor de 'y'(razao):"
  termo: .asciiz "\nO valor da PG que supera 'n': "
  soma: .asciiz ". A soma dos termos da PG(antes de x superar n): "
  quantidade:.asciiz". O numeros de termos da PG(antes de x superar n): "
        .text
        li $v0, 4        # system call code for print_str
        la $a0, n      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de n
	syscall
	add $a1,$zero,$v0 #valor de n no a1
	
	li $v0, 4        # system call code for print_str
        la $a0, x      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de x
	syscall
	add $s1,$zero,$v0 #valor de x no s1
		
	li $v0, 4        # system call code for print_str
        la $a0, y      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de y
	syscall
	add $s2,$zero,$v0 #valor de y no s2


Pg:
slt $s0,$s1,$a1       #x>=n -> s0=0
beq $s0,$zero,saida   #0=0 -> saida
add $s3,$s3,$s1      #x+soma
addi $s6,$s6,1       #quantidade de termos +1
add $s4,$zero,$s2    #quantidade de vezes que precisa somar
addi $s4,$s4,-1      #total de soma -1
add $s5,$zero,$s1    #para somar x com x0
multi:
add $s1,$s1,$s5      #x0+xn
addi $s4,$s4,-1      #total de soma -1
bne $s4,$zero,multi  #total de soma != 0 ->mult
bne $s0,$zero,Pg     #total de soma ==0 -> Pg
saida:

li $v0, 4        # system call code for print_str
la $a0, termo      # address of string to print
syscall          # print the string
li $v0, 1        # system call code for print_int
move $a0,$s1        # integer to print x
syscall          # print it

 li $v0, 4        # system call code for print_str
 la $a0, soma      # address of string to print
 syscall          # print the string
 li $v0, 1        # system call code for print_int
move $a0,$s3        # integer to print soma
syscall          # print it
 
 li $v0, 4        # system call code for print_str
 la $a0, quantidade      # address of string to print
 syscall          # print the string
 li $v0, 1        # system call code for print_int
move $a0,$s6        # integer to print quantdade
syscall          # print 

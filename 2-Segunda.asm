    
        .data
  n:  .asciiz "Digite o valor de 'n':"
  x:  .asciiz "\nDigite o valor de 'x'(valor inicial):"
  y:  .asciiz "\nDigite o valor de 'y'(razao):"
  termo: .asciiz "\nO valor da PA que supera 'n': "
  soma: .asciiz ". A soma dos termos da PA(antes de x superar n): "
  quantidade:.asciiz". O numeros de termos da PA(antes de x superar n): "
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
	

Pa:
slt $s0,$s1,$a1        #x>=n  = 0
beq $s0,$zero,saida    #=0 saida
add $s3,$s3,$s1        #x+soma
addi $s4,$s4,1         #quantidade de termos
add $s1,$s1,$s2        #x+y
j Pa
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
move $a0,$s4        # integer to print quantdade
syscall          # print it

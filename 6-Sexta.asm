
Formula:
addi $sp,$sp,-32
sw $ra,0($sp)
sw $a0,4($sp)
sw $a1,8($sp)
sw $a2,12($sp)
sw $a3,16($sp)
sw $t0,20($sp)
sw $t1,24($sp)
sw $t2,28($sp)

          .data
  formula: .asciiz "Dada a formula:Z=[A/(BY)]^X"
  A:  .asciiz "\nDigite ovalor de A: "
  B:  .asciiz "\nDigite ovalor de B: "
  X:  .asciiz "\nDigite ovalor de X: "
  Y:  .asciiz "\nDigite ovalor de Y: "
  Z:  .asciiz "\nO valor de Z:  "
        .text
        li $v0, 4        # system call code for print_str
        la $a0, formula      # address of string to print
        syscall          # print the string
        li $v0, 4        # system call code for print_str
        la $a0, B      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de B
	syscall
	add $a1,$zero,$v0 #valor de B no a1
	 li $v0, 4        # system call code for print_str
        la $a0, X      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de X
	syscall
	add $a2,$zero,$v0 #valor de X no a2
	 li $v0, 4        # system call code for print_str
        la $a0, Y      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de Y
	syscall
	add $a3,$zero,$v0 #valor de Y no a3
	li $v0, 4        # system call code for print_str
        la $a0, A      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de A
	syscall
	add $a0,$zero,$v0 #valor de A no a0
	
add $t0,$zero,$a0  #A para t0
add $a0,$zero,$a3  #Y para a0
add $t2,$zero,$a1  #valor inicial da mult
addi $a0,$a0,-1    #-1 da sama inical

MULT:
add $a1,$a1,$a2    #soma
addi $a0,$a0,-1    #-1 lopp
bne $a0,$zero,MULT  #loop =! 0 ->mult
add $v0,$zero,$a1   #valor da mult no v0
add $t1,$zero,$a2  #X para t1
add $a2,$zero,$t0   #A para a2
add $a3,$zero,$v0   #BY para a3
addi $t2,$zero,0   #zerando t2
addi $v0,$zero,0   #zerando v0


DIV:
slt $t2,$a2,$a3   #A>=BY -> t2=0
bne $t2,$zero,saiDiv  
sub $a2,$a2,$a3   
addi $v0,$v0,1
j DIV  

saiDiv:
add $a0,$zero,$v0   #A/BY para a0
add $a1,$zero,$t1    #X para a1
add $t0,$zero,$a0   #t0=base

POT:
add $t1,$zero,$t0   #t1=base
add $t2,$zero,$a0  #valor inicial da mult

MULTp:
add $a0,$a0,$t2    #soma
addi $t1,$t1,-1    #-1 lopp
#slt $a3,$t1,$zero #valor decimal
bne $t1,1,MULTp  #loop =! 1 ->multp
addi $a1,$a1,-1
beq $a1,1,saida
j POT
                     
saida:
add $t0,$zero,$a0  #uso do t0, pois o v0 ou a0 da bug no print
li $v0, 4        # system call code for print_str
la $a0, Z      # address of string to print
syscall          # print the string
li $v0, 1        # system call code for print_int
move $a0,$t0       # integer to print 
syscall          # print it
add $v0,$zero,$t0 #output v0=t0

lw $ra,28($sp)
lw $a0,24($sp)
lw $a1,20($sp)
lw $a2,16($sp)
lw $a3,12($sp)
lw $t0,8($sp)
lw $t1,4($sp)
lw $t2,0($sp)
addi $sp,$sp,32
jr $ra




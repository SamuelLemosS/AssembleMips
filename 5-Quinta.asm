    
          .data
  resu: .asciiz "\nA media dos numeros dados:"
  n:  .asciiz "Digite quantos numeros vai ter a media:"
  valor:  .asciiz "\nDigite o valor:"
        .text
        li $v0, 4        # system call code for print_str
        la $a0, n      # address of string to print
        syscall          # print the string
        li $v0,5  #armazenar valor de n
	syscall
	add $s0,$zero,$v0 #valor de n no s0

lui $t0,0x1001
addi $t0,$t0,0x0040	
media:
li $v0, 4        # system call code for print_str
la $a0, valor     # address of string to print
syscall          # print the string
li $v0,5        #armazenar valor
syscall
add $s2,$zero,$v0
sw $s2,0($t0)   #valor no array
addi $t0,$t0,4    #mudar bit do array 
addi $s1,$s1,1    
beq $s0,$s1,soma   #quantidae de numeros da media=s1 -> soma
j media

soma:
beq $s1,$zero,div
addi $t0,$t0,-4   #mudar bit do arrray
addi $s1,$s1,-1   
lw $s3,0($t0)  #s3 reebe valor do array
add $s4,$s4,$s3  #1 numero do array soma com o resto
j soma

div:
slt $s5,$s4,$s0
bne $s5,$zero,saida
sub $s4,$s4,$s0
addi $s6,$s6,1
j div

saida:
li $v0, 4        # system call code for print_str
la $a0, resu      # address of string to print
syscall          # print the string
li $v0, 1        # system call code for print_int
move $a0,$s6        # integer to print meida
syscall          # print it


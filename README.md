# AssembleMips

1) Suponha que tenha havido um erro na divulgação das notas dos alunos de Arquitetura e Organização de
Computadores, com as notas de Circuitos Digitais. Um aluno da turma de arquitetura foi convidado a
fazer um programa de modo a corrigir a falha. Supondo que a quantidade de alunos é n e que este valor
está inicialmente armazenado em $a0, que o endereço-base do array das notas de arquitetura e
organização de computadores está associado ao registrador $a1 e que o endereço-base do array de notas
de circuitos digitais está associado ao registrador $a2, pede-se a elaboração do programa. O programa
deverá ser feito como um procedimento, para que possa ser usado por outros programas, o qual deve
seguir todas as regras do Mips para salvamento em pilha dos registradores. É permitida a escolha de
qualquer registrador na elaboração do programa, desde que siga as regras do Mips aplicadas aos
registradores e aos procedimentos.

2) Suponha que n, um inteiro positivo qualquer, é usado como entrada de um programa que executa uma
P.A, durante a execução do código. Suponha que o valor inicial da P.A. seja x e a razão seja y, também a
serem definidos durante a execução do programa. Mostre na tela do simulador o termo da P.A. que supera
o valor de n, e também a quantidade de termos da P.A. e a soma dos termos da P.A., anteriores a esta
ocorrência, na tela do simulador.
3) Suponha que n, um inteiro positivo qualquer, é usado como entrada de um programa que executa uma
P.G, durante a execução do código. Suponha que o valor inicial da P.G. seja x e a razão seja y, também a
serem definidos durante a execução do programa. Mostre na tela do simulador o termo da P.G. que supera
o valor de n, e também a quantidade de termos da P.G. e a soma dos termos da P.G., anteriores a esta
ocorrência, na tela do simulador.
4) Um procedimento lê palavras de dois bancos de dados, A[ ] e B[ ], cujos endereços-base já estão
armazenados em $a1 e em $a2, respectivamente. O procedimento lê as palavras do banco A[ ] de um
modo crescente e as palavras do banco B[ ] de um modo decrescente, uma a uma e as compara, a partir
do endereço inicial. Isto é, primeiro elemento de A[ ] é comprado com o último de B[ ], o segundo
elemento de A[ ] é comparado com o penúltimo elemento de B[ ], e assim sucessivamente. Os elementos
de A[ ] e B[ ] são comparados e copiados para um terceiro banco C[ ], cujo o endereço base está
armazenado em $a3, de acordo com as seguintes regras: a) Caso o elemento do banco A[ ] seja maior do
que o elemento do banco B[ ], o elemento de A[ ] é copiado em C[ ]; b) Caso o elemento de A[ ] seja
menor do que o de B[ ], o elemento de B[ ] é copiado em C[ ]. A comparação termina quanto um dos
elementos de A[ ] ou B[ ] for igual a 5 ou o número de elementos for n, a ser definido durante a
execução. Quantos elementos de A[ ] e B[ ]são copiados para o banco C [ ]?
5) Escreva um programa em linguagem de montagem do Mips que execute o cálculo da média aritmética de
um vetor de inteiros com n números a ser definido durante a execuçao.
6) Desenvolver através das regras do mips de modo eficiente e usando pilha, o trecho de código
correspondente a expressão Z= [(A)/(BY)] X . As variáveis A, B, X e Y de entrada são passadas pela
rotina chamadora deste trecho de código através dos registradores $A0, $A1, $A2 e $A3,
respectivamente, isto é, A$a0, B$a1, X$a2 e Y$a3. A variável de saída Z é retornada pelo
registrador $V0 para a rotina chamadora. As funções MULT, DIV e POT que precisam ser
implementadas, possuem interfaces conforme descrito abaixo. Execute a expressão passando os
parâmetros necessários para as funções, usando o conceito de pilha de acordo com o Mips de um modo
eficiente. Não utilizar os registradores $Si para i=0,....7
MULT: /* Multiplicação*/ DIV: /* Divisão */ POT:/*Potenciação*/
Input : $a1 //multiplicador Input: $a2 //dividendo Input: $a0 //Base
$a0//multiplicando $a3 //divisor $a1 //expoente

Output: $v0 Output: $v0 Output: $v0

7) Um determinado programa procura copiar um determinado número de palavras num processador
Mips de 32bits, duas palavras por vez, armazenadas a partir de um endereço M1 para um endereço
M2 a serem definidos durante a execução do programa. O número de palavras copiadas devem ser
armazenadas em $v0. O programa para de copiar quando uma das palavras for maior do que -1020 e
menor do que -5, e a outra palavra for maior do que 150. As palavras finais devem ser copiadas, mas
não devem ser contadas.

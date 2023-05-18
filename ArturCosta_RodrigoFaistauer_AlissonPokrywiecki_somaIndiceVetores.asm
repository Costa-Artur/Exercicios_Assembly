# Disciplina: Arquitetura e Organização de Computadores
# Atividade: Avaliação 03 – Programação de Procedimentos
# Grupo: 	- Artur Costa de Souza
# 		- Rodrigo Faistauer dos Santos
#		- Alisson Pokrywiecki da Silva

.data
	
	vetor: .word 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99
	digitaNum: .asciz "Digite o numero: "
	escreveSoma: .asciz "A soma e: "
	mensagemErro: .asciz "Valor Invalido! \n"
	espaco: .asciz "\n"
	
.text

	j main
	
somaVetor:
	
	addi sp, sp, -16
	sw s3, 12(sp)
	sw s2, 8(sp)
	sw s1, 4(sp)
	sw ra, 0(sp)
	
	li t0, 0
	
loopSoma:

	bge t0, s2, endLoopSoma
	
	slli t1, t0, 2 # i*4
	add a1, s1, t1
	lw a0, 0(a1)
	
	add s3, s3, a0
	addi t0, t0, 1 # i++
	
	j loopSoma  

endLoopSoma:

	addi a7, zero, 4
	la a0, escreveSoma
	ecall	
	
	add a0, zero, s3
	li a7, 1
	ecall

	lw ra, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	lw s3, 12(sp)
	
	addi sp, sp, 16
	
	jalr ra, 0
	
	
erro:
	addi a7, zero, 4
	la a0, mensagemErro
	ecall	
	
	j main
main:
	
	addi a7, zero, 4
	la a0, digitaNum
	ecall
	
	addi a7, zero, 5
	ecall
	add t0, zero, a0
	
	li t1, 2
	blt t0, t1, erro
	li t1, 100
	bgt t0, t1, erro
	
	la s1, vetor # endereço base do vetor
	add s2, zero, t0 #s2 = numero do vetor para somar
	addi s3, zero, 0 #s3 = soma recebe 0
	
	jal ra, somaVetor
	
	
	
	
	

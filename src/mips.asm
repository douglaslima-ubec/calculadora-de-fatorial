.text
input:
	li $v0, 5
	syscall
	# move o valor do registrador $t2 para $t1
	move $s0, $v0
	j calculaFatorial
calculaFatorial:
	# inicializa $t0 com valor 1
	li $t0, 1
	while:
		# compara se são iguais e, caso afirmativo, pula a execução para a label indicada
		beq $s0, 0, output
		# multiplicação com overflow (pseudoinstrução)
		# mulo rd, rt, rs
		mulo $t0, $t0, $s0
		sub $s0, $s0, 1
		# pula a execução para a label incondicionalmente
		j while
output:
	li $v0, 1
	move $a0, $t0
	syscall
	j end
end:
	li $v0, 10
	syscall
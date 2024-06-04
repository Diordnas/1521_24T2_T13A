# Simple factorial calculator - without error checking

main:
	# n in $t0
	# fac in $t1
	# i in $t2

	la	$a0, prompt_str		# printf("n  = ")
	li	$v0, 4			# mode 4: print_str
	syscall

	li	$v0, 5			# scanf("%d", &n)
	syscall				# mode 5: read_int
	move	$t0, $v0

fac_init:
	li	$t1, 1			# fac = 1
	li	$t2, 1			# i = 1
fac_cond:
	bgt	$t2, $t0, fac_end	# while i <= n {
fac_body:
	mul	$t1, $t1, $t2		#     fac *= i
fac_step:
	add	$t2, $t2, 1		#     i += 1
	b	fac_cond		# }
fac_end:

	la	$a0, result_str		# printf("n! = ")
	li	$v0, 4			# mode 4: print_str
	syscall

	move	$a0, $t1		# printf("%d", fac)
	li	$v0, 1			# mode 1: print_int
	syscall

	li	$a0, '\n'		# printf("\n")
	li	$v0, 11			# mode 11: print_char
	syscall

	jr	$ra			# return

	.data
prompt_str:
	.asciiz "n  = "
result_str:
	.asciiz "n! = "
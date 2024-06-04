

main:
	# i in $t0
	# j in $t1

row_init:
	li	$t0, 1			# i = 1

row_cond:
	bgt	$t0, 10, row_end	# while i <= 10 {

row_body:
col_init:
	li	$t1, 0			# j = 0

col_cond:
	bge	$t1, $t0, col_end	# while j <= i {

col_body:
	li	$a0, '*'		# printf("*")
	li	$v0, 11			# mode 11: print_char
	syscall

col_step:
	add	$t1, $t1, 1		# j++
	b	col_cond		# }

col_end:
	li	$a0, '\n'		# printf("\n")
	li	$v0, 11			# mode 11: print_char
	syscall

row_step:
	add	$t0, $t0, 1		# i++
	b	row_cond		# }

row_end:
	jr	$ra			# return
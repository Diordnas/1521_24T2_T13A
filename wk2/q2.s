# Prints the square of a number

SQUARE_MAX = 46340

main:
	# x in $t0
	# y in $t1

	la	$a0, prompt_str			# printf("Enter a number: ")
	li	$v0, 4				# mode 4: print_str
	syscall

	li	$v0, 5				# scanf("%d", &x)
	syscall					# mode 5: read_int
	move	$t0, $v0
	
	ble	$t0, SQUARE_MAX, x_is_ok	# if (x <= SQUARE_MAX) goto x_is_ok

x_is_too_big:
	la	$a0, error_str			# printf("square too big for 32 bits\n")
	li	$v0, 4				# mode 4: print_str
	syscall

	b	end_if				# goto end_if

x_is_ok:
	mul	$t1, $t0, $t0			# y = x * x

	move	$a0, $t1			# printf("%d", y)
	li	$v0, 1				# mode 1: print_int
	syscall

	li	$a0, '\n'			# printf("\n")
	li	$v0, 11				# mode 11: print_char
	syscall

end_if:
	jr	$ra		#		 return

	.data
prompt_str:
	.asciiz "Enter a number: "
error_str:
	.asciiz "square too big for 32 bits\n"
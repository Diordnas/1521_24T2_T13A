# Print every third number from 24 to 42.

main:
	# x in $t0

loop_init:
	li	$t0, 24			# int x = 24

loop_cond:
	bge	$t0, 42, loop_end	# while x < 42 {

loop_body:
	move	$a0, $t0		#     printf("%d", x)
	li	$v0, 1			#     mode 1: print_int
	syscall

	li	$a0, '\n'		#     printf("\n")
	li	$v0, 11			#     mode 11: print_char
	syscall

loop_step:
	add	$t0, $t0, 3		#     x += 3
	b	loop_cond		# }

loop_end:

	jr	$ra			# return
# A simple program that will print 10 numbers from an array

N_SIZE = 10

main:
	# i in $t0

loop_init:
	li	$t0, 0			# i = 0
loop_cond:
	bge	$t0, N_SIZE, loop_end	# while (i < N_SIZE) {
loop_body:
					# this is a slightly simpler method for calculating array addresses
	mul	$t1, $t0, 4		# multiply i * 4 because word = 4 bytes
	lw	$a0, numbers($t1)	# load word from numbers[i] into a register
	li	$v0, 1			# printf(numbers[i])
	syscall				# mode 1: print_int

	li	$a0, '\n'		# printf('\n')
	li	$v0, 11			# mode 11: print_char
	syscall

loop_incr:
	add	$t0, $t0, 1		# i++
	b	loop_cond		# }
loop_end:

	jr	$ra			# return


	.data
numbers:
	# this is an array of words
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
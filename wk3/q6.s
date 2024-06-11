# A simple program that adds 42 to each element of an array

N_SIZE = 10

main:
	# i in $t0
	# numbers[i] in $t1
	# address calculation in $t2

modify_numbers_init:
	li	$t0, 0			# i = 0
modify_numbers_cond:			# while i < N_SIZE {
	bge	$t0, N_SIZE, modify_numbers_end
modify_numbers_body:
	mul	$t2, $t0, 4		# &numbers[i]
	lw	$t1, numbers($t2)	# = &numbers + (i * 4)

	bge	$t1, 0, num_is_positive	# if numbers[i] is negative:

	add	$t1, $t1, 42		# numbers[i] += 42
	sw	$t1, numbers($t2)
num_is_positive:
modify_numbers_step:
	add	$t0, $t0, 1		# i++
	b	modify_numbers_cond	# }
modify_numbers_end:
	jr	$ra			# return

	.data
numbers:
	.word 0, 1, 2, -3, 4, -5, 6 , -7, 8, 9
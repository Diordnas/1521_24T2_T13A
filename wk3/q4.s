# A simple program that will read 10 numbers into an array

N_SIZE = 10

main:
	# i in $t0
loop_init:
	li	$t0, 0			# i = 0
loop_cond:
	bge	$t0, N_SIZE, loop_end	# while (i < N_SIZE) {
loop_body:
	li	$v0, 5			# scanf("%d", &numbers[i])
	syscall				# mode 5: print_int

					# this is the way lecturers and provided code will calculate addresses
	la	$t1, numbers		# calculate the address of numbers
	mul	$t2, $t0, 4		# multiply index by 4 because each array element is four bytes
	add	$t1, $t1, $t2		# add modified index to address of start of array
	sw	$v0, ($t1)		# store the value we read in at the address we calculated
loop_incr:
	add	$t0, $t0, 1		# i++
	b	loop_cond		# }
loop_end:
	jr	$ra			# return


	.data
numbers:
	# this is an array of words
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
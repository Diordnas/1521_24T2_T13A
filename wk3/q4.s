# A simple program that will read 10 numbers into an array

N_SIZE = 10

main:
	# i in $t0

load_array_init:
	li	$t0, 0
load_array_cond:
	bge	$t0, N_SIZE, load_array_end
load_array_body:
	li	$v0, 5
	syscall

	mul	$t1, $t0, 4		# &numbers[i]
	sw	$v0, numbers($t1)	# = &numbers + (i * 4)
load_array_step:
	add	$t0, $t0, 1
	b	load_array_cond
load_array_end:
	jr	$ra

	.data
numbers:
	.space 4 * N_SIZE
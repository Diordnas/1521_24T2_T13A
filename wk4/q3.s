
FLAG_ROWS = 6
FLAG_COLS = 12

main:
	# row in $t0
	# col in $t1
	# flag[row][col] in $t2
	# temp address calculation in $t3

row_loop_init:
	li	$t0, 0
row_loop_cond:
	bge	$t0, FLAG_ROWS, row_loop_end
row_loop_body:

col_loop_init:
	li	$t1, 0
col_loop_cond:
	bge	$t1, FLAG_COLS, col_loop_end
col_loop_body:

					# &flag[row][col] = &flag +
	mul	$t3, $t0, FLAG_COLS	# row * num_cols
	add	$t3, $t3, $t1		# + col
	mul	$t3, $t3, 1		# * 1
	lb	$t2, flag($t3)

	move	$a0, $t2
	li	$v0, 11
	syscall

col_loop_step:
	add	$t1, $t1, 1
	b	col_loop_cond
col_loop_end:
	li	$a0, '\n'
	li	$v0, 11
	syscall

row_loop_step:
	add	$t0, $t0, 1
	b	row_loop_cond
row_loop_end:


	jr $ra


	.data
flag:
	.ascii "#####..#####"
	.ascii "#####..#####"
	.ascii "............"
	.ascii "............"
	.ascii "#####..#####"
	.ascii "#####..#####"
# This program prints out a danish flag, by
# looping through the rows and columns of the flag.
# Each element inside the flag is a single character.
# (i.e., 1 byte).
#
# (Dette program udskriver et dansk flag, ved at
# sløjfe gennem rækker og kolonner i flaget.)
#

FLAG_ROWS = 6
FLAG_COLS = 12

main:
	# row in $t0
	# col in $t1

row_loop_init:
	li	$t0, 0				# row = 0

row_loop_cond:
	bge	$t0, FLAG_ROWS, row_loop_end	# while (row < FLAG_ROWS) {

row_loop_body:
col_loop_init:
	li	$t1, 0				# col = 0

col_loop_cond:
	bge	$t1, FLAG_COLS, col_loop_end	# while (col < FLAG_COLS) {

col_loop_body:					# calculating offset to flag[row][col]
	mul	$t2, $t0, FLAG_COLS		# row * num_cols
	add	$t2, $t2, $t1			# + col
	mul	$t2, $t2, 1			# * 1
	lb	$a0, flag($t2)			# this is different to how they calculate array addresses in lectures
						# use whichever approach you like, but stay consistent!

	li	$v0, 11				# print(flag[row][col])
	syscall					# mode 11: print_char

col_loop_incr:
	add	$t1, $t1, 1			# col++
	b	col_loop_cond			# }

col_loop_end:
	li	$a0, '\n'			# print("\n")
	li	$v0, 11				# mode 11: print_char
	syscall

row_loop_incr:
	add	$t0, $t0, 1			# row++
	b	row_loop_cond			# }

row_loop_end:

	jr	$ra				# return


.data
# This label inside the data region refers to the bytes of the flag.
# Note that even thought the bytes are listed on separate lines,
# they are actually stored as a single contiguous chunk or 'string' in memory.
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
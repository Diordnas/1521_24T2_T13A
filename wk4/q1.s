main:
	begin
	push	$ra

	# result in $t0

	li	$a0, 11		# result = sum4(11, 13, 17, 19)
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4
	move	$t0, $v0

	move	$a0, $t0	# print(result)
	li	$v0, 1		# mode 1 : print_int
	syscall

	li	$a0, '\n'	# print("\n")
	li	$v0, 11		# mode 11 : print_char
	syscall

	pop	$ra
	end

	li	$v0, 0		# return 0
	jr	$ra

# sum4 returns the sum of 4 arguments
#
# args:
# 	$a0 - a
# 	$a1 - b
# 	$a2 - c
# 	$a3 - d
#
# returns:
#	$v0 -> the sum of the 4 arguments
#
# locals:
# 	res1 in $s4
# 	res2 in $s5
sum4:

sum4__proglogue:
	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2
	push	$s3
	push	$s4
	push	$s5

	move	$s0, $a0
	move	$s1, $a1
	move	$s2, $a2
	move	$s3, $a3

sum4__body:
	jal	sum2		# res1 = sum2(a, b)
	move	$s4, $v0

	move	$a0, $s2	# res2 = sum2(c, d)
	move	$a1, $s3
	jal	sum2
	move	$s5, $v0

	move	$a0, $s4	# return sum2(res1, res2)
	move	$a1, $s5
	jal	sum2

sum4__epilogue:
	pop	$s5
	pop	$s4
	pop	$s3
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

	jr	$ra


# sum2 returns the sum of 2 arguments
sum2:
	# args:
	# $a0 - x
	# $a1 - y
	move	$t0, $a0	# you might choose to move arguments out of a registers
	move	$t1, $a1

	add	$v0, $t0, $t1	# return x + y
	jr	$ra
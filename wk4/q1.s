# sum 4 numbers using function calls

main:
main__prologue:
	push	$ra

main__body:
	li	$a0, 11
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4
	move	$a0, $v0

	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

main__epilogue:
	pop	$ra

	li	$v0, 0
	jr	$ra

sum4:
# function that adds four numbers
# args:
#	$a0 : a
#	$a1 : b
#	$a2 : c
#	$a3 : d
# return value:
#	$v0 : sum of a, b, c, d
# local variables:
#	a in $s0
#	b in $s1
#	c in $s2
#	d in $s3
#	res1 in $s4
#	res2 in $s5
#	return value in $t0
sum4__prologue:
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
	move	$a0, $s0	# res1 = sum2(a, b)
	move	$a1, $s1
	jal	sum2
	move	$s4, $v0

	move	$a0, $s2	# res2 = sum2(c, d)
	move	$a1, $s3
	jal	sum2
	move	$s5, $v0

	move	$a0, $s4	# result = sum2(res1, res2)
	move	$a1, $s5
	jal	sum2
	move	$t0, $v0

sum4__epilogue:
	pop	$s5
	pop	$s4
	pop	$s3
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra

	move	$v0, $t0
	jr	$ra

sum2:
# function that adds two numbers
# args:
#	$a0 : x
#	$a1 : y
# return value:
#	$v0 : sum of x and y
# local variables:
#	x in $t0
#	y in $t1
#	x + y in $t2
sum2__prologue:
	move	$t0, $a0	# move arguments out of
	move	$t1, $a1	# a registers

sum2__body:
	add	$t2, $t0, $t1	# result = x + y

sum2__epilogue:
	move	$v0, $t2	# return result
	jr	$ra
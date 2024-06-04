# char *string = "....";
# char *s = &string[0];
# int   length = 0;
# while (*s != '\0') {
#    length++;  // increment length
#    s++;       // move to next char
# }

main:
main__prologue:
	push	$ra		# put $ra into memory so it
				# doesn't get overridden by jal

main__body:
	la	$a0, string	# put the argument into the a register
	jal	get_str_len	# jump-and-link | call the function

				# you could comment this whole block as:
				# get_str_len(string)

main__epilogue:
	pop	$ra		# always pop in the reverse order to push
	jr	$ra

get_str_len:
get_str_len__prologue:
	# arguments:
	# $a0 : string pointer to get length of
	move	$t0, $a0				# in the prologue, move arguments into proper registers

get_str_len__body:
	# s in $t0
	# length in $t1

get_str_len__loop_init:
	li	$t1, 0					# length = 1
get_str_len__loop_cond:
	lb	$t2, ($t0)				# deref s, load from memory
	beq	$t2, '\0', get_str_len__loop_end	# while (*s != '\0') {
get_str_len__loop_incr:
	add	$t0, $t0, 1				# s++
	add	$t1, $t1, 1				# length++
	b	get_str_len__loop_cond			# }
get_str_len__loop_end:
	move	$v0, $t1				# return length
	jr	$ra					# we return by storing the value we want to return
							# into $v0



	.data
string:
	.asciiz "supercalisticexpialodocious"
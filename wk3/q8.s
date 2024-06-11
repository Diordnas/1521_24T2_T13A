# char *string = "....";
# char *s = &string[0];
# int   length = 0;
# while (*s != '\0') {
#    length++;  // increment length
#    s++;       // move to next char
# }

main:
	push	$ra		# put $ra's original value on the stack

	la	$a0, string_1	# call get_str_len(string_1)
	jal	get_str_len

	move	$a0, $v0	# print the result
	li	$v0, 1		# mode 1: print_int
	syscall

	li	$a0, '\n'	# print '\n'
	li	$v0, 11		# mode 11: print_char
	syscall

	la	$a0, string_1	# call get_str_len(string_2)
	jal	get_str_len

	move	$a0, $v0	# print the result
	li	$v0, 1		# mode 1: print_int
	syscall

	li	$a0, '\n'	# print '\n'
	li	$v0, 11		# mode 11: print_char
	syscall

	pop	$ra		# get $ra's original value from the stack
	jr	$ra		# return

# Gets the length of a null-terminated string
#
# args:
# - $a0: the string
#
# returns:
# - $v0: the length of the string
#
# local variables:
# - s in $t0
# - length in $t1
# - temp in $t2
#
get_str_len:
	move	$t0, $a0			# s is an argument
	li	$t1, 0				# length = 0

get_str_len__while_start:
	lb	$t2, ($t0)			# while *s != '\0' {
	beqz	$t2, get_str_len__while_end
	add	$t0, $t0, 1			# s++
	add	$t1, $t1, 1			# length++
	b	get_str_len__while_start	# }

get_str_len__while_end:
	move	$v0, $t1			# return length
	jr	$ra



	.data
string_1:
	.asciiz "hello everybody"
string_2:
	.asciiz "what's up"
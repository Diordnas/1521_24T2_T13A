# goal code:
# #include <stdio.h>
# 
# int main(void) {
#     int x, y;
# 
#     printf("Enter a number: ");
#     scanf("%d", &x);
# 
#     y = x * x;
# 
#     printf("%d\n", y);
# 
#     return;
# }

main:
	# x in $t0
	# y in $t1

	la	$a0, prompt_str	# printf("Enter a number: ");
	li	$v0, 4		# mode 4: print_string
	syscall

	li	$v0, 5		# scanf("%d", &x);
	syscall			# mode 5: read_int
	move	$t0, $v0

	mul	$t1, $t0, $t0	# y = x *x

	move	$a0, $t1	# printf("%d", y);
	li	$v0, 1		# mode 1: print_int
	syscall

	li	$a0, '\n'	# printf("\n");
	li	$v0, 11		# mode 11: print_char
	syscall

	jr	$ra		# return

	.data
prompt_str:
	.asciiz "Enter a number: "
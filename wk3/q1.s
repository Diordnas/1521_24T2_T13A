

	.data			# 
a:	.word	42		# 4 bytes: 42
b:	.space	4		# 4 empty bytes
c:	.asciiz	"abcde"		# 6 bytes: 'a', 'b', 'c', 'd', 'e', '\0'
	.align 	2		# align to a grid of size 2^2
d: 	.byte	1, 2, 3, 4	# 4 bytes: 1, 2, 3, 4
e: 	.word	1, 2, 3, 4	# 16 bytes: 1, 2, 3, 4
f:	.space	1		# 1 empty byte
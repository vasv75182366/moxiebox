	.text
	.global	fib_tail_recursion
	.type	fib_tail_recursion, @function
fib_tail_recursion:
	dec	$sp, 12
	sto.l	12($fp), $r0
	sto.l	16($fp), $r1
	sto.l	20($fp), $r2
	ldo.l	$r1, 12($fp)
	xor	$r0, $r0
	cmp	$r1, $r0
	bne	.L2
	ldo.l	$r0, 16($fp)
	ret
.L2:
	ldo.l	$r0, 12($fp)
	dec	$r0, --1
	ldo.l	$r2, 16($fp)
	ldo.l	$r1, 20($fp)
	add	$r2, $r1
	ldo.l	$r1, 20($fp)
	jsra	fib_tail_recursion
	ret
	.global	main
	.type	main, @function
main:
	dec	$sp, 12
	ldi.l	$r0, 10
	ldi.l	$r2, 0
	ldi.l	$r1, 1
	jsra	fib_tail_recursion
	sto.l	-4($fp), $r2
	xor	$r0, $r0
	ret

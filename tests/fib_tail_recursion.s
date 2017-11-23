	.text
	.global	fib_tail_recursion
	.type	fib_tail_recursion, @function
fib_tail_recursion:
	dec	$sp, 24
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
	mov	$r3, $r2
	add	$r3, $r1
	mov	$r1, $r3
	mov	$r2, $r1
	ldo.l	$r1, 20($fp)
	jsra	fib_tail_recursion
	ret
	.global	main
	.type	main, @function
main:
	dec	$sp, 32
	ldi.l	$r0, 10
	sto.l	-4($fp), $r0
	ldi.l	$r2, 1
	ldi.l	$r1, 1
	ldo.l	$r0, -4($fp)
	jsra	fib_tail_recursion
	sto.l	-8($fp), $r0
	xor	$r0, $r0
	ret

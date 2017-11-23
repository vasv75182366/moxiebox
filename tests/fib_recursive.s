	.text
	.global	fib_recursive
	.type	fib_recursive, @function
fib_recursive:
	push	$sp, $r6
	dec	$sp, 24
	sto.l	12($fp), $r0
	ldo.l	$r1, 12($fp)
	xor	$r0, $r0
	cmp	$r1, $r0
	bne	.L2
	xor	$r0, $r0
	jmpa	.L3
.L2:
	ldo.l	$r1, 12($fp)
	ldi.l	$r0, 1
	cmp	$r1, $r0
	bne	.L4
	ldi.l	$r0, 1
	jmpa	.L3
.L4:
	ldo.l	$r0, 12($fp)
	dec	$r0, --1
	jsra	fib_recursive
	mov	$r6, $r0
	ldo.l	$r0, 12($fp)
	dec	$r0, --2
	jsra	fib_recursive
	mov	$r1, $r6
	add	$r1, $r0
	mov	$r0, $r1
.L3:
	mov	$r12, $fp
	dec	$r12, 4
	pop	$r12, $r6
	ret
	.global	main
	.type	main, @function
main:
	dec	$sp, 32
	ldi.l	$r0, 10
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	fib_recursive
	sto.l	-8($fp), $r0
	xor	$r0, $r0
	ret

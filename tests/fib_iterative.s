	.text
	.global	fib_iterative
	.type	fib_iterative, @function
fib_iterative:
	dec	$sp, 16
	sto.l	12($fp), $r0
	ldi.l	$r0, -1
	sto.l	-4($fp), $r0
	ldi.l	$r0, 1
	sto.l	-8($fp), $r0
	xor	$r0, $r0
	sto.l	-16($fp), $r0
	xor	$r0, $r0
	sto.l	-12($fp), $r0
	jmpa	.L2
.L3:
	ldo.l	$r1, -8($fp)
	ldo.l	$r0, -4($fp)
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	sto.l	-16($fp), $r0
	ldo.l	$r0, -8($fp)
	sto.l	-4($fp), $r0
	ldo.l	$r0, -16($fp)
	sto.l	-8($fp), $r0
	ldo.l	$r0, -12($fp)
	inc	$r0, 1
	sto.l	-12($fp), $r0
.L2:
	ldo.l	$r1, -12($fp)
	ldo.l	$r0, 12($fp)
	cmp	$r1, $r0
	ble	.L3
	ldo.l	$r0, -8($fp)
	ret
	.global	main
	.type	main, @function
main:
	dec	$sp, 32
	ldi.l	$r0, 10
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	fib_iterative
	sto.l	-8($fp), $r0
	xor	$r0, $r0
	ret

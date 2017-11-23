	.text
	.global	fib_iterative
	.type	fib_iterative, @function
fib_iterative:
	ldi.l	$r2, -1
	ldi.l	$r3, 1
	xor	$r4, $r4
	xor	$r1, $r1
	jmpa	.L2
.L3:
	mov	$r4, $r3
	add	$r4, $r2
	mov	$r2, $r3
	mov	$r3, $r4
	inc	$r1, 1
.L2:
	cmp	$r1, $r0
	ble	.L3
	ret
	.global	main
	.type	main, @function
main:
	dec	$sp, 4
	ldi.l	$r0, 10
	jsra	fib_iterative
	sto.l	-4($fp), $r3
	ret

	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L2
	mov	r3, #31
	ldmia	r4, {r0, r1}	@ phole ldm
	ldr	ip, .L2+4
	mov	r2, #3
	mov	lr, pc
	bx	ip
	mov	r2, #32512
	ldr	r0, [r4, #8]
	mov	r1, #0
	add	r2, r2, #224
	ldr	r5, .L2+8
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #12]
	mov	r1, #236
	mov	r2, #992
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.word	drawBall
	.word	drawPlayer
	.size	draw, .-draw
	.align	2
	.global	erase
	.type	erase, %function
erase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L5
	mov	r3, #0
	ldmia	r4, {r0, r1}	@ phole ldm
	ldr	ip, .L5+4
	mov	r2, #3
	mov	lr, pc
	bx	ip
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [r4, #8]
	ldr	r5, .L5+8
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #12]
	mov	r1, #236
	mov	r2, #0
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.word	drawBall
	.word	drawPlayer
	.size	erase, .-erase
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r0, r0, asl #5
	add	r0, r0, r1, asl #2
	add	r0, r0, r0, asl #2
	mov	r3, #0
	mov	r1, r0, asl #4
	sub	sp, sp, #8
	cmp	r1, r3
	str	r3, [sp, #4]
	ble	.L7
.L9:
	ldr	r2, [sp, #4]
	add	r3, r3, #1
	add	r2, r2, #1
	cmp	r3, r1
	str	r2, [sp, #4]
	bne	.L9
.L7:
	add	sp, sp, #8
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	updatePaddle1
	.type	updatePaddle1, %function
updatePaddle1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L13
	ldr	r3, .L15
	ldr	r2, [r3, #8]
	sub	r2, r2, #3
	cmp	r2, #24
	str	r2, [r3, #8]
	movle	r2, #25
	strle	r2, [r3, #8]
.L13:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bxne	lr
	ldr	r3, .L15
	ldr	r2, [r3, #8]
	add	r2, r2, #3
	cmp	r2, #115
	str	r2, [r3, #8]
	movgt	r2, #115
	strgt	r2, [r3, #8]
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	updatePaddle1, .-updatePaddle1
	.align	2
	.global	updatePaddle2
	.type	updatePaddle2, %function
updatePaddle2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L18
	ldr	r3, .L20
	ldr	r2, [r3, #12]
	sub	r2, r2, #3
	cmp	r2, #24
	str	r2, [r3, #12]
	movle	r2, #25
	strle	r2, [r3, #12]
.L18:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L20
	ldr	r2, [r3, #12]
	add	r2, r2, #3
	cmp	r2, #115
	str	r2, [r3, #12]
	movgt	r2, #115
	strgt	r2, [r3, #12]
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	updatePaddle2, .-updatePaddle2
	.align	2
	.global	borders
	.type	borders, %function
borders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L29
	mov	r4, #0
.L23:
	mov	r1, r4
	mov	r0, #24
	mov	r2, #31744
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #240
	bne	.L23
	mov	r4, #0
.L24:
	mov	r0, r4
	mov	r1, #120
	mov	r2, #31744
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #24
	bne	.L24
	mov	r4, #0
.L25:
	mov	r1, r4
	mov	r0, #135
	mov	r2, #31744
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #240
	bne	.L25
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	setPixel
	.size	borders, .-borders
	.align	2
	.global	updateScore1
	.type	updateScore1, %function
updateScore1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L38
	sub	sp, sp, #8
	ldr	r2, [r4, #0]
	cmp	r2, #1
	beq	.L35
	cmp	r2, #2
	beq	.L36
	cmp	r2, #3
	beq	.L37
.L31:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L37:
	mov	r2, #2
	mov	ip, #31
	mov	r3, r2
	str	ip, [sp, #0]
	mov	r0, #10
	mov	r1, #20
	ldr	ip, .L38+4
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #4]
	b	.L31
.L35:
	mov	ip, #32512
	mov	r2, #2
	add	ip, ip, #224
	str	ip, [sp, #0]
	mov	r0, #10
	mov	r1, #100
	mov	r3, r2
	ldr	ip, .L38+4
	mov	lr, pc
	bx	ip
	b	.L31
.L36:
	mov	ip, #32512
	add	ip, ip, #224
	str	ip, [sp, #0]
	mov	r0, #10
	mov	r1, #60
	mov	r3, r2
	ldr	ip, .L38+4
	mov	lr, pc
	bx	ip
	b	.L31
.L39:
	.align	2
.L38:
	.word	.LANCHOR1
	.word	drawRect
	.size	updateScore1, .-updateScore1
	.align	2
	.global	updateScore2
	.type	updateScore2, %function
updateScore2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L47
	sub	sp, sp, #8
	ldr	r2, [r4, #8]
	cmp	r2, #1
	moveq	r2, #2
	moveq	r0, #10
	moveq	r1, #135
	beq	.L44
	cmp	r2, #2
	beq	.L45
	cmp	r2, #3
	beq	.L46
.L40:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L45:
	mov	r0, #10
	mov	r1, #175
.L44:
	mov	ip, #992
	str	ip, [sp, #0]
	mov	r3, r2
	ldr	ip, .L47+4
	mov	lr, pc
	bx	ip
	b	.L40
.L46:
	mov	r2, #2
	mov	ip, #31
	mov	r3, r2
	str	ip, [sp, #0]
	mov	r0, #10
	mov	r1, #215
	ldr	ip, .L47+4
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #4]
	b	.L40
.L48:
	.align	2
.L47:
	.word	.LANCHOR1
	.word	drawRect
	.size	updateScore2, .-updateScore2
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r3, #1024
	add	r3, r3, #3
	mov	r2, #67108864
	sub	sp, sp, #12
	mov	r4, #9984
	strh	r3, [r2, #0]	@ movhi
	ldr	r7, .L73
	ldr	r5, .L73+4
	ldr	r8, .L73+8
	add	r4, r4, #16
	mov	r9, #132
	mov	sl, #28
	mov	fp, #1
.L68:
	ldr	r6, [r7, #4]
	cmp	r6, #0
	bne	.L69
.L62:
	bl	borders
	bl	updatePaddle1
	bl	updatePaddle2
	ldmia	r5, {r2, r3}	@ phole ldm
	add	r0, r5, #16
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r3, r1, r3
	add	r2, r0, r2
	stmia	r5, {r2, r3}	@ phole stm
	mov	lr, pc
	bx	r8
	bl	draw
	str	r6, [sp, #4]
.L51:
	ldr	r3, [sp, #4]
	add	r6, r6, #1
	add	r3, r3, #1
	cmp	r6, r4
	str	r3, [sp, #4]
	bne	.L51
	bl	erase
	ldr	r3, [r5, #0]
	cmp	r3, #27
	bgt	.L52
	ldr	r3, [r5, #16]
	rsb	r3, r3, #0
	str	r3, [r5, #16]
	ldr	r3, [r5, #4]
	cmp	r3, #5
	str	sl, [r5, #0]
	beq	.L70
.L54:
	cmp	r3, #0
	beq	.L71
	cmp	r3, #236
	beq	.L72
	cmp	r3, #239
	bne	.L68
	ldr	r3, [r7, #0]
	add	r3, r3, #1
	str	r3, [r7, #0]
	bl	updateScore1
	ldr	r3, [r5, #20]
	mov	r2, #238
	rsb	r3, r3, #0
	str	r2, [r5, #4]
	str	r3, [r5, #20]
	b	.L68
.L52:
	cmp	r3, #132
	ldrgt	r3, [r5, #16]
	rsbgt	r3, r3, #0
	strgt	r3, [r5, #16]
	ldr	r3, [r5, #4]
	strgt	r9, [r5, #0]
	cmp	r3, #5
	bne	.L54
.L70:
	ldr	r2, [r5, #8]
	ldr	r3, [r5, #0]
	sub	r1, r2, #19
	cmp	r1, r3
	bgt	.L68
	add	r2, r2, #19
	cmp	r3, r2
	bgt	.L68
	ldr	r3, [r5, #20]
	mov	r2, #6
	rsb	r3, r3, #0
	str	r2, [r5, #4]
	str	r3, [r5, #20]
	b	.L68
.L71:
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
	bl	updateScore2
	ldr	r3, [r5, #20]
	ldr	r6, [r7, #4]
	rsb	r3, r3, #0
	cmp	r6, #0
	str	fp, [r5, #4]
	str	r3, [r5, #20]
	beq	.L62
.L69:
	mov	r0, #0
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L72:
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #0]
	sub	r1, r2, #19
	cmp	r1, r3
	bgt	.L68
	add	r2, r2, #19
	cmp	r3, r2
	bgt	.L68
	ldr	r3, [r5, #20]
	mov	r2, #235
	rsb	r3, r3, #0
	str	r2, [r5, #4]
	str	r3, [r5, #20]
	b	.L68
.L74:
	.align	2
.L73:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	waitForVBlank
	.size	main, .-main
	.global	row
	.global	col
	.global	rd
	.global	cd
	.global	p1Row
	.global	p2Row
	.global	p1Score
	.global	p2Score
	.global	gameOver
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	row, %object
	.size	row, 4
row:
	.word	80
	.type	col, %object
	.size	col, 4
col:
	.word	120
	.type	p1Row, %object
	.size	p1Row, 4
p1Row:
	.word	80
	.type	p2Row, %object
	.size	p2Row, 4
p2Row:
	.word	80
	.type	rd, %object
	.size	rd, 4
rd:
	.word	1
	.type	cd, %object
	.size	cd, 4
cd:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	p1Score, %object
	.size	p1Score, 4
p1Score:
	.space	4
	.type	gameOver, %object
	.size	gameOver, 4
gameOver:
	.space	4
	.type	p2Score, %object
	.size	p2Score, 4
p2Score:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"

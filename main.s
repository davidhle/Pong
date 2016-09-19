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
	bne	.L8
	ldr	r3, .L11
	ldr	r2, [r3, #8]
	sub	r2, r2, #3
	cmp	r2, #24
	str	r2, [r3, #8]
	movle	r2, #25
	strle	r2, [r3, #8]
.L8:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bxne	lr
	ldr	r3, .L11
	ldr	r2, [r3, #8]
	add	r2, r2, #3
	cmp	r2, #115
	str	r2, [r3, #8]
	movgt	r2, #115
	strgt	r2, [r3, #8]
	bx	lr
.L12:
	.align	2
.L11:
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
	bne	.L14
	ldr	r3, .L16
	ldr	r2, [r3, #12]
	sub	r2, r2, #3
	cmp	r2, #24
	str	r2, [r3, #12]
	movle	r2, #25
	strle	r2, [r3, #12]
.L14:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L16
	ldr	r2, [r3, #12]
	add	r2, r2, #3
	cmp	r2, #115
	str	r2, [r3, #12]
	movgt	r2, #115
	strgt	r2, [r3, #12]
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r5, .L25
	mov	r4, #0
.L19:
	mov	r1, r4
	mov	r0, #24
	mov	r2, #31744
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #240
	bne	.L19
	mov	r4, #0
.L20:
	mov	r0, r4
	mov	r1, #120
	mov	r2, #31744
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #24
	bne	.L20
	mov	r4, #0
.L21:
	mov	r1, r4
	mov	r0, #135
	mov	r2, #31744
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #240
	bne	.L21
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	setPixel
	.size	borders, .-borders
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r5, .L31
	ldr	r2, [r5, #0]
	mov	r3, #1024
	add	r3, r3, #3
	cmp	r2, #0
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	bne	.L28
	ldr	r7, .L31+4
	ldr	r4, .L31+8
	ldr	r6, .L31+12
.L29:
	bl	borders
	bl	updatePaddle1
	bl	updatePaddle2
	ldr	r1, [r4, #20]
	ldmia	r4, {r2, r3}	@ phole ldm
	ldr	r0, [r4, #16]
	add	r3, r1, r3
	add	r2, r0, r2
	stmia	r4, {r2, r3}	@ phole stm
	bl	draw
	mov	lr, pc
	bx	r6
	bl	erase
	mov	lr, pc
	bx	r7
	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	.L29
.L28:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR1
	.word	handleCollisions
	.word	.LANCHOR0
	.word	waitForVBlank
	.size	main, .-main
	.align	2
	.global	updateScore1
	.type	updateScore1, %function
updateScore1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L40
	sub	sp, sp, #8
	ldr	r2, [r4, #4]
	cmp	r2, #1
	beq	.L37
	cmp	r2, #2
	beq	.L38
	cmp	r2, #3
	beq	.L39
.L33:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L39:
	mov	r2, #2
	mov	ip, #31
	mov	r3, r2
	str	ip, [sp, #0]
	mov	r0, #10
	mov	r1, #20
	ldr	ip, .L40+4
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #0]
	b	.L33
.L37:
	mov	ip, #32512
	mov	r2, #2
	add	ip, ip, #224
	str	ip, [sp, #0]
	mov	r0, #10
	mov	r1, #100
	mov	r3, r2
	ldr	ip, .L40+4
	mov	lr, pc
	bx	ip
	b	.L33
.L38:
	mov	ip, #32512
	add	ip, ip, #224
	str	ip, [sp, #0]
	mov	r0, #10
	mov	r1, #60
	mov	r3, r2
	ldr	ip, .L40+4
	mov	lr, pc
	bx	ip
	b	.L33
.L41:
	.align	2
.L40:
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
	ldr	r4, .L49
	sub	sp, sp, #8
	ldr	r2, [r4, #8]
	cmp	r2, #1
	moveq	r2, #2
	moveq	r0, #10
	moveq	r1, #135
	beq	.L46
	cmp	r2, #2
	beq	.L47
	cmp	r2, #3
	beq	.L48
.L42:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L47:
	mov	r0, #10
	mov	r1, #175
.L46:
	mov	ip, #992
	str	ip, [sp, #0]
	mov	r3, r2
	ldr	ip, .L49+4
	mov	lr, pc
	bx	ip
	b	.L42
.L48:
	mov	r2, #2
	mov	ip, #31
	mov	r3, r2
	str	ip, [sp, #0]
	mov	r0, #10
	mov	r1, #215
	ldr	ip, .L49+4
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #0]
	b	.L42
.L50:
	.align	2
.L49:
	.word	.LANCHOR1
	.word	drawRect
	.size	updateScore2, .-updateScore2
	.align	2
	.global	handleCollisions
	.type	handleCollisions, %function
handleCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L66
	ldr	r3, [r4, #0]
	cmp	r3, #27
	bgt	.L52
	ldr	r3, [r4, #16]
	rsb	r3, r3, #0
	str	r3, [r4, #16]
	ldr	r3, [r4, #4]
	mov	r2, #28
	cmp	r3, #5
	str	r2, [r4, #0]
	ldr	r5, .L66
	beq	.L62
.L54:
	cmp	r3, #0
	beq	.L63
	cmp	r3, #236
	beq	.L64
	cmp	r3, #239
	beq	.L65
.L51:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L52:
	cmp	r3, #132
	ldrgt	r3, [r4, #16]
	rsbgt	r3, r3, #0
	strgt	r3, [r4, #16]
	ldr	r3, [r4, #4]
	movgt	r2, #132
	strgt	r2, [r4, #0]
	cmp	r3, #5
	ldr	r5, .L66
	bne	.L54
.L62:
	ldr	r2, [r5, #8]
	ldr	r3, [r5, #0]
	sub	r1, r2, #19
	cmp	r1, r3
	bgt	.L51
	add	r2, r2, #19
	cmp	r3, r2
	bgt	.L51
	ldr	r3, [r5, #20]
	mov	r2, #6
	rsb	r3, r3, #0
	str	r2, [r5, #4]
	str	r3, [r5, #20]
	b	.L51
.L63:
	ldr	r3, .L66+4
	ldr	r2, [r3, #8]
	add	r2, r2, #1
	str	r2, [r3, #8]
	bl	updateScore2
	ldr	r3, [r5, #20]
	mov	r2, #1
	rsb	r3, r3, #0
	str	r2, [r5, #4]
	str	r3, [r5, #20]
	b	.L51
.L64:
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #0]
	sub	r1, r2, #19
	cmp	r1, r3
	bgt	.L51
	add	r2, r2, #19
	cmp	r3, r2
	bgt	.L51
	ldr	r3, [r5, #20]
	mov	r2, #235
	rsb	r3, r3, #0
	str	r2, [r5, #4]
	str	r3, [r5, #20]
	b	.L51
.L65:
	ldr	r3, .L66+4
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	bl	updateScore1
	ldr	r3, [r4, #20]
	mov	r2, #238
	rsb	r3, r3, #0
	str	r2, [r4, #4]
	str	r3, [r4, #20]
	b	.L51
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	handleCollisions, .-handleCollisions
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
	.type	gameOver, %object
	.size	gameOver, 4
gameOver:
	.space	4
	.type	p1Score, %object
	.size	p1Score, 4
p1Score:
	.space	4
	.type	p2Score, %object
	.size	p2Score, 4
p2Score:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"

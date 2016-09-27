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
	.global	eraseBall
	.type	eraseBall, %function
eraseBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r2, [r0, #8]
	rsb	r4, r2, #0
	cmp	r2, r4
	mov	r7, r0
	mul	r6, r2, r2
	mov	r8, r4
	ldrge	sl, .L12
	blt	.L1
.L10:
	cmp	r4, r2
	bgt	.L3
	mul	r5, r8, r8
	b	.L5
.L4:
	add	r4, r4, #1
	cmp	r2, r4
	blt	.L3
.L5:
	mla	r3, r4, r4, r5
	cmp	r6, r3
	blt	.L4
	ldmia	r7, {r0, r1}	@ phole ldm
	add	r0, r4, r0
	mov	r2, #0
	add	r1, r8, r1
	mov	lr, pc
	bx	sl
	ldr	r2, [r7, #8]
	add	r4, r4, #1
	cmp	r2, r4
	bge	.L5
.L3:
	add	r8, r8, #1
	cmp	r8, r2
	rsble	r4, r2, #0
	ble	.L10
.L1:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	setPixel
	.size	eraseBall, .-eraseBall
	.align	2
	.global	erasePlayer
	.type	erasePlayer, %function
erasePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, r0
	sub	sp, sp, #12
	mov	ip, #0
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	r0, [r0, #0]
	ldr	r3, [r3, #16]
	str	ip, [sp, #0]
	ldr	ip, .L15
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	drawRect
	.size	erasePlayer, .-erasePlayer
	.align	2
	.global	erase
	.type	erase, %function
erase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L18
	bl	eraseBall
	ldr	r4, .L18+4
	ldr	r0, .L18+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L18+12
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	ball
	.word	erasePlayer
	.word	player1
	.word	player2
	.size	erase, .-erase
	.align	2
	.global	drawBall
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r2, [r0, #8]
	rsb	r4, r2, #0
	cmp	r2, r4
	mov	r5, r0
	mul	r7, r2, r2
	mov	r8, r4
	ldrge	sl, .L30
	blt	.L20
.L29:
	cmp	r4, r2
	bgt	.L22
	mul	r6, r8, r8
	b	.L24
.L23:
	add	r4, r4, #1
	cmp	r2, r4
	blt	.L22
.L24:
	mla	r3, r4, r4, r6
	cmp	r7, r3
	blt	.L23
	ldmia	r5, {r0, r1}	@ phole ldm
	add	r0, r4, r0
	ldrh	r2, [r5, #12]
	add	r1, r8, r1
	mov	lr, pc
	bx	sl
	ldr	r2, [r5, #8]
	add	r4, r4, #1
	cmp	r2, r4
	bge	.L24
.L22:
	add	r8, r8, #1
	cmp	r8, r2
	rsble	r4, r2, #0
	ble	.L29
.L20:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	setPixel
	.size	drawBall, .-drawBall
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	lr, [r0, #0]
	ldrh	ip, [r0, #8]
	ldr	r1, [r0, #4]
	add	r2, r0, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	r0, lr
	ldr	ip, .L33
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L34:
	.align	2
.L33:
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r5, .L36
	ldr	r7, .L36+4
	ldr	r0, .L36+8
	bl	drawBall
	ldr	r4, .L36+12
	mov	r0, r5
	bl	drawPlayer
	mov	r0, r7
	bl	drawPlayer
	ldr	r6, .L36+16
	ldr	r2, [r5, #20]
	ldr	r1, .L36+20
	mov	r0, r4
	mov	lr, pc
	bx	r6
	mov	r3, #32512
	add	r3, r3, #224
	mov	r2, r4
	mov	r1, #7
	mov	r0, #10
	ldr	r5, .L36+24
	mov	lr, pc
	bx	r5
	ldr	r2, [r7, #20]
	mov	r0, r4
	ldr	r1, .L36+28
	mov	lr, pc
	bx	r6
	mov	r0, #10
	mov	r1, #130
	mov	r2, r4
	mov	r3, #992
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	player1
	.word	player2
	.word	ball
	.word	buffer
	.word	sprintf
	.word	.LC0
	.word	drawString
	.word	.LC1
	.size	draw, .-draw
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
	bne	.L39
	ldr	r3, .L41
	ldr	r2, [r3, #0]
	sub	r2, r2, #3
	cmp	r2, #24
	str	r2, [r3, #0]
	movle	r2, #25
	strle	r2, [r3, #0]
.L39:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bxne	lr
	ldr	r3, .L41
	ldr	r2, [r3, #0]
	add	r2, r2, #3
	cmp	r2, #115
	str	r2, [r3, #0]
	movgt	r2, #115
	strgt	r2, [r3, #0]
	bx	lr
.L42:
	.align	2
.L41:
	.word	player1
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
	bne	.L44
	ldr	r3, .L46
	ldr	r2, [r3, #0]
	sub	r2, r2, #3
	cmp	r2, #24
	str	r2, [r3, #0]
	movle	r2, #25
	strle	r2, [r3, #0]
.L44:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L46
	ldr	r2, [r3, #0]
	add	r2, r2, #3
	cmp	r2, #115
	str	r2, [r3, #0]
	movgt	r2, #115
	strgt	r2, [r3, #0]
	bx	lr
.L47:
	.align	2
.L46:
	.word	player2
	.size	updatePaddle2, .-updatePaddle2
	.align	2
	.global	borders
	.type	borders, %function
borders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L55
	mov	r4, #0
.L49:
	mov	r1, r4
	mov	r0, #24
	mov	r2, #31744
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #240
	bne	.L49
	mov	r4, #0
.L50:
	mov	r0, r4
	mov	r1, #120
	mov	r2, #31744
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #24
	bne	.L50
	mov	r4, #0
.L51:
	mov	r1, r4
	mov	r0, #135
	mov	r2, #31744
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #240
	bne	.L51
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	setPixel
	.size	borders, .-borders
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bl	borders
	ldr	r1, .L58
	mov	ip, #32512
	ldr	r2, .L58+4
	mov	r0, #0
	mov	r7, #70
	mov	r6, #20
	mov	r5, #4
	add	ip, ip, #224
	ldr	r3, .L58+8
	str	r7, [r1, #0]
	str	r0, [r1, #4]
	str	r6, [r1, #12]
	str	r5, [r1, #16]
	strh	ip, [r1, #8]	@ movhi
	str	r0, [r1, #20]
	mov	r1, #236
	str	r1, [r2, #4]
	mov	r1, #80
	str	r1, [r3, #0]
	mov	r1, #120
	str	r1, [r3, #4]
	mov	r1, #3
	ldr	r8, .L58+12
	str	r1, [r3, #8]
	mov	r1, #992	@ movhi
	mov	r4, #1
	str	r7, [r2, #0]
	str	r6, [r2, #12]
	str	r5, [r2, #16]
	str	r0, [r2, #20]
	strh	r1, [r2, #8]	@ movhi
	mov	r2, #31	@ movhi
	str	r0, [r8, #0]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	strh	r2, [r3, #12]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	player1
	.word	player2
	.word	ball
	.word	gameOver
	.size	initialize, .-initialize
	.align	2
	.global	updateScore1
	.type	updateScore1, %function
updateScore1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r5, .L63
	ldr	r4, .L63+4
	ldr	r2, [r5, #20]
	ldr	r1, .L63+8
	sub	r2, r2, #1
	ldr	r7, .L63+12
	mov	r0, r4
	mov	lr, pc
	bx	r7
	ldr	r6, .L63+16
	mov	r3, #0
	mov	r1, #7
	mov	r2, r4
	mov	r0, #10
	mov	lr, pc
	bx	r6
	ldr	r1, .L63+8
	ldr	r2, [r5, #20]
	mov	r0, r4
	mov	lr, pc
	bx	r7
	mov	r3, #32512
	add	r3, r3, #224
	mov	r0, #10
	mov	r1, #7
	mov	r2, r4
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #20]
	cmp	r3, #3
	beq	.L62
.L60:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L62:
	ldr	r3, .L63+20
	ldmia	r3, {r0, r1, r2, r3}
	mov	ip, r4
	stmia	ip!, {r0, r1, r2}
	mov	r2, ip
	strh	r3, [r2, #0]	@ movhi
	mov	ip, r3, lsr #16
	mov	r3, #32512
	mov	r2, r4
	add	r3, r3, #224
	mov	r0, #145
	mov	r1, #80
	strb	ip, [r4, #14]
	mov	lr, pc
	bx	r6
	ldr	r3, .L63+24
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L60
.L64:
	.align	2
.L63:
	.word	player1
	.word	buffer
	.word	.LC0
	.word	sprintf
	.word	drawString
	.word	.LC2
	.word	gameOver
	.size	updateScore1, .-updateScore1
	.align	2
	.global	updateScore2
	.type	updateScore2, %function
updateScore2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r5, .L68
	ldr	r4, .L68+4
	ldr	r2, [r5, #20]
	ldr	r1, .L68+8
	sub	r2, r2, #1
	ldr	r7, .L68+12
	mov	r0, r4
	mov	lr, pc
	bx	r7
	ldr	r6, .L68+16
	mov	r3, #0
	mov	r1, #130
	mov	r2, r4
	mov	r0, #10
	mov	lr, pc
	bx	r6
	ldr	r1, .L68+8
	ldr	r2, [r5, #20]
	mov	r0, r4
	mov	lr, pc
	bx	r7
	mov	r3, #992
	mov	r0, #10
	mov	r1, #130
	mov	r2, r4
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #20]
	cmp	r3, #3
	beq	.L67
.L65:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L67:
	ldr	r3, .L68+20
	ldmia	r3, {r0, r1, r2, r3}
	mov	ip, r4
	stmia	ip!, {r0, r1, r2}
	mov	r2, ip
	strh	r3, [r2, #0]	@ movhi
	mov	ip, r3, lsr #16
	mov	r2, r4
	mov	r3, #992
	mov	r0, #145
	mov	r1, #80
	strb	ip, [r4, #14]
	mov	lr, pc
	bx	r6
	ldr	r3, .L68+24
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L65
.L69:
	.align	2
.L68:
	.word	player2
	.word	buffer
	.word	.LC1
	.word	sprintf
	.word	drawString
	.word	.LC3
	.word	gameOver
	.size	updateScore2, .-updateScore2
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L84
	ldr	r2, [r4, #0]
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #20]
	add	r2, r1, r2
	add	r3, r0, r3
	cmp	r2, #28
	stmia	r4, {r2, r3}	@ phole stm
	bgt	.L71
	rsb	r1, r1, #0
	mov	r2, #29
	cmp	r3, #5
	str	r2, [r4, #0]
	str	r1, [r4, #16]
	beq	.L81
.L73:
	cmp	r3, #1
	ble	.L82
	cmp	r3, #236
	beq	.L83
	cmp	r3, #238
	ble	.L76
	ldr	r3, .L84+4
	ldr	r2, [r3, #20]
	add	r2, r2, #1
	str	r2, [r3, #20]
	bl	updateScore1
	ldr	r3, [r4, #20]
	mov	r2, #238
	rsb	r3, r3, #0
	str	r2, [r4, #4]
	str	r3, [r4, #20]
.L76:
	bl	updatePaddle1
	ldmfd	sp!, {r4, lr}
	b	updatePaddle2
.L71:
	cmp	r2, #130
	rsbgt	r1, r1, #0
	movgt	r2, #130
	strgt	r2, [r4, #0]
	strgt	r1, [r4, #16]
	cmp	r3, #5
	bne	.L73
.L81:
	ldr	r3, .L84+4
	ldr	r2, [r3, #0]
	ldr	r3, [r4, #0]
	sub	r1, r2, #19
	cmp	r1, r3
	ldr	r1, .L84
	bgt	.L76
	add	r2, r2, #19
	cmp	r3, r2
	rsble	r0, r0, #0
	movle	r3, #6
	strle	r3, [r1, #4]
	strle	r0, [r1, #20]
	b	.L76
.L83:
	ldr	r3, .L84+8
	ldr	r2, [r3, #0]
	ldr	r3, [r4, #0]
	sub	r2, r2, #19
	cmp	r2, r3
	ldr	r2, .L84
	bgt	.L76
	ldr	r1, .L84+4
	ldr	r1, [r1, #0]
	add	r1, r1, #19
	cmp	r3, r1
	bgt	.L76
	ldr	r3, [r2, #20]
	mov	r1, #235
	rsb	r3, r3, #0
	str	r1, [r2, #4]
	str	r3, [r2, #20]
	b	.L76
.L82:
	ldr	r3, .L84+8
	ldr	r2, [r3, #20]
	add	r2, r2, #1
	str	r2, [r3, #20]
	bl	updateScore2
	ldr	r3, [r4, #20]
	mov	r2, #2
	rsb	r3, r3, #0
	str	r2, [r4, #4]
	str	r3, [r4, #20]
	b	.L76
.L85:
	.align	2
.L84:
	.word	ball
	.word	player1
	.word	player2
	.size	update, .-update
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #1024
	add	r3, r3, #3
	mov	r2, #67108864
	ldr	r5, .L90
	strh	r3, [r2, #0]	@ movhi
	bl	initialize
	ldr	r3, [r5, #0]
	cmp	r3, #0
	bne	.L87
	ldr	r7, .L90+4
	ldr	r4, .L90+8
	ldr	r6, .L90+12
.L88:
	bl	update
	bl	draw
	mov	lr, pc
	bx	r6
	ldr	r0, .L90+16
	mov	lr, pc
	bx	r7
	ldr	r0, .L90+20
	mov	lr, pc
	bx	r4
	ldr	r0, .L90+24
	mov	lr, pc
	bx	r4
	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	.L88
.L87:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	gameOver
	.word	eraseBall
	.word	erasePlayer
	.word	waitForVBlank
	.word	ball
	.word	player1
	.word	player2
	.size	main, .-main
	.comm	gameOver,4,4
	.comm	buffer,41,4
	.comm	player1,24,4
	.comm	player2,24,4
	.comm	ball,24,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Player 1 Score: %d\000"
	.space	1
.LC1:
	.ascii	"Player 2 Score: %d\000"
	.space	1
.LC2:
	.ascii	"Player 1 Wins!\000"
	.space	1
.LC3:
	.ascii	"Player 2 Wins!\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"

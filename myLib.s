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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	rsb	r0, r0, r0, asl #4
	ldr	r3, [r3, #0]
	add	r1, r1, r0, asl #4
	add	r1, r3, r1, asl #1
	mov	r3, #20
.L5:
	mov	ip, r1
	mov	r0, #4
.L6:
	subs	r0, r0, #1
	strh	r2, [ip], #2	@ movhi
	bne	.L6
	subs	r3, r3, #1
	add	r1, r1, #480
	bne	.L5
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBall
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	ip, r2, #0
	cmp	r2, ip
	stmfd	sp!, {r4, r5, r6, r7, r8}
	mul	r6, r2, r2
	blt	.L12
	ldr	r4, .L18
	add	r0, ip, r0
	add	r1, ip, r1
	rsb	r0, r0, r0, asl #4
	ldr	r4, [r4, #0]
	add	r8, r1, r0, asl #4
	add	r8, r4, r8, asl #1
	mov	r7, ip
.L14:
	mul	r5, r7, r7
	mov	r0, r8
	mov	r1, ip
.L16:
	mla	r4, r1, r1, r5
	add	r1, r1, #1
	cmp	r6, r4
	strgeh	r3, [r0, #0]	@ movhi
	cmp	r2, r1
	add	r0, r0, #480
	bge	.L16
	add	r7, r7, #1
	cmp	r2, r7
	add	r8, r8, #2
	bge	.L14
.L12:
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	drawBall, .-drawBall
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L25
	rsb	r0, r0, r0, asl #4
	add	ip, r1, r0, asl #4
	ldr	r3, [r3, #0]
	sub	ip, ip, #1
	ldrh	r1, [sp, #0]
	add	ip, r3, ip, asl #1
	mov	r0, #5
.L21:
	mov	r2, ip
	mov	r3, #5
.L22:
	subs	r3, r3, #1
	strh	r1, [r2, #2]!	@ movhi
	bne	.L22
	subs	r0, r0, #1
	add	ip, ip, #480
	bne	.L21
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L28:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L28
	mov	r2, #67108864
.L30:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L30
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"

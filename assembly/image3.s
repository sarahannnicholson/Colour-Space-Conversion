	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"image.c"
	.text
	.align	2
	.global	ycc_to_rgb
	.type	ycc_to_rgb, %function
ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	fp, r0
	mov	r0, #4
	mul	r4, r1, r2
	bl	malloc
	mov	r3, r4, asl #1
	add	r9, r3, r4
	mov	sl, r0
	mov	r0, r9
	bl	malloc
	cmp	r4, #0
	str	r0, [sl, #0]
	ble	.L2
	mov	lr, #0
.L9:
	ldr	r3, [fp, #0]
	ldrb	r4, [r3, lr]	@ zero_extendqisi2
	add	r3, r3, lr
	ldrb	r8, [r3, #2]	@ zero_extendqisi2
	mov	r2, r4, asl #10
	ldrb	r7, [r3, #1]	@ zero_extendqisi2
	sub	r2, r2, r4, asl #3
	mov	r3, r8, asl #8
	sub	r3, r3, r8, asl #4
	add	r2, r2, r4
	mov	ip, r3, asl #4
	mov	r2, r2, asl #3
	add	r2, r2, r4
	rsb	ip, r3, ip
	mov	r1, r7, asl #7
	mov	r0, r7, asl #10
	rsb	ip, r8, ip
	mov	r3, r2, asl #2
	sub	r1, r1, r7, asl #5
	sub	r0, r0, r7, asl #3
	add	r2, r2, r3
	mov	r5, ip, asl #4
	add	r1, r1, r7
	add	r0, r0, r7
	mov	r3, r8, asl #5
	rsb	r5, ip, r5
	mov	r1, r1, asl #4
	mov	r0, r0, asl #2
	mov	r6, r8, asl #2
	mov	r2, r2, asl #2
	rsb	r2, r4, r2
	add	r6, r6, r3
	add	r1, r1, r7
	add	r0, r0, r7
	mov	r5, r5, asl #2
	add	r6, r6, r8
	mov	r3, r1, asl #5
	rsb	r5, r8, r5
	mov	ip, r2, asl #4
	mov	r0, r0, asl #2
	add	r1, r1, r3
	rsb	ip, r2, ip
	add	r0, r0, r7
	mov	r4, r6, asl #4
	mov	r2, r5, asl #5
	rsb	r4, r6, r4
	mov	r1, r1, asl #3
	mov	r0, r0, asl #3
	rsb	r2, r5, r2
	mov	ip, ip, asl #1
	add	r0, r0, r7
	mov	r4, r4, asl #7
	add	r1, r1, r7
	add	ip, ip, #-83886080
	add	r2, r2, #-872415232
	add	r4, r4, r8
	mov	r3, r0, asl #6
	mov	r1, r1, asl #2
	add	ip, ip, #5767168
	add	r2, r2, #15532032
	add	r0, r0, r3
	add	r1, r1, r7
	mov	r3, r4, asl #2
	add	ip, ip, #4160
	add	r2, r2, #37120
	add	ip, ip, #32
	rsb	r3, r4, r3
	rsb	r1, r1, #645922816
	add	r0, r0, #-1090519040
	add	r2, r2, #128
	add	r2, r2, ip
	mov	r3, r3, asl #4
	add	r1, r1, #466944
	add	r0, r0, #7077888
	add	r3, r3, r8
	mov	r2, r2, asr #22
	add	r1, r1, #2816
	add	r0, r0, #35584
	cmp	r2, #255
	rsb	r1, r3, r1
	add	r0, r0, #128
	bicle	r3, r2, r2, asr #31
	add	r0, r0, ip
	add	r1, r1, ip
	ldr	ip, [sl, #0]
	andle	r2, r3, #255
	movgt	r2, #255
	strb	r2, [ip, lr]
	mov	r1, r1, asr #22
	cmp	r1, #255
	ldr	r2, [sl, #0]
	bicle	r3, r1, r1, asr #31
	andle	r1, r3, #255
	movgt	r1, #255
	add	r3, r2, lr
	strb	r1, [r3, #1]
	mov	r0, r0, asr #22
	cmp	r0, #255
	ldr	r2, [sl, #0]
	bicle	r3, r0, r0, asr #31
	andle	r0, r3, #255
	add	r3, r2, lr
	add	lr, lr, #3
	movgt	r0, #255
	cmp	lr, r9
	strb	r0, [r3, #2]
	bne	.L9
.L2:
	mov	r0, sl
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	ycc_to_rgb, .-ycc_to_rgb
	.align	2
	.global	meta_to_ycc
	.type	meta_to_ycc, %function
meta_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #28
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r6, r0
	mov	r0, #4
	mov	r4, r1
	str	r2, [sp, #0]
	bl	malloc
	ldr	r3, [sp, #0]
	mul	r3, r4, r3
	mov	r5, r0
	mov	r0, r3, asl #1
	add	r0, r0, r3
	bl	malloc
	mov	r4, r4, asr #1
	cmp	r4, #0
	str	r4, [sp, #4]
	str	r0, [r5, #0]
	ble	.L14
	ldr	r2, [sp, #0]
	add	r1, r2, #1
	mov	r0, r2, asl #1
	mov	r2, r2, asl #2
	add	r2, r2, r0
	mov	r3, #0
	str	r2, [sp, #16]
	ldr	r2, [sp, #0]
	str	r3, [sp, #8]
	mov	r3, r1, asl #1
	add	r3, r3, r1
	add	r0, r0, r2
	mov	r9, #0
	str	r3, [sp, #12]
	str	r0, [sp, #20]
	mov	sl, r2, asr #1
	mov	fp, r9
.L17:
	add	r3, r9, r9, lsr #31
	cmp	sl, #0
	mov	r2, r3, asr #1
	ble	.L15
	mov	r3, r2, asl #3
	ldr	r0, [sp, #20]
	ldr	lr, [sp, #12]
	sub	ip, r3, r2, asl #1
	add	r7, fp, #3
	mov	r4, fp
	mov	r8, #0
.L16:
	ldr	r3, [r6, #0]
	ldr	r2, [r5, #0]
	ldrb	r1, [r3, ip]	@ zero_extendqisi2
	strb	r1, [r2, r4]
	ldr	r3, [r6, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	ldr	r2, [r5, #0]
	strb	r1, [r2, r7]
	ldr	r3, [r6, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #2]	@ zero_extendqisi2
	ldr	r2, [r5, #0]
	strb	r1, [r2, r0]
	ldr	r3, [r6, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #3]	@ zero_extendqisi2
	ldr	r2, [r5, #0]
	strb	r1, [r2, lr]
	ldr	r3, [r6, #0]
	ldr	r2, [r5, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	add	r2, r2, r4
	strb	r1, [r2, #1]
	ldr	r3, [r6, #0]
	ldr	r2, [r5, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	add	r2, r2, r7
	strb	r1, [r2, #1]
	ldr	r3, [r6, #0]
	ldr	r2, [r5, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	add	r2, r2, r0
	strb	r1, [r2, #1]
	ldr	r3, [r6, #0]
	ldr	r2, [r5, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	add	r2, r2, lr
	strb	r1, [r2, #1]
	ldr	r3, [r6, #0]
	ldr	r2, [r5, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #5]	@ zero_extendqisi2
	add	r2, r2, r4
	strb	r1, [r2, #2]
	ldr	r3, [r6, #0]
	ldr	r2, [r5, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #5]	@ zero_extendqisi2
	add	r2, r2, r7
	strb	r1, [r2, #2]
	ldr	r3, [r6, #0]
	ldr	r2, [r5, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #5]	@ zero_extendqisi2
	add	r2, r2, r0
	strb	r1, [r2, #2]
	ldr	r3, [r6, #0]
	ldr	r2, [r5, #0]
	add	r3, r3, ip
	ldrb	r1, [r3, #5]	@ zero_extendqisi2
	add	r8, r8, #1
	add	r2, r2, lr
	cmp	sl, r8
	strb	r1, [r2, #2]
	add	r4, r4, #6
	add	ip, ip, #6
	add	r7, r7, #6
	add	r0, r0, #6
	add	lr, lr, #6
	bgt	.L16
.L15:
	ldmib	sp, {r2, r3}	@ phole ldm
	add	r3, r3, #1
	cmp	r2, r3
	str	r3, [sp, #8]
	ldr	r3, [sp, #0]
	ldr	r2, [sp, #12]
	add	r9, r9, r3
	ldr	r3, [sp, #16]
	add	r2, r2, r3
	str	r2, [sp, #12]
	ldr	r2, [sp, #20]
	add	r2, r2, r3
	add	fp, fp, r3
	str	r2, [sp, #20]
	bgt	.L17
.L14:
	mov	r0, r5
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	meta_to_ycc, .-meta_to_ycc
	.align	2
	.global	ycc_to_meta
	.type	ycc_to_meta, %function
ycc_to_meta:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #44
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r9, r0
	mov	r0, #4
	mov	r4, r1
	str	r2, [sp, #4]
	bl	malloc
	ldr	r3, [sp, #4]
	mul	r3, r4, r3
	mov	r5, r0
	mov	r0, r3, asl #3
	sub	r0, r0, r3, asl #1
	mov	r0, r0, lsr #2
	bl	malloc
	mov	r4, r4, asr #1
	cmp	r4, #0
	str	r4, [sp, #8]
	str	r0, [r5, #0]
	ble	.L22
	ldr	r2, [sp, #4]
	mov	r3, #0
	add	r1, r2, #1
	str	r3, [sp, #12]
	mov	r3, r1, asl #1
	mov	r0, r2, asl #1
	add	r3, r3, r1
	mov	r2, r2, asl #2
	ldr	r1, [sp, #4]
	add	r2, r2, r0
	str	r3, [sp, #20]
	str	r2, [sp, #28]
	mov	r3, #0
	add	r0, r0, r1
	mov	r2, r1, asr #1
	str	r0, [sp, #24]
	str	r2, [sp, #16]
	str	r3, [sp, #32]
	str	r3, [sp, #36]
.L25:
	ldr	r1, [sp, #16]
	ldr	r3, [sp, #32]
	cmp	r1, #0
	mov	r2, r3, asr #1
	ble	.L23
	ldr	r1, [sp, #36]
	mov	r3, r2, asl #3
	add	r6, sp, #20
	ldmia	r6, {r6, r7}	@ phole ldm
	sub	lr, r3, r2, asl #1
	add	sl, r1, #3
	mov	r8, r1
	mov	fp, #0
.L24:
	ldr	r3, [r9, #0]
	ldr	r2, [r5, #0]
	ldrb	r1, [r3, r8]	@ zero_extendqisi2
	strb	r1, [r2, lr]
	ldr	r0, [r9, #0]
	ldr	r3, [r5, #0]
	ldrb	r2, [r0, sl]	@ zero_extendqisi2
	add	r3, r3, lr
	strb	r2, [r3, #1]
	ldr	r1, [r9, #0]
	ldr	r3, [r5, #0]
	ldrb	r2, [r1, r7]	@ zero_extendqisi2
	add	r3, r3, lr
	strb	r2, [r3, #2]
	ldr	r1, [r9, #0]
	ldr	r3, [r5, #0]
	ldrb	r2, [r1, r6]	@ zero_extendqisi2
	add	r3, r3, lr
	strb	r2, [r3, #3]
	ldr	r1, [r9, #0]
	add	r2, r1, sl
	add	r0, r1, r8
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	add	r2, r1, r7
	ldrb	r4, [r2, #1]	@ zero_extendqisi2
	add	r1, r1, r6
	ldrb	r0, [r1, #1]	@ zero_extendqisi2
	add	r3, r3, ip
	ldr	r2, [r5, #0]
	add	r3, r3, r4
	add	r3, r3, r0
	add	r2, r2, lr
	mov	r3, r3, asr #2
	strb	r3, [r2, #4]
	ldr	r1, [r9, #0]
	add	r2, r1, sl
	add	r0, r1, r8
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	add	r2, r1, r7
	ldrb	r4, [r2, #2]	@ zero_extendqisi2
	add	r1, r1, r6
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	add	r3, r3, ip
	ldr	r2, [r5, #0]
	ldr	r1, [sp, #16]
	add	r3, r3, r4
	add	r3, r3, r0
	add	fp, fp, #1
	add	r2, r2, lr
	mov	r3, r3, asr #2
	cmp	r1, fp
	strb	r3, [r2, #5]
	add	lr, lr, #6
	add	r8, r8, #6
	add	sl, sl, #6
	add	r7, r7, #6
	add	r6, r6, #6
	bgt	.L24
.L23:
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #8]
	add	r2, r2, #1
	cmp	r3, r2
	ldr	r1, [sp, #32]
	str	r2, [sp, #12]
	ldr	r2, [sp, #4]
	add	r1, r1, r2
	ldr	r3, [sp, #20]
	str	r1, [sp, #32]
	ldr	r1, [sp, #28]
	add	r3, r3, r1
	ldr	r2, [sp, #36]
	str	r3, [sp, #20]
	ldr	r3, [sp, #24]
	add	r2, r2, r1
	add	r3, r3, r1
	str	r2, [sp, #36]
	str	r3, [sp, #24]
	bgt	.L25
.L22:
	mov	r0, r5
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	ycc_to_meta, .-ycc_to_meta
	.align	2
	.global	rgb_to_ycc
	.type	rgb_to_ycc, %function
rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r8, r0
	mov	r0, #4
	mul	r4, r1, r2
	bl	malloc
	mov	r7, r0
	mov	r0, r4, asl #1
	add	r0, r0, r4
	bl	malloc
	cmp	r4, #0
	str	r0, [r7, #0]
	ble	.L30
	sub	r3, r4, #1
	mov	r3, r3, lsr #2
	add	r3, r3, #1
	mov	r2, r3, asl #4
	sub	sl, r2, r3, asl #2
	mov	lr, #0
.L31:
	ldr	r2, [r8, #0]
	add	r3, r2, lr
	ldrb	ip, [r3, #1]	@ zero_extendqisi2
	ldrb	r4, [r3, #2]	@ zero_extendqisi2
	ldrb	r5, [r2, lr]	@ zero_extendqisi2
	mov	r3, ip, asl #3
	mov	r2, ip, asl #11
	add	r3, r3, r2
	mov	r1, r4, asl #5
	mov	r2, r4, asl #7
	add	r1, r1, r2
	add	r3, r3, ip
	mov	r2, r5, asl #7
	mov	r0, r5, asl #2
	add	r0, r0, r2
	mov	r3, r3, asl #2
	mov	r2, r1, asl #2
	add	r1, r1, r2
	rsb	r3, ip, r3
	mov	r2, r0, asl #7
	rsb	r2, r0, r2
	rsb	r1, r4, r1
	mov	r3, r3, asl #2
	rsb	r2, r5, r2
	add	r3, r3, ip
	mov	r1, r1, asl #3
	rsb	r1, r4, r1
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r7, #0]
	mov	r3, r3, asr #16
	add	r3, r3, #16
	strb	r3, [r2, lr]
	ldr	r1, [r8, #0]
	add	r5, r1, lr
	ldrb	r2, [r1, lr]	@ zero_extendqisi2
	ldrb	r4, [r5, #1]	@ zero_extendqisi2
	mov	r1, r2, asl #7
	mov	r3, r4, asl #6
	sub	r3, r3, r4, asl #4
	sub	r1, r1, r2, asl #3
	add	r1, r1, r2
	mov	r0, r3, asl #5
	add	r3, r3, r0
	mov	ip, r1, asl #2
	ldrb	r0, [r5, #2]	@ zero_extendqisi2
	add	r1, r1, ip
	rsb	r3, r4, r3
	sub	r2, r2, r1, asl #2
	sub	r3, r3, r3, asl #2
	add	r2, r2, r3
	mov	r1, r0, asl #15
	sub	r1, r1, r0, asl #12
	mov	r2, r2, asl #2
	ldr	r3, [r7, #0]
	add	r2, r2, r1
	mov	r2, r2, asr #16
	add	r3, r3, lr
	sub	r2, r2, #128
	strb	r2, [r3, #1]
	ldr	r5, [r8, #0]
	add	r4, r5, lr
	ldrb	ip, [r4, #1]	@ zero_extendqisi2
	mov	r2, ip, asl #5
	mov	r3, ip, asl #3
	add	r3, r3, r2
	mov	r1, r3, asl #2
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	add	r3, r3, r1
	mov	r1, r3, asl #4
	ldrb	r4, [r5, lr]	@ zero_extendqisi2
	rsb	r1, r3, r1
	mov	r2, r0, asl #2
	mov	r3, r0, asl #5
	add	r2, r2, r3
	add	r1, r1, ip
	add	r2, r2, r0
	mov	r3, r4, asl #15
	mov	r1, r1, asl #3
	add	r1, r1, ip
	sub	r3, r3, r4, asl #12
	sub	r2, r2, r2, asl #6
	rsb	r3, r1, r3
	mov	r2, r2, asl #1
	ldr	r1, [r7, #0]
	add	r3, r3, r2
	mov	r3, r3, asr #16
	add	r1, r1, lr
	sub	r3, r3, #128
	strb	r3, [r1, #2]
	ldr	r2, [r8, #0]
	add	r6, lr, #3
	add	r3, r2, r6
	ldrb	ip, [r3, #1]	@ zero_extendqisi2
	ldrb	r4, [r3, #2]	@ zero_extendqisi2
	ldrb	r5, [r2, r6]	@ zero_extendqisi2
	mov	r3, ip, asl #3
	mov	r2, ip, asl #11
	add	r3, r3, r2
	mov	r1, r4, asl #5
	mov	r2, r4, asl #7
	add	r1, r1, r2
	add	r3, r3, ip
	mov	r2, r5, asl #7
	mov	r0, r5, asl #2
	add	r0, r0, r2
	mov	r3, r3, asl #2
	mov	r2, r1, asl #2
	add	r1, r1, r2
	rsb	r3, ip, r3
	mov	r2, r0, asl #7
	rsb	r2, r0, r2
	rsb	r1, r4, r1
	mov	r3, r3, asl #2
	rsb	r2, r5, r2
	add	r3, r3, ip
	mov	r1, r1, asl #3
	rsb	r1, r4, r1
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r7, #0]
	mov	r3, r3, asr #16
	add	r3, r3, #16
	strb	r3, [r2, r6]
	ldr	r1, [r8, #0]
	add	r5, r1, r6
	ldrb	r2, [r1, r6]	@ zero_extendqisi2
	ldrb	r4, [r5, #1]	@ zero_extendqisi2
	mov	r1, r2, asl #7
	mov	r3, r4, asl #6
	sub	r3, r3, r4, asl #4
	sub	r1, r1, r2, asl #3
	add	r1, r1, r2
	mov	r0, r3, asl #5
	add	r3, r3, r0
	mov	ip, r1, asl #2
	ldrb	r0, [r5, #2]	@ zero_extendqisi2
	add	r1, r1, ip
	rsb	r3, r4, r3
	sub	r2, r2, r1, asl #2
	sub	r3, r3, r3, asl #2
	add	r2, r2, r3
	mov	r1, r0, asl #15
	sub	r1, r1, r0, asl #12
	mov	r2, r2, asl #2
	ldr	r3, [r7, #0]
	add	r2, r2, r1
	mov	r2, r2, asr #16
	add	r3, r3, r6
	sub	r2, r2, #128
	strb	r2, [r3, #1]
	ldr	r5, [r8, #0]
	add	r4, r5, r6
	ldrb	ip, [r4, #1]	@ zero_extendqisi2
	mov	r2, ip, asl #5
	mov	r3, ip, asl #3
	add	r3, r3, r2
	mov	r1, r3, asl #2
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	add	r3, r3, r1
	mov	r1, r3, asl #4
	ldrb	r4, [r5, r6]	@ zero_extendqisi2
	rsb	r1, r3, r1
	mov	r2, r0, asl #2
	mov	r3, r0, asl #5
	add	r2, r2, r3
	add	r1, r1, ip
	add	r2, r2, r0
	mov	r3, r4, asl #15
	mov	r1, r1, asl #3
	add	r1, r1, ip
	sub	r3, r3, r4, asl #12
	sub	r2, r2, r2, asl #6
	rsb	r3, r1, r3
	mov	r2, r2, asl #1
	add	r3, r3, r2
	ldr	r1, [r7, #0]
	mov	r3, r3, asr #16
	add	r1, r1, r6
	sub	r3, r3, #128
	strb	r3, [r1, #2]
	ldr	r2, [r8, #0]
	add	r6, lr, #6
	add	r3, r2, r6
	ldrb	ip, [r3, #1]	@ zero_extendqisi2
	ldrb	r4, [r3, #2]	@ zero_extendqisi2
	ldrb	r5, [r2, r6]	@ zero_extendqisi2
	mov	r3, ip, asl #3
	mov	r2, ip, asl #11
	add	r3, r3, r2
	mov	r1, r4, asl #5
	mov	r2, r4, asl #7
	add	r1, r1, r2
	add	r3, r3, ip
	mov	r2, r5, asl #7
	mov	r0, r5, asl #2
	add	r0, r0, r2
	mov	r3, r3, asl #2
	mov	r2, r1, asl #2
	add	r1, r1, r2
	rsb	r3, ip, r3
	mov	r2, r0, asl #7
	rsb	r2, r0, r2
	rsb	r1, r4, r1
	mov	r3, r3, asl #2
	rsb	r2, r5, r2
	add	r3, r3, ip
	mov	r1, r1, asl #3
	rsb	r1, r4, r1
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r7, #0]
	mov	r3, r3, asr #16
	add	r3, r3, #16
	strb	r3, [r2, r6]
	ldr	r1, [r8, #0]
	add	r5, r1, r6
	ldrb	r2, [r1, r6]	@ zero_extendqisi2
	ldrb	r4, [r5, #1]	@ zero_extendqisi2
	mov	r1, r2, asl #7
	mov	r3, r4, asl #6
	sub	r3, r3, r4, asl #4
	sub	r1, r1, r2, asl #3
	add	r1, r1, r2
	mov	r0, r3, asl #5
	add	r3, r3, r0
	mov	ip, r1, asl #2
	ldrb	r0, [r5, #2]	@ zero_extendqisi2
	add	r1, r1, ip
	rsb	r3, r4, r3
	sub	r2, r2, r1, asl #2
	sub	r3, r3, r3, asl #2
	add	r2, r2, r3
	mov	r1, r0, asl #15
	sub	r1, r1, r0, asl #12
	mov	r2, r2, asl #2
	ldr	r3, [r7, #0]
	add	r2, r2, r1
	mov	r2, r2, asr #16
	add	r3, r3, r6
	sub	r2, r2, #128
	strb	r2, [r3, #1]
	ldr	r5, [r8, #0]
	add	r4, r5, r6
	ldrb	ip, [r4, #1]	@ zero_extendqisi2
	mov	r2, ip, asl #5
	mov	r3, ip, asl #3
	add	r3, r3, r2
	mov	r1, r3, asl #2
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	add	r3, r3, r1
	mov	r1, r3, asl #4
	ldrb	r4, [r5, r6]	@ zero_extendqisi2
	rsb	r1, r3, r1
	mov	r2, r0, asl #2
	mov	r3, r0, asl #5
	add	r2, r2, r3
	add	r1, r1, ip
	add	r2, r2, r0
	mov	r3, r4, asl #15
	mov	r1, r1, asl #3
	add	r1, r1, ip
	sub	r3, r3, r4, asl #12
	sub	r2, r2, r2, asl #6
	rsb	r3, r1, r3
	mov	r2, r2, asl #1
	ldr	r1, [r7, #0]
	add	r3, r3, r2
	mov	r3, r3, asr #16
	add	r1, r1, r6
	sub	r3, r3, #128
	strb	r3, [r1, #2]
	ldr	r2, [r8, #0]
	add	r6, lr, #9
	add	r3, r2, r6
	ldrb	ip, [r3, #1]	@ zero_extendqisi2
	ldrb	r4, [r3, #2]	@ zero_extendqisi2
	ldrb	r5, [r2, r6]	@ zero_extendqisi2
	mov	r3, ip, asl #3
	mov	r2, ip, asl #11
	add	r3, r3, r2
	mov	r1, r4, asl #5
	mov	r2, r4, asl #7
	add	r1, r1, r2
	add	r3, r3, ip
	mov	r2, r5, asl #7
	mov	r0, r5, asl #2
	add	r0, r0, r2
	mov	r3, r3, asl #2
	mov	r2, r1, asl #2
	add	r1, r1, r2
	rsb	r3, ip, r3
	mov	r2, r0, asl #7
	rsb	r2, r0, r2
	rsb	r1, r4, r1
	mov	r3, r3, asl #2
	rsb	r2, r5, r2
	add	r3, r3, ip
	mov	r1, r1, asl #3
	rsb	r1, r4, r1
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r7, #0]
	mov	r3, r3, asr #16
	add	r3, r3, #16
	strb	r3, [r2, r6]
	ldr	r1, [r8, #0]
	add	r5, r1, r6
	ldrb	r4, [r5, #1]	@ zero_extendqisi2
	ldrb	r2, [r1, r6]	@ zero_extendqisi2
	mov	r3, r4, asl #6
	mov	r1, r2, asl #7
	sub	r3, r3, r4, asl #4
	sub	r1, r1, r2, asl #3
	add	r1, r1, r2
	mov	r0, r3, asl #5
	add	r3, r3, r0
	mov	ip, r1, asl #2
	ldrb	r0, [r5, #2]	@ zero_extendqisi2
	add	r1, r1, ip
	rsb	r3, r4, r3
	sub	r2, r2, r1, asl #2
	sub	r3, r3, r3, asl #2
	add	r2, r2, r3
	mov	r1, r0, asl #15
	sub	r1, r1, r0, asl #12
	mov	r2, r2, asl #2
	ldr	r3, [r7, #0]
	add	r2, r2, r1
	mov	r2, r2, asr #16
	add	r3, r3, r6
	sub	r2, r2, #128
	strb	r2, [r3, #1]
	ldr	r5, [r8, #0]
	add	r4, r5, r6
	ldrb	ip, [r4, #1]	@ zero_extendqisi2
	mov	r2, ip, asl #5
	mov	r3, ip, asl #3
	add	r3, r3, r2
	mov	r1, r3, asl #2
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	add	r3, r3, r1
	mov	r1, r3, asl #4
	ldrb	r4, [r5, r6]	@ zero_extendqisi2
	rsb	r1, r3, r1
	mov	r2, r0, asl #2
	mov	r3, r0, asl #5
	add	r2, r2, r3
	add	r1, r1, ip
	add	r2, r2, r0
	mov	r1, r1, asl #3
	mov	r3, r4, asl #15
	add	r1, r1, ip
	sub	r3, r3, r4, asl #12
	sub	r2, r2, r2, asl #6
	rsb	r3, r1, r3
	mov	r2, r2, asl #1
	ldr	r1, [r7, #0]
	add	r3, r3, r2
	mov	r3, r3, asr #16
	add	lr, lr, #12
	add	r1, r1, r6
	sub	r3, r3, #128
	cmp	lr, sl
	strb	r3, [r1, #2]
	bne	.L31
.L30:
	mov	r0, r7
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
	.size	rgb_to_ycc, .-rgb_to_ycc
	.align	2
	.global	bmp_init
	.type	bmp_init, %function
bmp_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r4, r0
	mov	r0, #56
	bl	malloc
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	mov	r5, r0
	bl	fread
	mov	r1, #4
	mov	r3, r4
	add	r0, r5, r1
	mov	r2, #1
	bl	fread
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	add	r0, r5, #8
	bl	fread
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	add	r0, r5, #10
	bl	fread
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #12
	bl	fread
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #16
	bl	fread
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #20
	bl	fread
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #24
	bl	fread
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	add	r0, r5, #28
	bl	fread
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	add	r0, r5, #30
	bl	fread
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #32
	bl	fread
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #36
	bl	fread
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #40
	bl	fread
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #44
	bl	fread
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #48
	bl	fread
	mov	r3, r4
	add	r0, r5, #52
	mov	r1, #4
	mov	r2, #1
	bl	fread
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	bmp_init, .-bmp_init
	.align	2
	.global	print_bmp_header
	.type	print_bmp_header, %function
print_bmp_header:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r4, r1
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	mov	r5, r0
	bl	fwrite
	mov	r1, #4
	mov	r3, r4
	add	r0, r5, r1
	mov	r2, #1
	bl	fwrite
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	add	r0, r5, #8
	bl	fwrite
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	add	r0, r5, #10
	bl	fwrite
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #12
	bl	fwrite
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #16
	bl	fwrite
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #20
	bl	fwrite
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #24
	bl	fwrite
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	add	r0, r5, #28
	bl	fwrite
	mov	r3, r4
	mov	r1, #2
	mov	r2, #1
	add	r0, r5, #30
	bl	fwrite
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #32
	bl	fwrite
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #36
	bl	fwrite
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #40
	bl	fwrite
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #44
	bl	fwrite
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, r5, #48
	bl	fwrite
	add	r0, r5, #52
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	bl	fwrite
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	print_bmp_header, .-print_bmp_header
	.align	2
	.global	rgb_to_ycc_to_rgb
	.type	rgb_to_ycc_to_rgb, %function
rgb_to_ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mul	r8, r1, r2
	mov	r5, r1
	mov	r6, r2
	mov	r4, r0
	bl	rgb_to_ycc
	mov	r7, r0
	ldr	r0, [r4, #0]
	bl	free
	mov	r1, r5
	mov	r2, r6
	mov	r0, r7
	bl	ycc_to_meta
	mov	r4, r0
	ldr	r0, [r7, #0]
	bl	free
	mov	r1, r5
	mov	r2, r6
	mov	r0, r4
	bl	meta_to_ycc
	mov	fp, r0
	ldr	r0, [r4, #0]
	bl	free
	mov	r0, #4
	bl	malloc
	mov	r3, r8, asl #1
	add	r9, r3, r8
	mov	sl, r0
	mov	r0, r9
	bl	malloc
	cmp	r8, #0
	str	r0, [sl, #0]
	ble	.L39
	mov	r8, #0
.L46:
	ldr	r3, [fp, #0]
	ldrb	lr, [r3, r8]	@ zero_extendqisi2
	add	r3, r3, r8
	ldrb	r7, [r3, #2]	@ zero_extendqisi2
	mov	r2, lr, asl #10
	ldrb	r6, [r3, #1]	@ zero_extendqisi2
	sub	r2, r2, lr, asl #3
	mov	r3, r7, asl #8
	sub	r3, r3, r7, asl #4
	add	r2, r2, lr
	mov	ip, r3, asl #4
	mov	r2, r2, asl #3
	add	r2, r2, lr
	rsb	ip, r3, ip
	mov	r1, r6, asl #7
	mov	r0, r6, asl #10
	rsb	ip, r7, ip
	mov	r3, r2, asl #2
	sub	r1, r1, r6, asl #5
	sub	r0, r0, r6, asl #3
	add	r2, r2, r3
	mov	r4, ip, asl #4
	add	r1, r1, r6
	add	r0, r0, r6
	mov	r3, r7, asl #5
	rsb	r4, ip, r4
	mov	r1, r1, asl #4
	mov	r0, r0, asl #2
	mov	r5, r7, asl #2
	mov	r2, r2, asl #2
	rsb	r2, lr, r2
	add	r5, r5, r3
	add	r1, r1, r6
	add	r0, r0, r6
	mov	r4, r4, asl #2
	add	r5, r5, r7
	mov	r3, r1, asl #5
	rsb	r4, r7, r4
	mov	ip, r2, asl #4
	mov	r0, r0, asl #2
	add	r1, r1, r3
	rsb	ip, r2, ip
	add	r0, r0, r6
	mov	lr, r5, asl #4
	mov	r2, r4, asl #5
	rsb	lr, r5, lr
	mov	r1, r1, asl #3
	mov	r0, r0, asl #3
	rsb	r2, r4, r2
	mov	ip, ip, asl #1
	add	r0, r0, r6
	mov	lr, lr, asl #7
	add	r1, r1, r6
	add	ip, ip, #-83886080
	add	r2, r2, #-872415232
	add	lr, lr, r7
	mov	r3, r0, asl #6
	mov	r1, r1, asl #2
	add	ip, ip, #5767168
	add	r2, r2, #15532032
	add	r0, r0, r3
	add	r1, r1, r6
	mov	r3, lr, asl #2
	add	ip, ip, #4160
	add	r2, r2, #37120
	add	ip, ip, #32
	rsb	r3, lr, r3
	rsb	r1, r1, #645922816
	add	r0, r0, #-1090519040
	add	r2, r2, #128
	add	r2, r2, ip
	mov	r3, r3, asl #4
	add	r1, r1, #466944
	add	r0, r0, #7077888
	add	r3, r3, r7
	mov	r2, r2, asr #22
	add	r1, r1, #2816
	add	r0, r0, #35584
	cmp	r2, #255
	rsb	r1, r3, r1
	add	r0, r0, #128
	bicle	r3, r2, r2, asr #31
	add	r0, r0, ip
	add	r1, r1, ip
	ldr	ip, [sl, #0]
	andle	r2, r3, #255
	movgt	r2, #255
	strb	r2, [ip, r8]
	mov	r1, r1, asr #22
	cmp	r1, #255
	ldr	r2, [sl, #0]
	bicle	r3, r1, r1, asr #31
	andle	r1, r3, #255
	movgt	r1, #255
	add	r3, r2, r8
	strb	r1, [r3, #1]
	mov	r0, r0, asr #22
	cmp	r0, #255
	ldr	r2, [sl, #0]
	bicle	r3, r0, r0, asr #31
	andle	r0, r3, #255
	add	r3, r2, r8
	add	r8, r8, #3
	movgt	r0, #255
	cmp	r9, r8
	strb	r0, [r3, #2]
	bne	.L46
.L39:
	ldr	r0, [fp, #0]
	bl	free
	mov	r0, sl
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	rgb_to_ycc_to_rgb, .-rgb_to_ycc_to_rgb
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r0, .L60
	mov	r4, r1
	bl	chdir
	ldr	r1, .L60+4
	ldr	r0, [r4, #4]
	bl	fopen
	mov	r9, r0
	ldr	r0, .L60+8
	bl	chdir
	cmp	r9, #0
	beq	.L58
	ldr	r0, .L60+12
	bl	chdir
	ldr	r1, .L60+16
	ldr	r0, [r4, #4]
	bl	fopen
	mov	r7, r0
	ldr	r0, .L60+8
	bl	chdir
	cmp	r7, #0
	beq	.L59
	mov	r0, r9
	bl	bmp_init
	ldrh	r3, [r0, #8]
	cmp	r3, #0
	mov	r5, r0
	bne	.L52
	ldrh	sl, [r0, #10]
	cmp	sl, #0
	beq	.L53
.L52:
	ldr	r0, .L60+20
	bl	printf
	mov	r0, #3
	bl	exit
.L53:
	add	r1, r0, #20
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	r0, .L60+24
	bl	printf
	ldr	r1, [r5, #12]
	mov	r2, sl
	mov	r0, r9
	bl	fseek
	add	r2, r5, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r0, #4
	mul	r6, r3, r2
	bl	malloc
	mov	r4, r0
	mov	r0, r6, asl #1
	add	r0, r0, r6
	bl	malloc
	mov	r3, r9
	mov	r1, #3
	mov	r2, r6
	str	r0, [r4, #0]
	bl	fread
	ldr	r2, [r5, #20]
	ldr	r1, [r5, #24]
	mov	r0, r4
	bl	rgb_to_ycc_to_rgb
	mov	r1, r7
	mov	r8, r0
	mov	r0, r5
	bl	print_bmp_header
	mov	r0, r7
	ldr	r1, [r5, #12]
	mov	r2, sl
	bl	fseek
	cmp	r6, #0
	ble	.L54
	mov	r5, sl
	mov	r4, sl
.L55:
	ldr	r0, [r8, #0]
	add	r5, r5, #1
	add	r0, r0, r4
	mov	r1, #3
	mov	r2, #1
	mov	r3, r7
	bl	fwrite
	cmp	r6, r5
	add	r4, r4, #3
	bgt	.L55
.L54:
	mov	r0, r8
	bl	free
	mov	r0, r7
	bl	fclose
	mov	r0, r9
	bl	fclose
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L59:
	ldr	r0, .L60+28
	bl	printf
	mov	r0, #1
	bl	exit
.L58:
	ldr	r0, .L60+32
	bl	printf
	mov	r0, #1
	bl	exit
.L61:
	.align	2
.L60:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC4
	.word	.LC5
	.word	.LC7
	.word	.LC8
	.word	.LC6
	.word	.LC3
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"in\000"
	.space	1
.LC1:
	.ascii	"rb\000"
	.space	1
.LC2:
	.ascii	"..\000"
	.space	1
.LC3:
	.ascii	"Input File error\000"
	.space	3
.LC4:
	.ascii	"out\000"
.LC5:
	.ascii	"wb\000"
	.space	1
.LC6:
	.ascii	"Output File error\000"
	.space	2
.LC7:
	.ascii	"Invalid bitmap\000"
	.space	1
.LC8:
	.ascii	"Image is %d x %d \012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

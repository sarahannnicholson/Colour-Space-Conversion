	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"image.c"
	.text
	.align	2
	.global	bmp_init
	.type	bmp_init, %function
bmp_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-16]
	mov	r0, #56
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #10
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #30
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #36
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #40
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #52
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-16]
	bl	fread
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	bmp_init, .-bmp_init
	.align	2
	.global	print_bmp_header
	.type	print_bmp_header, %function
print_bmp_header:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #10
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #30
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #36
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #40
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #52
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-12]
	bl	fwrite
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	print_bmp_header, .-print_bmp_header
	.align	2
	.global	rgb_to_ycc
	.type	rgb_to_ycc, %function
rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
	mov	r0, #4
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-12]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L7:
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #5
	add	r2, r2, r3
	mov	r3, r2, asl #7
	rsb	r3, r2, r3
	rsb	ip, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #8
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #5
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	add	r3, r3, #16
	and	r3, r3, #255
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	rsb	ip, r3, #0
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r2, r3, asl #5
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r2, r3, asl #2
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	rsb	r3, r3, #0
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3, asl #12
	mov	r3, r2, asl #3
	rsb	r3, r2, r3
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r3, r3, #255
	strb	r3, [r0, #1]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #12
	mov	r3, r2, asl #3
	rsb	ip, r2, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	add	r2, r2, r1
	mov	r3, r2, asl #3
	add	r3, r3, r1
	rsb	r3, r3, #0
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r2, r3, asl #6
	rsb	r2, r3, r2
	mov	r3, r2, asl #1
	rsb	r3, r3, #0
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r3, r3, #255
	strb	r3, [r0, #2]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #5
	add	r2, r2, r3
	mov	r3, r2, asl #7
	rsb	r3, r2, r3
	rsb	ip, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #8
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #5
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	add	r3, r3, #16
	and	r3, r3, #255
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	rsb	ip, r3, #0
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r2, r3, asl #5
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r2, r3, asl #2
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	rsb	r3, r3, #0
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3, asl #12
	mov	r3, r2, asl #3
	rsb	r3, r2, r3
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r3, r3, #255
	strb	r3, [r0, #1]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #12
	mov	r3, r2, asl #3
	rsb	ip, r2, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	add	r2, r2, r1
	mov	r3, r2, asl #3
	add	r3, r3, r1
	rsb	r3, r3, #0
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r2, r3, asl #6
	rsb	r2, r3, r2
	mov	r3, r2, asl #1
	rsb	r3, r3, #0
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r3, r3, #255
	strb	r3, [r0, #2]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #5
	add	r2, r2, r3
	mov	r3, r2, asl #7
	rsb	r3, r2, r3
	rsb	ip, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #8
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #5
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	add	r3, r3, #16
	and	r3, r3, #255
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	rsb	ip, r3, #0
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r2, r3, asl #5
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r2, r3, asl #2
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	rsb	r3, r3, #0
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3, asl #12
	mov	r3, r2, asl #3
	rsb	r3, r2, r3
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r3, r3, #255
	strb	r3, [r0, #1]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #12
	mov	r3, r2, asl #3
	rsb	ip, r2, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	add	r2, r2, r1
	mov	r3, r2, asl #3
	add	r3, r3, r1
	rsb	r3, r3, #0
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #6
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r2, r3, asl #6
	rsb	r2, r3, r2
	mov	r3, r2, asl #1
	rsb	r3, r3, #0
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r3, r3, #255
	strb	r3, [r0, #2]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #5
	add	r2, r2, r3
	mov	r3, r2, asl #7
	rsb	r3, r2, r3
	rsb	ip, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #8
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #5
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	add	r3, r3, #16
	and	r3, r3, #255
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	rsb	ip, r3, #0
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r2, r3, asl #5
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r2, r3, asl #2
	rsb	r2, r3, r2
	mov	r3, r2, asl #2
	rsb	r3, r3, #0
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3, asl #12
	mov	r3, r2, asl #3
	rsb	r3, r2, r3
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r3, r3, #255
	strb	r3, [r0, #1]
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #12
	mov	r3, r2, asl #3
	rsb	ip, r2, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	add	r2, r2, r1
	mov	r3, r2, asl #3
	add	r3, r3, r1
	rsb	r3, r3, #0
	add	ip, ip, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r3, #9
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r2, r3, asl #6
	rsb	r2, r3, r2
	mov	r3, r2, asl #1
	rsb	r3, r3, #0
	add	r3, ip, r3
	mov	r3, r3, asr #16
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r3, r3, #255
	strb	r3, [r0, #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
.L6:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L7
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	rgb_to_ycc, .-rgb_to_ycc
	.align	2
	.global	ycc_to_meta
	.type	ycc_to_meta, %function
ycc_to_meta:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	mul	r3, r2, r3
	str	r3, [fp, #-28]
	mov	r0, #4
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, lsr #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L10
.L13:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	mul	r3, r2, r3
	mov	r3, r3, asr #1
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L11
.L12:
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-40]
	mul	r2, r3, r2
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r0, #1]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r0, #2]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r0, #3]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	add	ip, ip, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	add	ip, ip, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	add	r3, ip, r3
	mov	r3, r3, asr #2
	and	r3, r3, #255
	strb	r3, [r0, #4]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	add	ip, ip, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	add	ip, ip, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	add	r3, ip, r3
	mov	r3, r3, asr #2
	and	r3, r3, #255
	strb	r3, [r0, #5]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L11:
	ldr	r3, [fp, #-40]
	mov	r2, r3, asr #1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L12
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L10:
	ldr	r3, [fp, #-36]
	mov	r2, r3, asr #1
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L13
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	ycc_to_meta, .-ycc_to_meta
	.align	2
	.global	meta_to_ycc
	.type	meta_to_ycc, %function
meta_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	mul	r3, r2, r3
	str	r3, [fp, #-28]
	mov	r0, #4
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L16
.L19:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	mul	r2, r3, r2
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L17
.L18:
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-40]
	mul	r2, r3, r2
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	strb	r3, [r0, #1]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	strb	r3, [r0, #1]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	strb	r3, [r0, #1]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	strb	r3, [r0, #1]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	strb	r3, [r0, #2]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	strb	r3, [r0, #2]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	strb	r3, [r0, #2]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r0, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	strb	r3, [r0, #2]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L17:
	ldr	r3, [fp, #-40]
	mov	r2, r3, asr #1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L18
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L16:
	ldr	r3, [fp, #-36]
	mov	r2, r3, asr #1
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L19
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	meta_to_ycc, .-meta_to_ycc
	.align	2
	.global	ycc_to_rgb
	.type	ycc_to_rgb, %function
ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-48]
	mul	r3, r2, r3
	str	r3, [fp, #-32]
	mov	r0, #4
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L22
.L29:
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #3
	mov	r3, r2, asl #7
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	rsb	r2, r1, r2
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	add	r3, r3, #-83886080
	add	r3, r3, #5767168
	add	r3, r3, #4160
	add	r3, r3, #32
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #4
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	rsb	r2, r1, r2
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r1, r3
	mov	r2, r3, asl #5
	rsb	r3, r3, r2
	add	r3, r3, #-872415232
	add	r3, r3, #15532032
	add	r3, r3, #37120
	add	r3, r3, #128
	ldr	r2, [fp, #-20]
	add	r3, r3, r2
	mov	r3, r3, asr #22
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	mov	r2, r2, asl #7
	add	r2, r2, r1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	add	r3, r3, r1
	rsb	r3, r3, #0
	add	r3, r3, #436207616
	add	r3, r3, #266240
	add	r3, r3, #2176
	ldr	r2, [fp, #-20]
	add	r0, r3, r2
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #5
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r3, r3, asl #4
	add	r3, r3, r1
	mov	r2, r3, asl #5
	add	r3, r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	rsb	r3, r3, #0
	add	r3, r3, #209715200
	add	r3, r3, #200704
	add	r3, r3, #640
	add	r3, r0, r3
	mov	r3, r3, asr #22
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	mov	r2, r3, asl #3
	mov	r3, r2, asl #7
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r2, r3, asl #6
	add	r3, r3, r2
	add	r3, r3, #-1090519040
	add	r3, r3, #7077888
	add	r3, r3, #35584
	add	r3, r3, #128
	ldr	r2, [fp, #-20]
	add	r3, r3, r2
	mov	r3, r3, asr #22
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r1, r1, r3
	str	r1, [fp, #-72]
	ldr	r3, [fp, #-16]
	cmp	r3, #255
	bgt	.L23
	ldr	r3, [fp, #-16]
	bic	r3, r3, r3, asr #31
	and	r3, r3, #255
	str	r3, [fp, #-68]
	b	.L24
.L23:
	mov	r2, #255
	str	r2, [fp, #-68]
.L24:
	ldr	r2, [fp, #-68]
	mov	r3, r2
	ldr	r2, [fp, #-72]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r1, r1, r3
	str	r1, [fp, #-64]
	ldr	r3, [fp, #-12]
	cmp	r3, #255
	bgt	.L25
	ldr	r3, [fp, #-12]
	bic	r3, r3, r3, asr #31
	and	r3, r3, #255
	str	r3, [fp, #-60]
	b	.L26
.L25:
	mov	r3, #255
	str	r3, [fp, #-60]
.L26:
	ldr	r2, [fp, #-60]
	mov	r3, r2
	ldr	r2, [fp, #-64]
	strb	r3, [r2, #1]
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r1, r1, r3
	str	r1, [fp, #-56]
	ldr	r3, [fp, #-8]
	cmp	r3, #255
	bgt	.L27
	ldr	r3, [fp, #-8]
	bic	r3, r3, r3, asr #31
	and	r3, r3, #255
	str	r3, [fp, #-52]
	b	.L28
.L27:
	mov	r3, #255
	str	r3, [fp, #-52]
.L28:
	ldr	r2, [fp, #-52]
	mov	r3, r2
	ldr	r2, [fp, #-56]
	strb	r3, [r2, #2]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L22:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L29
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	ycc_to_rgb, .-ycc_to_rgb
	.align	2
	.global	rgb_to_ycc_to_rgb
	.type	rgb_to_ycc_to_rgb, %function
rgb_to_ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	bl	rgb_to_ycc
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	bl	ycc_to_meta
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	bl	meta_to_ycc
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	bl	ycc_to_rgb
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	rgb_to_ycc_to_rgb, .-rgb_to_ycc_to_rgb
	.section	.rodata
	.align	2
.LC0:
	.ascii	"in\000"
	.align	2
.LC1:
	.ascii	"rb\000"
	.align	2
.LC2:
	.ascii	"..\000"
	.align	2
.LC3:
	.ascii	"Input File error\000"
	.align	2
.LC4:
	.ascii	"out\000"
	.align	2
.LC5:
	.ascii	"wb\000"
	.align	2
.LC6:
	.ascii	"Output File error\000"
	.align	2
.LC7:
	.ascii	"Invalid bitmap\000"
	.align	2
.LC8:
	.ascii	"Image is %d x %d \012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r0, .L41
	bl	chdir
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r1, .L41+4
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r0, .L41+8
	bl	chdir
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L34
	ldr	r0, .L41+12
	bl	printf
	mov	r0, #1
	bl	exit
.L34:
	ldr	r0, .L41+16
	bl	chdir
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r1, .L41+20
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, .L41+8
	bl	chdir
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L35
	ldr	r0, .L41+24
	bl	printf
	mov	r0, #1
	bl	exit
.L35:
	ldr	r0, [fp, #-32]
	bl	bmp_init
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #8]
	cmp	r3, #0
	bne	.L36
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #10]
	cmp	r3, #0
	beq	.L37
.L36:
	ldr	r0, .L41+28
	bl	printf
	mov	r0, #3
	bl	exit
.L37:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #24]
	ldr	r0, .L41+32
	mov	r1, r2
	mov	r2, r3
	bl	printf
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-32]
	mov	r1, r3
	mov	r2, #0
	bl	fseek
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #20]
	mul	r3, r2, r3
	str	r3, [fp, #-20]
	mov	r0, #4
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-20]
	mov	r0, r3
	mov	r1, #3
	ldr	r3, [fp, #-32]
	bl	fread
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #24]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #20]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, r3
	bl	rgb_to_ycc_to_rgb
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	bl	print_bmp_header
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	mov	r2, #0
	bl	fseek
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L38
.L39:
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	mov	r0, r3
	mov	r1, #3
	mov	r2, #1
	ldr	r3, [fp, #-28]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L38:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L39
	ldr	r0, [fp, #-12]
	bl	free
	ldr	r0, [fp, #-28]
	bl	fclose
	ldr	r0, [fp, #-32]
	bl	fclose
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

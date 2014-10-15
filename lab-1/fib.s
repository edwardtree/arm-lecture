	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func
	.global fibonacci
	.type fibonacci, function

fibonacci:

	push {r4, r5, r6, r7, lr}

	add r4, r4, #-1
	add r5, r5, #1
	add r7, r7, #0
	add r6, r6, #0

L1:
	
	add r6, r5, r4
	mov r4, r5
	mov r5, r6
	
	add r7, r7, #1
	cmp r7, r0
	ble L1

	mov r0, r5 
	pop {r4, r5, r6, r7,pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end

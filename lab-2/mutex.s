	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        ldr r1, =locked @ load locked value into r1 the temp register 
	@ INSERT CODE BELOW
	
	ldrex r2,[r0] 
	cmp r2, r1
	beq lock_mutex @if lock , loop again

	strexeq r2,r1,[r0] @ store r1 into r0, if successful r2 equal zero 
	cmp r2, #0
	bne lock_mutex @if lock fail , lock again

        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
        ldr r1, =unlocked
	str r1,[r0] @ the thread finish work and unlock key
	bx lr
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end

.global _start 	// Delcalre the entry point symbol "_start"

// Hex5 - Hex2
.equ HEX_HIGH_ADDR, 0xFF200020
.equ HEX_LOW_ADDR, 0xFF200030

_start:			// Program entry point

	// Set r0 to constant High Address
	ldr r0, =HEX_HIGH_ADDR

	// Set r1 to A
	//ldr r1, ='A'
	ldr r1, =0x5B4F666D
	
	// Store the A into Segment 5
	str r1, [r0]
	
	
	// Set r2 to constant Low Address
	ldr r0, =HEX_LOW_ADDR

	// Set r1 to A
	//ldr r1, ='A'
	ldr r1, =0x00003F06
	
	// Store the A into Segment 5
	str r1, [r0]
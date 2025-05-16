.global _start 	// Delcalre the entry point symbol "_start"

// Hex5 - Hex2
.equ HEX_HIGH_ADDR, 0xFF200020
// Hex1 - Hex0
.equ HEX_LOW_ADDR, 0xFF200030

_start:			// Program entry point

	// Set r0 to constant High Address
	ldr r0, =HEX_HIGH_ADDR

	// Set r1 to 2345
	ldr r1, =0x5B4F666D
	
	// Store the 2345 into the HEX_HIGH_ADDR
	str r1, [r0]
	
	// Set r2 to constant Low Address
	ldr r2, =HEX_LOW_ADDR

	// Set r3 to 01
	ldr r3, =0x00003F06
	
	// Store the 01 into the HEX_LOW_ADDR
	str r3, [r2]
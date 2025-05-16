.global _start 	// Delcalre the entry point symbol "_start"

_start:			// Program entry point

// Load the address of data1 into r0
ldr r0, =operand_data1
// Load the value from memory at address r0 into r0
ldr r0, [r0]

ldr r1, =operand_data2
ldr r1, [r1]

ldr r2, =operand_data3
ldr r2, [r2]

mul r3, r0, r1
mul r4, r3, r2


program_halt_loop:
	b program_halt_loop



// Data Section
data_section: 
	// Define a 32-bit word with a value 17
	operand_data1: .word 17
	operand_data2: .word 29
	operand_data3: .word 56
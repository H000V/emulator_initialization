.global _start	// Declare the entry point symbol "_start"

_start:			// Program entry point

// Load immediate value 23 into r0
mov r0, #23
mov r1, #35
mov r2, #47

// Multiply r0 and r1, store results in r3
mul r3, r0, r1
mul r3, r3, r2

// Label for infinite loop to halt excution
halt:
	b halt		// Branch to 'halt'
	
end:			// Unused label

// Start of the routine
.global start
start:

    // Release the peripherals reset for iobank 0
    ldr r0, =RST_CLR       // Atomic Register for clearing reset controller
    mov r1, #32             // load a 1 into bit 5
                            // 32 is binary 0010 0000
    str r1, [r0, #0]        // Store the bit mask into the Atomic Register to clear our register

// Check if the reset is done
rst: 
    // Base address for reset controller
    ldr r0, =RST_BASE
    // Offset to get to the RESET_DONE register
    ldr r1, [r0, #8]
    // Load 1 in bit 5 of register 2
    mov r2, #32
    // Isolate bit 5
    and r1, r1, r2
    // If bit 5 is a 0 then check again, if, reset is done
    beq rst

    // Set the control
    // Control Register for our GPIO25 
    ldr r0, =CTRL
    // Function 5, select the SIO for GPIO25
    mov r1, #5
    // Store Function 5 in our GPIO Control Register
    str r1, [r0]

    // Shift over "1" the number of bits of our GPIO pin
    // Setup the bit mask by loading a 1 into register 1 (0001)
    mov r1, #1
    // To set the bit mask to the 25th bit, move (left shift) the bit 25 times
    lsl r1, r1, #25
    // SIO_BASE address stored in r0
    ldr r0, =SIO_BASE
    // Store r1 (bit mask) into the memory location pointed to by r0 plus an offset
    // of 36 dec or 0x20 GPIO Output Enable Register location.
    str r1, [r0, #36]

led_loop:
    // Address of our GPIO25 pin is r0 with an offset of 20 dec or 0x14
    // r1 already has the bit mask of 1 to turn the LED on.
    str r1, [r0, #20]
    // Load our countdown number
    ldr r3, =BIG_NUM
    // Branch with Link to subroutine delay
    bl delay

    // Turn the LED off
    // GPIO_OUT_CLR Register has an offset of dec 24
    str r1, [r0, #24]
    ldr r3, =BIG_NUM
    bl delay
    
    // Do the loop again (uncondtional branch)
    b led_loop

delay:
    // Subtract 1 from register 3
    sub r3, #1
    bne delay
    // Return from our subroutine (function)
    bx lr

data:
    // Atomic Register for clearing reset controller
    .equ RST_CLR, 0x4000F000
    // Rest Controller Base
    .equ RST_BASE, 0x4000C000
    // GPIO25_CTRL
    .equ CTRL, 0x400140CC
    // SIO Base
    .equ SIO_BASE, 0xD0000000
    // Large number for delay
    .equ BIG_NUM, 0x00F00000
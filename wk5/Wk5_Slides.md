---
marp: true
class: invert
---

# Welcome Back To C!
Week 5 Tute

We'll start at 10 past :D

--- 

# Numbers!

- There are many different ways to refer to any number.
- List some ways we could represent the number 78:

    -
    -
    -
    -
    -
    -

- What are the pros and cons of using these methods of representing numbers?

---

# Numbers! (sample answers)

- There are many different ways to refer to any number.
- List some ways we could represent the number 78:

    - The numeral `78`
    - The english words `seventy eight`
    - The french words `soixante-dix-huit`
    - Tally marks ~~`|||| |||| |||| |||| |||| |||| |||| |||| |||| |||| |||| |||| |||| |||| ||||`~~`|||`
    - Binary: `1001110`  Octal: `116`  Hexadecimal:`4E`

- What are the pros and cons of using these methods of representing numbers?

---

# What representation do computers use?

- Computers don't write symbols on paper, they have circuits!
- They represent a number using a bunch of circuits that can be on or off (1 or 0).
- Each of these circuits is called a bit. Recall that one byte is made of 8 bits.
- Computers represent integers using a system called binary.

---

# Decimal

- Usually when we write a number, like `42`, we're using a system called Decimal.
- "Dec" means ten, because in Decimal we have ten symbols we can use to write numbers.
- These ten symbols are:
    - 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
- We position these symbols next to each other. For example, in the decimal number `42`, `4` is in the tens' place, and `2` is in the ones' place."

---

# Binary
- When a computer stores a number, it uses a system called Binary.
- "Bin" means two, because in Binary we have two symbols to write numbers.
- These two symbols are:
    - 0, 1
- It positions these symbols next to each other. For example, in the binary number `101`, `1` is in the fours' place, `0` is in the twos' place, and `1` is in the ones' place.
- So the binary number `101` is equal to:
$$2^2(1)+2(0)+1(1)=4+1=5$$

---

# Decimal from Binary

How would the binary number `101010` be represented in decimal?

Anwser: __

---

# Binary from Decimal

How would the decimal number 24 be represented as a binary numeral?

There's a simple process!
- Write out the powers of two until you find one larger than the number.

    - 32, 16, 8, 4, 2, 1

- Go left to right.
    - If the power of 2 is greater than the number, write 1 and subtract it from the number.
    - If the power of 2 is less than the number, write 0.

Answer: `0b______`

---

# Some Other Number Systems

- Octal, which uses 8 symbols.
    - 0, 1, 2, 3, 4, 5, 6, 7
- Hexadecimal, which uses 16 symbols.
    - 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F

- Usually when we want to translate numbers between these systems and decimal, we'll use binary as an in-between.

---

Represent these decimal numbers as 8-bit binary, 3-digit octal, and 2-digit hexadecimal:

| Decimal |   Binary   | Octal | Hexadecimal |
|:-------:|:----------:|:-----:|:-----------:|
|    1    | 0b00000001 |  001  |     0x01    |
|    8    | 0b00001000 |  010  |     0x08    |
|    10   | 0b00001010 |  012  |     0x0A    |
|    15   | 0b00001111 |  017  |     0x0F    |
|    16   | 0b00010000 |  020  |     0x10    |
|   100   | 0b01100100 | 0144  |     0x64    |
|   127   | 0b01111111 | 0177  |     0x7F    |
|   200   | 0b11001000 | 0310  |     0xC8    |

---

Represent these decimal numbers as 8-bit binary, 3-digit octal, and 2-digit hexadecimal:

| Decimal |   Binary   | Octal | Hexadecimal |
|:-------:|:----------:|:-----:|:-----------:|
|    1    | 0b00000001 |  001  |     0x01    |
|    8    | 0b00001000 |  010  |     0x08    |
|    10   | 0b00001010 |  012  |     0x0A    |
|    15   | 0b00001111 |  017  |     0x0F    |
|    16   | 0b00010000 |  020  |     0x10    |
|   100   | 0b01100100 |  0144 |     0x64    |
|   127   | 0b01111111 |  0177 |     0x7F    |
|   200   | 0b11001000 |  0310 |     0xC8    |

---

How could we solve this problem with a C program?

---

```C
int number;
scanf(" %d", &number);
printf("%d = 0%3o = 0x%2x\n", number, number, number);
```

---

# Operations

- Some operations we know are addition, subtraction, multiplication, division.
- These operations are easiest when working with the decimal representations of numbers
- I don't want to multiple tally marks, and I don't want to divide binary.
- Operators are represented by a symbol. For example, `+` means addition.
- Most operators take two "operands". For example in `1 + 2` the operands are `1` and `2`.
- Some operators only take one operand. For example, in `-4`, the only operand is `4`. (This is called a unary operation.)

---

# Some new Operations!
- These new operators are more intuitive when we work with the binary representations of numbers.
- The new operators are:
    - Left shift: `<<`
    - Right shift: `>>`
    - Bitwise OR: `|`
    - Bitwse AND: `&`
    - Bitwise XOR: `^`
    - Bitwise NOT: `~`

---

# Bit shifting

The two bit shift operations are most intuitive when we use them with binary representations of numbers.

Some examples:

```
0b0010 << 1 = 0b0100
0b1000 >> 3 = 0b0001
```

The bits get shifted left or right by the amount specified in the second operand.

We're not limited to binary, but it makes the most sense in binary.
```
28 >> 2 = 7
0b11100 >> 2 = 0b00111
```

---

# Bitwise Logical Operations

To compute these operations, write the number as a binary number, and then compare each bit in the two numbers and consult a truth table.

| Input 1 | Input 2 || OR | AND | XOR |
|:-------:|:-------:|-|:--:|:---:|-----|
|    0    |    0    ||  0 |  0  | 0   |
|    0    |    1    ||  1 |  0  | 1   |
|    1    |    0    ||  1 |  0  | 1   |
|    1    |    1    ||  1 |  1  | 0   |

---

# NOT Truth Table

NOT's truth table is simple, you just invert each number.

| Input | NOT |
|:-----:|:---:|
|   0   |  1  |
|   1   |  0  |

---

# C Integer Types

```C
#include <stdint.h>

                 // range of values for type
                 //             minimum               maximum
    int8_t   i1; //                 -128                  127
    uint8_t  i2; //                    0                  255
    int16_t  i3; //               -32768                32767
    uint16_t i4; //                    0                65535
    int32_t  i5; //          -2147483648           2147483647
    uint32_t i6; //                    0           4294967295
    int64_t  i7; // -9223372036854775808  9223372036854775807
    uint64_t i8; //                    0 18446744073709551615
```

---

# Operations Question
Assume that we have the following 16-bit variables defined and initialised:
```C
uint16_t a = 0x5555, b = 0xAAAA, c = 0x0001;
```

What are the results of the following expressions? Give your answers in hexadecimal.

`a | b        = 0x____`
`a & b        = 0x____`
`a ^ b        = 0x____`
`a & ~b       = 0x____`
`c << 6       = 0x____`
`a >> 4       = 0x____`
`a & (b << 1) = 0x____`
`b | c        = 0x____`
`a & ~c       = 0x____`

---

# Answers

`a | b        = 0xFFFF`
`a & b        = 0x0000`
`a ^ b        = 0xFFFF`
`a & ~b       = 0x5555`
`c << 6       = 0x0040`
`a >> 4       = 0x0555`
`a & (b << 1) = 0x5554`
`b | c        = 0xAAAB`
`a & ~c       = 0x5554`

---

# Flags

Sometimes, when we want to be very memory efficient, we can pack in multiple pieces of information into a small space.

For example, a one-byte variable could contain up to 8 boolean (yes/no) pieces of information.

We use constants called "flags" that allow us to access and modify specific parts of memory.

---

# Flags Example

Say we have one 8-bit variable which encodes information about how we're allowed to access a file.

So the one's place tells us if we're allowed to read it, the two's place tells us if we're allowed to write to it, and the four's place tells us if we're allowed to execute it.

We might then have the following code:

```C
#include <stdint.h>

CAN_READ    = 0x1 // 0b001
CAN_WRITE   = 0x2 // 0b010
CAN_EXECUTE = 0x4 // 0b100

uint_8 permissions;
```

---

# More Flags example:

```C
#include <stdint.h>

CAN_READ    = 0x1 // 0b001
CAN_WRITE   = 0x2 // 0b010
CAN_EXECUTE = 0x4 // 0b100

uint_8 permissions;
scanf(" %d", &permissions);

// Print whether we can read the file
printf("%d\n", (permissions & CAN_READ));

// Print whether we can write to the file
printf("%d\n", (permissions & CAN_WRITE) >> 1);

// Print whether we can execute the file
printf("%d\n", (permissions & CAN_EXECUTE) >> 2);
```

 ---
# More Flags example:

```C
#include <stdint.h>

CAN_READ    = 0x1 // 0b001
CAN_WRITE   = 0x2 // 0b010
CAN_EXECUTE = 0x4 // 0b100

uint_8 permissions;

// Set the permissions to read-only
permissions = CAN_READ;

// Set the permissions to read and execute
permissions = CAN_READ | CAN_EXECUTE;

// Add the permission to write
permissions = permissions | CAN_WRITE;

// Remove the permission to execute
permissions = permissions & ~CAN_EXECUTE;
```

---

# Some Help With The Lab

You won't easily be able to copy-and-paste this into the lab, but it might give you some idea of what strategy to use with the earlier questions.

Let's say you want to set the nth binary digit of some value to 1.

We'd use the `|` operation.

We'll create a flag, and or it with our number.

```C
uint8_t add_one_at_position(uint8_t value, int position) {
    flag = 0x01;            // Create a flag: 0b00000001
    flag <<= position;      // Shift the flag left by some amount
    value = value | flag;   // OR the flag with our value, setting that digit to 1.
    return value;           // Return our new value.
}
```

---

# What is BCD?

BCD (Binary-Coded Decimal) is not the same as binary, it's yet another method of representing numbers.

Specifically, it's an encoding, different to C's usual encoding . This means that if we store a BCD-encoded number, C won't understand the encoding.

To translate a decimal representation of a number to a BCD representation of a number:
 - Look at each digit of the decimal representation of the number.
 - Write that digit as a 4-bit binary number (or a 1-digit hexadecimal number)
 - Concatenate the digits.

For example, the BCD representation of decimal `42` would be:
- In binary: `0b 0100 0010`
- In hexadecimal: `0x42`
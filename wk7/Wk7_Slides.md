---
marp: true
class: invert
---

# More Number Encoding
Week 7 Tute

We'll start at 10 past :D

--- 

# Week 5 Revision:

- Left shift: `<<` moves bits to the left
- Right shift: `>>` moves bits to the right
- Bitwise OR: `|` combines, keeps all 1s
- Bitwise AND: `&` masks/extracts, keeps all 0s
- Bitwise NOT: `~` inverts
- Bitwise XOR: `^` not used commonly, finds differences

All of these operations can also be done in mips.

---

# MIPS Equivalents

- Left shift `<<` in mips is: `sll`
- Right shift `>>` in mips is: `srl`
- Bitwise OR `|` in mips is: `or`
- Bitwise AND `&` in mips is: `and`
- Bitwise NOT `~` in mips is: `not`
- Bitwise XOR `^` in mips is: `xor`

---

# Representing Negative Numbers

Last week we talked about how computers store positive integers, but what about negative integers?

The most obvious way to do it is just to have the first bit represent whether the number is positive or negative, e.g. `0b0001 = 1`, `0b1001 = -1`.

This naive method has quite a few problems, though.

---

# Problems with the naive approach

We want negative numbers to work as simply as possible: `1 + 1` should be as easy to compute as `-1 + 1`.

With the naive approach, we'd have to modify our usual addition operation to account for negative numbers, which is inelegant and slow.

Additionally, a slightly smaller problem - the naive approach treats `0` and `-0` as different numbers.

---

# A better solution

The way we store negative integers is not using the naive method. We use a better system called two's complement.

One way to think about it:

> In two's complement, the left-most bit of the number does not represent a large positive number ($2^{15}$ for a 16-bit number). It instead represents a very large **negative** number: $-2^{15}$ (for a 16-bit number).

Another way to think about it:

> To represent a negative number, subrtract 1 from its positive version, then invert the bits.

---

# A quick example (in 8-bits):

So $1$ is represented by `0b........`, and $-3$ is `0b........`. So we can calculate $-3+1$:

```
0b........
0b........ +
----------
0b........
```

Converting this result back to decimal, we find the answer is:

With two's complement, we don't need to have any if statements, addition just works as we expect.

---

# Q1: Converting From Two's Complement

Assume that the following hexadecimal values are 16-bit twos-complement. Convert each to the corresponding decimal value.

- `0x0013`
- `0x0444`
- `0x1234`
- `0xffff`
- `0x8000`

---

# Q1 Answers:

- `0x0013` = $19$
- `0x0444` = $1092$
- `0x1234` = $4660$
- `0xffff` = $-1$
- `0x8000` = $−32768$

---

# Q2 Converting to Two's Complement

Give a representation for each of the following decimal values in 16-bit twos-complement bit-strings. Show the value in binary, octal and hexadecimal.

- $1$
- $100$
- $1000$
- $10000$
- $100000$
- $-5$
- $-100$

---

# Q2 Answers

- $1$ = `0b0000 0000 0000 0001` = `0x0001` = `01`
- $100$ = `0b0000 0000 0110 0100` = `0x0064` = `0144`
- $1000$ = `0b0000 0011 1110 1000` = `0x03E8` = `01750`
- $10000$ = `0b0010 0000 0000 0001` = `0x2710` = `023420`
- $100000$ cannot be represented in 16 bits
- $-5$ = `0b1111 1111 1111 1011` = `0xFFFB` = `0177774`
- $-100$ = `0b1111 1111 1001 1100` = `0xFF9C` = `0177634`

---

# Moving On

Okay, so we can represent any integer, positive or negative, with a string of 1s and 0s, though we'd prefer the integers aren't _too_ large.

But what about numbers like `0.25`, `3.15159`, or infinity?

We can only represent a finite amount of numbers with a computer - there are only so many combinations of 1s and 0s. We're going to have to trade precision for flexibility/range.

---

# Noninteger Numbers in Binary

In decimal, 0.1 is one tenth, 0.01 is one hundredth, 0.001 is one thousandth, and so on.

In binary, 0b0.1 is one half, 0b0.01 is one quarter, 0b0.001 is one eighth, and so on.

---

# Scientific Notation

You're probably familiar with scientific notation, which looks like this:

$3.674\times 10^{-5} = 0.00003674$

There are two relevant numbers here: the coefficient and the exponent. Note that the coefficient will always be between 1 and 10.

---

# Scientific Notation with Binary Numbers

The coefficient will always be between `0b1` and `0b10` - it'll be between 1 and 2.

We'll take everything after the decimal point and call it the fraction.

So our formula might be something like:

$(1 + \text{frac})\times 2^\text{exp}$

---

# Finishing Touches

An example fraction might be something like `0b0.0110` - this is a bit awkward, so we'll agree ahead of time that it will be a specific number of bits long. (We'll choose 23 bits).

That way we can just represent it as an integer: `0b0110` could  represent `0b0.0110` (if we'd chosen 4 bits).

The exponent can be positive or negative, but we don't really want to go to the trouble of 2s complement. We'll just use a normal unsigned binary number between 0-255, and subtract 127 from it, so we have access to the range -127 to 128.

We'll use one more bit to keep track of whether the whole number is positive or negative, we'll call it the sign.

---

# Special Cases

There are special cases for 0 and infinity.

If the exponent is at its minimum value (`0x00`), and the fraction is 0, the value of the number is 0.

If the exponent is at its maximum value (`0xff`) and the fraction is 0, the value of the number is infinity (or minus infinity, depending on the sign).

If the exponent is at its maximum value (`0xff`) and the fraction is not 0, the value of the number is NaN (Not a Number).

---

# We're done!

So we've described a system we can use to represent any number, including 0 and infinity.

This system is called IEEE 754.

To recap, we'll store a number using 32 bits. The first bit is the sign, the next 8 bits are the exponent, the final 23 bits are the fraction.

The value of the number is: $-1^\text{sign}\times(1+\text{frac})\times2^{\text{exp}-127}$

---

# Q3 - Converting from Floating Point

What decimal numbers do the following single-precision IEEE 754-encoded bit-strings represent?

- `0 00000000 00000000000000000000000`
- `1 00000000 00000000000000000000000`
- `0 01111111 10000000000000000000000`
- `0 01111110 00000000000000000000000`
- `0 01111110 11111111111111111111111`
- `0 10000000 01100000000000000000000`
- `0 10010100 10000000000000000000000`
- `0 01101110 10100000101000001010000`

---

# Q3 Answers

- `0 00000000 00000000000000000000000` = 0
- `1 00000000 00000000000000000000000` = -0
- `0 01111111 10000000000000000000000` = 1.5
- `0 01111110 00000000000000000000000` = 0.5
- `0 01111110 11111111111111111111111` = 0.9999...
- `0 10000000 01100000000000000000000` = 2.75
- `0 10010100 10000000000000000000000` = 3145728.00
- `0 01101110 10100000101000001010000` = 0.0000124165...

---

# Q4 Decimal to Floating Point

Convert the following decimal numbers into IEEE 754-encoded bit-strings:

> (Tip: the coefficient will be between 1 and 2.)

- 2.5
- 0.375
- 27.0
- 100.0

---

# Q4 Answers

- 2.5 = $1.25\times2^1$ = `0 10000000 01000000000000000000000`
- 0.375 = $1.5\times2^{-2}$ = `0 01111101 10000000000000000000000`
- 27.0 = $1.6875\times2^4$ = `0 10000011 10110000000000000000000`
- 100.0 = $1.5625\times2^6$ = `0 10000101 10010000000000000000000`

---

# Q5 Extracting Bits

Write a C function, `six_middle_bits`, which, given a `uint32_t`, extracts and returns the middle six bits.

---

# Q5 Answer

Write a C function, six_middle_bits, which, given a uint32_t, extracts and returns the middle six bits.

```C
uint32_t six_middle_bits(uint32_t u) {
    return (u >> 13) & 0x3F;
```
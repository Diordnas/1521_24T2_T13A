---
marp: true
class: invert
---

# 2D Arrays, Functions, and Structs
Week 4 Tute

We'll start at 10 past :D

---

# Assignment 1
 - Due Friday Week 5, 6pm
 - Start soon if you haven't already!

---

# Functions

- arguments in `$a` registers
- return value in `$v` registers
- return using `jr $ra`

---

# Functions - Example

Translate the q1 C code to MIPS.

---
# Preserving Values

- If your function calls another function (`jal`), you must preserve the value of `$ra`.
- If your function uses `$s` registers, you must preserve their values.

We preserve values by moving them from registers into memory. Specifically, we use a section of memory called the stack.

---

# The Stack

You can imagine the stack as a pile of values. We only interact with the top.

The stack is FILO (First In, Last Out). That is, the first value we put on the stack will be the last thing we pop off the stack, because it's at the bottom of the pile.

---

# Push and Pop

`push` and `pop` are pseudoinstructions in mipsy that make it easy to work with the stack.

They automatically allocate and free memory by moving the stack pointer `$sp`, so we don't have to deal with it by hand.

- Put a value on top of the stack with `push $r`.
- Remove the value on top of the stack and store it in a register with `pop $r`.
- You must pop in reverse order to how you pushed.

---

# Functions - Recursion Example
Translate the q2 C code to MIPS.

---

# 2D Arrays

Say you have a 5x5 2d array of ints.

How would you calculate the addresses of:
 - array[0][0]
 - array[0][1]
 - array[0][4]
 - array[1][0]
 - array[1][1]
 - array[2][1]
 - array[3][4]

---

# Answers

Say you have a 5x5 2d array of ints.

How would you calculate the addresses of:
 - array[0][0] : &array + 0
 - array[0][1] : &array + 4(1)
 - array[0][4] : &array + 4(4)
 - array[1][0] : &array + 4(5(1) + 0)
 - array[1][1] : &array + 4(5(1) + 1)
 - array[2][1] : &array + 4(5(2) + 1)
 - array[3][4] : &array + 4(5(3) + 4)

---

# General equation for 2D arrays:

size_of_element * ((row * num_col) + col)

---

# Printing from a 2d array

Translate the q3 C code to MIPS.

---

# Structs

- Structs in C allow us to create custom data types.

- In MIPS, we can create structs in memory, but we have to do a lot more manual work.

- We must decide on the layout of the struct in memory, figure out its total size, and the required offsets to calculate the address of each value in the struct.

---

# Structs Example

Examine the struct defitions in `q4.c` and decide on how you'd allocate them in memory in mips.

Figure out the total size of the struct, and the offsets to access each of its fields.

---

# Final Example

Translate the q5 C code to MIPS.

You have been given some starter code.

```
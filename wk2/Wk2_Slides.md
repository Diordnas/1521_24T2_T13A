---
marp: true
class: invert
---

# Welcome to MIPS!
Week 2 Tute

(We'll start at 5 past :D)
(maybe 10 past if people are real late)

---

# Mips
 - Low level language: closer to machine code, but harder to read/write.
 - Mips is so low-level and so close to machine code, that it will only run on CPUs designed for it.

---

# Mipsy!
 - Mips emulator that lets us run mips on any machine - it simulates a mips CPU.
 - Mipsy-web - online version for debugging.

---

# Variables in Mips
 - In C, when we make a variable, it's stored in memory.
 - Because mips is so low level, we'd have to manually move variables from memory to the CPU, and back.
 - That's inefficient & annoying - it's often better to store our variables in the CPU instead of in memory.

---

# Registers
 - Inside the CPU, there are spaces for us to store 32 numbers. These spaces are called registers.
 - Unlike variables in C, we don't have to declare, name, or allocate memory for them - the spaces are already there.
 - Let's look at some registers and their purposes!

---

# Question 1 - basics
Translate `q1.c` into mips assembly, and run it with `1521 mipsy`.

---

# Logic & Flow in Mips
 - Mips doesn't have built-in if statements or while loops.
 - Instead, it has "branch instructions" which let us jump to a specific line of code.
 - These are like `goto`s in C.

---

# Question 2 - `goto`s & If Statements
Refactor `q2.c` into `q2_simple.c`, so that instead of an if statement it uses `goto`s.

Then, translate it to mips assembly.

---

# Question 3 - Combining Conditions
Refactor `q3.c` into `q3_simple.c`, so that instead of an if statement it uses `goto`s.

Then, translate it to mips assembly.

---

# Question 4 - Loops!
Refactor `q4.c` into `q4_simple.c`, so that instead of a for loop it uses `goto`s.

Then, translate it to mips assembly.

---

# Question 5 - Nested Loops
Refactor `q5.c` into `q5_simple.c`, so that instead of for loops it uses `goto`s.

Then, translate it to mips assembly.

---

# Question 6 - Factorial
Refactor `q6.c` into `q6_simple.c`, so that instead of a for loop it uses `goto`s.

Then, translate it to mips assembly.
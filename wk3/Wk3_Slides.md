---
marp: true
class: invert
---

# Managing Mips Memory!
Week 3 Tute

We'll start at 15 past :D

---

# Assignment 1
 - It is due pretty soon! (Friday Week 5, 6pm)
 - Assignment content includes functions, which are in the Week 4 labs
 - Start early - you don't *need* to learn functions to dive in and start translating

---

# Storing Values in a Computer

- Numbers are stored in your computer as sequences of ones and zeroes.
- One of those ones or zeroes is called a bit.
- Eight bits = one byte.
- A "word" is a number that is stored using four bytes' worth of ones and zeroes.

---

# Q1 - MIPS Data Directives

We'll look at some MIPS code containing data directives and explain the resulting memory setup.

---

# Q2 - Representing C-Style Variables in MIPS

Use MIPS directives to represent the following variables:

- `int u;`
- `int v = 42`;
- `char w;`
- `char x = 'a';`
- `double y;`
- `int z[20];`

---

# Q3 - Loading Values from Memory

Let's say memory looks like this:
```
ADDRESS       DATA    DEFINTION
0x10010000    aa:     .word 42
0x10010004    bb:     .word 1000
0x10010008    cc:     .word 1
0x1001000C            .word 3
0x10010010            .word 5
0x10010014            .word 7
```

What will be in `$t0` after the following line of mips code is executed?

```mips
la   $t0, aa
```

---

# Q3 - Loading Values from Memory

Let's say memory looks like this:
```
ADDRESS       DATA    DEFINTION
0x10010000    aa:     .word 42
0x10010004    bb:     .word 1000
0x10010008    cc:     .word 1
0x1001000C            .word 3
0x10010010            .word 5
0x10010014            .word 7
```

What will be in `$t0` after the following line of mips code is executed?

```mips
lw   $t0, bb
```

---

# Q3 - Loading Values from Memory

Let's say memory looks like this:
```
ADDRESS       DATA    DEFINTION
0x10010000    aa:     .word 42
0x10010004    bb:     .word 1000
0x10010008    cc:     .word 1
0x1001000C            .word 3
0x10010010            .word 5
0x10010014            .word 7
```

What will be in `$t0` after the following line of mips code is executed?

```mips
lb   $t0, bb
```

---

# Q3 - Loading Values from Memory

Let's say memory looks like this:
```
ADDRESS       DATA    DEFINTION
0x10010000    aa:     .word 42
0x10010004    bb:     .word 1000
0x10010008    cc:     .word 1
0x1001000C            .word 3
0x10010010            .word 5
0x10010014            .word 7
```

What will be in `$t0` after the following line of mips code is executed?

```mips
lw   $t0, aa+4
```

---

# Q3 - Loading Values from Memory

Let's say memory looks like this:
```
ADDRESS       DATA    DEFINTION
0x10010000    aa:     .word 42
0x10010004    bb:     .word 1000
0x10010008    cc:     .word 1
0x1001000C            .word 3
0x10010010            .word 5
0x10010014            .word 7
```

What will be in `$t0` after the following line of mips code is executed?

```mips
la   $t1, cc
lw   $t0, ($t1)
```

---

# Q3 - Loading Values from Memory

Let's say memory looks like this:
```
ADDRESS       DATA    DEFINTION
0x10010000    aa:     .word 42
0x10010004    bb:     .word 1000
0x10010008    cc:     .word 1
0x1001000C            .word 3
0x10010010            .word 5
0x10010014            .word 7
```

What will be in `$t0` after the following line of mips code is executed?

```mips
la   $t1, cc
lw   $t0, 8($t1)
```

---

# Q3 - Loading Values from Memory

Let's say memory looks like this:
```
ADDRESS       DATA    DEFINTION
0x10010000    aa:     .word 42
0x10010004    bb:     .word 1000
0x10010008    cc:     .word 1
0x1001000C            .word 3
0x10010010            .word 5
0x10010014            .word 7
```

What will be in `$t0` after the following line of mips code is executed?

```mips
li   $t1, 8
lw   $t0, cc($t1)
```

---

# Q3 - Loading Values from Memory

Let's say memory looks like this:
```
ADDRESS       DATA    DEFINTION
0x10010000    aa:     .word 42
0x10010004    bb:     .word 1000
0x10010008    cc:     .word 1
0x1001000C            .word 3
0x10010010            .word 5
0x10010014            .word 7
```

What will be in `$t0` after the following line of mips code is executed?

```mips
la   $t1, cc
lw   $t0, 2($t1)
```

---

# Q4 - Storing an Array
Translate this C program into MIPS.

```C
// A simple program that will read 10 numbers into an array

#define N_SIZE 10

#include <stdio.h>

int main(void) {
    int i;
    int numbers[N_SIZE] = {0};

    i = 0;
    while (i < N_SIZE) {
        scanf("%d", &numbers[i]);
        i++;
    }
}
```

---

# Pros and Cons of Memory vs a Register

Pros:
 - Can store way more variables.
 - Can store larger variables - strings, arrays.
 - Variables can be accessed from any point in the code.

Cons:
 - Have to use `lw` and `sw` to load and store it every time.

---

# Question 5 - Printing an Array
Translate this C program into MIPS.

```C
// A simple program that will print 10 numbers from an array

#define N_SIZE 10

#include <stdio.h>

int main(void) {
    int i;
    int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    i = 0;
    while (i < N_SIZE) {
        printf("%d\n", numbers[i]);
        i++;
    }
}
```

---

# Question 6 - Modifying an Array
Translate this C program into MIPS.

```C
// A simple program that adds 42 to each element of an array

#define N_SIZE 10

int main(void) {
    int i;
    int numbers[N_SIZE] = {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};

    i = 0;
    while (i < N_SIZE) {
        if (numbers[i] < 0) {
            numbers[i] += 42;
        }
        i++;
    }
}
```

---

# Question 7 - Reversing an Array
Translate this C program into MIPS.

```C
// A short program that reverses an array by swapping elements.

#define N_SIZE 10
#define N_SIZE_M_1 N_SIZE - 1
#define N_SIZE_D_2 N_SIZE / 2

#include <stdio.h>

int main(void) {
    int i;
    int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    i = 0;
    while (i < N_SIZE_D_2) {
        int x = numbers[i];
        int y = numbers[N_SIZE_M_1 - i];

        numbers[i] = y;
        numbers[N_SIZE_M_1 - i] = x;

        i++;
    }
}
```

---

# Question 8 - Count the Length of a String

Translate this C snippet into MIPS.

```C
char *string = "....";
char *s = &string[0];
int   length = 0;
while (*s != '\0') {
   length++;  // increment length
   s++;       // move to next char
}
```
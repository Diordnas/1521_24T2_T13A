---
marp: true
class: invert
---

# Welcome to COMP1521!
Week 1 Tute

---

# Course Overview

[https://cgi.cse.unsw.edu.au/~cs1521/24T1/](https://cgi.cse.unsw.edu.au/~cs1521/24T1/)

---

# Introductions!

---

# Question 2
Explain the difference between `s1` and `s2` in the below code fragment.

```C
#include <stdio.h>

char *s1 = "abc";

int main(void) {
    char *s2 = "def";
    // ...
}
```

Where is each variable located in memory? Where are the strings located?

---

# How Memory is Structured

![width:12in sepia invert](q2_img.png)

---

# Question 3
What is wrong with the following code?
```C
int main(void) {
    int *num = get_num_ptr();

    printf("%d\n", *num);
}

int *get_num_ptr(void) {
    int x = 42;
    return &x;
}
```

Assuming we still want `get_num_ptr` to return a pointer, how can we fix this code?

How does fixing this code affect each variable's location in memory?


---


# Question 4
Consider the following C program:

```C
#include <stdio.h>

int main(void) {
    char str[10];
    str[0] = 'H';
    str[1] = 'i';
    printf("%s", str);
    return 0;
}
```

What will happen when the above program is compiled and executed?
In particular, what does this look like **in memory?**
*(What's different with compiling it with `gcc` vs `dcc`?)*

---

# `str` in Memory
![width:12in sepia invert](q4_img.png)



---

# Question 5

How can we fix the code from question 4?

```C
#include <stdio.h>

int main(void) {
    char str[10];
    str[0] = 'H';
    str[1] = 'i';
    printf("%s", str);
    return 0;
}
```

---

# Command-Line Arguments
Consider this command:
```shell
$ dcc -o program program.c
```
We're executing the `dcc` program, and giving it some information.
How can we use information from the command line in our code?

---

# Question 6

Consider this program:
```C
#include <stdio.h>

int main(int argc, char *argv[]) {
    printf("argc=%d\n", argc);
    for (int i = 0; i < argc; i++) {
        printf("argv[%d]=%s\n", i, argv[i]);
    }
    return 0;
}
```

What are `argc` and `argv`? What will be the output of the following commands?

```shell
$ dcc -o program q6.c
$ ./program I love MIPS
```

---

# Question 7
The following prgram sums up command-line arguments.
```C
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int sum = 0;
    for (int i = 0; i < argc; i++) {
        sum += atoi(argv[i]);
    }
    printf("sum of command-line arguments = %d\n", sum);
    return 0;
}
```

Why do we need `atoi` in this code?
What happens if the command-line arguments are not integers?

---

# Recursion!

---

# Recursion Example: Factorial

We want to write a function that can calculate the factorial of some positive integer `n`.

We'll start by analysing the problem.

---


# What is a Factorial?

$n! = 1\times2\times3\times...\times (n-1)  \times n.$

For example:
$3! = 3\times2\times1 = 6.$
$5! = 5\times4\times3\times2\times1 = 120.$

---

# Recursion Example: Factorial

Solve the problem without recursion

---

# Recursion Example: Factorial
A "recursive" function is a function that calls itself.


---


# More Thinking 🤓
$5! = 5\times(4\times3\times2\times1).$
$5! = 5\times4!.$

---

# Recursion Example: Factorial

Solve the problem with recursion

---

# Hints and Tips
 - Remember to read the "Hint" sections in the lab excercises.
 - Using the C manual in the command-line.

---

# What is MIPS?
- When a high-level language like C gets compiled, the compiler has to do a lot of work to convert it into machine code.
- Mips is an assembly language, which means it directly corresponds with machine code, while still being human-readable.
- We use a type of mips called mipsy, which has some handy pseudo-instructions.

---

# What is `mipsy`?

- mipsy is a mips emulator, that lets us run mips code on our non-mips CPUs

- we also have [`mipsy-web`](https://cs1521.web.cse.unsw.edu.au/mipsy/), which has a user interface and lets you create breakpoints and step through mips code, line by line

---

# Introduction to mips

Without diving into too much detail, translate the following C program into MIPS assembler and run it with 1521 mipsy.

```C
#include <stdio.h>

int main(void) {
    int x, y;

    printf("Enter a number: ");
    scanf("%d", &x);

    y = x * x;

    printf("%d\n", y);

    return 0;
}
```
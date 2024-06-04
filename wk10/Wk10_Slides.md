---
marp: true
class: invert
---

# Final Week!
Week 10 Tute

We'll start at 10 past :D

---

# MyExperience Survey!

:point_right: :point_left:


---

# Processes

When we run a program, the operating system creates a process to execute the program.

```
$ date +%d-%m-%Y
17-11-2023
$ date +%T
09:15:47
$ whoami
z5418204
$ hostname -f
vx14.orchestra.cse.unsw.EDU.AU
$ realpath .
/import/kamen/2/z5418204/Desktop
```

---

# Creating Processes in C

In C, we might want to execute a program. We can do this by creating a process, with the function `posix_spawn`.

```C
int posix_spawn(
    pid_t *pid,             // pointer to a pid_t to hold the id
    const char *path,       // path of the program to be executed
    const posix_spawn_file_actions_t *file_actions, // usually NULL
    const posix_spawnattr_t *attrp,                 // usually NULL
    char *const argv[],     // argv for the process
    char *const envp[]      // environment varibles

);
```

Don't worry too much about these - we'll do an example.

---

# Q1

Create a C program that executes `whoami`.

You'll need to use these - make use of the manual!
- posix_spawn
- waitpid
- error handling

---

# Q2

Create a C program that prints:

- The current date.
- The current time.
- The current user.
- The current hostname.
- The current working directory.

---

# Concurrency and Parallelism

Our CPU can execute multiple programs at once!

I can open a web browser and vscode at the same time, and both work fine. How does our CPU execute two or more pieces of machine code at the same time?

- Option 1: The CPU switches between the two processes very quickly.
- Option 2: The CPU has multiple cores, each of which executes a different process.

---

# Concurrency in C

In C, we can use POSIX threads to utilise concurrency.

We'll use the `pthread_create` function.
```C
pthread_create(
    &thread,    // the pthread_t handle that will represent this thread
    NULL,       // thread-attributes -- we usually just leave this NULL
    thread_run, // the function that the thread should start executing
    NULL        // data we want to pass to the thread -- this will be
                // given in the `void *data` argument above
);
```

---

# Q3

Write a C program where `main` infinitely prints `"Hello\n"`, and another thread infinitely prints `there!\n`.

---

# Q4

Write a C program where one thread prints `"Feed me input\n"` once each second, and the main thread continuously reads in lines of input, then prints them to stdout.

---

# Q5

The code in `q5.c` attempts to count to 20,000,000, but it doesn't work consistently. Why not? How can we fix it?

You might find [this resource](https://web.cse.unsw.edu.au/~xavc/data-race/) useful.
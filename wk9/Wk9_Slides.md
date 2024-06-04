---
marp: true
class: invert
---

# More Filesystem + Encoding Content
Week 9 Tute

We'll start at 10 past :D

---

# MyExperience Survey!

:point_right: :point_left:


---

# Reminder from Last Week

We can use the `fseek` function to manually move a file pointer around a file.

`fseek(file, offset, whence)`

Sets our position in the file to `offset + whence`

Whence can be:
- `SEEK_SET`
- `SEEK_END`
- `SEEK_CUR`

(Make sure to `#include <stdio.h>`)

---

# Q1

Write a C program, which prints the contents of the file `$HOME/.diary` to `stdout`.

The lecture example [getstatus.c](https://cgi.cse.unsw.edu.au/~cs1521/23T3/topic/processes/code/#get_status.c) shows how to get the value of an environment variable.

`snprintf` is a convenient function for constructing the pathname of the diary file.

---

# `stat()`

The `stat()` and `lstat()` functions both take an argument which is a pointer to a `struct stat` object, and fill it with the meta-data for a named file.

On Linux, a `struct` stat contains the following fields (among others, which have omitted for simplicity):

```C
struct stat {
    ino_t st_ino;         /* inode number */
    mode_t st_mode;       /* protection  <-- Important */
    uid_t st_uid;         /* user ID of owner */
    gid_t st_gid;         /* group ID of owner */
    off_t st_size;        /* total size, in bytes */
    blksize_t st_blksize; /* blocksize for filesystem I/O */
    blkcnt_t st_blocks;   /* number of 512B blocks allocated */
    time_t st_atime;      /* time of last access */
    time_t st_mtime;      /* time of last modification */
    time_t st_ctime;      /* time of last status change */
};
```

---

# Permissions in UNIX

A file has 3 types of permissions - read, write and execute. These permissions can be different for the owner, the people in the owner's group, and everybody else.

So there are nine permissions to keep track of per file.

Each of these permissions is stored as one bit worth of data, so we store all the permissions in one integer.

---

# Showcasing Permissions with `ls -l`

Demo

If you're looking at the slides afterwards, the demo is:

```
$ cd ~
$ ls -l
```

---

# Q2

Consider the following (edited) output from the command `ls -l ~cs1521`:

```
drwxr-x--- 11 cs1521 cs1521 4096 Aug 27 11:59 17s2.work
drwxr-xr-x  2 cs1521 cs1521 4096 Aug 20 13:20 bin
-rw-r-----  1 cs1521 cs1521   38 Jul 20 14:28 give.spec
drwxr-xr-x  3 cs1521 cs1521 4096 Aug 20 13:20 lib
drwxr-x--x  3 cs1521 cs1521 4096 Jul 20 10:58 public_html
drwxr-xr-x 12 cs1521 cs1521 4096 Aug 13 17:31 spim
drwxr-x---  2 cs1521 cs1521 4096 Sep  4 15:18 tmp
lrwxrwxrwx  1 cs1521 cs1521   11 Jul 16 18:33 web -> public_html
```

- Who can access the `17s2.work` directory?

- What operations can a typical user perform on the `public_html` directory?

- What is the file `web`?

- What is the difference between `stat("web", &info)` and `lstat("web", &info)`?
(where info is an object of type (struct stat))

---

# Accessing this info in C

We use the `stat()` function.

`man 3 stat` tells us to refer to `man 3 fstatat`.

Information about `st_mode` is found in `man 7 inode`.

---

# For Example

Checking if a file is a directory:

```C
struct stat sb;
stat(pathname, &sb);
if ((sb.st_mode & S_IFMT) == S_IFDIR) {
    // It's a diretory
}
```

```C
struct stat sb;
stat(pathname, &sb);
if (S_ISDIR(sb.st_mode)) {
    // It's a diretory
}
```

---

# For Example

Checking if the owner has write permissions

```C
struct stat sb;
stat(pathname, &sb);
if ((sb.st_mode & S_IWUSR) == S_IWUSR) {
    // Owner can write
}
```

Checking if "others" have read permissions

```C
struct stat sb;
stat(pathname, &sb);
if ((sb.st_mode & S_IROTH) != 0) {
    // Others can read
}
```

---

# For Reference

Required Library: `#include <sys/stat.h>`

Functions for checking type:
- `S_ISDIR`
- `S_ISREG`
- `S_ISLNK`

Flags for permissions:
- `S_IRUSR` `S_IWUSR` `S_IXUSR`
- `S_IRGRP` `S_IWGRP` `S_IXGRP`
- `S_IROTH` `S_IWOTH` `S_IXOTH`

---

# Unicode

We're used to using `char`s to store strings.

A `char` is 1 byte (8 bits) in size, so we can store 256 different values - this is enough for simple strings using ASCII encoding.

We want to be able to encode characters from any language (and emoji), but we don't want to store simple English strings less efficiently than ASCII.

Unicode's UTF-8 is an character encoding system that solves this problem.

---

# UTF-8

In UTF-8, each character can be represented by a different number of bytes, as necessary.

We want common, low-information characters to be stores by less bytes, while uncommon or high-information characters can be stored by more bytes.

The beginning of each byte of data tells us information about how the data is grouped.

```
0xxxxxxx
110xxxxx 10xxxxxx
1110xxxx 10xxxxxx 10xxxxxx
11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
```

---

# Q3
The following code will compile with:
`dcc q3.c -o q3`

But it won't compile with:
`dcc -Wpedantic q3.c -o q3`

What does the code do?

How can the code be modified to compile with the `-Wpedantic` option?
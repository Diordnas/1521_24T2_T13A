// Write a C program, which is given one command-line argument, the name of a file, and which reads a line from stdin, and writes it to the specified file; if the file exists, it should be overwritten.

#include <stdio.h>

int main(int argc, char *argv[]) {
    // Check for right number of args
    if (argc != 2) {
        fprintf(stderr, "Wrong number of arguments!\n");
        return 1;
    }

    // Open the file
    FILE *fp = fopen(argv[1], "w");

    // Check for error opening file
    if (fp == NULL) {
        perror("File Error");
        return 1;
    }

    // Read a line from stdin, put it in the file
    int c;
    while ((c = fgetc(stdin)) != EOF) {
        putc(c, fp);

        // Break out of loop at end of line
        if (c == '\n') {
            break;
        }
    }

    // Close the file!
    fclose(fp);

    return 0;
}
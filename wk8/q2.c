// Write a C program, which is given one command-line argument, the name of a file, and which prints the first line of that file to stdout. If given an incorrect number of arguments, or if there was an error opening the file, it should print a suitable error message.

#include <stdio.h>

int main(int argc, char *argv[]) {
    // Check for right number of args
    if (argc != 2) {
        fprintf(stderr, "Wrong number of arguments!\n");
        return 1;
    }

    // Open the file
    FILE *fp = fopen(argv[1], "r");

    // Check for error opening file
    if (fp == NULL) {
        perror("File Error");
        return 1;
    }

    // Print the first line
    int c;
    while ((c = fgetc(fp)) != EOF) {
        putc(c, stdout);

        // Break out of loop at end of line
        if (c == '\n') {
            break;
        }
    }

    // Close the file!
    fclose(fp);

    return 0;
}
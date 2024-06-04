#include <stdio.h>
#include <stdlib.h>

#define MAX_PATH_LEN 512

int main() {
    // Get the $HOME environment variable
    char *home = getenv("HOME");

    // Construct a filename as $HOME + /.diary
    char filename[MAX_PATH_LEN];
    snprintf(filename, MAX_PATH_LEN, "%s/.diary", home);

    // Open the file
    FILE *fp = fopen(filename, "r");

    // Handle errors
    if (fp == NULL) {
        perror(filename);
        return 1;
    }

    // Print file contents to stdout
    int c;
    while ((c = fgetc(fp)) != EOF) {
        putc(c, stdout);
    }

    // Close the file
    fclose(fp);

    return 0;
}
// check 1+ cmd-line args

// 1 argument: search lines from stdin for arg1

// 2+ arguments: open the filenames of args 2+
// search the lines for arg1

// check file opened correctly

// print line numbers

#include <stdio.h>
#include <string.h>

#define MAX_SIZE 1024

void search_stream(FILE *fp, char *substring);

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Wrong number of arguments!\n");
        return 1;
    } else if (argc == 2) {
        // Search stdin
        search_stream(stdin, argv[1]);
    } else {
        // Open and search files
        for (int i = 2; i < argc; i++) {
            FILE *fp = fopen(argv[i], "r");

            if (fp == NULL) {
                perror(argv[i]);
                return 1;
            }

            printf("\t%s\n", argv[i]);
            search_stream(fp, argv[1]);

            fclose(fp);
        }

    }

    return 0;
}

// Search each line of a file for a substring
// Prints the line number and line of lines with the substrings
void search_stream(FILE *fp, char *substring) {
    int i = 1;
    char line[MAX_SIZE];

    // Loop through the file
    while (fgets(line, MAX_SIZE, fp) != NULL) {
        // strstr != NULL means substring exists in line
        if (strstr(line, substring) != NULL) {
            printf("%d: %s", i, line);
        }

        i++;
    }
}
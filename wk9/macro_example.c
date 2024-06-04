#include <stdio.h>
#include <sys/stat.h>

int main() {
    struct stat sb;
    stat("file.txt", &sb);

    if (S_ISDIR(sb.st_mode)) {
    // The above line expands to:
//  if (((((sb.st_mode)) & 0170000) == (0040000))) {
        printf("It's a directory!");
    } else {
        printf("It's not a directory!");
    }
}
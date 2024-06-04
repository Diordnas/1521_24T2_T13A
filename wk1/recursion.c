#include <stdio.h>

int fact(int n);

int main () {
    int n = fact(5);
    printf("%d\n", n);

    return 0;
}

int fact(int n) {
    if (n == 1) {
        return 1;
    }
    return n * fact(n - 1);
}
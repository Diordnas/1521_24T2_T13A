#include <stdio.h>

int fact(int n);

int main () {
    int n = fact(5);
    printf("%d\n", n);

    return 0;
}

int fact(int n) {
    int total = 1;

    for (int i = 2; i <= n; i++) {
        total *= i;
    }

    return total;
}
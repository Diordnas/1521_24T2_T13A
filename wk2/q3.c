#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto x_is_small_or_big;
    if (x >= 1000) goto x_is_small_or_big;
x_is_medium:
        printf("medium\n");
        goto end_if;
x_is_small_or_big:
        printf("small/big\n");
end_if:
}
int main(void) {
    int *num = get_num_ptr();

    printf("%d\n", *num);
    free(num);
}

int *get_num_ptr(void) {
    int *x = malloc(sizeof(int));
    *x = 42;
    return x;
}
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

void *other_thread(void *data) {
    while(1) {
        printf("Awaiting user input...\n");
        sleep(1);
    }
}


int main() {
    pthread_t other_thread_handle;
    pthread_create(
        &other_thread_handle,
        NULL,
        other_thread,
        NULL
    );

    while (1) {
        int c = getchar();
        putchar(c);
    }

    return 0;
}
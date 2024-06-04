#include <stdio.h>
#include <pthread.h>
#include <stdatomic.h>

// By using an atomic_int, the increment operation won't be interrupted
atomic_int global_total = 0;

void *add_ten_million_to_counter(void *data) {
    for (int i = 0; i < 10000000; i++) {
        // increment the global total by 1
        global_total++;
    }

    return NULL;
}

int main(void) {
    pthread_t thread1;
    pthread_create(&thread1, NULL, add_ten_million_to_counter, NULL);

    pthread_t thread2;
    pthread_create(&thread2, NULL, add_ten_million_to_counter, NULL);

    // Wait for threads to finish
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // if program works correctly, should print 2 million
    printf("Final total: %d\n", global_total);
}
#include <stdio.h>
#include <pthread.h>

int global_total = 0;

// A mutex keeps track of whether anybody is using the global_total
pthread_mutex_t global_total_mutex = PTHREAD_MUTEX_INITIALIZER;

void *add_ten_million_to_counter(void *data) {
    for (int i = 0; i < 10000000; i++) {
        // Wait until the mutex is free, then claim it
        pthread_mutex_lock(&global_total_mutex);

        // increment the global total by 1
        global_total++;

        // Relinquish the mutex
        pthread_mutex_unlock(&global_total_mutex);
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
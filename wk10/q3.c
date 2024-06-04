#include <stdio.h>
#include <pthread.h>

void *other_thread(void *data) {
    // Cast the void pointer to a char pointer
    char *message = data;

    while(1) {
        printf("Message: %s\n", message);
    }

}


int main() {
    pthread_t other_thread_handle;
    pthread_create(
        &other_thread_handle,
        NULL,
        other_thread,
        "helloooooo"
    );

    while (1) {
        printf("Hello from the main thread!\n");
    }

    return 0;
}
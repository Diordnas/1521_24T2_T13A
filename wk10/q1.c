#include <stdio.h>
#include <spawn.h>
#include <errno.h>
#include <sys/wait.h>

extern char **environ;

int main() {
    // Set up variables for the process
    pid_t pid;
    char *p_argv[] = {"/usr/bin/whoami", NULL};

    // Spawn the process
    int spawn_status = posix_spawn(
        &pid,
        "/usr/bin/whoami",
        NULL,
        NULL,
        p_argv,
        environ
    );

    // Handle errors spawning process
    if (spawn_status != 0) {
        errno = spawn_status;
        perror("Problem spawning process");
        return 1;
    }

    // Wait for the process to finish
    int return_status;
    waitpid(pid, &return_status, 0);

    // Handle errors from the process
    if (return_status != 0) {
        errno = return_status;
        perror("Problem spawning process");
        return 1;
    }

    printf("This should print after the process finishes\n");

    return 0;
}
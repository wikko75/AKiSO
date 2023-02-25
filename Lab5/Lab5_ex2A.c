#include <stdio.h>
#include <signal.h>
#include <unistd.h>

struct sigaction siga;

void f(int sig) {
    printf("Caught signal %d\n", sig);
}

// sets f as handler to all the possible signals.
void myfunct(void(*f)(int sig)) {

    //binds f to sigaction handler
    siga.sa_handler = f;
    for (int sig = 1; sig <= SIGRTMAX; ++sig) {
        
	// on error
        if (sigaction(sig, &siga, NULL) == -1)
	{
		printf("Can not handle signal: %d\n", sig);
	}

     }
}

int main() {
    printf("PID: %d\n", getpid());
    myfunct(f);
    pause(); // wait for signal
   
    return 0;
}

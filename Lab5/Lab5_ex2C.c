#include <signal.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

int num;

void handle_signal(int sig)
{	
	num++;
	printf("Received %d signal\n", num);
}


int main(int args, char* argv[])
{
	int id = fork();
	
	if(id == 0)
	{
		sleep(1);
		for(int i = 0; i < 100; i++)
		{
     	        	printf("Sent %d signal\n", i+1);
        	        kill(getppid(), SIGUSR1);
	   				
		}
		
	}
	else
	{	//creating sa and binding handler to signal
		struct sigaction sa = {0};
		sa.sa_handler = &handle_signal;

		sigaction(SIGUSR1, &sa, NULL);

		wait(NULL);
	}
	return 0;
}

	

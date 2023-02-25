#include <stdio.h>
#include <signal.h>

int main(int args, char* argv[])
{
	//sygnal zostanie zignorowany, bo init nie ma signal handlera do SIGKILLa
	//jest to  zabezpieczenie
	kill(1, SIGKILL);
	
	printf("Nothing happend\n");
	return 0;

}

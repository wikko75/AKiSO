#include <stdio.h>
#include <unistd.h>


int main(void)
{
	char* args[];

	execvp(args[0], args);

	return 0;
}

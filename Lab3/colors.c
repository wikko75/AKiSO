#include <stdio.h>
#include <string.h>

int main()
{
	char color[12];
	int intColor;

	for (int i = 0; i < 16; i++)
	{
		for (int j = 0; j < 16; j++)
		{
			intColor = (i*16+j);
			sprintf(color, "%d", intColor);
			printf("\033[38;5;%sm Hello, World! \033[0m\n", color);
		}
	}

	return 0;
}


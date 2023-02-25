#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

int main(int argc, char *argv)
{
	double **a;
	double **b;
	double **res;
	int  N; //size
	struct timeval start, stop;
	double start_ms, stop_ms;

	printf("Matrix size: ");
	scanf("%d", &N);

	a = (double **)malloc(N * sizeof(double *));
	for (int i = 0; i < N; i++)
	{
		a[i] = (double*)malloc(N * sizeof(double));
	}
	
	b = (double **)malloc(N * sizeof(double *));
        for (int i = 0; i < N; i++)
        {
                b[i] = (double*)malloc(N * sizeof(double));
        }
 
	res = (double **)malloc(N * sizeof(double *));
        for (int i = 0; i < N; i++)
        {
                res[i] = (double*)malloc(N * sizeof(double));
        }

	gettimeofday(&start, NULL);

	//transformation
	double tmp[N][N];
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			tmp[i][j] = b[j][i];
		}
	}

	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			res[i][j] = 0;

			for (int k = 0; k < N; k++)
			{
				//res[i][j] += a[i][k] * b[k][j];
				res[i][j] += a[i][k] * tmp[j][k];
			}
		}
	}

	gettimeofday(&stop, NULL);

	start_ms = (double)start.tv_sec * 1000000.0 + (double)start.tv_usec;
	stop_ms = (double)stop.tv_sec * 1000000.0 + (double)stop.tv_usec;

	printf("Total time: %lf s\n", (stop_ms - start_ms) * 1e-6);


	return 0;

	}

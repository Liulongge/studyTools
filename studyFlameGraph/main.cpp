#include<iostream>
#include <sys/time.h>

using namespace std;

static int64_t get_time_interval(void)
{
	struct timeval t_curr;
    const static timeval t_start = {0};
	gettimeofday(&t_curr, NULL);
	return  (t_curr.tv_sec * 1000) + (t_curr.tv_usec / 1000) - ((t_start.tv_sec * 1000) + (t_start.tv_usec / 1000));
}

void test()
{
	for (int i = 0; i < 80000; i++)
	{
		get_time_interval();
	}
}
 
int main()
{
	while(1)
	{
		test();
	}
 
	return 0;
}
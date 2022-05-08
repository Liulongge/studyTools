#include<iostream>
#include"omp.h"
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
	}
}
 
int main()
{
    //指定2个线程
    int64_t beg_time = get_time_interval();
	float startTime = omp_get_wtime();
#pragma omp parallel for num_threads(2)
	for (int i = 0; i < 80000; i++)
	{
		test();
	}
	float endTime = omp_get_wtime();
    int64_t end_time = get_time_interval();
	printf("指定 2 个线程，执行时间: %f--%ld\n", endTime - startTime, end_time - beg_time);
 
	//指定4个线程
    beg_time = get_time_interval();
    startTime = omp_get_wtime();
#pragma omp parallel for num_threads(4)
	for (int i = 0; i < 80000; i++)
	{
		test();
	}
	endTime = omp_get_wtime();
    end_time = get_time_interval();
	printf("指定 4 个线程，执行时间: %f--%ld\n", endTime - startTime, end_time - beg_time);
 
	//指定8个线程
    beg_time = get_time_interval();
    startTime = omp_get_wtime();
#pragma omp parallel for num_threads(8)
	for (int i = 0; i < 80000; i++)
	{
		test();
	}
	endTime = omp_get_wtime();
    end_time = get_time_interval();
	printf("指定 8 个线程，执行时间: %f--%ld\n", endTime - startTime, end_time - beg_time);

 
	//指定12个线程
    beg_time = get_time_interval();
    startTime = omp_get_wtime();
#pragma omp parallel for num_threads(12)
	for (int i = 0; i < 80000; i++)
	{
		test();
	}
	endTime = omp_get_wtime();
    end_time = get_time_interval();
	printf("指定 12 个线程，执行时间: %f--%ld\n", endTime - startTime, end_time - beg_time);
 
	//不使用OpenMP
    beg_time = get_time_interval();
    startTime = omp_get_wtime();
	for (int i = 0; i < 80000; i++)
	{
		test();
	}
	endTime = omp_get_wtime();
    end_time = get_time_interval();
	printf("不使用OpenMP多线程, 执行时间: %f--%ld\n", endTime - startTime, end_time - beg_time);
	startTime = endTime;
 
	return 0;
}
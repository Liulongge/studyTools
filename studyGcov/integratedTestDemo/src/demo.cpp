#include <stdio.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

extern "C" void __gcov_flush(); 

void handlerSIGTERM( int signo )
{
	printf("recv SIGTERM(%d)\n", signo);
    __gcov_flush();
    exit(0);
}

int main(int argc, char *argv[])
{   
    signal( 15, handlerSIGTERM);
    while(true)
    {
        printf("Hello World !\n");
        usleep(100 * 1000);
    }
    return 0;
}

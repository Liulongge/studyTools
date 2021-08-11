// ubuntu arm64 g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
// g++ global-buffer-overflow.cpp -g -o demo -fsanitize=address

#include<iostream>

int global_array[100] = {-1};

int main(int argc, char **argv) 
{
    return global_array[1 + 100];  // BOOM
}
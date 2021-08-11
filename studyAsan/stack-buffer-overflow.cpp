// ubuntu arm64 g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
// g++ stack-buffer-overflow.cpp -g -o demo -fsanitize=address

#include<iostream>

int main(int argc, char **argv) 
{
    int stack_array[100];
    stack_array[1] = 0;
    return stack_array[1 + 100];  // BOOM
}
// ubuntu arm64 g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
// export ASAN_OPTIONS=detect_stack_use_after_return=1
// g++ stack-use-after-return.cpp -g  -o demo -fsanitize=address

#include<iostream>

int *ptr;
__attribute__((noinline))
void FunctionThatEscapesLocalObject() 
{
    int local[100];
    ptr = &local[0];
}

int main(int argc, char **argv) 
{
    FunctionThatEscapesLocalObject();
    return ptr[0];
}
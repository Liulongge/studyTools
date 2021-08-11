// ubuntu arm64 g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
// g++ heap-buffer-overflow.cpp -o demo -fsanitize=address

#include<iostream>

int main(int argc, char **argv) 
{
    int *array = new int[100];
    array[0] = 0;
    int res = array[1 + 100];  // BOOM
    delete [] array;
    return res;
}
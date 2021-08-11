// ubuntu arm64 g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
// export ASAN_OPTIONS=check_initialization_order=true
// 1 g++ -fsanitize=address -g a.cpp b.cpp -o demo    // boom
// 43: g++ -fsanitize=address -g b.cpp a.cpp -o demo  // OK


#include <stdio.h>
extern int extern_global;
int __attribute__((noinline)) read_extern_global() 
{
    return extern_global;
}

int x = read_extern_global() + 1;

int main() 
{
    // 1 g++ -fsanitize=address -g a.cpp b.cpp -o demo
    // 43: g++ -fsanitize=address -g b.cpp a.cpp -o demo
    printf("%d\n", x);
    return 0;
}
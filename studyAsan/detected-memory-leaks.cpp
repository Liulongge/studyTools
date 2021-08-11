// ubuntu arm64 g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
// g++ detected-memory-leaks.cpp -o demo  -fsanitize=address

#include <stdlib.h>

void *p;
int main() 
{
  p = malloc(7);
  p = nullptr; // The memory is leaked here.
  return 0;
}
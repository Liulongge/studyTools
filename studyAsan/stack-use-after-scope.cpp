// ubuntu arm64 g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
// g++ stack-use-after-scope.cpp -g -o demo -fsanitize=address

#include<iostream>

volatile int *p = 0;

int main() {
  {
    int x = 0;
    p = &x;
  }
  *p = 5;
  return 0;
}
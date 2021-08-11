// ./g++ main.cpp -g -llsan -fsanitize=leak
#include<iostream>

int main(int argc, char* argv[])
{
  char *x = (char*)malloc(10 * sizeof(char*));
  free(x);
  x[0] = 1;
  return 0;
}
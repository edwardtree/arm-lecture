#include <stdio.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
 
  
  int number=10,result;
  result = fibonacci(number);   
  printf("The fibonacci sequence at %d is: %d\n", number, result);
}


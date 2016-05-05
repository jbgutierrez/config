#include<stdio.h>

#define GREETING "Hello %s!"

void hello(char user[]) {
  printf(GREETING, user);
}

int main()
{
  hello("world");
}

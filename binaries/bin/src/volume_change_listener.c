#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
  while (1) {
    while(getchar() != '\n');
    system("adjust_volumes.sh");
  }

  return 0;
}

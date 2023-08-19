#include <stdio.h>

extern int doubler(int num);

int main(){
    printf("The result is : %d\n",doubler(doubler(10)));
    return 0;
}
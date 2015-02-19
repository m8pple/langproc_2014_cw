//Sample 8
#include <stdio.h>
#include <stdlib.h>

typedef int* int_pointer;

int main(){
    int_pointer mypointer;
    
    mypointer = malloc( sizeof( int ) );
    *mypointer = 10;
    printf("%d", *mypointer);
    free(mypointer);
    
    exit(0);
}

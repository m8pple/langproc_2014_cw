//Sample 7
#include <stdio.h>
#include <stdlib.h>

int main(){
    int index;
    int myarray[5];

    for (index = 0; index < 5; index++){
        myarray[ index ] = index;
    }

    for (index = 0; index< 5; index++){
        printf("%d", myarray[index]);
    }
    
    exit(0);
}

//Sample 6
#include <stdio.h>

int incr( int X ){
    int result;
    result = X + 1;
    return result;
}

int main(){
    int a, b, c;
    a = 1;
    b = incr(a);
    printf("%d", b);
    
    return 0;
}

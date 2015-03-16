# 1 "input/A_sample1.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "input/A_sample1.c"

# 1 "include/stdio.h" 1





int puts( const char * str, ...);
int printf( const char * str, ...);

int putchar ( int character );
int getchar();
# 3 "input/A_sample1.c" 2
# 1 "include/stdlib.h" 1



void exit (int status);
# 4 "input/A_sample1.c" 2

int main(){
    int a = 1;
    printf("%d\n", a);
    exit(0);
}

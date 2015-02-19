.global main
/* directive .global to make
name main available to OS */
main:
stmfd sp!, {lr}
ldr r0, print_args
/*
print_args: intermediate label
for the address of the
format string for printf
*/
mov r1, #1
bl printf
/*
calling printf
(will take arguments
from r0 and r1)
*/
ldmfd sp!, {pc}
print_args:
.word print_args_str
/* print_args_str actual label for format
string contained in data section */
.data
print_args_str:
.asciz "%d\n"
/* directive .asciz for
0-terminated C-style strings */
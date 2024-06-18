This project is about converting the following C program to MIPS.
Code:#include <stdio.h>
int power(int b, int e){
if(e == 0)
return 1;
else return b * power(b, e-1);
}
int main(){
int x, y;
printf(“please enter two integers: “);
scanf(“%d”, &x);
scanf(“%d”, &y);
printf(“%d raised to power %d is %d\n”, x,y,power(x,y));
return 0;
}

Also: install Mars4_4, then open Mips_Machine.asm file and run

output: Enter the value of x: 4
Enter the value of y: 2
%d ra1sed power %d is %d,(x,y,power(x,y)(The result of x^y is): 16

-- program is finished running --

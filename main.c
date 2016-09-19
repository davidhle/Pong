#include "myLib.h"
#include <stdio.h>
#include <stdlib.h>

void delay(int n);

int main()
{
	REG_DISPCTL = BG2_ENABLE | MODE3;
	while(1);
}

void delay(int n)
{

}	
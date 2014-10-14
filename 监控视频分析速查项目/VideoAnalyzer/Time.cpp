#include "stdafx.h"
#include <stdio.h>
#include "Time.h"
#include "string.h"

Time::Time(int a,int b,int c)
{
	hour=a;
	minute=b;
	second=c;
}
Time::Time(int z)
{
	int z1=z%3600;
	int z2=z1%60;
	hour=(z-z1)/3600;
	minute=(z1-z2)/60;
	second=z2;
}

void Time::setTime(int a,int b,int c)
{
	hour=a;
	minute=b;
	second=c;
}

void Time::setTime(int z)
{
	int z1=z%3600;
	int z2=z1%60;
	hour=(z-z1)/3600;
	minute=(z1-z2)/60;
	second=z2;
}

void Time::printTime()
{
	printf("%d:%d:%d\n",hour,minute,second);
}

Time::~Time(void)
{
}
